icd10cm_mech_regex <- icd10cm_inj_matrix %>%
  group_by(mechanism) %>%
  summarise(icd10cm_regex = make_regex(icd10cm))

devtools::use_data(icd10cm_mech_regex, compress = "xz", overwrite = T)
