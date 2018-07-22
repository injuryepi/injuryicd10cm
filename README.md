# injuryicd10cm
A R package for the use of the injury ICD-10-CM matrix

**injuryicd10cm**, a package with functions and data for the analysis of icd-10-cm codes related to injury. It add intent and mechanism, and ICD-10-CM code description to the inputed data.

To install and load the **injuryicd10cm** package into your working environment:

1. Install the devtools package: *`install.packages("devtools")`*
2. Install the overdoser package: *`devtools::install_github("injuryepi/injuryicd10cm")`*
3. Load the package: `library(injuryicd10cm)`

and try 
library(tidyverse)
library(fuzzyjoin)
library(overdoser)
icd10cm_data150 %>% add_inj_intent_mech_icd10cm(icd10cm_main = principal_diag, reference = "specific")

