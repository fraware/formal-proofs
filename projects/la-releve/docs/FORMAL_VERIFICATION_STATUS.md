# Formal verification status — La Relève v1.3

Status: **machine-checked formal subsystem; natural-language semantics remain outside the proof boundary.**

## Verified toolchain and successful hardened run

The `LaReleve` formal subsystem has been compiled and checked on a GitHub-hosted runner using the pinned toolchain:

- Lean 4.33.1 (`leanprover/lean4:v4.33.1`)
- Lean commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`
- Lake `5.0.0-src+819816b`
- repository: `fraware/formal-proofs`
- isolated branch: `la-releve-v1.3-ci`
- hardened successful commit: `ac8bb6ce75d92c98482393fd6d90abe0c14a70a8`
- successful GitHub Actions run: `33959495545`

The following gates all succeeded in that run:

1. `lake build --wfail`;
2. Lean's bundled `leanchecker` over the compiled environment;
3. `leanprover-community/axiom-audit` v0.1.2, scoped to the `LaReleve` namespace;
4. an explicit `#print axioms` audit over the selected project theorem set;
5. a separate Rust-kernel replay using `robsimmons/nanoda_lib` pinned at commit `68d5ca9db226849b41a6fff59d796ff19d0a8840`, fed by `lean4export` built against the project's Lean 4.33.1 toolchain.

The independent Rust checker reported:

> Checked 104483 declarations with no typechecker errors

It also reported one **pretty-printer** error, `Unable to print axioms`. This is not a typechecking failure. Axiom dependency checking is supplied separately by the project-scoped Lean axiom audit and explicit `#print axioms` pass; no claim is made that nanoda itself successfully printed or audited axiom dependencies.

## Axiom policy and the ambient `sorryAx` subtlety

A strict nanoda run that prohibited the name `sorryAx` failed before project-specific dependency analysis because Lean's exported ambient environment contains a declaration named `sorryAx`. That failure does **not** establish that any `LaReleve` theorem depends on `sorryAx`.

The hardened final configuration therefore separates two questions:

1. **Environment loading / independent typechecking.** Nanoda permits the ambient declarations required to load the exported environment, including `sorryAx`, while `unpermitted_axiom_hard_error` remains enabled for other unexpected axioms.
2. **Project theorem dependencies.** `axiom-audit`, scoped to `LaReleve`, and the explicit theorem-level `#print axioms` pass determine whether project declarations actually depend on such axioms.

The project-scoped audit reported:

> audited 1021 declaration(s) under `LaReleve`; all within the allowlist `[propext, Classical.choice, Quot.sound]`.

For the explicitly audited theorem set, every theorem was axiom-free except:

- `LaReleve.allSchedules_complete` — depends on `propext`;
- `LaReleve.selectedBaseKey_noninterference` — depends on `propext`.

No explicitly audited project theorem reported dependency on `sorryAx` or `Lean.trustCompiler`.

## What is machine-checked

Within the represented finite model, the formalization certifies claims including:

- exhaustive enumeration of the `2^8` labelled schedule space;
- impossibility of perfect alternation subject to Monday-to-Monday recurrence;
- exactly 14 labelled minimum-repair schedules;
- the unique repeated handover in each valid schedule;
- fault-location and repeated-caregiver counts;
- the 3/4 weekly burden split;
- B/K/L catalogue sizes and declared interface typing;
- exactly one licensed K and one licensed L module per valid schedule;
- licensing of declared K/L observation requirements;
- structural noninterference of base-module selection.

## What is outside the proof boundary

The proof does **not** certify:

- that arbitrary French prose has exactly the semantics declared by its manifest;
- absence of undeclared pragmatic, metaphorical, or implicature-level information;
- narrative coherence as experienced by human readers;
- literary quality or aesthetic merit;
- the intended reader inference concerning agency;
- historical originality or priority of the form.

Exact manuscript-byte binding, hashes, insertion anchors, and assembly belong to the executable compiler/test layer. Semantic adequacy and literary effect require adversarial and human evaluation. Historical priority requires a separate humanistic/bibliographic audit.

## Authorized technical wording

The strongest concise wording currently supported is:

> The finite schedule and declared epistemic-interface model of *La Relève* was machine-checked under Lean 4.33.1. The compiled environment was additionally rechecked by Lean's bundled checker and by a separately implemented Rust kernel. Project-scoped axiom auditing found only the declared standard allowlist. These guarantees apply to the formal model and declared interfaces, not to the full semantics or literary quality of the French prose.
