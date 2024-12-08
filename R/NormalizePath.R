#' @title Normalize Path
#'
#' @description Converts a file path to always use forward slashes and never
#'   have multiple or a trailing slash.
#'
#' @inheritParams fs::path_real
#'
#' @param mustWork boolean whether the path must be a real path.
#'
#' @return returns the canonical path, eliminating any symbolic links and the
#'   special references.
#'
#' @export

NormalizePath <- function(path = utils::readClipboard(), mustWork = FALSE) {
  # Normalize path
  path <- if (isTRUE(mustWork)) {
    fs::path_real(path = path)
  } else if (isFALSE(mustWork)) {
    Try(fs::path_real(path), otherwise = {
      path |>
        fs::path_expand() |>
        fs::path_norm() |>
        fs::path_split() |>
        purrr::map_chr(function(x) {
          realDir <- nDir <- length(x)
          realPath <- NULL
          while (is.null(realPath) && realDir >= 0) {
            realPath <- Try(fs::path_join(parts = utils::head(x, n = realDir)))
            newPath <- fs::path_join(parts = c(realPath, utils::tail(x, n = nDir - realDir)))
            realDir <- realDir - 1
          }
          newPath
        })
    })
  } else {
    cli::cli_abort("{.arg mustWork} must be {.or {.val {c(TRUE, FALSE)}}}.")
  }
  
  utils::writeClipboard(as.character(path))
  return(path)
}
