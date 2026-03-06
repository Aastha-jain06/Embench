/* host/liboat_count_only.h
 *
 * Count-only runtime matching the OAT paper's Smin exactly.
 *
 * World switches per the paper (Table VI + Section IV):
 *
 *   Function               | Paper event          | Triggered by OATPass
 *   ───────────────────────┼──────────────────────┼─────────────────────────
 *   __oat_init()           | oei_attest_begin      | Manually by benchmark
 *   __oat_log(val)         | cond. branch (trace)  | Every conditional branch
 *   __oat_log_indirect(a)  | ind. call/jump (trace)| Every indirect call/jump
 *   __oat_func_exit(id)    | return (hash update)  | Every function return
 *   __oat_print_proof()    | oei_attest_end        | Manually by benchmark
 *
 * NOT present (paper explicitly excludes):
 *   __oat_func_enter — direct calls NOT in Smin, no world switch on entry
 */

#ifndef LIBOAT_COUNT_ONLY_H
#define LIBOAT_COUNT_ONLY_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ── Injected by OATPass (do NOT call manually) ─────────────────────────── */

/* Conditional branch: val=1 (taken), val=0 (not-taken)
 * Paper: "for each branch, adds the taken/non-taken bit to the trace" */
void __oat_log(int val);

/* Indirect call or indirect jump: target address
 * Paper: "for each indirect call/jump, adds the destination address to trace"
 * Paper Table VI: blr xr (indirect call), br xr (indirect jump) */
void __oat_log_indirect(uint64_t target_addr);

/* Return: encodes return address into hash
 * Paper: "H = Hash(H XOR RetAddr)" — one world switch per return
 * Paper Table VI: ret -> records (pc, lr) */
void __oat_func_exit(int func_id);

/* ── Called manually by benchmark ───────────────────────────────────────── */

/* oei_attest_begin — start of attested operation, resets counters */
void __oat_init(void);

/* oei_attest_end — end of attested operation, prints switch breakdown */
void __oat_print_proof(void);

/* ── Utility ─────────────────────────────────────────────────────────────── */

void     oat_reset_switch_count(void);
uint64_t oat_get_switch_count(void);

#ifdef __cplusplus
}
#endif

#endif /* LIBOAT_COUNT_ONLY_H */