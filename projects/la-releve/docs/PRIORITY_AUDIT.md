# Priority audit — La Relève / minimal-repair literature

Status: **historical priority remains unestablished. No “first” claim is authorized.**

## 1. Candidate contribution under audit

The candidate contribution must be stated narrowly. Formal constraints in literature, computational Oulipian writing, combinatorial possibility spaces, impossible or limit constraints, controlled exceptions to constraints, formal narrative generation, logical character-belief models, model checking of story paths, MaxSAT-based narrative repair, and proof-carrying artifacts all have substantial prior art.

The surviving candidate is:

> A literary construction in which an intentionally inconsistent specification is part of the work's generative premise; the **minimum repairs of that inconsistency index the potential family of realizations**; each selected repair controls a corresponding literary/epistemic transformation; and machine-checked certificates establish universal structural and declared information-interface properties over the finite family while leaving natural-language semantics outside the trust boundary.

For *La Relève*, hard Monday recurrence conflicts with seven repairable alternation obligations. Seven singleton repair locations, each with two labelled repeated-caregiver assignments, produce fourteen labelled formal realizations. The selected repair controls a local continuity module; the recurrence structure controls a separate return module.

This formulation is intentionally narrower than earlier drafts.

## 2. Strong precedents that eliminate broader novelty claims

### Oulipo: constraint as generative structure

Oulipo explicitly defines its project as the invention and systematic exploration of new constraints and structures. Constraint-based generativity is foundational, not novel here.

Sources:
- https://oulipo.net/historique-de-loulipo
- https://www.oulipo.net/fr/exhibercacher
- https://oulipo.net/fr/usage-de-la-contrainte

### Potential families and combinatorial works

Raymond Queneau's *Cent mille milliards de poèmes* already makes a finite combinatorial family central to the literary object; later computerized realizations reinforce the computational lineage.

Sources:
- https://oulipo.net/fr/contraintes/cmmp
- https://directory.eliterature.org/individual-work/374

Therefore “a literary work as a formally generated family of realizations” is not new.

### Impossible, limit, and impotential constraints

Oulipian practice explicitly includes *tentatives à la limite*, impossible/near-impossible constraints, and a developed potential/impotential discourse. A contradiction or impossibility used as literary provocation cannot support priority by itself.

Sources:
- https://www.oulipo.net/fr/contraintes/sonnet-a-la-limite
- https://oulipo.net/fr/limpotentiel
- https://www.bnf.fr/fr/mediatheque/les-jeudis-de-loulipo-tentatives-la-limite

### Metaconstraint, manque, faux, and clinamen

Perec's practice already uses a rule that acts on the constraint system itself: MANQUE and FAUX modify expected elements, and the clinamen deliberately perturbs excessive formal regularity. This is a very close conceptual ancestor to any literary form in which a defect or exception becomes productive.

Source:
- https://oulipo.net/perec-de-la-judeite-a-lesthetique-du-manque

Accordingly, *La Relève* cannot claim to invent productive violation, exception, formal defect, or metaconstraint.

### Braffort and ALAMO: formal literary algorithmics

Paul Braffort's work explicitly includes *Un système formel pour l'algorithmique littéraire* (1981), *Formalismes pour l'analyse et la synthèse de textes littéraires* (1988), recurrent literature, and ALAMO's computer-aided literary production. Recent historical scholarship further documents Braffort's role in early French computational literature.

Sources:
- https://www.oulipo.net/fr/principales-publications-de-paul-braffort
- https://releve.erudit.org/fr/revues/etudfr/2000-v36-n2-etudfr145/
- Bruno Galmar, 2025, DOI 10.1177/09571558251406513

No claim involving “formal systems for literature,” “literary algorithms,” or “computer-aided Oulipo” is available.

### Constraint programming for poetry

Toivanen, Järvisalo, and Toivonen use declarative hard/soft constraints and an off-the-shelf constraint solver to search poem spaces.

Source:
- J. M. Toivanen, M. Järvisalo, H. Toivonen, “Harnessing Constraint Programming for Poetry Composition,” ICCC 2013, pp. 160–167: https://www.computationalcreativity.net/iccc2013/accepted-papers/

“Constraint solver + literary generation” is established.

### Formal narrative generation and proof-theoretic story systems

Martens and collaborators use linear logic to encode narrative knowledge and obtain generated story instances as proof terms. Martens' dissertation explicitly connects formal specification languages, narrative generation, and proving design-level properties.

Sources:
- DOI 10.1007/978-3-642-40564-8_42: https://research.tees.ac.uk/en/publications/linear-logic-programming-for-narrative-generation/
- https://www.cs.cmu.edu/~cmartens/thesis/

Neither “proof-derived narrative generation” nor “formal proofs about a narrative program” is new.

### Model checking every possible telling

Thompson, Battle, and Padget represent non-linear stories as Kripke structures in Interval Temporal Logic and model-check each possible telling for consistency, with reusable story components.

Source:
- DOI 10.1007/978-3-319-27036-4_39: https://researchspace.bathspa.ac.uk/8218/

Thus universal formal checking across a family of story paths is established.

### Epistemic logic for character beliefs

Eger and Martens use Dynamic Epistemic Logic to maintain logically consistent character belief states in story generation.

Source:
- DOI 10.1609/aiide.v13i2.12990: https://ojs.aaai.org/index.php/AIIDE/article/view/12990

Logical character-knowledge tracking is established.

### Proof-carrying artifacts

Proof-carrying code and certifying architectures establish the general paradigm of an artifact accompanied by independently checkable evidence of selected properties.

Sources:
- https://www.cs.cmu.edu/~fox/pcc-bib.html
- https://www.cs.cmu.edu/~fox/lf.html

“Proof-carrying literature” may be a useful analogy, but not a claim of invention of proof-carrying artifacts.

## 3. Closest adverse computational precedent found in this pass

### ScenarioGen: MaxSAT selects minimal narrative repairs

Sigal Sina, Avi Rosenfeld, and Sarit Kraus's 2014 ScenarioGen work materially narrows the white space. Their system uses a MaxSAT logical engine to identify which activities in an existing narrative scenario must be modified so that revised content satisfies constraints. It uses the solver to obtain an optimal solution with the minimum number of scenario modifications, replaces the selected content with natural-language alternatives, and reruns MaxSAT to validate the final scenario.

Sources:
- https://arxiv.org/abs/1402.5034
- https://www.researchgate.net/publication/288288298_Generating_content_for_scenario-based_serious-games_using_crowdsourcing

This precedent defeats any broad claim such as:

- “first use of minimal logical repair to generate narrative content”;
- “first narrative system where a solver selects the smallest changes needed for consistency”;
- “first use of MaxSAT-style repair in narrative generation.”

However, ScenarioGen's aim is scenario adaptation and consistency restoration. In the material reviewed, the inconsistency is a problem to repair, not an aesthetic generative premise; the set of all minimum repairs is not itself presented as the literary possibility space; the repair location is not used as a literary metaconstraint whose identity organizes focalized textual modules; and no theorem-prover certificate over the resulting literary family is described.

That difference is currently central to the surviving *La Relève* hypothesis.

## 4. Related scenario-repair work

Niehaus, Li, and Riedl's *Automated Scenario Adaptation in Support of Intelligent Tutoring Systems* (FLAIRS 2011) automatically rewrites manually authored narrative scenarios, repairing flaws while adapting them to learning objectives. Plan-like narrative representations, causal links, open preconditions, and repair strategies are explicit.

Source:
- https://ocs.aaai.org/ocs/index.php/FLAIRS/FLAIRS11/rt/metadata/2588/0

This further prevents us from treating “repairing narrative structures while preserving coherence” as novel.

## 5. Electronic-literature precedent class

The Electronic Literature Collection explicitly classifies many works as constraint-based/procedural, generative, combinatorial, and modular. Works such as *Oulipoems* and computerized Oulipian generators reinforce the depth of this lineage.

Sources:
- https://collection.eliterature.org/2/extra/keywords.html
- https://collection.eliterature.org/1/works/niss__oulipoems.html
- https://collection.eliterature.org/3/collection-renderings.html

The project must be situated inside—not outside—this history.

## 6. Current novelty matrix

| Ingredient | Prior art? | Consequence |
|---|---:|---|
| constrained literature | yes, extensive | no novelty claim |
| combinatorial literary families | yes | no novelty claim |
| impossible/limit constraint | yes | no novelty claim |
| deliberate exception / clinamen | yes | no novelty claim |
| metaconstraint modifying a rule system | yes | no novelty claim |
| formal literary algorithmics | yes | no novelty claim |
| constraint-solver poetry | yes | no novelty claim |
| formal narrative generation from proofs | yes | no novelty claim |
| formal checking of all story paths | yes | no novelty claim |
| epistemic logic for character beliefs | yes | no novelty claim |
| minimal/optimal narrative repair via MaxSAT | yes | no novelty claim |
| proof-carrying artifacts | yes | analogy only |
| intentionally inconsistent literary specification whose **entire minimum-repair set is the authored potential family** | **not yet located** | candidate contribution only |
| repair identity controls literary/epistemic modules and is itself thematically productive | **not yet located in equivalent form** | candidate contribution only |
| above construction plus theorem-prover-checked universal structural/interface claims and explicit semantic trust boundary | **not yet located** | candidate contribution only |

“Not yet located” means only that the searches performed so far did not find a structurally equivalent precedent. It is not evidence sufficient for priority.

## 7. Authorized wording after this audit

Use:

> *La Relève* investigates a literary construction in which the minimum repairs of an intentionally inconsistent specification index a finite family of realizations, and the chosen repair controls declared literary and epistemic modules. The family is accompanied by machine-checked structural/interface claims. Substantial precedents exist for constrained and computational literature, formal narrative generation, character-belief logic, model checking of story paths, and even solver-selected minimal repairs of narrative scenarios. We have not yet identified a published precedent combining these elements in the same literary construction; historical priority remains under investigation.

Do not use:

- “the first formally verified literary work”;
- “the first proof-carrying literature”;
- “the first formal Oulipian work”;
- “the first narrative generated by logical repair”;
- “the first use of minimum repair in narrative generation”;
- “a new Oulipian form” as a historical fact;
- any statement that Lean verifies the semantics of the French prose.

## 8. Remaining work before any priority claim

A publication-grade priority claim would still require direct inspection and citation chaining through:

1. *La Littérature potentielle* and *Atlas de littérature potentielle*, especially Braffort, Le Lionnais, Roubaud, recurrent literature, metaconstraints, graph/tree literature, Boolean theatre, and computing;
2. the Bibliothèque oulipienne catalogue and relevant fascicles, including unpublished/poorly indexed material;
3. Archives de l'Oulipo / BnF materials on circulaires, meetings, limit constraints, and early computational work;
4. ALAMO publications and proceedings;
5. Electronic Literature Organization directories and collections;
6. computational-creativity and narrative-generation citation graphs around Martens, Riedl, Cavazza, Toivonen, Sina/Rosenfeld/Kraus, and related planning/repair systems;
7. French-language theses and articles using SAT/MaxSAT, logic programming, model checking, theorem proving, or formal verification in literary production;
8. backward and forward citation chasing from the closest adverse precedents.

Until that process converges, originality remains a research hypothesis.
