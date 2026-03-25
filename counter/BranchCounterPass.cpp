#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {

class BranchCounterPass : public PassInfoMixin<BranchCounterPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);

private:
    void insertCounterCall(Instruction *InsertBefore, const char *funcName, Module *M);
};

void BranchCounterPass::insertCounterCall(Instruction *InsertBefore,
                                          const char *funcName, Module *M) {
    LLVMContext &Ctx = M->getContext();
    IRBuilder<> Builder(InsertBefore);
    FunctionType *FuncTy = FunctionType::get(Type::getVoidTy(Ctx), false);
    FunctionCallee CounterFunc = M->getOrInsertFunction(funcName, FuncTy);
    Builder.CreateCall(CounterFunc);
}

PreservedAnalyses BranchCounterPass::run(Function &F, FunctionAnalysisManager &FAM) {
    Module *M = F.getParent();

    // Skip our instrumentation functions

    if (FuncName.starts_with("increment_") ||
        FuncName.starts_with("print_")     ||
        FuncName.starts_with("reset_")     ||
        FuncName.starts_with("init_")      ||
        FuncName.starts_with("get_")) {
        return PreservedAnalyses::all();
    }

    // Get Loop Information
    LoopInfo &LI = FAM.getResult<LoopAnalysis>(F);

    // ── KEY FIX ────────────────────────────────────────────────────────────
    // The paper counts loop headers by detecting CFG BACK-EDGES.
    // A back-edge is an edge (A -> B) where B dominates A, i.e. B is an
    // ancestor of A in the CFG dominator tree — meaning we are jumping
    // *back* to a block we already visited.  The target B of a back-edge
    // is the true loop header in the CFG sense.
    //
    // Previous logic: insert counter at the top of every LoopInfo header
    // block, which fires once per loop *entry*, not once per back-edge
    // traversal.  This over-counts because inner loops add extra headers
    // and the counter fires on every iteration entry, not on the back-edge.
    //
    // Fixed logic: collect every back-edge (Latch -> Header) from LoopInfo
    // and instrument the BRANCH INSTRUCTION inside the latch block that
    // jumps back to the header.  This fires exactly once per loop iteration
    // crossing a back-edge, matching the paper's definition.
    // ───────────────────────────────────────────────────────────────────────

    // Collect all back-edges: set of (LatchBB -> HeaderBB) pairs
    // We instrument the branch in LatchBB that targets HeaderBB.
    SmallPtrSet<BranchInst*, 32> BackEdgeBranches;

    for (Loop *L : LI) {
        // Walk all loops and sub-loops recursively
        std::function<void(Loop*)> collectBackEdges = [&](Loop *LP) {
            BasicBlock *Header = LP->getHeader();
            // Every latch block has a back-edge to the header
            SmallVector<BasicBlock*, 8> Latches;
            LP->getLoopLatches(Latches);
            for (BasicBlock *Latch : Latches) {
                Instruction *Term = Latch->getTerminator();
                if (BranchInst *BI = dyn_cast<BranchInst>(Term)) {
                    // Verify one of the successors is the loop header
                    for (unsigned i = 0; i < BI->getNumSuccessors(); i++) {
                        if (BI->getSuccessor(i) == Header) {
                            BackEdgeBranches.insert(BI);
                            break;
                        }
                    }
                }
            }
            for (Loop *SubL : LP->getSubLoops())
                collectBackEdges(SubL);
        };
        collectBackEdges(L);
    }

    bool Modified = false;

    for (BasicBlock &BB : F) {
        std::vector<std::pair<Instruction*, const char*>> ToInstrument;

        for (Instruction &Inst : BB) {

            if (BranchInst *BI = dyn_cast<BranchInst>(&Inst)) {
                if (BI->isConditional()) {
                    // ── Conditional branch ──────────────────────────────
                    ToInstrument.push_back({BI, "increment_cond_branch"});

                    // ── Back-edge (loop header) ─────────────────────────
                    // If this conditional branch is a back-edge branch,
                    // also count it as a loop header traversal.
                    if (BackEdgeBranches.count(BI)) {
                        ToInstrument.push_back({BI, "increment_loop_header"});
                    }
                } else {
                    // ── Unconditional branch ────────────────────────────
                    ToInstrument.push_back({BI, "increment_uncond_branch"});

                    // An unconditional back-edge also counts as a loop header
                    if (BackEdgeBranches.count(BI)) {
                        ToInstrument.push_back({BI, "increment_loop_header"});
                    }
                }
            }

            // ── Direct calls ────────────────────────────────────────────
            else if (CallInst *CI = dyn_cast<CallInst>(&Inst)) {
                Function *Callee = CI->getCalledFunction();
                if (Callee && !Callee->isIntrinsic()) {
                    StringRef CalleeName = Callee->getName();
                    if (!CalleeName.starts_with("increment_") &&
                        !CalleeName.starts_with("print_")     &&
                        !CalleeName.starts_with("reset_")     &&
                        !CalleeName.starts_with("init_")      &&
                        !CalleeName.starts_with("get_")       &&
                        !CalleeName.starts_with("llvm.")) {
                        ToInstrument.push_back({CI, "increment_direct_call"});
                    }
                }
            }

            // ── Returns ─────────────────────────────────────────────────
            else if (isa<ReturnInst>(&Inst)) {
                ToInstrument.push_back({&Inst, "increment_return"});
            }
        }

        for (auto &Pair : ToInstrument) {
            insertCounterCall(Pair.first, Pair.second, M);
            Modified = true;
        }
    }

    return Modified ? PreservedAnalyses::none() : PreservedAnalyses::all();
}

} // end anonymous namespace

// New PM Registration
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return {
        .APIVersion = LLVM_PLUGIN_API_VERSION,
        .PluginName = "BranchCounter",
        .PluginVersion = "v0.1",
        .RegisterPassBuilderCallbacks = [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "branch-counter") {
                        FPM.addPass(BranchCounterPass());
                        return true;
                    }
                    return false;
                });

            PB.registerPipelineStartEPCallback(
                [](ModulePassManager &MPM, OptimizationLevel Level) {
                    FunctionPassManager FPM;
                    FPM.addPass(BranchCounterPass());
                    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
                });
        }
    };
}