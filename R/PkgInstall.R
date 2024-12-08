#' @title Install packages
#'
#' @description This calls [pak::pkg_install()] which installs a package. This
#'   always clears the caches and has the `upgrade` defualted to `TRUE`.
#'
#' @inherit pak::pkg_install params return
#'
#' @export

PkgInstall <- function(pkg, upgrade = TRUE) {
  pak::pak_cleanup(force = TRUE)
  pak::pkg_install(pkg = pkg, upgrade = upgrade)
}
