#' @title Update Description Date
#'
#' @description Updates the Date field in the package description file to the
#'   current date. Useful for local packages that you want to date which won't
#'   be uploaded to CRAN.
#'
#' @param path path to a package
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
  
  cli::cli_bullets(c(
    "i" = "Updating: {.file {fs::path(path, 'DESCRIPTION')}}",
    "v" = "Package date bumped from {.var {descDate}} to {.var {newDate}}."
  ))
  
  return(invisible(NULL))
}
