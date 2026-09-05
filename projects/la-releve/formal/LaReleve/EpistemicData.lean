import LaReleve.EpistemicCore

namespace LaReleve

/-- SHA-256 of the canonical JSON spec used to generate this module. -/
def generatedSpecSha256 : String := "cfe5701828a7ce7e522703ee9d94a0c596c54302dcad0a63b63e075284d7bcf5"

/-- Generated base-module interface catalogue. Do not edit by hand. -/
def baseModules : List BaseModule := [
  { name := "B_fri_A", day := 4, actor := false, observes := [obs 4 false "bounded_clothes_in_bag", obs 4 false "plant_note_written"], requiresPrivateHistory := [] },
  { name := "B_fri_B", day := 4, actor := true, observes := [obs 4 true "pullovers_compared", obs 4 true "claire_visit_expected"], requiresPrivateHistory := [] },
  { name := "B_mon0_A", day := 0, actor := false, observes := [obs 0 false "envelope_empty", obs 0 false "care_sheet_meal_half_written"], requiresPrivateHistory := [] },
  { name := "B_mon0_B", day := 0, actor := true, observes := [obs 0 true "mail_question_claire", obs 0 true "care_sheet_created_by_thomas"], requiresPrivateHistory := [] },
  { name := "B_mon1_A", day := 7, actor := false, observes := [obs 7 false "taxi_arrives_1015", obs 7 false "destination_disclosed", obs 7 false "care_sheet_mon1_blank"], requiresPrivateHistory := [] },
  { name := "B_mon1_B", day := 7, actor := true, observes := [obs 7 true "decision_explained", obs 7 true "reversible_month_disclosed", obs 7 true "care_sheet_still_present"], requiresPrivateHistory := [] },
  { name := "B_sat_A", day := 5, actor := false, observes := [obs 5 false "claire_receives_plant_note_and_key", obs 5 false "id_wallet_staged"], requiresPrivateHistory := [] },
  { name := "B_sat_B", day := 5, actor := true, observes := [obs 5 true "claire_receives_household_instructions", obs 5 true "mon_1015_arranged"], requiresPrivateHistory := [] },
  { name := "B_sun_A", day := 6, actor := false, observes := [obs 6 false "id_wallet_in_handbag", obs 6 false "bag_and_1015_marker"], requiresPrivateHistory := [] },
  { name := "B_sun_B", day := 6, actor := true, observes := [obs 6 true "mon_1015_confirmed", obs 6 true "mother_authorship_disclosed"], requiresPrivateHistory := [] },
  { name := "B_thu_A", day := 3, actor := false, observes := [obs 3 false "appointments_rescheduled", obs 3 false "clothes_examined"], requiresPrivateHistory := [] },
  { name := "B_thu_B", day := 3, actor := true, observes := [obs 3 true "appointments_rescheduled_heard", obs 3 true "sete_weather_question"], requiresPrivateHistory := [] },
  { name := "B_tue_A", day := 1, actor := false, observes := [obs 1 false "key_inside_envelope", obs 1 false "photos_selected"], requiresPrivateHistory := [] },
  { name := "B_tue_B", day := 1, actor := true, observes := [obs 1 true "claire_contacted", obs 1 true "helene_photo_claim"], requiresPrivateHistory := [] },
  { name := "B_wed_A", day := 2, actor := false, observes := [obs 2 false "photos_wrapped", obs 2 false "dates_copied"], requiresPrivateHistory := [] },
  { name := "B_wed_B", day := 2, actor := true, observes := [obs 2 true "photo_annotated", obs 2 true "appointment_dates_requested"], requiresPrivateHistory := [] },
]

/-- Generated continuity-module interface catalogue. Do not edit by hand. -/
def continuityModules : List ContinuityModule := [
  { name := "K_0_A", edge := 0, actor := false, requires := [obs 0 false "envelope_empty", obs 1 false "key_inside_envelope"], introducesWorldFacts := [] },
  { name := "K_0_B", edge := 0, actor := true, requires := [obs 0 true "mail_question_claire", obs 1 true "claire_contacted"], introducesWorldFacts := [] },
  { name := "K_1_A", edge := 1, actor := false, requires := [obs 1 false "photos_selected", obs 2 false "photos_wrapped"], introducesWorldFacts := [] },
  { name := "K_1_B", edge := 1, actor := true, requires := [obs 1 true "helene_photo_claim", obs 2 true "photo_annotated"], introducesWorldFacts := [] },
  { name := "K_2_A", edge := 2, actor := false, requires := [obs 2 false "dates_copied", obs 3 false "appointments_rescheduled"], introducesWorldFacts := [] },
  { name := "K_2_B", edge := 2, actor := true, requires := [obs 2 true "appointment_dates_requested", obs 3 true "appointments_rescheduled_heard"], introducesWorldFacts := [] },
  { name := "K_3_A", edge := 3, actor := false, requires := [obs 3 false "clothes_examined", obs 4 false "bounded_clothes_in_bag"], introducesWorldFacts := [] },
  { name := "K_3_B", edge := 3, actor := true, requires := [obs 3 true "sete_weather_question", obs 4 true "pullovers_compared"], introducesWorldFacts := [] },
  { name := "K_4_A", edge := 4, actor := false, requires := [obs 4 false "plant_note_written", obs 5 false "claire_receives_plant_note_and_key"], introducesWorldFacts := [] },
  { name := "K_4_B", edge := 4, actor := true, requires := [obs 4 true "claire_visit_expected", obs 5 true "claire_receives_household_instructions"], introducesWorldFacts := [] },
  { name := "K_5_A", edge := 5, actor := false, requires := [obs 5 false "id_wallet_staged", obs 6 false "id_wallet_in_handbag"], introducesWorldFacts := [] },
  { name := "K_5_B", edge := 5, actor := true, requires := [obs 5 true "mon_1015_arranged", obs 6 true "mon_1015_confirmed"], introducesWorldFacts := [] },
  { name := "K_6_A", edge := 6, actor := false, requires := [obs 6 false "bag_and_1015_marker", obs 7 false "taxi_arrives_1015"], introducesWorldFacts := [] },
  { name := "K_6_B", edge := 6, actor := true, requires := [obs 6 true "mother_authorship_disclosed", obs 7 true "decision_explained"], introducesWorldFacts := [] },
]

/-- Generated Monday-return interface catalogue. Do not edit by hand. -/
def returnModules : List ReturnModule := [
  { name := "L_A", actor := false, requires := [obs 0 false "care_sheet_meal_half_written", obs 7 false "care_sheet_mon1_blank"], introducesWorldFacts := [] },
  { name := "L_B", actor := true, requires := [obs 0 true "care_sheet_created_by_thomas", obs 7 true "care_sheet_still_present"], introducesWorldFacts := [] },
]

end LaReleve
