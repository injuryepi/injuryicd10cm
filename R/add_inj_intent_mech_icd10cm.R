#' Add intent, mechanism, and description to injury ICD-10-CM.
#'
#'
#' @param data input data
#' @param icd10cm_main principal diagnosis column name without "quotation marks"
#' @param reference injury matrix reference with four possible choices:
#' "matrix"(the default) adding intent and mechanism to the input data
#' "specific" adding intent, mechanism and the description of the icd10cm code
#' "intent" adding intent only
#' "mechanism" adding mechanism only
#'
#' @return return the input with additional variables (intent, mechanism and description of the icd-10-cm) depending on the choice of the reference
#' @export
#' @importFrom fuzzyjoin regex_left_join
#'
#' @examples to be added
#' library(tidyverse)
#' filter(hosp_set, year == 2016, quarters(discharge_date) == "Q4" ) %>% od_drug_apr_icd10cm(diag_ecode_col = c(3, 6)) %>% sample_n(5)
#'

add_inj_intent_mech_icd10cm <- function(data, icd10cm_main,
                                        reference = c("matrix", "specific", "intent", "mechanism"), ignore_case = TRUE) {
  icd10cm_inj <- switch(match.arg(reference), matrix = icd10cm_inj_regex, specific = icd10cm_injury_matrix, intent = icd10cm_intent_regex, mechanism = icd10cm_mech_regex)

  icd10cm_main <- enquo(icd10cm_main)
  icd10cm_regex <- "icd10cm_regex"

  suppressWarnings(suppressMessages(require(fuzzyjoin)))

  data %>%
    mutate(!!icd10cm_regex := !!icd10cm_main) %>%
    fuzzyjoin::regex_left_join(icd10cm_inj, by = c("icd10cm_regex", "icd10cm_regex"), ignore_case = ignore_case) %>%
    select(-icd10cm_regex.x, -icd10cm_regex.y)
}
