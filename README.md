# Cairo Verification

[![CI](https://github.com/fraware/formal-proofs/actions/workflows/lean4-ci.yml/badge.svg)](https://github.com/fraware/formal-proofs/actions/workflows/lean4-ci.yml)
[![Lean4](https://img.shields.io/badge/Lean-4.29.0-blue)](https://lean-lang.org/)
[![License: Apache--2.0](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

`verification` is a Lean 4 package for formal reasoning about Cairo execution semantics and Cairo library functions.

## What This Package Provides

- A Lean formalization of Cairo VM and CPU semantics.
- Soundness and completeness proof infrastructure for Cairo assembly-level reasoning.
- Verified specifications for selected Cairo libfunc families (`u16`, `u32`, `u64`, `u128`,
  `u256`, `u512`, and bounded integer routines).
- AIR encoding correctness components used in STARK-oriented verification workflows.

## Install

Add this package to your `lakefile.lean`:

```lean
require verification from git
  "https://github.com/fraware/formal-proofs.git"
```

Then build your project as usual with `lake build`.

## Minimal Usage Example

```lean
import Verification.Semantics.Assembly

#check Casm.Instr
```

## Build From This Repository

Prerequisites:
- Lean 4 (toolchain pinned by `lean-toolchain`)
- Lake

From the repository root:

```bash
lake exe cache get
lake build
```

Notes:
- `lake exe cache get` downloads precompiled mathlib artifacts to speed up builds.
- If your environment has strict thread limits, you can run:
  `LEAN_NUM_THREADS=1 lake build +Verification`

## Repository Layout

- `Verification/Semantics`: Cairo semantics and proof infrastructure.
  - `Cpu.lean`: CPU execution semantics.
  - `Vm.lean`: VM-style semantics used for completeness-oriented reasoning.
  - `Soundness/`: one-step reasoning and Hoare-style tooling.
  - `Completeness/`: VM completeness machinery.
  - `AirEncoding/`: algebraic trace encoding and correctness lemmas.
- `Verification/Libfuncs`: soundness/completeness specs and proofs for selected Cairo libfuncs.
- `Verification.lean`: top-level module aggregator.

## Publications

- [A verified algebraic representation of Cairo program execution](https://dl.acm.org/doi/10.1145/3497775.3503675)
- [A proof-producing compiler for blockchain applications](https://doi.org/10.4230/LIPIcs.ITP.2023.7)

## Maintenance Policy

- This repository is Lean 4 only.
- Release checks run from the repository root.
- Primary quality-gated artifacts are:
  `Verification/`, `Verification.lean`, `lakefile.lean`, `lake-manifest.json`, and `lean-toolchain`.