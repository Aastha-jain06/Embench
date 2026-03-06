# v1_embench

This repository contains shell scripts to patch, instrument, and build Embench-IOT benchmarks for:
- local execution (branch counter)
- OP-TEE/AArch64 branch counting
- OAT world-switch counting (count-only)
- CFLAT builds (full OP-TEE and count-only)

## Repository layout

### Main scripts
- `build.sh`  
  Builds all benchmarks for the local machine with branch-counter instrumentation and runs them.
- `build_optee.sh`  
  Builds OP-TEE/AArch64 benchmark binaries with branch-counter instrumentation.
- `build_oat_count.sh`  
  Builds OP-TEE/AArch64 OAT count-only binaries and records expected OAT-style world-switch output.
- `build_cflat.sh`  
  Builds OP-TEE/AArch64 CFLAT binaries (links against `libteec` from sysroot).
- `min_cflat.sh`  
  Builds OP-TEE/AArch64 CFLAT count-only binaries (no `libteec`, uses `min_libcflat.c`).
- `patch.sh`  
  Patches benchmark sources for branch-counter flow.
- `patch_oat.sh`  
  Patches benchmark sources for OAT count-only flow.
- `patch_cflat.sh`  
  Patches benchmark sources for CFLAT count-only flow.

### Key directories
- `counter/`  
  LLVM passes and runtime support files (`BranchCounterPass.so`, `OATPass.so`, `CFlatPass.so`, runtime C files/headers).
- `embench-iot-benchmarks/`  
  Base Embench benchmark sources.
- `embench-iot-benchmarks-oat-count/`  
  OAT-oriented benchmark source copy.
- `embench-iot-benchmarks-cflat-count/`  
  CFLAT count-only benchmark source copy.
- `embench-iot-benchmarks-cflat/`  
  CFLAT OP-TEE benchmark source copy.
- `embench-iot-benchmarks-backup/`  
  Backup folder created by patch scripts.

### Build outputs
- `output/` from `build.sh`
- `output_optee/` from `build_optee.sh`
- `output_oat_countonly/` from `build_oat_count.sh`
- `output_cflat_optee/` from `build_cflat.sh`
- `output_cflat_countonly/` from `min_cflat.sh`

Each output directory typically includes:
- `ir/` raw LLVM IR
- `ir_inst/` instrumented LLVM IR
- `obj/` object files (cross builds)
- final binaries (`bins/`, `oat/`, or `cflat/`)
- `logs/` per-benchmark logs
- a summary/result text file

## Prerequisites

## 1. Tools
- Bash
- LLVM/Clang tools (`clang`, `opt`)
- `sed`, `grep`, `timeout`, `file`

Note: scripts use hardcoded LLVM tool paths like:
- `/usr/lib/llvm-18/bin/clang`
- `/usr/lib/llvm-18/bin/opt`

## 2. OP-TEE cross toolchain (for AArch64 scripts)
The AArch64 scripts assume these exact paths exist:
- Cross GCC:  
  `/home/dell/Videos/Aastha/optee/out-br/host/bin/aarch64-linux-gnu-gcc`
- Sysroot:  
  `/home/dell/Videos/Aastha/optee/out-br/host/aarch64-buildroot-linux-gnu/sysroot`

`build_cflat.sh` also expects:
- `${SYSROOT}/usr/lib/libteec.so`

## 3. Pass/runtime artifacts
Before running build scripts, ensure these exist in `counter/`:
- `BranchCounterPass.so`
- `OATPass.so`
- `CFlatPass.so`
- runtime sources/objects used by each flow (already present in this repo)

## How to run

Run all commands from repository root:

```bash
cd /home/dell/Videos/Aastha/v1_embench
```

If scripts are not executable:

```bash
chmod +x *.sh
```

## Local branch-counter build

```bash
./build.sh
```

Outputs:
- binaries: `output/bins/`
- logs: `output/logs/`
- summary: `output/branch_stats_all.txt`

## OP-TEE branch-counter build (AArch64)

```bash
./build_optee.sh
```

Outputs:
- binaries: `output_optee/bins/`
- logs: `output_optee/logs/`
- summary: `output_optee/branch_stats_optee.txt`

## OAT world-switch count-only build (AArch64)

Optional patch step (if your OAT benchmark sources are not already patched):

```bash
./patch_oat.sh
```

Then build:

```bash
./build_oat_count.sh
```

Outputs:
- binaries: `output_oat_countonly/oat/`
- logs: `output_oat_countonly/logs/`
- summary: `output_oat_countonly/oat_switch_counts.txt`

## CFLAT full OP-TEE build (AArch64 + libteec)

```bash
./build_cflat.sh
```

Outputs:
- binaries: `output_cflat_optee/cflat/`
- logs: `output_cflat_optee/logs/`
- summary: `output_cflat_optee/cflat_stats_optee.txt`

## CFLAT count-only world-switch build (AArch64, no libteec)

Optional patch step (if CFLAT count-only sources are not already patched):

```bash
./patch_cflat.sh
```

Then build:

```bash
./min_cflat.sh
```

Outputs:
- binaries: `output_cflat_countonly/cflat/`
- logs: `output_cflat_countonly/logs/`
- summary: `output_cflat_countonly/cflat_switch_counts.txt`

## Branch-counter source patching flow

Use if you want to patch base benchmarks for branch-counter hooks:

```bash
./patch.sh
```

This modifies files in `embench-iot-benchmarks/` and creates backup copies in `embench-iot-benchmarks-backup/`.

## Typical workflow

1. Patch sources only when needed (`patch.sh`, `patch_oat.sh`, `patch_cflat.sh`).
2. Run one of the build scripts depending on target:
   - local: `build.sh`
   - OP-TEE branch counter: `build_optee.sh`
   - OAT count-only: `build_oat_count.sh`
   - CFLAT OP-TEE: `build_cflat.sh`
   - CFLAT count-only: `min_cflat.sh`
3. Check `logs/` and result summary files in the corresponding `output*` directory.

## Notes

- Patch scripts are idempotent for include checks, but still create backups; avoid repeated patching unless intentional.
- Some script header comments mention older script names (for example `run_*.sh`), but the actual files to execute in this repo are:
  - `build.sh`
  - `build_optee.sh`
  - `build_oat_count.sh`
  - `build_cflat.sh`
  - `min_cflat.sh`
  - `patch.sh`
  - `patch_oat.sh`
  - `patch_cflat.sh`
