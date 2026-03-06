/* instrumentation/runtime/libcflat_count_only.h
 *
 * Public interface for the world-switch counter.
 * Include this wherever you need to report or reset the switch count.
 *
 * The instrumentation hooks (__cflat_*) are injected automatically by the
 * LLVM pass and do NOT need to be called manually — do not include this
 * header just for those.
 */

#ifndef LIBCFLAT_COUNT_ONLY_H
#define LIBCFLAT_COUNT_ONLY_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ── Instrumentation hooks (called automatically by LLVM pass) ──────────────
 *
 * These are injected at:
 *   - Every conditional/unconditional branch   → __cflat_record_node
 *   - Every loop back-edge enter               → __cflat_loop_enter
 *   - Every loop exit                          → __cflat_loop_exit
 *   - Every loop header re-entry (iteration)   → __cflat_loop_iteration
 *   - Every direct function call               → __cflat_call_enter
 *   - Every function return                    → __cflat_call_return
 *
 * Do NOT call these manually.
 */
void __cflat_record_node(uint64_t node_id);
void __cflat_loop_enter(uint64_t loop_id);
void __cflat_loop_exit(uint64_t loop_id);
void __cflat_loop_iteration(uint64_t loop_id);
void __cflat_call_enter(uint64_t call_id, uint64_t caller);
void __cflat_call_return(uint64_t call_id);

/* ── User-facing API (call these manually in your program) ──────────────────
 *
 * Typical usage:
 *
 *   cflat_reset_switch_count();   // optional: start from 0
 *   run_workload();
 *   cflat_print_switch_count();   // prints final count
 *
 *   // or read it yourself:
 *   uint64_t n = cflat_get_switch_count();
 */

/* Drop-in replacement for the original cflat_finalize_and_print().
 * Prints only the world switch count — no TEE attestation or hash output. */
void cflat_finalize_and_print(void);

/* Reset the counter to 0 (useful between multiple measurement runs). */
void cflat_reset_switch_count(void);

/* Return the current counter value without printing. */
uint64_t cflat_get_switch_count(void);

#ifdef __cplusplus
}
#endif

#endif /* LIBCFLAT_COUNT_ONLY_H */