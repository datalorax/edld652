#' Access your key from .Renviron
#'
#' This function is primarily used as the default argument for
#'   [get_data()], but can be run at any time to access your
#'   specific key. Note that you should first set your key with
#'   [set_key()].
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(edld652)
#' get_key()
#' }
#'
get_key <- function() {
  key <- Sys.getenv("azure_sas")
  if (nchar(key) < 1) {
    return(stop(paste0(
      "Key not found in R Environment. Please run `set_key()` ",
      "to first set your key. Note - you will have to restart R after running",
      "`set_key()` for the changes to take affect."
    ), call. = FALSE))
  }
  key
}


#' Function to set an access key for the course data
#'
#' This function adds your key to your .Renviron so it is accessible by
#' [get_key()]. You should only need to run this function once. Make sure to
#' restart your local R session after running this function for the changes
#' to take effect.
#'
#' @param key A string of your specific key
#' @param overwrite Defaults to \code{FALSE}. If there is a key already in the
#'   .Renviron, should it be overwritten?
#'
#' @export
#'
#' @examples
#' library(edld652)
#' \dontrun{
#' redcap_set_key("abcdefghikjlmnop")
#' }
set_key <- function(key, overwrite = FALSE) {
  token <- paste0('azure_sas = "', key, '"')
  home <- path.expand("~")
  home_files <- list.files(home, all.files = TRUE)

  if (!any(grepl("\\.Renviron", home_files))) {
    dir.create(file.path(home, ".Renviron"))
  }

  renviron <- readLines(file.path(home, ".Renviron"))

  current_token <- grep("azure_sas", renviron)
  if (length(current_token) > 0) {
    if (overwrite) {
      renviron[current_token] <- token
    } else {
      stop("`azure_sas` already exists in .Renviron. ",
           "Run again with `overwrite = TRUE` to overwrite the existing key.",
           call. = FALSE)
    }
  } else {
    placement <- length(renviron) + 1
    renviron[placement] <- token
  }
  writeLines(renviron, file.path(home, ".Renviron"))
  message("Make sure to restart R for changes to take effect")
}
