#!/bin/bash
# ============================================================
# OAT World-Switch Counter Build Script for Embench-IOT
# Mode   : Count-only (no TEE / no libteec)
# Pass   : Paper-accurate Smin instrumentation
#          - Conditional branches (1 switch per branch)
#          - Indirect call/jump   (1 switch each)
#          - Returns              (1 switch each)
#          - Direct calls         NOT instrumented (excluded from Smin)
#          - Function entries     NOT instrumented (not in paper)
# Target : OP-TEE / AArch64 cross-compilation
# Usage  : ./run_oat_countonly.sh
# Run from: ~/Videos/Aastha/v1_embench/
# ============================================================

# ── Toolchain paths ──────────────────────────────────────────
CLANG=/usr/lib/llvm-18/bin/clang
OPT=/usr/lib/llvm-18/bin/opt
CROSS_GCC=/home/dell/Videos/Aastha/optee/out-br/host/bin/aarch64-linux-gnu-gcc
SYSROOT=/home/dell/Videos/Aastha/optee/out-br/host/aarch64-buildroot-linux-gnu/sysroot

# ── Project paths ────────────────────────────────────────────
COUNTER_DIR="./counter"
BENCH_DIR="./embench-iot-benchmarks-backup-cflat-next"
OUT_DIR="./output_oat_countonly"
PASS_SO="${COUNTER_DIR}/OATPass.so"
OAT_SRC="${COUNTER_DIR}/liboat_count_only.c"
OAT_OBJ="${OUT_DIR}/liboat_count_only.o"
RESULTS_FILE="${OUT_DIR}/oat_switch_counts.txt"

# ── Colors ───────────────────────────────────────────────────
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

mkdir -p "${OUT_DIR}/ir" "${OUT_DIR}/ir_inst" "${OUT_DIR}/obj" \
         "${OUT_DIR}/oat" "${OUT_DIR}/logs"

echo "=============================================="
echo "  OAT Count-Only (Paper-Accurate Smin)"
echo "  Instrumented events (per OAT paper):"
echo "    Cond. branches  — 1 switch each"
echo "    Indirect calls  — 1 switch each"
echo "    Indirect jumps  — 1 switch each"
echo "    Returns         — 1 switch each"
echo "    Direct calls    — NOT instrumented"
echo "    Function entry  — NOT instrumented"
echo "=============================================="
echo "  Clang    : ${CLANG}"
echo "  Cross GCC: ${CROSS_GCC}"
echo "  Sysroot  : ${SYSROOT}"
echo "  Pass     : ${PASS_SO}  (OATPass v0.4)"
echo "  Runtime  : ${OAT_SRC}  (count-only, paper Smin)"
echo "=============================================="
echo ""

# ── Verify toolchain & dependencies ──────────────────────────
echo "[*] Verifying toolchain ..."

[ ! -f "${CLANG}" ]     && echo -e "${RED}[!] clang not found: ${CLANG}${NC}"          && exit 1
[ ! -f "${CROSS_GCC}" ] && echo -e "${RED}[!] cross-gcc not found: ${CROSS_GCC}${NC}"  && exit 1
[ ! -d "${SYSROOT}" ]   && echo -e "${RED}[!] sysroot not found: ${SYSROOT}${NC}"      && exit 1
[ ! -f "${PASS_SO}" ]   && echo -e "${RED}[!] OATPass.so not found: ${PASS_SO}${NC}"   && exit 1
[ ! -f "${OAT_SRC}" ]   && echo -e "${RED}[!] liboat_count_only.c not found: ${OAT_SRC}${NC}" && exit 1

# ── Smoke test ────────────────────────────────────────────────
echo "int main(){return 0;}" > /tmp/_smoke.c
${CLANG} --target=aarch64-linux-gnu --sysroot=${SYSROOT} \
    -c /tmp/_smoke.c -o /tmp/_smoke.o 2>/dev/null
${CROSS_GCC} /tmp/_smoke.o -o /tmp/_smoke_bin 2>/dev/null
ARCH=$(file /tmp/_smoke_bin | grep -o "ARM aarch64")
if [ -z "$ARCH" ]; then
    echo -e "${RED}[!] Smoke test failed — binary is not AArch64. Check toolchain.${NC}"
    exit 1
fi
echo -e "${GREEN}[+] Toolchain OK — produces AArch64 binary${NC}"
echo ""

# ── Step 0: Compile liboat_count_only.c → AArch64 .o ─────────
echo "[*] Compiling liboat_count_only.c → AArch64 object ..."
${CLANG} -O0 \
    --target=aarch64-linux-gnu \
    --sysroot=${SYSROOT} \
    -c "${OAT_SRC}" \
    -I "${COUNTER_DIR}" \
    -o "${OAT_OBJ}" 2>/tmp/oat_runtime.log
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Failed to compile liboat_count_only.c${NC}"
    cat /tmp/oat_runtime.log
    exit 1
fi
echo -e "${GREEN}[+] liboat_count_only.o ready (no libteec)${NC}"
echo ""

# ── Benchmark list: "name:source:extra_link_flags" ───────────
BENCHMARKS=(
    "aha-mont64:mont64.c:"
    "crc32:crc_32.c:"
    "cubic:basicmath_small.c:-lm"
    "edn:libedn.c:"
    "huffbench:libhuffbench.c:"
    "matmult-int:matmult-int.c:"
    "minver:libminver.c:"
    "nbody:nbody.c:-lm"
    "nettle-aes:nettle-aes.c:"
    "nettle-sha256:nettle-sha256.c:"
    "primecount:primecount.c:"
    "sglib-combined:sglib-combined.c:"
    "st:libst.c:-lm"
    "tarfind:tarfind.c:"
    "ud:libud.c:"
)

echo "OAT Count-Only Results (Paper Smin, AArch64) - $(date)" > "${RESULTS_FILE}"
echo "Instrumented: cond.branches + indirect calls/jumps + returns" >> "${RESULTS_FILE}"
echo "NOT instrumented: direct calls, function entries"             >> "${RESULTS_FILE}"
echo "Paper formula: Total = branches + indirect + returns + 2"    >> "${RESULTS_FILE}"
echo "Reference (paper Table II OAT column):"                      >> "${RESULTS_FILE}"
echo "  aha-mont64   : 392,967,008"                                 >> "${RESULTS_FILE}"
echo "  crc32        : 348,840,008"                                 >> "${RESULTS_FILE}"
echo "  cubic        :     860,013"                                 >> "${RESULTS_FILE}"
echo "  edn          : 372,621,011"                                 >> "${RESULTS_FILE}"
echo "  huffbench    : 496,903,008"                                 >> "${RESULTS_FILE}"
echo "  matmult-int  : 406,825,691"                                 >> "${RESULTS_FILE}"
echo "  minver       : 115,440,042"                                 >> "${RESULTS_FILE}"
echo "  nbody        :   6,329,070"                                 >> "${RESULTS_FILE}"
echo "  nettle-aes   :  78,858,777"                                 >> "${RESULTS_FILE}"
echo "  nettle-sha256:  34,200,025"                                 >> "${RESULTS_FILE}"
echo "  primecount   : 880,206,008"                                 >> "${RESULTS_FILE}"
echo "  sglib-comb.  : 757,568,416"                                 >> "${RESULTS_FILE}"
echo "  st           :  17,108,010"                                 >> "${RESULTS_FILE}"
echo "  tarfind      : 117,236,430"                                 >> "${RESULTS_FILE}"
echo "  ud           : 413,840,009"                                 >> "${RESULTS_FILE}"
echo "==============================================" >> "${RESULTS_FILE}"

PASS_COUNT=0
FAIL_COUNT=0
FAILED_NAMES=""

for entry in "${BENCHMARKS[@]}"; do
    NAME=$(echo "$entry"  | cut -d: -f1)
    SRC=$(echo "$entry"   | cut -d: -f2)
    EXTRA=$(echo "$entry" | cut -d: -f3)

    SRC_PATH="${BENCH_DIR}/${SRC}"
    LOG="${OUT_DIR}/logs/${NAME}.log"
    IR="${OUT_DIR}/ir/${NAME}.ll"
    IR_INST="${OUT_DIR}/ir_inst/${NAME}_inst.ll"
    OBJ="${OUT_DIR}/obj/${NAME}.o"
    BIN="${OUT_DIR}/oat/${NAME}-oat"
    FAILED=0

    echo "----------------------------------------------"
    echo "[*] ${NAME}"
    > "${LOG}"

    if [ ! -f "${SRC_PATH}" ]; then
        echo -e "${RED}    [!] Source not found: ${SRC_PATH}${NC}"
        FAIL_COUNT=$((FAIL_COUNT+1))
        FAILED_NAMES="${FAILED_NAMES} ${NAME}"
        continue
    fi

    # ── 1. Generate AArch64 LLVM IR at -O0 ───────────────────
    echo "    [1/5] Generating AArch64 IR ..."
    ${CLANG} -O0 -S -emit-llvm \
        --target=aarch64-linux-gnu \
        --sysroot=${SYSROOT} \
        "${SRC_PATH}" \
        -I "${COUNTER_DIR}" \
        -I "${BENCH_DIR}" \
        -DCPU_MHZ=1000 \
        -o "${IR}" >> "${LOG}" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "${RED}    [!] IR generation failed${NC}"
        FAILED=1
    fi

    # ── 2. Strip optnone ──────────────────────────────────────
    if [ $FAILED -eq 0 ]; then
        echo "    [2/5] Stripping optnone ..."
        ${OPT} -strip-debug -S "${IR}" 2>>"${LOG}" | \
            sed 's/optnone/noinline/g' > "${IR}.stripped"
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] optnone strip failed${NC}"
            FAILED=1
        else
            mv "${IR}.stripped" "${IR}"
        fi
    fi

    # ── 3. Instrument with OATPass (paper-accurate Smin) ─────
    # Injects:
    #   __oat_log(val)           at every conditional branch successor
    #   __oat_log_indirect(addr) before every indirect call and indirect jump
    #   __oat_func_exit(id)      before every return
    # Does NOT inject:
    #   __oat_func_enter         (direct calls excluded from Smin)
    if [ $FAILED -eq 0 ]; then
        echo "    [3/5] Instrumenting with OATPass (paper Smin) ..."
        ${OPT} -load-pass-plugin="${PASS_SO}" \
            -passes="oat-pass" \
            -S "${IR}" -o "${IR_INST}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] OATPass instrumentation failed${NC}"
            cat "${LOG}"
            FAILED=1
        else
            BRANCH_COUNT=$(grep -c   "call.*__oat_log\b"         "${IR_INST}" 2>/dev/null); BRANCH_COUNT=${BRANCH_COUNT:-0}
            INDIRECT_COUNT=$(grep -c "call.*__oat_log_indirect"  "${IR_INST}" 2>/dev/null); INDIRECT_COUNT=${INDIRECT_COUNT:-0}
            EXIT_COUNT=$(grep -c     "call.*__oat_func_exit"     "${IR_INST}" 2>/dev/null); EXIT_COUNT=${EXIT_COUNT:-0}
            TOTAL=$(( BRANCH_COUNT + INDIRECT_COUNT + EXIT_COUNT ))
            echo "    [+] Injected sites: ${BRANCH_COUNT} branches, ${INDIRECT_COUNT} indirect, ${EXIT_COUNT} returns"
            echo "    [+] Total static sites: ${TOTAL} (no func_enter — matches paper)"
        fi
    fi

    # ── 4. Compile instrumented IR → .o ──────────────────────
    if [ $FAILED -eq 0 ]; then
        echo "    [4/5] Compiling IR to object (clang AArch64) ..."
        ${CLANG} -O0 \
            --target=aarch64-linux-gnu \
            --sysroot=${SYSROOT} \
            -c "${IR_INST}" \
            -I "${COUNTER_DIR}" \
            -I "${BENCH_DIR}" \
            -o "${OBJ}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] Compile to .o failed${NC}"
            FAILED=1
        fi
    fi

    # ── 5. Link (no -lteec) ───────────────────────────────────
    if [ $FAILED -eq 0 ]; then
        echo "    [5/5] Linking (no libteec) ..."
        ${CROSS_GCC} \
            "${OBJ}"     \
            "${OAT_OBJ}" \
            ${EXTRA}     \
            -o "${BIN}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] Linking failed${NC}"
            FAILED=1
        else
            ARCH=$(file "${BIN}" | grep -o "ARM aarch64")
            [ -n "$ARCH" ] && echo -e "${GREEN}    [+] AArch64 binary: ${BIN}${NC}" \
                           || echo -e "${YELLOW}    [~] Built — verify: file ${BIN}${NC}"
        fi
    fi

    if [ $FAILED -eq 0 ]; then
        echo ""                >> "${RESULTS_FILE}"
        echo "### ${NAME} ###" >> "${RESULTS_FILE}"
        echo "Binary : ${BIN}" >> "${RESULTS_FILE}"
        echo "Status : BUILT"  >> "${RESULTS_FILE}"
        PASS_COUNT=$((PASS_COUNT + 1))
    else
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_NAMES="${FAILED_NAMES} ${NAME}"
    fi
done

# ── Summary ───────────────────────────────────────────────────
echo ""
echo "=============================================="
echo -e "  ${GREEN}Built : ${PASS_COUNT} / $((PASS_COUNT + FAIL_COUNT))${NC}"
[ -n "${FAILED_NAMES}" ] && echo -e "  ${RED}Failed:${FAILED_NAMES}${NC}"
echo ""
echo -e "  ${BLUE}Copy to RPi and run:${NC}"
echo "    scp ${OUT_DIR}/oat/* user@<rpi-ip>:/tmp/"
echo "    ssh user@<rpi-ip> '/tmp/aha-mont64-oat'"
echo ""
echo -e "  ${BLUE}Expected output format:${NC}"
echo "    [OAT] --- World Switch Count (paper Smin, count-only mode) ---"
echo "    [OAT]   oei_attest_begin:          1"
echo "    [OAT]   Cond. branches (trace):    <count>"
echo "    [OAT]   Indirect call/jump (trace):<count>"
echo "    [OAT]   Returns (hash):            <count>"
echo "    [OAT]   oei_attest_end:            1"
echo "    [OAT]   Total World Switches:      <total>"
echo "    [OAT]   (paper formula: branches + indirect + returns + 2)"
echo "=============================================="