#' @title Install Reverse Development Dependencies
#'
#' @description This function identifies the local development dependencies of a package and their reverse dependencies, then installs all of them.
#'
#' @inheritParams pak::local_dev_deps
#' @inheritParams pak::pkg_install
#'
#' @returns `root` invisibly.

LocalInstallRevDevDeps <- function(root = ".", ask = interactive()) {
# Get local development dependencies
  localDevDeps <- pak::local_dev_deps(root = root)
  pkgName <- localDevDeps$package[localDevDeps$directpkg]
  localDeps <- localDevDeps$package[localDevDeps$type %in% "standard"]

# Get reverse dependencies
  revDeps <- tools::package_dependencies(packages = pkgName, which = "all", reverse = TRUE)[[pkgName]]

# Combine local dependencies and reverse dependencies
  allDeps <- c(localDeps, revDeps)

# Install all dependencies
  if (rlang::has_length(allDeps)) {
    pak::pkg_install(pkg = allDeps, upgrade = TRUE, ask = ask, dependencies = TRUE)
  }

  invisible(root)
}
