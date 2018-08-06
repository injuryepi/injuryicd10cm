#' Add intent and mechanism combined fields for injury ICD-10-CM.
#'
#', reference
#' @param data input data
#' @param inj_col ecode and diagnosis column indices
#' @param reference injury matrix reference with three possible choices:
#' "both"(the default) adding intent and mechanism combined variables
#' "intent" adding intent only
#' "mechanism" adding mechanism only
#'
#' @return return the input with additional variables (93 intent_mechanism combinations, five intent variables, or 32 mechanism variable depending on the reference choice
#'
#' @export
#' @importFrom purrr map2_dfc
#'
#' @examples
#' library(tidyverse)
#' dat <- data.frame(d1 = c("T63023", "X92821", "X99100", "T360x"),
#' d2 = c("T65823", "Y030x0", "T17200", "V0100x" ))
#'
#' dat %>% intent_mech(inj_col = c(1,2), reference = "both")
#' dat %>% intent_mech(inj_col = c(1,2), reference = "intent")
#' dat %>% intent_mech(inj_col = c(1,2), reference = "mechanism")
#'

create_intent_mech <- function(data, inj_col, reference = c("both", "intent", "mechanism")) {

  icd10cm_inj <- switch(match.arg(reference), both = icd10cm_intent_mech_regex, intent = icd10cm_intent_regex, mechanism = icd10cm_mech_regex)

  list_int_mech <- icd10cm_inj %>% pull(intent_mechanism)
  list_expr <- icd10cm_inj %>% pull(icd10cm_regex)

  f_im <- function(data = data, inj_col, var_name, expr) {
    var_name <- quo_name(var_name)

    data %>% mutate(!!var_name := create_new_diag(., expr = expr, colvec = inj_col)) %>% select(!!var_name)
  }
  dat2 <- map2_dfc(.x = list_int_mech, .y = list_expr, ~f_im(data = data, inj_col = inj_col, var_name = .x, expr =.y))

  data %>% bind_cols(dat2)
}
