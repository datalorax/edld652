#' Downloads a Microsoft Word file containing the data documentation for a given dataset
#'
#' @inheritParams get_data
#'
#' @export

get_documentation <- function(name) {
  link <- documentation[documentation$TABLE_NAME == name, "Documentation"]
  ext <- substr(link, nchar(link) - 4, nchar(link))
  file <- paste0(name, ext)
  file_path <- file.path(getwd(),"data-documentation", file)

  if(file.exists(file_path)) {
    file_open(file_path)
    return(message("Opening documentation file ", file))
  }

  if (!file.exists("data-documentation")) {
    dir.create(file.path(getwd(), "data-documentation"))
  }

  download.file(link, file_path)
  file_open(file_path)
}

file_open <- function(file) {
  if (.Platform$OS.type == "unix") {
    return(system(paste("open", file)))
  } else {
    return(shell.exec(file))
  }
}

