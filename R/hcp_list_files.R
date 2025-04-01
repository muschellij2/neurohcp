#' @title List files from HCP bucket
#' @description Lists a set of files from an HCP bucket for a specific sub-folder
#'
#' @param prefix directory folder to list files.  If \code{""}, then it will be
#' the root path
#' @param delimiter Delimiter to list files.  For example \code{".mat"},
#' for ".mat"
#' @param query Additional query arguments
#' @param marker the marker to start the listing, needed for pagination of
#' results
#' @param ... additional arguments passed to \code{\link{get_hcp_file}}
#' @param sign Should the url be signed with an API key?
#'
#' @return List with the result of the GET command, the parsed result, and
#' the content from the result.
#' @export
#'
#' @examples
#' if (have_aws_key()){
#' x = hcp_list_files(prefix = "HCP/100307/unprocessed/3T/Diffusion",
#'    delimiter="bval")
#' stopifnot(x$parsed_result$ListBucketResult$Name[[1]] == "hcp-openaccess")
#' t1_niis = hcp_list_files(prefix ="HCP/100307/T1w",
#' delimiter = ".nii.gz")
#' all_dirs = hcp_list_dirs("HCP/")
#' }
#'
hcp_list_files = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  marker = NULL,
  ...,
  sign = TRUE
) {
  ret = hcp_list_files_once(prefix = prefix,
                            delimiter = delimiter,
                            query = query,
                            marker = marker,
                            ...,
                            sign = sign
  )
  extract_truncation = function(ret) {
    is_trunc = ret$parsed_result$ListBucketResult$IsTruncated[[1]]
    is_trunc = as.logical(is_trunc)
  }
  is_trunc = extract_truncation(ret)
  get_last_marker = function(ret) {
    res = parse_list_files(ret)
    res = res$contents
    marker = res$Key[nrow(res)]
  }
  marker = get_last_marker(ret)
  if (is_trunc) {
    all_data = list(ret)
    while (is_trunc) {
      message(paste0("New Marker is: ", marker))
      ret2 = hcp_list_files_once(prefix = prefix,
                                 delimiter = delimiter,
                                 query = query,
                                 marker = marker,
                                 ...
      )
      ret$get_result = c(ret$get_result, ret2$get_result)
      ret$content = c(ret$content, ret2$content)
      ret$parsed_result = c(ret$parsed_result, ret2$parsed_result)
      marker = get_last_marker(ret2)
      is_trunc = extract_truncation(ret2)
    }
  }
  ret
}

hcp_list_files_once = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  marker = NULL,
  ...,
  sign = TRUE
) {
  L = make_aws_call(path_to_file = prefix, ..., sign = sign)

  bucket = list(...)$bucket
  if (is.null(bucket)) bucket = formals(hcp_aws_url)$bucket
  query$delimiter = delimiter
  query$prefix = prefix
  if ("marker" %in% names(prefix)) {
    stop("Only specify marker in query itself or as an argument, not both!")
  }
  query$marker = marker
  if (!sign) {
    L$headers$access_key = ""
    L$headers$secret_key = ""
    env_key = Sys.getenv("AWS_ACCESS_KEY_ID")
    on.exit({
      Sys.setenv("AWS_ACCESS_KEY_ID" = env_key)
    })
    Sys.setenv(AWS_ACCESS_KEY_ID = "")
    env_secret = Sys.getenv("AWS_SECRET_ACCESS_KEY")
    on.exit({
      Sys.setenv("AWS_SECRET_ACCESS_KEY" = env_secret)
    })
    Sys.setenv(AWS_SECRET_ACCESS_KEY = "")
  }
  ret = aws.s3::s3HTTP(
    bucket = bucket,
    path = "",
    verb = "GET",
    query = query,
    key = L$headers$access_key,
    secret = L$headers$secret_key,
    parse_response = FALSE,
    region = L$headers$default_region)

  httr::stop_for_status(ret)
  cr = httr::content(ret, as = "text", encoding = "UTF-8")
  if (cr != "") {
    res = xml2::read_xml(cr)
    res = xml2::as_list(res)
  } else {
    res = NULL
  }
  ret = list(get_result = ret,
             content = cr,
             parsed_result = res)

  return(ret)
}

#' @export
#' @rdname hcp_list_files
fcp_list_files = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  marker = NULL,
  ...
) {
  hcp_list_files(
    prefix = prefix,
    delimiter = delimiter,
    query = query,
    bucket = "openneuro",
    sign = FALSE,
    marker = marker,
    ...)
}

#' @export
#' @rdname hcp_list_files
openneuro_list_files = function(
  prefix = "",
  delimiter = NULL,
  query = NULL,
  marker = NULL,
  ...
) {
  hcp_list_files(
    prefix = prefix,
    delimiter = delimiter,
    query = query,
    bucket = "fcp-indi",
    sign = FALSE,
    marker = marker,
    ...)
}

#' @rdname hcp_list_files
#' @export
#' @examples
#' if (have_aws_key()){
#'   res = hcp_list_dirs("HCP/")
#'   projects = unlist(parse_list_files(res)$prefixes)
#'   projects = unname(projects)
#'   projects = unname(projects)
#'   head(projects)
#'   head(basename(projects))
#'   stopifnot("100307" %in% basename(projects))
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
#' if (have_aws_key()){
#' res = fcp_list_dirs()
#' projects = unlist(parse_list_files(res)$prefixes)
#' projects = unname(projects)
#' head(projects)
#' head(basename(projects))
#' stopifnot("ABIDE" %in% basename(projects))
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
#' stopifnot("ds000002" %in% basename(projects))
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

