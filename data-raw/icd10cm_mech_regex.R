icd10cm_mech_regex <- icd10cm_inj_matrix %>%
  group_by(mechanism) %>%
  summarise(icd10cm_regex = make_regex(icd10cm))

icd10cm_mech_regex <- icd10cm_mech_regex %>%
  mutate(intent_mechanism = clean_mech_names(mechanism))


devtools::use_data(icd10cm_mech_regex, compress = "xz", overwrite = T)
