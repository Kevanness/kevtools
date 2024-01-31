#' @title Update Description Date
#'
#' @description Updates the Date field in the package description file to the
#'   current date. Useful for local packages that you want to date which won't
#'   be uploaded to CRAN.
#'
#' @param path Path to a package.
#'
#' @return NULL
#'
#' @export

UpdateDescDate <- function(path) {
  # Load desc file
  descFile <- desc::desc(file = path)
  
  # Get old and current date
  descDate <- descFile$get_field("Date")
  newDate <- Sys.Date()
  
  # Set date
  desc::desc_set("Date", newDate, file = path)
  
  # Message new dates
  message(paste("Updating:", fs::path(path, "DESCRIPTION")))
  message(paste0("Package date bumped from '", descDate, "' to '", newDate, "'"))
}
