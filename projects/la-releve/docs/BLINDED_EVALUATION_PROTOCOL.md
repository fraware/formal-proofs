# Blinded literary evaluation protocol — La Relève

Status: **preregistration-ready design; no human results yet.**

## 1. Purpose

Formal correctness does not establish literary success. The evaluation must answer separate empirical questions without using the proof system itself as evidence for aesthetic quality.

The program therefore separates:

1. **literary merit** — whether expert readers judge the realized texts to work as literature;
2. **mechanism validity** — whether the formally selected continuity/return modules improve the intended reader-level coherence and inference;
3. **robustness across realizations** — whether effects depend strongly on which of the fourteen formal realizations is instantiated;
4. **constraint disclosure effects** — whether learning about the mechanism changes evaluation, treated as a separate post-blind question.

The study must not be framed as “proving” literary value. Its function is to expose the project to possible failure.

## 2. Core design principle

Use two complementary studies.

### Study A — expert consensual assessment

Question: *Does the work succeed as literature when provenance and mechanism are hidden?*

Use a panel of domain experts: French-language fiction writers, literary editors, critics, or experienced creative-writing instructors. The primary measure is holistic expert judgment, following the logic of the Consensual Assessment Technique (CAT), which treats aggregated domain-expert assessment as the appropriate criterion for creative products.

Relevant methodological sources:
- Baer & McKool, CAT overview, DOI 10.4018/978-1-60566-667-9.ch004
- Kaufman, Baer & Cole, expert vs novice short-fiction judgments, DOI 10.1002/j.2162-6057.2009.tb01316.x
- systematic review of creativity assessment in narrative writing, DOI 10.1016/j.tsc.2021.100949

### Study B — randomized mechanism ablation

Question: *Does the formally selected literary mechanism causally improve the intended reading?*

Recruit a larger sample of proficient/native French readers and compare valid realizations against carefully controlled counterfactual variants in which one formal module is replaced by a plausible but **mismatched** module. This preserves length and prose density better than simple deletion.

The experiment tests the mechanism, not authorship prestige.

## 3. Blinding

Blinding is mandatory.

Readers must not be told, before the primary ratings, that:

- the work was generated from a formal system;
- Lean or any theorem prover was used;
- AI participated in development;
- the project is Oulipian or Oulipo-adjacent;
- some presented texts are ablations or counterfactual controls.

All stimuli must:

- use identical typography and page layout;
- omit version names, filenames, hashes, module labels, and authoring metadata;
- receive random opaque IDs;
- be served in randomized order;
- be normalized for formatting.

A coordinator or script may retain the treatment map. The analyst should receive treatment labels as `A`, `B`, `C` until the analysis code and exclusion decisions are frozen.

## 4. Stimulus construction

### 4.1 Native condition

A compiler-produced valid *La Relève* realization satisfying the current manifest and formal model.

### 4.2 K-mismatch condition

Replace the realization's licensed K continuity module with a K module licensed for another repair location or caregiver, selected under a preregistered derangement so that no text receives its own correct module.

Rationale: this keeps a stylistically comparable continuity passage in place while breaking the formal information interface. It is a stronger causal control than simply deleting the module, because deletion changes length, pacing, and density.

### 4.3 L-mismatch condition

Replace the licensed return module with a return module corresponding to a different formal state/caregiver under a preregistered derangement.

This tests whether the selected return module contributes specifically to the intended terminal inference rather than merely providing an additional ending paragraph.

### 4.4 Optional sham control

If preliminary adversarial review shows that K/L mismatch produces conspicuous contradictions, create a separately authored “sham” module set matched on approximate length, syntax, tone, and local referents while omitting the licensed information. Sham modules must be frozen before confirmatory data collection. They must not be optimized against reader outcomes.

### 4.5 External literary controls

For Study A, include a small number of independently authored, rights-cleared French short-fiction controls of comparable length and general register. Their purpose is calibration, not a simplistic “human versus machine” contest. Prefer commissioned or openly licensed contemporary controls whose provenance can remain undisclosed during rating.

Do not use famous texts whose style or authorship is recognizable.

## 5. Sampling and assignment

### 5.1 Study A experts

Target a panel large enough to estimate consensus, not just collect anecdotes. A practical target is **12–20 qualified expert judges**, with the final number justified before recruitment by expected reliability and budget.

Every expert need not read every stimulus. Use a balanced incomplete-block assignment so that:

- each target realization receives comparable expert coverage;
- each condition appears equally often in each ordinal presentation position;
- no judge sees both the valid and counterfactual version of the same underlying realization;
- each judge reads a manageable amount of text.

Do not interpret an underpowered pilot as confirmatory evidence.

### 5.2 Study B general readers

Run a small **variance-estimation pilot** first, used only to estimate variance, completion time, floor/ceiling effects, and attrition. Do not test the main hypothesis on the pilot and then silently pool it with confirmatory data.

Before confirmatory recruitment, perform simulation-based power analysis for the preregistered ordinal mixed model and a stated smallest effect size of interest. Fix the maximum sample size and stopping rule before unblinding.

A likely confirmatory sample will be in the low hundreds because reader and text heterogeneity must both be modeled, but the final N must come from the simulation rather than from convention.

## 6. Primary and secondary outcomes

### 6.1 Study A primary outcome

**Holistic literary merit**, 1–7, with the prompt kept deliberately broad to preserve consensual expert judgment.

A single holistic creativity/literary-quality judgment is preferable to pretending that literary value is reducible to a deterministic rubric.

### 6.2 Study A secondary outcomes

Rate separately, 1–7:

- narrative coherence;
- stylistic control;
- emotional force;
- specificity / felt necessity of detail;
- structural integrity;
- ending resonance;
- desire to reread;
- perceived originality.

These are diagnostic outcomes, not interchangeable definitions of literary merit.

### 6.3 Study B primary mechanism outcomes

Use comprehension/inference outcomes that directly correspond to the hypothesized mechanism:

1. **local continuity inference** associated with K;
2. **terminal agency/recurrence inference** associated with L.

Each should include:

- one preregistered forced-choice or structured inference question;
- confidence rating;
- one open-ended explanation scored later by coders blind to condition.

### 6.4 Study B secondary outcomes

- perceived coherence;
- confusion/discontinuity;
- emotional impact;
- ending satisfaction;
- literary-quality rating.

These determine whether mechanism improvements come at an aesthetic cost.

## 7. Hypotheses

Preregister directional hypotheses before data collection.

### H1 — expert merit

Valid *La Relève* realizations receive nontrivial, internally reliable expert literary-merit judgments. The criterion for “nontrivial” must be defined prospectively using external controls or an explicit decision threshold; it cannot be chosen after seeing scores.

### H2 — K causal contribution

Readers assigned the correctly licensed K module show better local continuity inference and lower confusion than readers assigned a mismatched K module.

### H3 — L causal contribution

Readers assigned the correctly licensed L module show higher probability of the intended terminal agency/recurrence inference than readers assigned a mismatched L module.

### H4 — no hidden aesthetic tax

Any gain in mechanism-specific comprehension should not be accompanied by a prespecified practically important loss in literary-merit ratings.

### H5 — heterogeneity across formal realizations

Estimate, rather than conceal, variation in treatment effect across repair location / repeated caregiver. A mechanism that works only for a small subset of the fourteen realizations does not justify a family-wide aesthetic claim.

## 8. Statistical analysis

### 8.1 Ordinal outcomes

Use cumulative-link mixed-effects models for 1–7 ordinal ratings where computationally stable. Include:

- fixed effect for condition;
- presentation order;
- expert/general-reader stratum where applicable;
- random intercepts for reader and underlying realization;
- random condition slope by reader when supported by the design/data.

If a simpler model is used because the ordinal mixed model is unstable, the deviation and reason must be reported.

### 8.2 Binary/forced-choice outcomes

Use logistic mixed-effects models with random intercepts for reader and realization.

### 8.3 Open-ended responses

Develop a scoring codebook on a calibration subset that is isolated from the confirmatory subset. Freeze the codebook before confirmatory coding. Use at least two independent blind coders and report inter-coder agreement (e.g. Krippendorff's alpha or an appropriate equivalent) together with adjudication rules.

### 8.4 Expert consensus

Report inter-rater reliability/consensus for the expert panel. Do not report only the mean. If expert consensus is poor, that is substantively important evidence and must not be hidden by aggregation.

### 8.5 Multiplicity

One primary outcome/contrast per main hypothesis. Treat additional dimensions as secondary and control or clearly label multiplicity. Do not fish across dozens of aesthetic items for a favorable result.

### 8.6 Missingness and exclusions

Preregister exclusions, including:

- insufficient French proficiency;
- failed attention/comprehension checks that do not depend on treatment;
- implausibly short completion time using a threshold fixed from pilot data;
- duplicate participation.

Report all exclusions by condition.

## 9. Randomization and reproducibility

Before data collection, freeze and archive:

- exact stimulus bytes and SHA-256 hashes;
- compiler commit;
- formal-model commit;
- randomization seed;
- K/L derangement map;
- participant assignment algorithm;
- questionnaires;
- exclusion rules;
- primary statistical model code;
- stopping rule;
- power simulation;
- analysis environment lockfile.

The confirmatory analysis should be executable from de-identified raw data to tables/figures without manual spreadsheet editing.

## 10. Disclosure experiment — only after blind ratings

After all primary blind outcomes are recorded, a secondary within-participant phase may reveal progressively:

1. that the text follows a formal constraint;
2. that the family is generated from a minimal-repair system;
3. that selected structural/interface claims are machine-checked.

Then ask whether disclosure changes:

- literary-merit judgment;
- perceived originality;
- interest in rereading;
- interpretation of the fault/repair mechanism.

This directly addresses the Oulipian *Exhiber/Cacher* question without contaminating the primary aesthetic evaluation.

## 11. Failure criteria

The protocol is useful only if it can falsify the project. Precommit to conclusions such as:

- If expert literary-merit ratings are weak relative to calibration controls, do not claim demonstrated aesthetic success.
- If K mismatch does not worsen the intended continuity inference, the K interface is formally elegant but lacks demonstrated reader-level necessity.
- If L mismatch does not affect the intended terminal inference, the return mechanism lacks demonstrated causal function.
- If effects occur only in a few realizations, restrict claims to those realizations and revise the generator.
- If readers detect manipulations because counterfactual prose is conspicuously defective, redesign the controls and rerun rather than interpreting the artifact as a mechanism effect.

## 12. What counts as strong evidence

A strong result would require convergence across distinct evidence types:

- reproducible formal correctness;
- blinded expert literary judgment;
- randomized reader-level mechanism effects;
- acceptable consensus/reliability;
- no material aesthetic degradation from the mechanism;
- qualitative interpretations that agree with the quantitative mechanism measures;
- robustness across the fourteen formal realizations.

No single Likert score should carry the scientific claim.

## 13. Methodological references

- Baer, J. & McKool, S. S. (2009). *Assessing Creativity Using the Consensual Assessment Technique*. DOI: 10.4018/978-1-60566-667-9.ch004.
- Kaufman, J. C., Baer, J., & Cole, J. C. *Expertise, Domains, and the Consensual Assessment Technique*. DOI: 10.1002/j.2162-6057.2009.tb01316.x.
- Hennessey, B. A. *The consensual assessment technique: An examination of the relationship between ratings of product and process creativity*. DOI: 10.1080/10400419409534524.
- *What characterises creativity in narrative writing, and how do we assess it? Research findings from a systematic literature search.* DOI: 10.1016/j.tsc.2021.100949.
- Kidd, Comer & Castano, “Inference or Enaction? The Impact of Genre on the Narrative Processing of Other Minds,” PLOS ONE: https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0114172.

## 14. Current claim status

This document defines an evaluation design only. No participant has been recruited, no human result has been observed, and no claim of aesthetic success or reader-level causal effect is currently supported.
