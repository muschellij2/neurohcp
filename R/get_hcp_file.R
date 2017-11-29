#' @title Get HCP file
#' @description Wraps a \code{\link{make_aws_call}} to a \code{GET}
#' statement to get the file
#' @param ... arguments to pass to \code{\link{make_aws_call}}
#' @param verbose Should the URL be printed?
#' @param verb passed to \code{\link{VERB}}
#'
#' @return Result of \code{GET}
#' @export
#' @importFrom httr GET VERB
get_hcp_file = function(...,
                        verbose = TRUE,
                        verb = "GET") {
  url = hcp_aws_url(..., verb = verb)

  if (verbose) {
    message(paste0("URL sent to ", verb, "\n", url))
  }
  args = list(verb = verb,
              url = url
              )
  # xy= httr::VERB(verb = verb, url = url)
  xy = do.call("VERB", args)
  if (verbose) {
    # message("Output of GET\n")
    # message(xy)
  }
  return(xy)
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

