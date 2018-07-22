#' transform the ICD-10-CM codes into an operational regular expression.
#'
#'
#' @param x input variable

#' @return return the icd10cm as regular expressions with all the "x" not at the beginning of the icd10cm code replaced by '.' to match any character.
#'
#' @export
#' @importFrom purrr compose
#'
#' @examples to be added
#' library(tidyverse)
#' make_regex(c("X45x2", "Y65xx"))
#'
#'
make_regex1 <- purrr::compose(
  function(x) paste0("^", x),
  function(x) gsub("(?<!^)x", ".", x, ignore.case = T, perl = T)
)
