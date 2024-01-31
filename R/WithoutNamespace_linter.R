#' @title Without Namespace Linter
#'
#' @description Check for missing namespace prefixes in function calls.
#'
#' @param excludePkg Character string, all functions within the namespace will
#'   be excluded from being flagged.
#'
#' @examples
#' # Will produce lints
#' lintr::lint(
#'   text = "map()",
#'   linters = WithoutNamespace_linter()
#' )
#'
#' # Okay
#' lintr::lint(
#'   text = "purrr::map()",
#'   linters = WithoutNamespace_linter()
#' )
#'
#' @export

WithoutNamespace_linter <- function(excludePkg = NULL) {
  internalFuncs <- c(
    getNamespaceExports("base"),
    if (!is.null(excludePkg)) ls(asNamespace(excludePkg))
  )
  
  lintr::Linter(function(source_expression) {
    if (!lintr::is_lint_level(source_expression, "expression")) {
      return(list())
    }
    
    # Parse xml file
    xml <- source_expression$xml_parsed_content
    
    # Get function calls without a preceding namespace or class
    functionNodes <- xml2::xml_find_all(
      xml,
      xpath = "//SYMBOL_FUNCTION_CALL[not(preceding-sibling::NS_GET) and not(preceding-sibling::OP-DOLLAR)]"
    )
    
    funNames <- lintr::get_r_string(functionNodes)
    
    externalFuncs <- !funNames %in% internalFuncs
    
    lintr::xml_nodes_to_lints(
      xml = functionNodes[externalFuncs],
      source_expression = source_expression,
      lint_message = "Use explicit namespace function calls, i.e. `map()` should be `purrr::map()`.",
      type = "warning"
    )
  })
}
