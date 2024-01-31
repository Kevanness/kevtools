#' @title Load complete package
#'
#' @description This calls [pkgload::load_all()] which loads a package. This
#'   splits the directory and package which can be useful for working on
#'   multiple packages without switching working directories or providing the
#'   entire path.
#'
#' @param repoPath Path to the directory.
#'
#' @param path Folder/path the package is in, starting from the repoPath.
#'
#' @return NULL
#'
#' @export

LoadAll <- function(repoPath = getOption("repoPath"), package) {
  # Combine paths to get full package path
  path <- fs::path(repoPath, package)
  
  pkgload::load_all(path)
  
  return(invisible(NULL))
}
