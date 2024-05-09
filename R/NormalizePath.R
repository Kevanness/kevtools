#' @title Normalize Path
#'
#' @description Converts a file path to always use forward slashes and never
#'   have multiple or a trailing slash.
#'
#' @param path file path to normalize.
#'
#' @return converted path, will also write the path to the clipboard.
#'
#' @export

NormalizePath <- function(path = utils::readClipboard()) {
  # Cleans path
  path <- fs::path(path)
  
  utils::writeClipboard(as.character(path))
  return(path)
}
