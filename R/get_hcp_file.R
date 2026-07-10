#' @title Get HCP file
#' @description Wraps a \code{\link{make_aws_call}} to a \code{\link[httr]{GET}}
#' statement to get the file
#' @param path_to_file Path to file on HCP S3 Bucket
#' @param ... arguments to pass to \code{\link{make_aws_call}}
#' @param verbose Should the URL be printed?
#' @param verb passed to \code{\link[httr]{VERB}}
#'
#' @return Result of \code{GET}
#' @export
#' @importFrom httr GET VERB
get_hcp_file = function(
  path_to_file = "/",
  ...,
  verbose = TRUE,
  verb = "GET") {
  args = list(...)
  bucket = args$bucket
  if (is.null(bucket)) bucket = formals(hcp_aws_url)$bucket
  sign = args$sign
  if (is.null(sign)) {
    sign = TRUE
  }
  args$bucket = NULL
  args$sign = NULL
  ret = do.call(
    s3_http_request,
    c(
      list(
        path_to_file = path_to_file,
        bucket = bucket,
        verb = verb,
        sign = sign,
        show_progress = verbose
      ),
      args
    )
  )
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
