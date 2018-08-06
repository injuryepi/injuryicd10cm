icd10cm_intent_regex <- icd10cm_inj_matrix %>%
  group_by(intent) %>%
  summarise(icd10cm_regex = make_regex(icd10cm))


icd10cm_intent_regex <- icd10cm_intent_regex %>%
  mutate(intent_mechanism = intent)

devtools::use_data(icd10cm_intent_regex, compress = "xz", overwrite = T)
