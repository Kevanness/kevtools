#' @title Update Description Version
#'
#' @description Updates the version field in the package description file to a
#'   new version.
#'
#' @param path Path to a package.
#'
#' @return NULL
#'
#' @export

UpdateDescVersion <- function(path) {
  # Get current package version
  descVersion <- desc::desc_get_version(file = path)
  upgradeChoices <- c("major", "minor", "patch")
  
  # Get version numbers
  newVersions <- purrr::map_chr(
    upgradeChoices,
    function(x) {
      tryVersion <- desc::desc(text = paste("Version:", descVersion))
      suppressMessages(tryVersion$bump_version(x)$get("Version")[[1]])
    }
  )
  
  # Let user choose which version to update to
  bumpTo <- utils::menu(
    choices = paste(upgradeChoices, "-->", newVersions),
    title = paste0(
      "Current version is ", descVersion, "/n",
      "What should the new version be? (0 to exit)"
    )
  )
  
  # Bump to new version or return if 0 is used to exit
  if (bumpTo != 0) {
    message(paste("Updating:", fs::path(path, "DESCRIPTION")))
    desc::desc_bump_version(which = bumpTo, file = path)
  }
  
  return(invisible(NULL))
}
