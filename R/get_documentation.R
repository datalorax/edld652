#' Downloads a Microsoft Word file containing the data documentation for a given dataset
#'
#' @inheritParams get_data
#'
#' @export

get_documentation <- function(name) {
  link <- documentation[
            documentation$TABLE_NAME == name,
            "Documentation",
            drop = TRUE
          ]

  if (grepl("lunch_program", name)) {
    link <- "https://nces.ed.gov/ccd/xls/2019-20_School_Lunch_Companion.xlsx"
  }
  if (.Platform$OS.type != "unix") {
    return(message(link))
  }
  ext <- substr(link, nchar(link) - 4, nchar(link))
  file <- paste0(name, ext)
  file_path <- file.path(getwd(),"data-documentation", file)

  if (file.exists(file_path)) {
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
  system(paste("open", file))
}

