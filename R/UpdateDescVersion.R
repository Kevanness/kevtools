#' @title Update Description Version
#'
#' @description Updates the Version field in the package description file to a
#'   new version.
#'
#' @param path path to a package.
#'
#' @return NULL
#'
#' @export

UpdateDescVersion <- function(path) {
  # Get current package version
  descVersion <- desc::desc_get_version(file = path)
  upgradeChoices <- c("major", "minor", "patch", "dev")
  
  # Get version numbers
  newVersions <- purrr::map_chr(upgradeChoices, function(x) {
    tryVersion <- desc::desc(text = glue::glue("Version: {descVersion}"))
    suppressMessages(tryVersion$bump_version(x)$get("Version")[[1]])
  })
  
  # Let user choose which version to update to
  bumpTo <- utils::menu(
    choices = glue::glue("{format(upgradeChoices, justify = 'right')} --> {newVersions}"),
    title = glue::glue("
    Current version is {descVersion}
    What should the new version be? (0 to exit)
    ")
  )
  
  # Bump to new version or return if 0 is used to exit
  if (bumpTo != 0) {
    cli::cli_bullets(c(
      "i" = "Updating: {.file {fs::path(path, 'DESCRIPTION')}}",
      "v" = "Package version bumped from {.var {descVersion}} to {.var {bumpTo}}."
    ))
    suppressMessages(desc::desc_bump_version(which = bumpTo, file = path))
  }
  
  invisible()
}
