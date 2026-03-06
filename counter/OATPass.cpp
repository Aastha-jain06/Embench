/* llvm_pass/OATPass.cpp
 *
 * Instruments according to the OAT paper's Smin (minimum instrumentation set).
 *
 * From the paper Section IV and Table VI, Smin contains ONLY:
 *
 *   Event              | Layer | Instruction          | Info recorded
 *   ───────────────────┼───────┼──────────────────────┼──────────────
 *   Indirect call      | Assm. | blr xr               | xr (target addr)
 *   Indirect jump      | Assm. | br xr                | xr (target addr)
 *   Conditional branch | Assm. | b.cond/cbz/cbnz/...  | taken=1/not-taken=0
 *   Return             | Assm. | ret                   | pc, lr
 *
 * From the paper Section IV on Smin:
 *   "Direct calls and jumps are NOT included in Smin because their
 *    destinations are unique and statically determinate."
 *
 * Therefore this pass does NOT instrument:
 *   - Function entries  (no __oat_func_enter — paper has no equivalent)
 *   - Direct calls      (excluded from Smin)
 *   - Unconditional branches
 *
 * Trampoline functions called (one world switch each):
 *   __oat_log(int val)              — conditional branch (val=1 taken, val=0 not-taken)
 *   __oat_log_indirect(uint64_t a)  — indirect call OR indirect jump
 *   __oat_func_exit(int func_id)    — return (encodes return addr into hash per paper)
 *
 * Session boundaries (called manually by benchmark, not injected by pass):
 *   __oat_init()         — oei_attest_begin
 *   __oat_print_proof()  — oei_attest_end + CMD_HASH_FINAL
 */

#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
struct OATPass : public PassInfoMixin<OATPass> {

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
    LLVMContext &Ctx = F.getContext();
    bool modified = false;

    // ── Declare trampoline functions ──────────────────────────────────────

    // void __oat_log(int val)
    // Called on conditional branch: val=1 (taken) or val=0 (not-taken)
    // Paper: "for each branch, adds the taken/non-taken bit to the trace"
    FunctionCallee logFunc = F.getParent()->getOrInsertFunction(
        "__oat_log", Type::getVoidTy(Ctx), Type::getInt32Ty(Ctx));

    // void __oat_log_indirect(uint64_t addr)
    // Called on indirect call AND indirect jump
    // Paper: "for each indirect call/jump, adds the destination address to trace"
    FunctionCallee logIndirectFunc = F.getParent()->getOrInsertFunction(
        "__oat_log_indirect", Type::getVoidTy(Ctx), Type::getInt64Ty(Ctx));

    // void __oat_func_exit(int func_id)
    // Called before every return
    // Paper: "encodes the return address into the hash: H = Hash(H XOR RetAddr)"
    // Paper Table VI: ret -> records (pc, lr)
    // Note: NO corresponding func_enter — paper explicitly excludes direct calls
    uint32_t funcID = 0;
    for (char c : F.getName()) funcID += c;

    FunctionCallee exitFunc = F.getParent()->getOrInsertFunction(
        "__oat_func_exit", Type::getVoidTy(Ctx), Type::getInt32Ty(Ctx));

    // ── Scan all basic blocks ─────────────────────────────────────────────
    for (auto &BB : F) {

      // ── 1. Returns → __oat_func_exit (backward edge / hash update) ──────
      // Paper: "for each return, the measurement engine encodes the return
      //         address to the hash: H = Hash(H XOR RetAddr)"
      // One world switch per return.
      if (ReturnInst *RI = dyn_cast<ReturnInst>(BB.getTerminator())) {
        IRBuilder<> Builder(RI);
        Builder.CreateCall(exitFunc, {Builder.getInt32(funcID)});
        modified = true;
      }

      // ── 2. Conditional branches → __oat_log (forward edge / trace) ──────
      // Paper: "for each branch, it adds the taken/non-taken bit to the trace"
      // Instrumentation goes on the BRANCH EDGE — insert BEFORE the branch,
      // recording which way it went.
      // We insert into the TRUE successor and FALSE successor basic blocks
      // at their first insertion point, which correctly records the taken
      // direction at the point execution enters that successor.
      //
      // One world switch per branch outcome (one per dynamic branch execution).
      Instruction *Term = BB.getTerminator();
      if (BranchInst *BI = dyn_cast<BranchInst>(Term)) {
        if (BI->isConditional()) {
          // True successor — branch was TAKEN
          BasicBlock *TrueDest = BI->getSuccessor(0);
          IRBuilder<> BuilderTrue(&*TrueDest->getFirstInsertionPt());
          BuilderTrue.CreateCall(logFunc, {BuilderTrue.getInt32(1)});

          // False successor — branch was NOT TAKEN
          BasicBlock *FalseDest = BI->getSuccessor(1);
          IRBuilder<> BuilderFalse(&*FalseDest->getFirstInsertionPt());
          BuilderFalse.CreateCall(logFunc, {BuilderFalse.getInt32(0)});

          modified = true;
        }
        // Unconditional branches: NOT instrumented (not in Smin)
      }

      // ── 3. Indirect calls → __oat_log_indirect (forward edge / trace) ───
      // Paper Table VI: "blr xr" → records xr (target address)
      // Paper: "for each indirect call/jump, adds the destination address"
      // One world switch per indirect call.
      for (auto &I : BB) {
        if (auto *CI = dyn_cast<CallBase>(&I)) {
          if (CI->isIndirectCall()) {
            IRBuilder<> Builder(CI);
            Value *targetPtr = CI->getCalledOperand();
            Value *targetInt = Builder.CreatePtrToInt(
                targetPtr, Builder.getInt64Ty());
            Builder.CreateCall(logIndirectFunc, {targetInt});
            modified = true;
          }
          // Direct calls: NOT instrumented (explicitly excluded from Smin)
        }
      }

      // ── 4. Indirect jumps (switch / indirectbr) ──────────────────────────
      // Paper Table VI: "br xr" → records xr (target address)
      // LLVM represents indirect jumps as IndirectBrInst.
      // One world switch per indirect jump.
      if (IndirectBrInst *IBI = dyn_cast<IndirectBrInst>(BB.getTerminator())) {
        IRBuilder<> Builder(IBI);
        Value *targetPtr = IBI->getAddress();
        Value *targetInt = Builder.CreatePtrToInt(
            targetPtr, Builder.getInt64Ty());
        Builder.CreateCall(logIndirectFunc, {targetInt});
        modified = true;
      }
    }

    return modified ? PreservedAnalyses::none() : PreservedAnalyses::all();
  }
};
} // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "OATPass", "v0.4",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name, FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name == "oat-pass") {
            FPM.addPass(OATPass());
            return true;
          }
          return false;
        });
    }
  };
}