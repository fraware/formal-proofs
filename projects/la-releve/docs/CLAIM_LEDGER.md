# Claim ledger — La Relève v1.3

This file defines the strongest language currently authorized for each claim family.

| Claim | Status | Evidence | Authorized wording |
|---|---|---|---|
| Perfect weekly alternation with Monday recurrence is impossible | **Machine-checked** | Lean 4.33.1 build + `leanchecker` + axiom audit | “Lean proves that no schedule in the formal model satisfies hard Monday recurrence and all seven alternation obligations.” |
| There are exactly 14 labelled one-fault minimum-repair schedules | **Machine-checked** | Lean theorem `minimum_repair_model_count` | “The formal model has exactly 14 labelled minimum-repair realizations.” |
| Every valid schedule has exactly one repeated handover | **Machine-checked** | formal definition + finite theorems | State directly within the formal model. |
| Each fault location occurs twice, once for each repeated caregiver | **Machine-checked** | Lean theorem `each_fault_actor_once` | State directly within the formal model. |
| Weekly burden is 4/3 | **Machine-checked** | Lean theorem + finite model | State directly within the formal model. |
| B/K/L declared interfaces are well typed | **Machine-checked** | Lean epistemic-interface theorems | “Lean checks the declared observation/interface layer.” |
| Exactly one K and one L are licensed in every valid realization | **Machine-checked** | Lean catalogue/licensing theorems | State directly about the manifest/generator model. |
| Licensed K/L facts belong to the corresponding character's declared knowledge | **Machine-checked at annotation level** | Lean `characterKnows` / licensing theorem | Must include “declared” or “manifest-level”; do not generalize to French semantics. |
| Compiled environment independently typechecks under a separate Rust kernel | **Machine-checked independently** | successful GitHub Actions run `33959495545`; nanoda fork commit `68d5ca9...`; 104,483 declarations, zero typechecker errors | “A separately implemented Rust checker rechecked the exported Lean environment with zero typechecker errors.” Do not imply nanoda successfully printed axiom dependencies. |
| Project declarations avoid `sorryAx` dependency | **Machine-audited for the scoped namespace/theorem set** | `axiom-audit` under `LaReleve` + explicit `#print axioms` | “The project-scoped axiom audit found only the stated standard allowlist; the explicitly audited theorem set reported no `sorryAx` dependency.” |
| Exact French fragment bytes match their manifests | **Executable check, not Lean theorem** | Python SHA-256 binding tests | “The compiler verifies exact content hashes.” |
| Generated Markdown has the correct insertion anchors / K/L placement | **Executable check** | Python regression suite | “The compiler tests structural assembly.” |
| French prose contains no illicit implication or memory | **Not proved** | lexical lint + manual/adversarial review only | “We test for semantic leakage; no formal semantic guarantee is claimed.” |
| All 14 realizations are narratively consistent for human readers | **Unestablished empirically** | formal/manifest checks do not establish reader-level coherence | Avoid categorical claim. |
| K continuity materially improves reader understanding | **Untested empirically** | no randomized human study yet | Hypothesis only. |
| L return module causes the intended agency/recurrence inference | **Untested empirically** | no randomized human study yet | Hypothesis only. |
| The work succeeds aesthetically | **Untested** | no blinded expert literary evaluation yet | Never infer from formal correctness. |
| Minimal logical repair has not previously been used to generate narrative content | **False / prohibited** | ScenarioGen 2014 and related scenario adaptation use MaxSAT/minimal modification for narrative scenarios | Do not claim. |
| The exact combined literary construction is historically original | **Unestablished** | no structurally equivalent precedent found so far, but substantial adjacent prior art remains | “We have not yet identified a published structurally equivalent construction; historical priority remains under investigation.” |
| This is the first proof-carrying / formally verified literature | **Unsupported and prohibited** | multiple adjacent formal/narrative precedents | Do not claim. |
| Lean verifies the meaning of the French | **False** | trust boundary explicitly excludes natural-language semantics | Do not claim. |

## Trust boundary

The strongest defensible summary is:

> The finite schedule and declared epistemic-interface model of *La Relève* is machine-checked under Lean 4.33.1 and independently rechecked by a separate Rust kernel. The executable compiler binds that model to manuscript files and assembles the realizations. Natural-language semantics, reader response, literary value, and historical priority remain separate empirical/humanistic questions.
