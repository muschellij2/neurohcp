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
#' t1_niis = hcp_list_files(prefix ="HCP/100307/T1w",
#' delimiter = ".nii.gz")
#' all_dirs = hcp_list_dirs("HCP/")
#' }
#'
hcp_list_files = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  ...
) {

  q = list()
  q$prefix = prefix
  q$delimiter = delimiter
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

#' @export
#' @rdname hcp_list_files
fcp_list_files = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  ...
) {
  hcp_list_files(
    prefix = prefix,
    delimiter = delimiter,
    query = query,
    bucket = "openneuro",
    sign = FALSE,
    ...)
}

#' @export
#' @rdname hcp_list_files
openneuro_list_files = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  ...
) {
  hcp_list_files(
    prefix = prefix,
    delimiter = delimiter,
    query = query,
    bucket = "fcp-indi",
    sign = FALSE,
    ...)
}

#' @rdname hcp_list_files
#' @export
#' @examples
#' if (have_aws_key()){
#'  all_dirs = hcp_list_dirs("HCP/")
#'  cr =parse_list_files(all_dirs)$prefixes
#' }
hcp_list_dirs = function(
  prefix = "HCP/",
  ...
) {
  if (length(prefix) > 0) {
    if (!grepl("/$", prefix)) {
      prefix = paste0(prefix, "/")
    }
  }
  return(hcp_list_files(..., prefix = prefix, delimiter = "/"))
}


#' @export
#' @rdname hcp_list_files
#' @examples
#' \dontrun{
#' res = fcp_list_dirs()
#' projects = unlist(parse_list_files(res)$prefixes)
#' projects = unname(projects)
#' head(projects)
#' head(basename(projects))
#' }
fcp_list_dirs = function(
  prefix = "data/Projects/",
  ...
) {
  hcp_list_dirs(
    prefix = prefix,
    bucket = "fcp-indi",
    sign = FALSE,
    ...)
}



#' @rdname hcp_list_files
#' @export
#' @examples
#' res = openneuro_list_dirs()
#' projects = unlist(parse_list_files(res)$prefixes)
#' projects = unname(projects)
#' head(projects)
#' if (length(projects) > 0) {
#' head(basename(projects))
#' }
openneuro_list_dirs  = function(
  prefix = NULL,
  ...
) {
  hcp_list_dirs(
    prefix = prefix,
    bucket = "openneuro",
    sign = FALSE,
    ...)
}

