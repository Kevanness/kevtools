#' @title Convert Paths In Windows
#'
#' @description Converts a traditional Windows file path with back slashes to
#'   forward slashes that can be used within R.
#'
#' @param path A file path with back slashes to be converted. Default uses the
#'   currently copied text within the clipboard.
#'
#' @return Writes the new converted path to the clipboard and also returns the
#'   converted path.
#'
#' @export

WindowsPath <- function(path = utils::readClipboard()) {
  # Cleans path
  path <- fs::path(path)

  utils::writeClipboard(path)
  return(path)
}
