.onAttach <- function(...) {
  key <- Sys.getenv("azure_sas")
  if (nchar(key) == 0) {
    packageStartupMessage("Please set your key with `set_key()`")
  }
}

.onLoad <- function(...) {
  key <- Sys.getenv("azure_sas")
  if (nchar(key) > 0) {
    uo_share <<- storage_endpoint(
      "https://usafactsstaticprod.blob.core.windows.net",
      sas = key
    )
    container <<- storage_container(uo_share, "public")
  }
}
