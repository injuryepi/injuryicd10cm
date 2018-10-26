# injuryicd10cm
A R package for the use of the injury ICD-10-CM matrix

**injuryicd10cm**, a package with functions and data for the analysis of icd-10-cm codes related to injury. It add intent and mechanism, and ICD-10-CM code description to the inputed data.

To install and load the **injuryicd10cm** package into your working environment:

1. Install the devtools package: *`install.packages("devtools")`*
2. Install the injuryicd10cm package: *`devtools::install_github("injuryepi/injuryicd10cm")`*
3. Load the package: `library(injuryicd10cm)`

and try these lines of R codes to get intent, mechanism or description of any ICD-10-CM codes:  

```{r}
library(tidyverse)   
library(fuzzyjoin)   
library(injuryicd10cm)

icd10cm_data150 %>% add_inj_intent_mech_icd10cm(icd10cm_main = principal_diag, reference = "specific")

```
For more options use `?add_inj_intent_mech_icd10cm` to see the help file of the function `add_inj_intent_mech_icd10cm()`

  When working with multiple fields of diagnosis and e-code, use the function `create_intent_mech()`. Below are examples of usage:
  
```{r}
library(tidyverse)   
library(injuryicd10cm) 

dat <- data.frame(d1 = c("T63023", "X92821", "X99100", "T360x"),
d2 = c("T65823", "Y030x0", "T17200", "V0100x" ))

dat %>% create_intent_mech(inj_col = c(1,2), reference = "both")
dat %>% create_intent_mech(inj_col = c(1,2), reference = "intent")
dat %>% create_intent_mech(inj_col = c(1,2), reference = "mechanism")
```
</br>
  For more details `?create_intent_mech`
