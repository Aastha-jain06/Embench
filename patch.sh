#!/bin/bash
# ============================================================
# Auto-patch all Embench-IOT benchmark files to add:
#   1. #include "branch_runtime.h"
#   2. init_branch_stats() after warm_caches()
#   3. print_branch_stats() before printf("%d\n", correct)
# Usage: ./patch_benchmarks.sh
# Run from: ~/Videos/Aastha/v1_embench/
# ============================================================

BENCH_DIR="./embench-iot-benchmarks"
BACKUP_DIR="./embench-iot-benchmarks-backup"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ── Backup originals first ────────────────────────────────────
echo "[*] Backing up original files to ${BACKUP_DIR} ..."
cp -r "${BENCH_DIR}" "${BACKUP_DIR}"
echo -e "${GREEN}[+] Backup done${NC}"
echo ""

PASS=0
FAIL=0

for SRC in "${BENCH_DIR}"/*.c; do
    NAME=$(basename "$SRC")
    echo "----------------------------------------------"
    echo "[*] Patching: ${NAME}"

    # ── Check if already patched ──────────────────────────────
    if grep -q "branch_runtime.h" "$SRC"; then
        echo -e "${YELLOW}[~] Already patched, skipping${NC}"
        continue
    fi

    # ── 1. Add #include "branch_runtime.h" after last #include ─
    # Find the last #include line and insert after it
    LAST_INCLUDE=$(grep -n "^#include" "$SRC" | tail -1 | cut -d: -f1)
    if [ -z "$LAST_INCLUDE" ]; then
        echo -e "${RED}[!] No #include found in ${NAME}, skipping${NC}"
        FAIL=$((FAIL + 1))
        continue
    fi

    sed -i "${LAST_INCLUDE}a #include \"branch_runtime.h\"" "$SRC"
    echo "    [+] Added #include \"branch_runtime.h\" after line ${LAST_INCLUDE}"

    # ── 2. Add init_branch_stats() after warm_caches(...) ──────
    # Pattern: find "warm_caches (" line and insert after it
    if grep -q "warm_caches" "$SRC"; then
        sed -i '/warm_caches\s*(/{
            /;/a\  init_branch_stats ();
        }' "$SRC"
        echo "    [+] Added init_branch_stats() after warm_caches()"
    else
        echo -e "${YELLOW}    [~] No warm_caches() found, skipping init_branch_stats()${NC}"
    fi

    # ── 3. Add print_branch_stats() before verify_benchmark ────
    # Pattern: find "correct = verify_benchmark" and insert before it
    if grep -q "verify_benchmark" "$SRC"; then
        sed -i '/correct = verify_benchmark/i\  print_branch_stats ();' "$SRC"
        echo "    [+] Added print_branch_stats() before verify_benchmark()"
    else
        echo -e "${YELLOW}    [~] No verify_benchmark() found, skipping print_branch_stats()${NC}"
    fi

    # ── Verify all 3 patches applied ─────────────────────────
    OK=1
    grep -q "branch_runtime.h"    "$SRC" || { echo -e "${RED}    [!] include missing${NC}";           OK=0; }
    grep -q "init_branch_stats"   "$SRC" || { echo -e "${RED}    [!] init_branch_stats missing${NC}"; OK=0; }
    grep -q "print_branch_stats"  "$SRC" || { echo -e "${RED}    [!] print_branch_stats missing${NC}"; OK=0; }

    if [ $OK -eq 1 ]; then
        echo -e "${GREEN}    [+] All patches applied successfully${NC}"
        PASS=$((PASS + 1))
    else
        FAIL=$((FAIL + 1))
    fi
done

echo ""
echo "=============================================="
echo "  Patching Complete"
echo "  Patched : ${PASS}"
echo "  Failed  : ${FAIL}"
echo "  Originals backed up in: ${BACKUP_DIR}"
echo "  To restore: cp -r ${BACKUP_DIR}/*.c ${BENCH_DIR}/"
echo "=============================================="
