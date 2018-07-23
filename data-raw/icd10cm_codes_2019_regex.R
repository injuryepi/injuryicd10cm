# load("/.R_Cache/icd10cm_codes_2019@.RData")

icd10cm_codes_2019 <- icd10cm_codes_2019 %>%
  mutate(icd10cm_regex = make_regex1(icd10cm))

devtools::use_data(icd10cm_codes_2019, compress = "xz", overwrite = T)

