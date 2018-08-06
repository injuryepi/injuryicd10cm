
icd10cm_injury_matrix <- icd10cm_inj_matrix %>%
  mutate(icd10cm_regex = make_regex1(icd10cm)) %>%
  select(-icd10cm, -icd10cm_f)

devtools::use_data(icd10cm_injury_matrix, compress = "xz", overwrite = T)

