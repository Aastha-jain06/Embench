/* host/liboat_count_only.c
 *
 * Count-only runtime matching the OAT paper's Smin exactly.
 * No TEE calls, no libteec dependency.
 *
 * Paper's Smin (Section IV + Table VI):
 *   - Conditional branches  → trace (1 bit: taken/not-taken)
 *   - Indirect call/jump    → trace (destination address)
 *   - Returns               → hash  (H = Hash(H XOR RetAddr))
 *   - Direct calls          → NOT instrumented (excluded from Smin)
 *   - Function entries      → NOT instrumented (no equivalent in paper)
 *
 * Each instrumented event = 1 world switch in the real OAT system.
 * Here we replace each switch with a counter increment.
 *
 * Expected counts to match paper's Table II (for OAT column):
 *   Total = conditional_branches + indirect_calls_jumps + returns
 *         + 1 (oei_attest_begin) + 1 (oei_attest_end)
 */

#include <stdio.h>
#include <stdint.h>

/* ── Per-event counters ──────────────────────────────────────────────────── */
static uint64_t world_switch_count = 0;  /* total                          */
static uint64_t count_init         = 0;  /* oei_attest_begin               */
static uint64_t count_branch       = 0;  /* conditional branches (trace)   */
static uint64_t count_indirect     = 0;  /* indirect call/jump (trace)     */
static uint64_t count_ret          = 0;  /* returns (hash update)          */

/* ── Hook implementations ───────────────────────────────────────────────── */

/* oei_attest_begin: start of attested operation.
 * Resets per-operation counters — mirrors CMD_HASH_INIT in original liboat.c */
void __oat_init(void) {
    world_switch_count++;
    count_init++;

    /* Reset per-operation event counters */
    count_branch   = 0;
    count_indirect = 0;
    count_ret      = 0;
}

/* Conditional branch: val=1 (taken), val=0 (not-taken).
 * Paper: "for each branch, adds the taken/non-taken bit to the trace"
 * One world switch per dynamic conditional branch execution. */
void __oat_log(int val) {
    (void)val;
    world_switch_count++;
    count_branch++;
}

/* Indirect call or indirect jump: target address.
 * Paper Table VI: blr xr (indirect call), br xr (indirect jump)
 * Paper: "for each indirect call/jump, adds the destination address"
 * One world switch per indirect transfer. */
void __oat_log_indirect(uint64_t target_addr) {
    (void)target_addr;
    world_switch_count++;
    count_indirect++;
}

/* Return: encodes return address into hash.
 * Paper: "H = Hash(H XOR RetAddr)" — backward edge measurement.
 * Paper Table VI: ret -> records (pc, lr)
 * One world switch per return.
 * NOTE: No __oat_func_enter — paper does NOT instrument function entries. */
void __oat_func_exit(int func_id) {
    (void)func_id;
    world_switch_count++;
    count_ret++;
}

/* ── Reporting ──────────────────────────────────────────────────────────── */

/* oei_attest_end: end of attested operation.
 * Counts as 1 world switch (CMD_HASH_FINAL in original liboat.c).
 * Prints breakdown matching paper's Table II OAT column. */
void __oat_print_proof(void) {
    world_switch_count++;   /* oei_attest_end / CMD_HASH_FINAL */

    printf("[OAT] --- World Switch Count (paper Smin, count-only mode) ---\n");
    printf("[OAT]   oei_attest_begin:          %llu\n",
           (unsigned long long)count_init);
    printf("[OAT]   Cond. branches (trace):    %llu\n",
           (unsigned long long)count_branch);
    printf("[OAT]   Indirect call/jump (trace):%llu\n",
           (unsigned long long)count_indirect);
    printf("[OAT]   Returns (hash):            %llu\n",
           (unsigned long long)count_ret);
    printf("[OAT]   oei_attest_end:            1\n");
    printf("[OAT] -------------------------------------------------------\n");
    printf("[OAT]   Total World Switches:      %llu\n",
           (unsigned long long)world_switch_count);
    printf("[OAT]   (paper formula: branches + indirect + returns + 2)\n");
    printf("[OAT] -------------------------------------------------------\n");
}

void oat_reset_switch_count(void) {
    world_switch_count = 0;
    count_init         = 0;
    count_branch       = 0;
    count_indirect     = 0;
    count_ret          = 0;
}

uint64_t oat_get_switch_count(void) {
    return world_switch_count;
}