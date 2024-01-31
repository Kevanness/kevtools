#' @title Load complete package
#'
#' @description This calls [pkgload::load_all()] which loads a package. This
#'   splits the directory and package which can be useful for working on
#'   multiple packages without switching working directories or providing the
#'   entire path.
#'
#' @param package Folder/path the package is in, starting from the repoPath.
#'
#' @param repoPath Path to the directory.
#'
#' @return NULL
#'
#' @export

LoadAll <- function(package, repoPath = getOption("repoPath")) {
  # Combine paths to get full package path
  path <- fs::path(repoPath, package)
  
  pkgload::load_all(path)
}
