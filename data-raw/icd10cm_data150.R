#load("/.R_Cache/icd10cm_data150@.RData")

devtools::use_data(icd10cm_data150, compress = "xz", overwrite = T)
