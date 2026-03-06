#!/bin/bash
# ============================================================
# CFLAT Instrumentation Script for Embench-IOT
# Target: OP-TEE / AArch64 cross-compilation
# Strategy: clang compiles IR -> cross GCC links
# Usage: ./run_cflat_optee.sh
# Run from: ~/Videos/Aastha/v1_embench/
# ============================================================

# ── Toolchain paths ──────────────────────────────────────────
CLANG=/usr/lib/llvm-18/bin/clang
OPT=/usr/lib/llvm-18/bin/opt
CROSS_GCC=/home/dell/Videos/Aastha/optee/out-br/host/bin/aarch64-linux-gnu-gcc
SYSROOT=/home/dell/Videos/Aastha/optee/out-br/host/aarch64-buildroot-linux-gnu/sysroot

# ── libteec — sysroot copy (correct AArch64 cross-link library) ──
LIBTEEC_DIR="${SYSROOT}/usr/lib"
LIBTEEC_FLAG="-L${LIBTEEC_DIR} -lteec"

# ── Project paths ────────────────────────────────────────────
COUNTER_DIR="./counter"
BENCH_DIR="./embench-iot-benchmarks-backup"
OUT_DIR="./output_cflat_optee"
PASS_SO="${COUNTER_DIR}/CFlatPass.so"
CFLAT_OBJ="${OUT_DIR}/libcflat.o"
RESULTS_FILE="${OUT_DIR}/cflat_stats_optee.txt"

# ── Colors ───────────────────────────────────────────────────
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

mkdir -p "${OUT_DIR}/ir" "${OUT_DIR}/ir_inst" "${OUT_DIR}/obj" "${OUT_DIR}/cflat" "${OUT_DIR}/logs"

echo "=============================================="
echo "  CFLAT - Embench-IOT (OP-TEE/AArch64)"
echo "=============================================="
echo "  Clang    : ${CLANG}"
echo "  Cross GCC: ${CROSS_GCC}"
echo "  Sysroot  : ${SYSROOT}"
echo "  Pass     : ${PASS_SO}"
echo "  libteec  : ${LIBTEEC_DIR}/libteec.so"
echo "  Strategy : clang compiles IR, cross GCC links"
echo "=============================================="
echo ""

# ── Verify toolchain & dependencies ──────────────────────────
echo "[*] Verifying toolchain ..."

[ ! -f "${CLANG}" ]                  && echo -e "${RED}[!] clang not found: ${CLANG}${NC}"                        && exit 1
[ ! -f "${CROSS_GCC}" ]              && echo -e "${RED}[!] cross-gcc not found: ${CROSS_GCC}${NC}"                && exit 1
[ ! -d "${SYSROOT}" ]                && echo -e "${RED}[!] sysroot not found: ${SYSROOT}${NC}"                    && exit 1
[ ! -f "${PASS_SO}" ]                && echo -e "${RED}[!] CFlatPass.so not found: ${PASS_SO}${NC}"               && exit 1
[ ! -f "${COUNTER_DIR}/libcflat.o" ] && echo -e "${RED}[!] libcflat.o not found: ${COUNTER_DIR}/libcflat.o${NC}" && exit 1
[ ! -f "${LIBTEEC_DIR}/libteec.so" ] && echo -e "${RED}[!] libteec.so not found: ${LIBTEEC_DIR}/libteec.so${NC}" && exit 1

echo -e "${GREEN}[+] libteec.so : ${LIBTEEC_DIR}/libteec.so${NC}"

# ── Smoke test ────────────────────────────────────────────────
echo "int main(){return 0;}" > /tmp/_smoke.c
${CLANG} --target=aarch64-linux-gnu --sysroot=${SYSROOT} \
    -c /tmp/_smoke.c -o /tmp/_smoke.o 2>/dev/null
${CROSS_GCC} /tmp/_smoke.o -o /tmp/_smoke_bin 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Smoke test failed. Check toolchain.${NC}"
    exit 1
fi
ARCH=$(file /tmp/_smoke_bin | grep -o "ARM aarch64")
if [ -z "$ARCH" ]; then
    echo -e "${RED}[!] Binary is not AArch64. Check toolchain.${NC}"
    exit 1
fi
echo -e "${GREEN}[+] Toolchain OK — produces AArch64 binary${NC}"
echo ""

# ── Copy libcflat.o (pre-built AArch64) ──────────────────────
echo "[*] Copying libcflat.o ..."
cp "${COUNTER_DIR}/libcflat.o" "${CFLAT_OBJ}"
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Failed to copy libcflat.o${NC}"
    exit 1
fi
echo -e "${GREEN}[+] libcflat.o ready${NC}"
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

echo "CFLAT Results (OP-TEE/AArch64) - $(date)" > "${RESULTS_FILE}"
echo "Target   : aarch64-linux-gnu"             >> "${RESULTS_FILE}"
echo "CPU_MHZ  : 1000"                          >> "${RESULTS_FILE}"
echo "libteec  : ${LIBTEEC_DIR}"                >> "${RESULTS_FILE}"
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
    BIN="${OUT_DIR}/cflat/${NAME}-cflat"
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
        cat "${LOG}"
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

    # ── 3. Instrument with CFlatPass ─────────────────────────
    if [ $FAILED -eq 0 ]; then
        echo "    [3/5] Instrumenting with CFlatPass ..."
        ${OPT} -load-pass-plugin="${PASS_SO}" \
            -passes="cflat-pass" \
            -S "${IR}" -o "${IR_INST}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] CFlatPass instrumentation failed${NC}"
            cat "${LOG}"
            FAILED=1
        else
            COUNT=$(grep -c "call void" "${IR_INST}" 2>/dev/null || echo 0)
            echo "    [+] ${COUNT} CFLAT instrumentation calls injected"
        fi
    fi

    # ── 4. Compile instrumented IR → .o (clang, AArch64) ─────
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
            cat "${LOG}"
            FAILED=1
        fi
    fi

    # ── 5. Link: <name>.o + libcflat.o + libteec ─────────────
    if [ $FAILED -eq 0 ]; then
        echo "    [5/5] Linking with cross GCC ..."
        ${CROSS_GCC} \
            "${OBJ}" \
            "${CFLAT_OBJ}" \
            ${LIBTEEC_FLAG} \
            ${EXTRA} \
            -o "${BIN}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] Linking failed${NC}"
            cat "${LOG}"
            FAILED=1
        else
            ARCH=$(file "${BIN}" | grep -o "ARM aarch64")
            if [ -n "$ARCH" ]; then
                echo -e "${GREEN}    [+] AArch64 binary ready: ${BIN}${NC}"
            else
                echo -e "${YELLOW}    [~] Binary built — verify arch: file ${BIN}${NC}"
            fi
        fi
    fi

    if [ $FAILED -eq 0 ]; then
        echo ""                >> "${RESULTS_FILE}"
        echo "### ${NAME} ###" >> "${RESULTS_FILE}"
        echo "Binary : ${BIN}" >> "${RESULTS_FILE}"
        echo "Status : BUILT OK — copy to RPi/OP-TEE to run" >> "${RESULTS_FILE}"
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
echo "  Binaries : ${OUT_DIR}/clfat/"
echo "  Logs     : ${OUT_DIR}/logs/"
echo ""
echo -e "  ${BLUE}To run on RPi/OP-TEE:${NC}"
echo "    scp ${OUT_DIR}/cflat/* user@<rpi-ip>:/tmp/"
echo "    ssh user@<rpi-ip> '/tmp/aha-mont64-cflat'"
echo "=============================================="

echo ""                                                         >> "${RESULTS_FILE}"
echo "==============================================" >> "${RESULTS_FILE}"
echo "Built: ${PASS_COUNT} / $((PASS_COUNT + FAIL_COUNT))"    >> "${RESULTS_FILE}"
[ -n "${FAILED_NAMES}" ] && echo "Failed:${FAILED_NAMES}"     >> "${RESULTS_FILE}"