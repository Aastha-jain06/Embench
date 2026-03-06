/* instrumentation/runtime/libcflat_count_only.c
 *
 * World-switch counter ONLY — no TEE communication, no hash computation.
 *
 * Every instrumentation hook that would normally invoke TEEC_InvokeCommand
 * (i.e. cross the Normal World → Secure World boundary) simply increments
 * world_switch_count instead.  This isolates the raw world-switch overhead
 * from all other costs (TEE session setup, TA hash logic, memory copies, etc.)
 *
 * The LLVM pass (CFlatPass.cpp) is unchanged — it still injects the same
 * __cflat_record_node / __cflat_call_enter / __cflat_call_return call sites,
 * so the count reflects exactly what a real CFLAT deployment would cross.
 */

#include <stdio.h>
#include <stdint.h>

/* ── Global counter ─────────────────────────────────────────────────────── */

static uint64_t world_switch_count = 0;

/* ── Instrumentation hooks ──────────────────────────────────────────────── */

/* Each function below corresponds to one TEEC_InvokeCommand call in the
 * original libcflat.c.  The body is intentionally empty except for the
 * counter increment so that no other latency is introduced. */

/* Conditional / unconditional branch edge */
void __cflat_record_node(uint64_t node_id) {
    (void)node_id;
    world_switch_count++;   /* NW → SW switch for CMD_RECORD_NODE */
}

/* Loop back-edge enter */
void __cflat_loop_enter(uint64_t loop_id) {
    (void)loop_id;
    world_switch_count++;   /* NW → SW switch for CMD_LOOP_ENTER */
}

/* Loop exit */
void __cflat_loop_exit(uint64_t loop_id) {
    (void)loop_id;
    world_switch_count++;   /* NW → SW switch for CMD_LOOP_EXIT */
}

/* Loop header re-entry (iteration tick) */
void __cflat_loop_iteration(uint64_t loop_id) {
    (void)loop_id;
    world_switch_count++;   /* NW → SW switch for CMD_LOOP_ITERATION */
}

/* Direct function call edge */
void __cflat_call_enter(uint64_t call_id, uint64_t caller) {
    (void)call_id;
    (void)caller;
    world_switch_count++;   /* NW → SW switch for CMD_CALL_ENTER */
}

/* Function return edge */
void __cflat_call_return(uint64_t call_id) {
    (void)call_id;
    world_switch_count++;   /* NW → SW switch for CMD_CALL_RETURN */
}

/* ── Reporting ──────────────────────────────────────────────────────────── */

/* Drop-in replacement for the original cflat_finalize_and_print().
 * Prints only the world-switch count; all TEE attestation / hash
 * output is omitted since no TA is involved. */
void cflat_finalize_and_print(void) {
    printf("[CFLAT] World switches: %llu\n",
           (unsigned long long)world_switch_count);
}

/* Reset the counter between measurement runs without restarting the process. */
void cflat_reset_switch_count(void) {
    world_switch_count = 0;
}

/* Read the current counter value programmatically. */
uint64_t cflat_get_switch_count(void) {
    return world_switch_count;
}