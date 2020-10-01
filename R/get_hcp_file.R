#' @title Get HCP file
#' @description Wraps a \code{\link{make_aws_call}} to a \code{GET}
#' statement to get the file
#' @param path_to_file Path to file on HCP S3 Bucket
#' @param ... arguments to pass to \code{\link{make_aws_call}}
#' @param verbose Should the URL be printed?
#' @param verb passed to \code{\link{VERB}}
#'
#' @return Result of \code{GET}
#' @export
#' @importFrom httr GET VERB
get_hcp_file = function(
  path_to_file = "/",
  ...,
  verbose = TRUE,
  verb = "GET") {
  # url = hcp_aws_url(path_to_file = path_to_file,..., verb = verb)

  L = make_aws_call(path_to_file = path_to_file, ...)

  bucket = list(...)$bucket
  if (is.null(bucket)) bucket = formals(hcp_aws_url)$bucket
  query = L$query
  query$AWSAccessKeyId = NULL
  query$Expires = NULL
  query$Signature = NULL
  ret = aws.s3::s3HTTP(
    bucket = bucket,
    path = path_to_file,
    verb = verb,
    key = L$headers$access_key,
    secret = L$headers$secret_key,
    show_progress = verbose,
    region = L$headers$default_region)
  return(ret)
}

#' @rdname get_hcp_file
#' @export
head_hcp_file = function(...) {
  get_hcp_file(..., verb = "HEAD")
}


#' @rdname get_hcp_file
#' @export
get_fcp_file = function(...) {
  get_hcp_file(...,
               bucket = "fcp-indi",
               sign = FALSE)
}

#' @rdname get_hcp_file
#' @export
head_fcp_file = function(...) {
  head_hcp_file(...,
                bucket = "fcp-indi",
                sign = FALSE)
}



#' @rdname get_hcp_file
#' @export
get_openneuro_file = function(...) {
  get_hcp_file(...,
               bucket = "openneuro",
               sign = FALSE)
}

#' @rdname get_hcp_file
#' @export
head_openneuro_file = function(...) {
  head_hcp_file(...,
                bucket = "openneuro",
                sign = FALSE)
}

