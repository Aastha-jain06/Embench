#!/bin/bash
# ============================================================
# Auto-patch all Embench-IOT benchmark files for OAT:
#   1. #include "liboat_count_only.h"  after last #include
#   2. __oat_init()                    before benchmark()
#   3. __oat_print_proof()             before verify_benchmark()
# Usage: ./patch_benchmarks_oat.sh
# Run from: ~/Videos/Aastha/v1_embench/
# ============================================================

BENCH_DIR="./embench-iot-benchmarks-oat-count"
BACKUP_DIR="./embench-iot-benchmarks-backup"

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
    if grep -q "liboat_count_only.h" "$SRC"; then
        echo -e "${YELLOW}    [~] Already patched, skipping${NC}"
        continue
    fi

    OK=1

    # ── 1. Add #include "liboat_count_only.h" after last #include ──
    LAST_INCLUDE=$(grep -n "^#include" "$SRC" | tail -1 | cut -d: -f1)
    if [ -n "$LAST_INCLUDE" ]; then
        sed -i "${LAST_INCLUDE}a #include \"liboat_count_only.h\"" "$SRC"
        echo "    [+] Added #include \"liboat_count_only.h\" after line ${LAST_INCLUDE}"
    else
        echo -e "${RED}    [!] No #include found — skipping include patch${NC}"
        OK=0
    fi

    # ── 2. Add __oat_init() before result = benchmark() ──────
    # Starts the world-switch counter just before the timed region.
    # warm_caches() is intentionally left outside — we only count
    # switches during the actual benchmark run, not cache warmup.
    if grep -q "result = benchmark" "$SRC"; then
        sed -i '/result = benchmark/i\  __oat_init ();' "$SRC"
        echo "    [+] Added __oat_init() before result = benchmark()"
    else
        echo -e "${YELLOW}    [~] No result = benchmark() found — skipping __oat_init()${NC}"
        OK=0
    fi

    # ── 3. Add __oat_print_proof() before verify_benchmark() ─
    # Counts the CMD_HASH_FINAL switch and prints the full breakdown.
    if grep -q "verify_benchmark" "$SRC"; then
        sed -i '/correct = verify_benchmark/i\  __oat_print_proof ();' "$SRC"
        echo "    [+] Added __oat_print_proof() before verify_benchmark()"
    else
        echo -e "${YELLOW}    [~] No verify_benchmark() found — skipping __oat_print_proof()${NC}"
        OK=0
    fi

    # ── Verify patches ────────────────────────────────────────
    grep -q "liboat_count_only.h"  "$SRC" || { echo -e "${RED}    [!] liboat_count_only.h include missing${NC}";  OK=0; }
    grep -q "__oat_init"           "$SRC" || { echo -e "${RED}    [!] __oat_init() missing${NC}";                 OK=0; }
    grep -q "__oat_print_proof"    "$SRC" || { echo -e "${RED}    [!] __oat_print_proof() missing${NC}";          OK=0; }

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