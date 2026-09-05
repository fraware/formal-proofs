import LaReleve.EpistemicData

namespace LaReleve

/-- The generated catalogue contains exactly the manuscript's 16 B interfaces. -/
theorem base_catalog_count : baseModules.length = 16 := by
  decide +kernel

/-- The generated catalogue contains exactly the 14 adjacent-continuity interfaces. -/
theorem continuity_catalog_count : continuityModules.length = 14 := by
  decide +kernel

/-- The generated catalogue contains exactly the two Monday-return interfaces. -/
theorem return_catalog_count : returnModules.length = 2 := by
  decide +kernel

/-- Every declared B interface obeys the no-private-history/current-day rule. -/
theorem every_base_interface_well_typed :
    baseModules.all baseWellTyped = true := by
  decide +kernel

/-- Every declared K interface uses only exposed same-caregiver endpoint facts
and introduces no world fact. -/
theorem every_continuity_interface_well_typed :
    continuityModules.all (continuityWellTyped baseModules) = true := by
  decide +kernel

/-- Every declared L interface uses only exposed facts from the returning
caregiver's two Mondays and introduces no world fact. -/
theorem every_return_interface_well_typed :
    returnModules.all (returnWellTyped baseModules) = true := by
  decide +kernel

/-- Every minimum-repair realization licenses exactly one actual K module from
the generated catalogue. -/
theorem every_valid_schedule_licenses_one_k :
    (validSchedules.filter (fun s => licensedKCount continuityModules s != 1)).length = 0 := by
  decide +kernel

/-- Every minimum-repair realization licenses exactly one actual L module. -/
theorem every_valid_schedule_licenses_one_l :
    (validSchedules.filter (fun s => licensedLCount returnModules s != 1)).length = 0 := by
  decide +kernel

/-- Whenever a K is licensed in a valid realization, every observation in its
manifest is declared knowledge of the repeated caregiver by the edge's right
endpoint. -/
theorem every_licensed_k_requirement_is_known :
    validSchedules.all (fun s =>
      continuityModules.all (licensedKRequirementsKnown baseModules s)) = true := by
  decide +kernel

/-- Whenever an L is licensed, its two Monday observations are declared
knowledge of the returning caregiver by Monday_1. -/
theorem every_licensed_l_requirement_is_known :
    validSchedules.all (fun s =>
      returnModules.all (licensedLRequirementsKnown baseModules s)) = true := by
  decide +kernel

/-- Each concrete K module is licensed by exactly one of the 14 labelled
minimum-repair schedules. -/
def schedulesLicensingK (m : ContinuityModule) : List Schedule :=
  validSchedules.filter (fun s => licensedK s m)

theorem each_k_module_occurs_once :
    continuityModules.all (fun m => (schedulesLicensingK m).length == 1) = true := by
  decide +kernel

/-- Each L module appears in seven of the 14 labelled realizations. -/
def schedulesLicensingL (m : ReturnModule) : List Schedule :=
  validSchedules.filter (fun s => licensedL s m)

theorem each_l_module_occurs_seven_times :
    returnModules.all (fun m => (schedulesLicensingL m).length == 7) = true := by
  decide +kernel

end LaReleve
