#' @title Get HCP file
#' @description Wraps a \code{\link{hcp_aws_url}} to a \code{GET}
#' statement to get the file
#' @param ... arguments to pass to \code{\link{hcp_aws_url}}
#'
#' @return Result of \code{GET}
#' @export
#' @importFrom httr GET
get_hcp_file = function(...) {
  url <- hcp_aws_url(...)
  xy <- httr::GET(url)
  return(xy)
}