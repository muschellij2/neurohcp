#' @title Get HCP file
#' @description Wraps a \code{\link{aws_query_string_auth_url}} to a \code{GET}
#' statement to get the file
#' @param ... arguments to pass to \code{\link{aws_query_string_auth_url}}
#'
#' @return Result of \code{GET}
#' @export
#' @importFrom httr GET
get_hcp_file = function(...) {
  url <- aws_query_string_auth_url(...)
  xy <- httr::GET(url)
  return(xy)
}