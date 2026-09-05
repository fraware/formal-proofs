import Std
import LaReleve.Schedule

namespace LaReleve

/-- A declared private observation in the literary interface.

`day` ranges from 0 to 7, `actor = false` denotes Élise/A and
`actor = true` denotes Thomas/B. `tag` is an opaque proposition identifier;
Lean does not interpret the French semantics associated with the tag.
-/
structure Observation where
  day : Nat
  actor : Bool
  tag : String
  deriving DecidableEq, BEq, Repr

abbrev obs (day : Nat) (actor : Bool) (tag : String) : Observation :=
  ⟨day, actor, tag⟩

/-- Interface of a reusable day-local prose module B[d,p]. -/
structure BaseModule where
  name : String
  day : Nat
  actor : Bool
  observes : List Observation
  requiresPrivateHistory : List Observation
  deriving DecidableEq, BEq, Repr

/-- Interface of an adjacent-continuity prose module K[i,p]. -/
structure ContinuityModule where
  name : String
  edge : Nat
  actor : Bool
  requires : List Observation
  introducesWorldFacts : List String
  deriving DecidableEq, BEq, Repr

/-- Interface of a Monday-to-Monday return module L[p]. -/
structure ReturnModule where
  name : String
  actor : Bool
  requires : List Observation
  introducesWorldFacts : List String
  deriving DecidableEq, BEq, Repr

/-- Caregiver at displayed day `d` (0 = Monday_0, 7 = Monday_1). -/
def actorAtDay (s : Schedule) : Nat → Bool
  | 0 => s.mon0
  | 1 => s.tue
  | 2 => s.wed
  | 3 => s.thu
  | 4 => s.fri
  | 5 => s.sat
  | 6 => s.sun
  | 7 => s.mon1
  | _ => false

/-- A base module may expose only observations from its own day and actor, and it
must not declare any private-history requirement. -/
def baseWellTyped (m : BaseModule) : Bool :=
  m.requiresPrivateHistory.isEmpty &&
  m.observes.all (fun o => o.day == m.day && o.actor == m.actor)

/-- Whether an observation is actually exposed by some declared base module. -/
def observationExposed (bases : List BaseModule) (o : Observation) : Bool :=
  bases.any (fun b =>
    b.day == o.day && b.actor == o.actor && b.observes.contains o)

/-- A K module is well-typed when it depends on exactly one observation at each
endpoint of its edge, both observations belong to its actor, both are exposed by
base modules, and K introduces no new world fact. -/
def continuityWellTyped (bases : List BaseModule) (m : ContinuityModule) : Bool :=
  decide (m.edge < 7) &&
  (m.requires.length == 2) &&
  m.introducesWorldFacts.isEmpty &&
  m.requires.all (fun o =>
    o.actor == m.actor &&
    (o.day == m.edge || o.day == m.edge + 1) &&
    observationExposed bases o) &&
  m.requires.any (fun o => o.day == m.edge && o.actor == m.actor) &&
  m.requires.any (fun o => o.day == m.edge + 1 && o.actor == m.actor)

/-- An L module is well-typed when it depends on exactly one observation from
Monday_0 and one from Monday_1, both belonging to the returning actor, and adds
no world fact. -/
def returnWellTyped (bases : List BaseModule) (m : ReturnModule) : Bool :=
  (m.requires.length == 2) &&
  m.introducesWorldFacts.isEmpty &&
  m.requires.all (fun o =>
    o.actor == m.actor &&
    (o.day == 0 || o.day == 7) &&
    observationExposed bases o) &&
  m.requires.any (fun o => o.day == 0 && o.actor == m.actor) &&
  m.requires.any (fun o => o.day == 7 && o.actor == m.actor)

/-- K is licensed by a schedule exactly when its edge is the repeated handover
and the repeated caregiver is K's actor. -/
def licensedK (s : Schedule) (m : ContinuityModule) : Bool :=
  edgeRepeat s m.edge && (actorAtEdge s m.edge == m.actor)

/-- L is licensed by recurrence and by the actor assigned to both Mondays. -/
def licensedL (s : Schedule) (m : ReturnModule) : Bool :=
  (s.mon1 == s.mon0) && (s.mon0 == m.actor)

/-- Number of catalogue K modules licensed by one schedule. -/
def licensedKCount (catalog : List ContinuityModule) (s : Schedule) : Nat :=
  catalog.foldl (fun n m => n + (if licensedK s m then 1 else 0)) 0

/-- Number of catalogue L modules licensed by one schedule. -/
def licensedLCount (catalog : List ReturnModule) (s : Schedule) : Nat :=
  catalog.foldl (fun n m => n + (if licensedL s m then 1 else 0)) 0

/-- Private knowledge available to actor `p` by displayed day `d`, at the level
of declared proposition tags. This intentionally models only the manifest, not
arbitrary semantic consequences of French prose. -/
def characterKnows
    (bases : List BaseModule) (s : Schedule) (p : Bool) (d : Nat)
    (o : Observation) : Bool :=
  o.actor == p &&
  decide (o.day ≤ d) &&
  actorAtDay s o.day == p &&
  observationExposed bases o

/-- If K is not licensed, this check is vacuous. If it is licensed, every fact K
requires must be in the repeated caregiver's declared private knowledge by the
right endpoint of the edge. -/
def licensedKRequirementsKnown
    (bases : List BaseModule) (s : Schedule) (m : ContinuityModule) : Bool :=
  (! licensedK s m) ||
  m.requires.all (characterKnows bases s m.actor (m.edge + 1))

/-- Analogous knowledge check for a Monday-return module. -/
def licensedLRequirementsKnown
    (bases : List BaseModule) (s : Schedule) (m : ReturnModule) : Bool :=
  (! licensedL s m) ||
  m.requires.all (characterKnows bases s m.actor 7)

/-- The identity of the reusable base module selected at a day depends only on
that day's actor, never on previous schedule choices. -/
def selectedBaseKey (s : Schedule) (d : Nat) : Nat × Bool :=
  (d, actorAtDay s d)

/-- Structural noninterference theorem for base-module selection. It does not
claim semantic noninterference of arbitrary French wording. -/
theorem selectedBaseKey_noninterference
    (s t : Schedule) (d : Nat)
    (h : actorAtDay s d = actorAtDay t d) :
    selectedBaseKey s d = selectedBaseKey t d := by
  simp [selectedBaseKey, h]

end LaReleve
