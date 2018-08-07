icd10cm_intent_mech_regex <- icd10cm_inj_matrix %>%
  group_by(intent, mechanism) %>%
  summarise(icd10cm_regex = make_regex(icd10cm))


icd10cm_intent_mech_regex <- icd10cm_intent_mech_regex %>%
  mutate(mechanism = clean_mech_names(mechanism))

icd10cm_intent_mech_regex <- icd10cm_intent_mech_regex %>%
  mutate(intent_mechanism = paste(intent, mechanism, sep = "_"))

devtools::use_data(icd10cm_intent_mech_regex, compress = "xz", overwrite = T)
