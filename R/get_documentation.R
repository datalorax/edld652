#' Downloads a Microsoft Word file containing the data documentation for a given dataset
#'
#' @inheritParams get_data
#'
#' @export

get_documentation <- function(name) {
  link <- documentation[documentation$TABLE_NAME == name, "Documentation"]
  ext <- substr(link, nchar(link) - 4, nchar(link))
  file <- paste0(name, ext)

  if(file.exists(file.path(getwd(),"data-documentation", file))) {
    system(paste("open", file.path(getwd(),"data-documentation", file)))
  }

  if (!file.exists("data-documentation")) {
    dir.create(file.path(getwd(), "data-documentation"))
  }
  file_path <- file.path(getwd(),"data-documentation", file)

  download.file(link, file_path)
  system(paste("open", file_path))
}
