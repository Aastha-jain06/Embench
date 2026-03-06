# v1_embench

`v1_embench` is an Embench-IOT experimentation workspace for comparing instrumentation and world-switch behavior across:
- Branch-counter instrumentation
- OAT (count-only mode)
- CFLAT (full OP-TEE mode and count-only mode)

The repo contains:
- benchmark source trees
- LLVM passes and runtime support code
- patch scripts that insert runtime hooks into benchmark C files
- build scripts for local and AArch64/OP-TEE targets
- generated outputs (IR, instrumented IR, objects, binaries, logs, summary reports)

## What this repo is for

This project helps you answer questions like:
- How many branch/runtime events are inserted per benchmark?
- How many world switches are expected in OAT/CFLAT flows?
- Can the same benchmark suite be built for local host and OP-TEE AArch64 targets?

It does this by instrumenting Embench-IOT benchmark programs, compiling them, and writing per-benchmark logs plus summary files.

## High-level pipeline

Most build scripts follow this shape:
1. Read benchmark C source from a selected benchmark directory.
2. Generate LLVM IR (`.ll`) with `clang -O0 -S -emit-llvm`.
3. Strip `optnone` to ensure custom LLVM passes run.
4. Run a custom pass (`BranchCounterPass`, `OATPass`, or `CFlatPass`).
5. Compile instrumented IR to object/binary.
6. Link with the appropriate runtime support object.
7. Save outputs into a mode-specific `output*` directory.

## Repository structure

### Top-level scripts
- `build.sh`  
  Local host build + run for branch-counter instrumentation.
- `build_optee.sh`  
  OP-TEE/AArch64 cross-build for branch-counter instrumentation.
- `build_oat_count.sh`  
  OP-TEE/AArch64 OAT count-only build (no `libteec`).
- `build_cflat.sh`  
  OP-TEE/AArch64 CFLAT build using `libteec`.
- `min_cflat.sh`  
  OP-TEE/AArch64 CFLAT count-only build using `min_libcflat.c` (no `libteec`).
- `patch.sh`  
  Patches base Embench benchmarks with branch-counter hooks.
- `patch_oat.sh`  
  Patches OAT benchmark copy with OAT runtime hooks.
- `patch_cflat.sh`  
  Patches CFLAT count-only benchmark copy with CFLAT runtime hooks.

### Core directories
- `counter/`  
  LLVM pass plugins (`*.so`) and runtime code (`*.c`, `*.h`, `*.o`).
- `embench-iot-benchmarks/`  
  Base benchmark source set.
- `embench-iot-benchmarks-oat-count/`  
  Benchmark source set used in OAT count-only flow.
- `embench-iot-benchmarks-cflat-count/`  
  Benchmark source set used in CFLAT count-only flow.
- `embench-iot-benchmarks-cflat/`  
  Benchmark source set used in full CFLAT OP-TEE flow.
- `embench-iot-benchmarks-backup/`  
  Backup snapshots created by patch scripts.

### Output directories (generated)
- `output/` from `build.sh`
- `output_optee/` from `build_optee.sh`
- `output_oat_countonly/` from `build_oat_count.sh`
- `output_cflat_optee/` from `build_cflat.sh`
- `output_cflat_countonly/` from `min_cflat.sh`

Typical contents:
- `ir/`: raw LLVM IR per benchmark
- `ir_inst/`: instrumented LLVM IR
- `obj/`: object files (cross-build flows)
- final binaries: `bins/`, `oat/`, or `cflat/`
- `logs/`: per-benchmark build/instrumentation logs
- summary `.txt` report with pass/fail and/or switch counts

## Script-by-script explanation

## `patch.sh`
Purpose:
- Prepare `embench-iot-benchmarks/*.c` for branch-counter runtime.

What it inserts:
- `#include "branch_runtime.h"`
- `init_branch_stats ();` after warmup call pattern
- `print_branch_stats ();` before verification call pattern

Notes:
- Creates backup by copying benchmark directory into `embench-iot-benchmarks-backup/`.
- Skips files already containing `branch_runtime.h`.

## `patch_oat.sh`
Purpose:
- Prepare `embench-iot-benchmarks-oat-count/*.c` for OAT count-only runtime.

What it inserts:
- `#include "liboat_count_only.h"`
- `__oat_init ();` before `result = benchmark ...`
- `__oat_print_proof ();` before verify call pattern

Notes:
- Creates backup copy under `embench-iot-benchmarks-backup/`.
- Targets count-only flow (no TEE API linking).

## `patch_cflat.sh`
Purpose:
- Prepare `embench-iot-benchmarks-cflat-count/*.c` for CFLAT count-only runtime.

What it inserts:
- `#include "min_libcflat.h"`
- `cflat_finalize_and_print ();` before verify call pattern

Notes:
- Creates backup copy under `embench-iot-benchmarks-backup/`.

## `build.sh` (local host)
Purpose:
- Build and run branch-counter-instrumented benchmarks locally.

Input source tree:
- `embench-iot-benchmarks/`

Key runtime/pass:
- Pass: `counter/BranchCounterPass.so`
- Runtime object: `counter/branch_runtime.o`

Main output:
- binaries: `output/bins/*-instrumented`
- report: `output/branch_stats_all.txt`

## `build_optee.sh` (AArch64 cross)
Purpose:
- Cross-build branch-counter instrumented binaries for OP-TEE environment.

Input source tree:
- `embench-iot-benchmarks/`

Key runtime/pass:
- Pass: `counter/BranchCounterPass.so`
- Runtime object: `output_optee/branch_runtime.o` (built for AArch64)

Main output:
- binaries: `output_optee/bins/*-instrumented`
- report: `output_optee/branch_stats_optee.txt`

## `build_oat_count.sh` (AArch64 count-only)
Purpose:
- Build OAT-instrumented AArch64 binaries and count world-switch relevant events (paper-style Smin instrumentation scope).

Input source tree:
- `embench-iot-benchmarks-oat-count/`

Key runtime/pass:
- Pass: `counter/OATPass.so`
- Runtime object: `output_oat_countonly/liboat_count_only.o` (compiled from `counter/liboat_count_only.c`)

Main output:
- binaries: `output_oat_countonly/oat/*-oat`
- report: `output_oat_countonly/oat_switch_counts.txt`

## `build_cflat.sh` (AArch64 + libteec)
Purpose:
- Build CFLAT-instrumented AArch64 binaries linked with `libteec`.

Input source tree:
- `embench-iot-benchmarks-cflat/`

Key runtime/pass:
- Pass: `counter/CFlatPass.so`
- Runtime object: `counter/libcflat.o` copied into output dir
- External dependency: `${SYSROOT}/usr/lib/libteec.so`

Main output:
- binaries: `output_cflat_optee/cflat/*-cflat`
- report: `output_cflat_optee/cflat_stats_optee.txt`

## `min_cflat.sh` (AArch64 count-only)
Purpose:
- Build CFLAT count-only AArch64 binaries without `libteec` dependency.

Input source tree:
- `embench-iot-benchmarks-cflat-count/`

Key runtime/pass:
- Pass: `counter/CFlatPass.so`
- Runtime object: `output_cflat_countonly/min_libcflat.o` (from `counter/min_libcflat.c`)

Main output:
- binaries: `output_cflat_countonly/cflat/*-cflat`
- report: `output_cflat_countonly/cflat_switch_counts.txt`

## Prerequisites

## Host tools
- `bash`
- `sed`, `grep`, `file`, `timeout`
- LLVM/Clang tools (scripts use LLVM 18 paths)

Expected tool paths in scripts:
- `/usr/lib/llvm-18/bin/clang`
- `/usr/lib/llvm-18/bin/opt`

## OP-TEE cross toolchain (for AArch64 scripts)
Expected hardcoded paths:
- `CROSS_GCC=/home/dell/Videos/Aastha/optee/out-br/host/bin/aarch64-linux-gnu-gcc`
- `SYSROOT=/home/dell/Videos/Aastha/optee/out-br/host/aarch64-buildroot-linux-gnu/sysroot`

For `build_cflat.sh`, this must exist:
- `${SYSROOT}/usr/lib/libteec.so`

## Pass/runtime artifacts required
Expected in `counter/`:
- `BranchCounterPass.so`
- `OATPass.so`
- `CFlatPass.so`
- corresponding runtime source/object files (`branch_runtime.*`, `liboat_count_only.*`, `libcflat.*`, `min_libcflat.*`)

## How to run

From repo root:

```bash
cd /home/dell/Videos/Aastha/v1_embench
chmod +x *.sh
```

## Branch counter (local)

```bash
./patch.sh        # optional, only if base sources are not already patched
./build.sh
```

## Branch counter (OP-TEE AArch64)

```bash
./patch.sh        # optional
./build_optee.sh
```

## OAT count-only (OP-TEE AArch64)

```bash
./patch_oat.sh    # optional, for oat-count source tree
./build_oat_count.sh
```

## CFLAT full OP-TEE (AArch64 + libteec)

```bash
./build_cflat.sh
```

## CFLAT count-only (OP-TEE AArch64, no libteec)

```bash
./patch_cflat.sh  # optional, for cflat-count source tree
./min_cflat.sh
```

## Where to check results

- `output/branch_stats_all.txt`
- `output_optee/branch_stats_optee.txt`
- `output_oat_countonly/oat_switch_counts.txt`
- `output_cflat_optee/cflat_stats_optee.txt`
- `output_cflat_countonly/cflat_switch_counts.txt`

Also inspect per-benchmark logs under each `output*/logs/` directory.

## Operational notes

- Patch scripts are pattern-based (`sed` + `grep`) and assume expected Embench function patterns exist.
- Patch scripts create backups but do not provide strict rollback logic beyond copying backup files back.
- Build scripts print suggested `scp/ssh` commands for running AArch64 binaries on target boards.
- Some script header comments still mention older historical names (for example `run_*`), but the active filenames are the top-level `build*.sh`, `min_cflat.sh`, and `patch*.sh` files in this repo.
