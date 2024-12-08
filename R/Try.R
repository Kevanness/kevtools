#' @title Try an Expression Allowing Error Recovery
#'
#' @description `try` is a wrapper to run an expression that might fail and
#'   allow the user's code to handle error-recovery.
#'
#' @param expr an `R` expression to try.
#'
#' @param otherwise Default value to use when an error occurs.
#'
#' @return The value of the expression if `expr` is evaluated without error;
#'   otherwise `otherwise` will be returned.
#'
#' @export

Try <- function(expr, otherwise = NULL) {
  tryCatch(expr = expr, error = function(e) otherwise)
}
