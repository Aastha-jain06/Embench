#!/bin/bash
# ============================================================
# Auto-patch all Embench-IOT benchmark files for CFLAT:
#   1. #include "min_libcflat.h"       after last #include
#   2. cflat_finalize_and_print()  before verify_benchmark()
# Usage: ./patch_benchmarks_cflat.sh
# Run from: ~/Videos/Aastha/v1_embench/
# ============================================================

BENCH_DIR="./embench-iot-benchmarks-backup-cflat"
BACKUP_DIR="./embench-iot-benchmarks-backup-cflat-next"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ── Backup originals ──────────────────────────────────────────
echo "[*] Backing up original files to ${BACKUP_DIR} ..."
cp -r "${BENCH_DIR}" "${BACKUP_DIR}"
echo -e "${GREEN}[+] Backup saved to ${BACKUP_DIR}${NC}"
echo ""

PASS=0
FAIL=0

for SRC in "${BENCH_DIR}"/*.c; do
    NAME=$(basename "$SRC")

    echo "----------------------------------------------"
    echo "[*] Patching: ${NAME}"

    # ── Already patched? ──────────────────────────────────────
    if grep -q "min_libcflat.h" "$SRC"; then
        echo -e "${YELLOW}    [~] Already patched, skipping${NC}"
        continue
    fi

    OK=1

    # ── 1. Add #include "min_libcflat.h" after last #include ─────
    LAST_INCLUDE=$(grep -n "^#include" "$SRC" | tail -1 | cut -d: -f1)
    if [ -n "$LAST_INCLUDE" ]; then
        sed -i "${LAST_INCLUDE}a #include \"min_libcflat.h\"" "$SRC"
        echo "    [+] Added #include \"min_libcflat.h\" after line ${LAST_INCLUDE}"
    else
        echo -e "${RED}    [!] No #include found — skipping include patch${NC}"
        OK=0
    fi

    # ── 2. Add cflat_finalize_and_print() before verify_benchmark() ──
    # Same position as print_branch_stats() — just before result verification
    if grep -q "verify_benchmark" "$SRC"; then
        sed -i '/correct = verify_benchmark/i\  cflat_finalize_and_print ();' "$SRC"
        echo "    [+] Added cflat_finalize_and_print() before verify_benchmark()"
    else
        echo -e "${YELLOW}    [~] No verify_benchmark() found — skipping cflat_finalize_and_print()${NC}"
        OK=0
    fi

    # ── Verify patches ────────────────────────────────────────
    grep -q "min_libcflat.h"              "$SRC" || { echo -e "${RED}    [!] min_libcflat.h include missing${NC}";           OK=0; }
    grep -q "cflat_finalize_and_print" "$SRC" || { echo -e "${RED}    [!] cflat_finalize_and_print missing${NC}";    OK=0; }

    if [ $OK -eq 1 ]; then
        echo -e "${GREEN}    [+] All patches applied${NC}"
        PASS=$((PASS + 1))
    else
        FAIL=$((FAIL + 1))
    fi
done

echo ""
echo "=============================================="
echo "  Patching Complete"
echo "  Patched  : ${PASS}"
echo "  Failed   : ${FAIL}"
echo "  Backup   : ${BACKUP_DIR}"
echo "  To restore: cp ${BACKUP_DIR}/*.c ${BENCH_DIR}/"
echo "=============================================="
