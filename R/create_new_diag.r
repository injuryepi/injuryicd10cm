
#' Create a new variable based on pattern in the argument expr
#'
#' @param data: input data
#' @param expr: regular expression describing the pattern of interest
#' @param colvec: indices of variables of interest
#' @param ignore.case logical
#' @param perl logical
#'
#' @return new variable matching the pattern described in the regular expression
#' @export
#'
#' @examples to be added

#'
create_new_diag <- function(data, expr, colvec, ignore.case = T, perl = T) {

  colvec = enquo(colvec)
  # assign '1' if the regular expression matched
  f1 = function(x) as.numeric(grepl(expr, x, ignore.case = ignore.case, perl = perl))
  # any one in the diagnosis field suffices
  f2 = function(x){as.numeric(rowSums(x, na.rm = TRUE) > 0)}

  data %>% select(!!colvec) %>%
    mutate_all(funs(as.character)) %>%
    map_df(f1) %>%
    mutate(new_diag = f2(.)) %>%
    pull(new_diag)
}
