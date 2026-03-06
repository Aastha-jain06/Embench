#!/bin/bash
# ============================================================
# Branch Counter Instrumentation Script for Embench-IOT
# Each benchmark is self-contained with its own main()
# Usage: ./run_branch_counter.sh
# Run from: ~/Videos/Aastha/v1_embench/

# ============================================================

set -e




# ── Paths ────────────────────────────────────────────────────
COUNTER_DIR="./counter"
BENCH_DIR="./embench-iot-benchmarks"
OUT_DIR="./output"
PASS_SO="${COUNTER_DIR}/BranchCounterPass.so"
RUNTIME_OBJ="${COUNTER_DIR}/branch_runtime.o"
RESULTS_FILE="${OUT_DIR}/branch_stats_all.txt"

# ── Colors ───────────────────────────────────────────────────
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ── Setup output dirs ─────────────────────────────────────────
mkdir -p "${OUT_DIR}/ir" "${OUT_DIR}/ir_inst" "${OUT_DIR}/bins" "${OUT_DIR}/logs"

echo "=============================================="
echo "  Branch Counter - Embench-IOT Suite"
echo "=============================================="
echo ""

# ── Rebuild runtime ───────────────────────────────────────────
echo "[*] Building branch_runtime.o ..."
clang -c "${COUNTER_DIR}/branch_runtime.c" \
      -I "${COUNTER_DIR}" \
      -o "${RUNTIME_OBJ}"
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Failed to build branch_runtime.o. Exiting.${NC}"
    exit 1
fi
echo "[+] branch_runtime.o ready"
echo ""

# ── Benchmark list: "binary_name:source_file:extra_link_flags" ──
# extra_link_flags:
#   cubic        -> -lm  (uses sqrt, cos, acos, pow, atan)
#   sglib-combined -> -I for sglib.h (already in bench dir, handled via -I)
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

# ── Clear results file ────────────────────────────────────────
echo "Branch Counter Results - $(date)" > "${RESULTS_FILE}"
echo "CPU_MHZ=1000" >> "${RESULTS_FILE}"
echo "==============================================" >> "${RESULTS_FILE}"

# ── Process each benchmark ────────────────────────────────────
PASS_COUNT=0
FAIL_COUNT=0
FAILED_NAMES=""

for entry in "${BENCHMARKS[@]}"; do
    # Parse "name:src:extra_flags"
    NAME=$(echo "$entry" | cut -d: -f1)
    SRC=$(echo "$entry"  | cut -d: -f2)
    EXTRA=$(echo "$entry" | cut -d: -f3)

    SRC_PATH="${BENCH_DIR}/${SRC}"
    LOG="${OUT_DIR}/logs/${NAME}.log"
    IR="${OUT_DIR}/ir/${NAME}.ll"
    IR_INST="${OUT_DIR}/ir_inst/${NAME}_inst.ll"
    BIN="${OUT_DIR}/bins/${NAME}-instrumented"
    FAILED=0

    echo "----------------------------------------------"
    echo "[*] Processing: ${NAME} (${SRC})"
    > "${LOG}"  # clear log

    # Check source exists
    if [ ! -f "${SRC_PATH}" ]; then
        echo -e "${RED}[!] SKIP: ${SRC_PATH} not found${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_NAMES="${FAILED_NAMES} ${NAME}"
        continue
    fi

    # Step 1: Generate LLVM IR at -O0
    echo "    [1/4] Generating IR ..."
    clang -O0 -S -emit-llvm \
        "${SRC_PATH}" \
        -I "${COUNTER_DIR}" \
        -I "${BENCH_DIR}" \
        -DCPU_MHZ=1000 \
        -o "${IR}" >> "${LOG}" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "${RED}    [!] FAILED at IR generation${NC}"
        echo "    See: ${LOG}"
        cat "${LOG}"
        FAILED=1
    fi

    # Step 2: Strip optnone so pass runs at -O0
    if [ $FAILED -eq 0 ]; then
        echo "    [2/4] Stripping optnone ..."
        opt -strip-debug -S "${IR}" 2>>"${LOG}" | \
            sed 's/optnone/noinline/g' > "${IR}.stripped"
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] FAILED at optnone strip${NC}"
            cat "${LOG}"
            FAILED=1
        else
            mv "${IR}.stripped" "${IR}"
        fi
    fi

    # Step 3: Run BranchCounterPass
    if [ $FAILED -eq 0 ]; then
        echo "    [3/4] Instrumenting with BranchCounterPass ..."
        opt -load-pass-plugin="${PASS_SO}" \
            -passes="branch-counter" \
            -S "${IR}" -o "${IR_INST}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] FAILED at instrumentation${NC}"
            cat "${LOG}"
            FAILED=1
        else
            COUNT=$(grep -c "increment_" "${IR_INST}" 2>/dev/null || echo 0)
            echo "    [+] Found ${COUNT} instrumentation call(s) in IR"
        fi
    fi

    # Step 4: Compile instrumented IR + link runtime
    if [ $FAILED -eq 0 ]; then
        echo "    [4/4] Compiling and linking ..."
        clang -O0 \
            "${IR_INST}" \
            "${RUNTIME_OBJ}" \
            -I "${COUNTER_DIR}" \
            -I "${BENCH_DIR}" \
            ${EXTRA} \
            -o "${BIN}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] FAILED at linking${NC}"
            cat "${LOG}"
            FAILED=1
        fi
    fi

    # Step 5: Run and capture stats
    if [ $FAILED -eq 0 ]; then
        echo "    [*] Running ${NAME} ..."
        echo "" >> "${RESULTS_FILE}"
        echo "### ${NAME} ###" >> "${RESULTS_FILE}"

        timeout 120 "${BIN}" >> "${RESULTS_FILE}" 2>&1
        EXIT_CODE=$?

        if [ $EXIT_CODE -eq 124 ]; then
            echo -e "${RED}    [!] TIMEOUT after 120s${NC}"
            echo "TIMEOUT" >> "${RESULTS_FILE}"
            FAIL_COUNT=$((FAIL_COUNT + 1))
            FAILED_NAMES="${FAILED_NAMES} ${NAME}(timeout)"
        else
            echo -e "${GREEN}    [+] Done!${NC}"
            PASS_COUNT=$((PASS_COUNT + 1))
        fi
    else
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_NAMES="${FAILED_NAMES} ${NAME}"
    fi

done

# ── Summary ───────────────────────────────────────────────────
echo ""
echo "=============================================="
echo "  COMPLETE"
echo "  Passed : ${PASS_COUNT} / $((PASS_COUNT + FAIL_COUNT))"
if [ -n "${FAILED_NAMES}" ]; then
    echo -e "  ${RED}Failed : ${FAILED_NAMES}${NC}"
fi
echo "  Results: ${RESULTS_FILE}"
echo "=============================================="

echo "" >> "${RESULTS_FILE}"
echo "==============================================" >> "${RESULTS_FILE}"
echo "Passed: ${PASS_COUNT} / $((PASS_COUNT + FAIL_COUNT))" >> "${RESULTS_FILE}"
[ -n "${FAILED_NAMES}" ] && echo "Failed:${FAILED_NAMES}" >> "${RESULTS_FILE}"