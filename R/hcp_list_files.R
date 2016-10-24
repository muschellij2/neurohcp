#' @title List files from HCP bucket
#' @description Lists a set of files from an HCP bucket for a specific sub-folder
#'
#' @param prefix directory folder to list files.  If \code{""}, then it will be
#' the root path
#' @param delimiter Delimiter to list files.  For example \code{".mat"},
#' for ".mat"
#' @param query Additional query arguments
#' @param ... additional arguments passed to \code{\link{get_hcp_file}}
#'
#' @return List with the result of the GET command, the parsed result, and
#' the content from the result.
#' @export
#'
#' @examples
#' if (have_aws_key()){
#' x = hcp_list_files(prefix = "HCP/100307/unprocessed/3T/Diffusion",
#'    delimiter="bval")
#' }
#'
hcp_list_files = function(
  prefix = "",
  delimiter = "",
  query = NULL,
  ...
) {

  q = list(prefix = prefix, delimiter = delimiter)
  query = c(q, query)
  ret = get_hcp_file(
    path_to_file = "",
    query = query,
    ...)

  httr::stop_for_status(ret)
  cr = httr::content(ret, as = "text", encoding = "UTF-8")
  if (cr != "") {
    res = read_xml(cr)
    res = as_list(res)
  } else {
    res = NULL
  }
  L = list(get_result = ret,
           content = cr,
           parsed_result = res)
  return(L)
}


#' @rdname hcp_list_files
#' @export
hcp_list_dirs = function(
  prefix = "",
  delimiter = "/",
  ...
) {
  if (!grepl("/$", prefix)) {
    prefix = paste0(prefix, "/")
  }
  return(hcp_list_files(..., prefix = prefix, delimiter = delimiter))
}
