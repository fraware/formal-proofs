import LaReleve.Schedule

namespace LaReleve

/-- Sanity check: the finite enumerator contains all 2^8 assignments by count. -/
theorem allSchedules_count : allSchedules.length = 256 := by
  decide +kernel

/-- Every concrete Schedule value occurs in the explicit 2^8 enumerator. -/
theorem allSchedules_complete (s : Schedule) : s ∈ allSchedules := by
  cases s with
  | mk mon0 tue wed thu fri sat sun mon1 =>
    cases mon0 <;> cases tue <;> cases wed <;> cases thu <;>
      cases fri <;> cases sat <;> cases sun <;> cases mon1 <;> decide +kernel

/-- The explicit enumerator contains no duplicate schedule. -/
theorem allSchedules_nodup : allSchedules.Nodup := by
  decide +kernel

/-- Direct universal form of the odd-cycle impossibility theorem. -/
theorem no_perfect_schedule (s : Schedule) : ¬ perfectAlternation s := by
  cases s with
  | mk mon0 tue wed thu fri sat sun mon1 =>
    cases mon0 <;> cases tue <;> cases wed <;> cases thu <;>
      cases fri <;> cases sat <;> cases sun <;> cases mon1 <;> decide +kernel

/-- Any recurrent one-fault realization has a 3/4 split over the seven unique days. -/
theorem minimum_repair_implies_three_four (s : Schedule) :
    minimumRepair s → burdenThreeFour s := by
  cases s with
  | mk mon0 tue wed thu fri sat sun mon1 =>
    cases mon0 <;> cases tue <;> cases wed <;> cases thu <;>
      cases fri <;> cases sat <;> cases sun <;> cases mon1 <;> decide +kernel

/-- No recurrent schedule perfectly alternates across all seven handovers. -/
theorem no_perfect_alternation : perfectSchedules.length = 0 := by
  decide +kernel

/-- Exactly fourteen labelled minimum-repair realizations exist. -/
theorem minimum_repair_model_count : validSchedules.length = 14 := by
  decide +kernel

/-- Each of the seven possible fault locations occurs in exactly two realizations. -/
theorem each_fault_location_twice :
    (modelsAtEdge 0).length = 2 ∧
    (modelsAtEdge 1).length = 2 ∧
    (modelsAtEdge 2).length = 2 ∧
    (modelsAtEdge 3).length = 2 ∧
    (modelsAtEdge 4).length = 2 ∧
    (modelsAtEdge 5).length = 2 ∧
    (modelsAtEdge 6).length = 2 := by
  decide +kernel

/-- For every fault location, exactly one model repeats A and exactly one repeats B. -/
theorem each_fault_actor_once :
    (modelsAtEdgeActor 0 false).length = 1 ∧
    (modelsAtEdgeActor 0 true).length = 1 ∧
    (modelsAtEdgeActor 1 false).length = 1 ∧
    (modelsAtEdgeActor 1 true).length = 1 ∧
    (modelsAtEdgeActor 2 false).length = 1 ∧
    (modelsAtEdgeActor 2 true).length = 1 ∧
    (modelsAtEdgeActor 3 false).length = 1 ∧
    (modelsAtEdgeActor 3 true).length = 1 ∧
    (modelsAtEdgeActor 4 false).length = 1 ∧
    (modelsAtEdgeActor 4 true).length = 1 ∧
    (modelsAtEdgeActor 5 false).length = 1 ∧
    (modelsAtEdgeActor 5 true).length = 1 ∧
    (modelsAtEdgeActor 6 false).length = 1 ∧
    (modelsAtEdgeActor 6 true).length = 1 := by
  decide +kernel

/-- Every enumerated minimum-repair realization has a 3/4 weekly burden split. -/
theorem no_bad_burden_model :
    (validSchedules.filter (fun s => decide (¬ burdenThreeFour s))).length = 0 := by
  decide +kernel

/-- Every valid realization has exactly one K by construction: K-count = repeat-count. -/
theorem no_bad_k_count :
    (validSchedules.filter (fun s => repeatCount s != 1)).length = 0 := by
  decide +kernel

/-- Every valid realization licenses one L because the hard recurrence holds. -/
theorem no_bad_recurrence_model :
    (validSchedules.filter (fun s => decide (¬ recurrence s))).length = 0 := by
  decide +kernel

end LaReleve
