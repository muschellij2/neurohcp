#' @title Get HCP file
#' @description Wraps a \code{\link{hcp_aws_url}} to a \code{GET}
#' statement to get the file
#' @param ... arguments to pass to \code{\link{hcp_aws_url}}
#'
#' @return Result of \code{GET}
#' @export
#' @importFrom httr GET
get_hcp_file = function(..., verbose = TRUE) {
  url <- hcp_aws_url(...)
  if (verbose) {
    message(paste0("URL sent to GET\n", url))
  }
  xy <- httr::GET(url)
  if (verbose) {
    # message("Output of GET\n")
    # message(xy)
  }
  return(xy)
}