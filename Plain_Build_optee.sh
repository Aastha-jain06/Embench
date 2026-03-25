#!/bin/bash
# ============================================================
# Embench-IOT Build Script for OP-TEE / AArch64
# Strategy: clang compiles IR -> cross GCC links (no LLVM pass)
# Usage: ./run_embench_optee.sh
# Run from: ~/Videos/Aastha/v1_embench/
# ============================================================

# ── Toolchain paths ──────────────────────────────────────────
CLANG=/usr/lib/llvm-18/bin/clang
CROSS_GCC=/home/dell/Videos/Aastha/optee/out-br/host/bin/aarch64-linux-gnu-gcc
SYSROOT=/home/dell/Videos/Aastha/optee/out-br/host/aarch64-buildroot-linux-gnu/sysroot

# ── Project paths ─────────────────────────────────────────────
BENCH_DIR="./embench-iot-benchmarks-backup"
OUT_DIR="./output_optee_plain"
RESULTS_FILE="${OUT_DIR}/build_stats_optee.txt"

# ── Colors ───────────────────────────────────────────────────
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

mkdir -p "${OUT_DIR}/obj" "${OUT_DIR}/bins" "${OUT_DIR}/logs"

echo "=============================================="
echo "  Embench-IOT Plain Build (OP-TEE/AArch64)"
echo "=============================================="
echo "  Clang    : ${CLANG}"
echo "  Cross GCC: ${CROSS_GCC}"
echo "  Sysroot  : ${SYSROOT}"
echo "  Strategy : clang compiles, cross GCC links (no LLVM pass)"
echo "=============================================="
echo ""

# ── Verify toolchain ─────────────────────────────────────────
echo "[*] Verifying toolchain ..."

[ ! -f "${CLANG}" ]     && echo -e "${RED}[!] clang not found: ${CLANG}${NC}"         && exit 1
[ ! -f "${CROSS_GCC}" ] && echo -e "${RED}[!] cross-gcc not found: ${CROSS_GCC}${NC}" && exit 1
[ ! -d "${SYSROOT}" ]   && echo -e "${RED}[!] sysroot not found: ${SYSROOT}${NC}"     && exit 1

# Smoke test
echo "int main(){return 0;}" > /tmp/_smoke.c
${CLANG} --target=aarch64-linux-gnu --sysroot=${SYSROOT} \
    -c /tmp/_smoke.c -o /tmp/_smoke.o 2>/dev/null
${CROSS_GCC} /tmp/_smoke.o -o /tmp/_smoke_bin 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Smoke test failed. Check toolchain.${NC}"
    exit 1
fi
ARCH=$(file /tmp/_smoke_bin | grep -o "ARM aarch64")
if [ -n "$ARCH" ]; then
    echo -e "${GREEN}[+] Toolchain OK — produces AArch64 binary${NC}"
else
    echo -e "${RED}[!] Binary is not AArch64. Check toolchain.${NC}"
    exit 1
fi
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

# Init results file
echo "Plain Build Results (OP-TEE/AArch64) - $(date)" > "${RESULTS_FILE}"
echo "Target   : aarch64-linux-gnu"                   >> "${RESULTS_FILE}"
echo "CPU_MHZ  : 1000"                                >> "${RESULTS_FILE}"
echo "Sysroot  : ${SYSROOT}"                          >> "${RESULTS_FILE}"
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
    OBJ="${OUT_DIR}/obj/${NAME}.o"
    BIN="${OUT_DIR}/bins/${NAME}"
    FAILED=0

    echo "----------------------------------------------"
    echo "[*] ${NAME}"
    > "${LOG}"

    [ ! -f "${SRC_PATH}" ] && \
        echo -e "${RED}    [!] Source not found: ${SRC_PATH}${NC}" && \
        FAIL_COUNT=$((FAIL_COUNT+1)) && FAILED_NAMES="${FAILED_NAMES} ${NAME}" && continue

    # ── 1. Compile source → .o (clang, AArch64) ──────────────
    echo "    [1/2] Compiling to object (clang AArch64) ..."
    ${CLANG} -O0 \
        --target=aarch64-linux-gnu \
        --sysroot=${SYSROOT} \
        -c "${SRC_PATH}" \
        -I "${BENCH_DIR}" \
        -DCPU_MHZ=1000 \
        -o "${OBJ}" >> "${LOG}" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "${RED}    [!] Compile to .o failed${NC}"; cat "${LOG}"; FAILED=1
    fi

    # ── 2. Link with cross GCC ────────────────────────────────
    if [ $FAILED -eq 0 ]; then
        echo "    [2/2] Linking with cross GCC ..."
        ${CROSS_GCC} \
            "${OBJ}" \
            ${EXTRA} \
            -o "${BIN}" >> "${LOG}" 2>&1
        if [ $? -ne 0 ]; then
            echo -e "${RED}    [!] Linking failed${NC}"; cat "${LOG}"; FAILED=1
        else
            ARCH=$(file "${BIN}" | grep -o "ARM aarch64")
            if [ -n "$ARCH" ]; then
                echo -e "${GREEN}    [+] AArch64 binary ready: ${BIN}${NC}"
            else
                echo -e "${YELLOW}    [~] Binary built but check arch: file ${BIN}${NC}"
            fi
        fi
    fi

    if [ $FAILED -eq 0 ]; then
        echo "" >> "${RESULTS_FILE}"
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
echo "  Binaries : ${OUT_DIR}/bins/"
echo "  Logs     : ${OUT_DIR}/logs/"
echo ""
echo -e "  ${BLUE}To run on RPi/OP-TEE:${NC}"
echo "    scp ${OUT_DIR}/bins/* user@<rpi-ip>:/tmp/"
echo "    ssh user@<rpi-ip> '/tmp/aha-mont64'"
echo "=============================================="

echo "" >> "${RESULTS_FILE}"
echo "==============================================" >> "${RESULTS_FILE}"
echo "Built: ${PASS_COUNT} / $((PASS_COUNT + FAIL_COUNT))" >> "${RESULTS_FILE}"
[ -n "${FAILED_NAMES}" ] && echo "Failed:${FAILED_NAMES}" >> "${RESULTS_FILE}"