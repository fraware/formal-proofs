import Std

namespace LaReleve

/--
A caregiver schedule for the eight displayed days. `false` denotes caregiver A
and `true` denotes caregiver B. The representation is intentionally tiny and
closed so that the central counting claims are decidable by reduction.
-/
structure Schedule where
  mon0 : Bool
  tue  : Bool
  wed  : Bool
  thu  : Bool
  fri  : Bool
  sat  : Bool
  sun  : Bool
  mon1 : Bool
  deriving DecidableEq, Repr

def bits : List Bool := [false, true]

/-- Exhaustive enumeration of all 2^8 labelled schedules. -/
def allSchedules : List Schedule :=
  bits.flatMap fun mon0 =>
  bits.flatMap fun tue  =>
  bits.flatMap fun wed  =>
  bits.flatMap fun thu  =>
  bits.flatMap fun fri  =>
  bits.flatMap fun sat  =>
  bits.flatMap fun sun  =>
  bits.map     fun mon1 =>
    ⟨mon0, tue, wed, thu, fri, sat, sun, mon1⟩

/-- Whether handover edge `i` repeats the same caregiver. -/
def edgeRepeat (s : Schedule) : Nat → Bool
  | 0 => s.mon0 == s.tue
  | 1 => s.tue  == s.wed
  | 2 => s.wed  == s.thu
  | 3 => s.thu  == s.fri
  | 4 => s.fri  == s.sat
  | 5 => s.sat  == s.sun
  | 6 => s.sun  == s.mon1
  | _ => false

/-- Number of repeated handovers among the seven repairable edges. -/
def repeatCount (s : Schedule) : Nat :=
  (List.range 7).foldl
    (fun n i => n + (if edgeRepeat s i = true then 1 else 0))
    0

/-- Hard weekly recurrence: the two displayed Mondays have the same caregiver.
`abbrev` keeps the proposition transparent to decidability synthesis. -/
abbrev recurrence (s : Schedule) : Prop := s.mon1 = s.mon0

/-- Perfect alternation under the hard recurrence. -/
abbrev perfectAlternation (s : Schedule) : Prop :=
  recurrence s ∧ repeatCount s = 0

/-- A minimum-repair realization: hard recurrence plus exactly one repeated edge. -/
abbrev minimumRepair (s : Schedule) : Prop :=
  recurrence s ∧ repeatCount s = 1

/-- All labelled minimum-repair realizations. -/
def validSchedules : List Schedule :=
  allSchedules.filter (fun s => decide (minimumRepair s))

/-- All perfectly alternating recurrent schedules; this list should be empty. -/
def perfectSchedules : List Schedule :=
  allSchedules.filter (fun s => decide (perfectAlternation s))

/-- Caregiver at the left endpoint of edge `i`; meaningful for `i < 7`. -/
def actorAtEdge (s : Schedule) : Nat → Bool
  | 0 => s.mon0
  | 1 => s.tue
  | 2 => s.wed
  | 3 => s.thu
  | 4 => s.fri
  | 5 => s.sat
  | 6 => s.sun
  | _ => false

/-- Number of valid realizations whose unique repeated edge is `i`. -/
def modelsAtEdge (i : Nat) : List Schedule :=
  validSchedules.filter (fun s => edgeRepeat s i)

/-- Number of valid realizations for edge `i` and repeated caregiver `actor`. -/
def modelsAtEdgeActor (i : Nat) (actor : Bool) : List Schedule :=
  validSchedules.filter (fun s => edgeRepeat s i && (actorAtEdge s i == actor))

def asA (b : Bool) : Nat := if b = false then 1 else 0
def asB (b : Bool) : Nat := if b = true then 1 else 0

/-- Number of visits by A over the seven unique days. -/
def visitsA (s : Schedule) : Nat :=
  asA s.mon0 + asA s.tue + asA s.wed + asA s.thu +
  asA s.fri + asA s.sat + asA s.sun

/-- Number of visits by B over the seven unique days. -/
def visitsB (s : Schedule) : Nat :=
  asB s.mon0 + asB s.tue + asB s.wed + asB s.thu +
  asB s.fri + asB s.sat + asB s.sun

/-- The burden is split 3/4 in either direction. -/
abbrev burdenThreeFour (s : Schedule) : Prop :=
  (visitsA s = 4 ∧ visitsB s = 3) ∨
  (visitsA s = 3 ∧ visitsB s = 4)

end LaReleve
