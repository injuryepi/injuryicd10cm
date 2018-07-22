load("/.R_Cache/icd10cm_inj_regex@.RData")

devtools::use_data(icd10cm_inj_regex, compress = "xz", overwrite = T)
