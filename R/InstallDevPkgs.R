#' @title Install Development packages
#'
#' @description This calls [PkgInstall()] updating common packages used in
#'   development.
#'
#' @inherit PkgInstall return
#'
#' @export

InstallDevPkgs <- function() {
  PkgInstall(pkg = c(
    "devtools", "roxygen2", "styler", "testthat", "usethis", "withr"
  ))
}
