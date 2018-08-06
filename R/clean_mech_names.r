#' clean the mechanism categories replacing space and other symbols
#'  with _.
#'
#'
#' @param x input variable

#' @return return cleaner mechanism categories
#'
#' @export
#' @importFrom purrr compose
#'
#' @examples
#' library(tidyverse)
#' clean_mech_names(c("Natural/Environmental, Other"))
#'
#'
clean_mech_names <- compose(
  # remove repeat "_" and extreme "_"
  function(x) gsub("(_)(?=_*\\1)|^_|_$", "", x, perl = T),
  # not [A-Za-z0-9_] and replace with "_"
  function(x) gsub("\\W", "_", x),
  # parenthesis and its contents
  function(x) gsub("\\(.+\\)", "", x))
