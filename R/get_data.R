#' Function to retrieve course data
#'
#' Note there are many possible data files to pull. To see all possible data
#'   files, please run `list_datasets()`. These files link together via keys. You
#'   should be able to join multiple files to get a more complete dataset
#'   from which to visualize your results.
#'
#' @param name The name of the file you want to import. Should be a string
#'   returned by [edld652::list_datasets()].
#' @export

get_data <- function(name) {
  file <- paste0("data/education-data-share/", name, ".csv")
  storage_read_csv(container, file)
}

#' Imports all fiscal data available
#'
#' Returns a list of all fiscal data.
#'
#' Note -  this may not work if you don't have a lot of memory, and it will
#' take a considerable amount of time regardless. Be prepared to wait several
#' minutes.
#' @export
#' @examples \dontrun{
#' l <- get_fiscal_data()
#'
#' # fiscal dataframe from 2010
#' l$sy2010
#'
# fiscal dataframe from 2018
#' l$sy2018
#'
#' }
get_fiscal_data <- function() {
  files <- paste0("NCES_CCD_fiscal_district_20", 10:18)
  suppressMessages(
    l <- lapply(files, get_data)
  )
  names(l) <- paste0("sy20", 10:18)
  l
}

#' List  the available dataset
#'
#' This function will list all possible datasets that are available for you to
#' work with in this class. You can import any of these into R using by
#' supplying the name of the dataset (as a string) to the [edld652::get_data()]
#' function.
#'
#' @export

list_datasets <- function() {
  files <- list_storage_files(container, "data/education-data-share")
  gsub("data/education-data-share/(.+)\\.csv", "\\1", files$name)
}
