#' @title Set Amazon AWS Key
#' @description Sets and returns the AWS keys.  This will error if not all are
#' specified.
#' @param access_key Amazon access key.  If \code{NULL} then looks at the
#' \code{AWS_ACCESS_KEY_ID} system variable.
#' @param secret_key Amazon secret key.  If \code{NULL} then looks at the
#' \code{AWS_SECRET_ACCESS_KEY} system variable.
#' @param default_region Amazon default region.  If \code{NULL} then looks at the
#' \code{AWS_DEFAULT_REGION} system variable.
#' @param error Should this function error if things are not specified?
#'
#' @return List of \code{access_key}, \code{secret_key},
#' and \code{default_region}
#' @export
set_aws_api_key = function(
  access_key = NULL,
  secret_key = NULL,
  default_region = "us-east-1",
  error = TRUE){

  if (is.null(access_key)) {
    access_key = Sys.getenv("HCP_AWS_ACCESS_KEY_ID", unset = NA)
    if (is.na(access_key)) {
      access_key = Sys.getenv("AWS_ACCESS_KEY_ID")
    }
  } else {
    Sys.setenv("AWS_ACCESS_KEY_ID" = access_key)
  }
  if (is.null(secret_key)) {
    secret_key = Sys.getenv("HCP_AWS_SECRET_ACCESS_KEY", unset = NA)
    if (is.na(secret_key)) {
      secret_key = Sys.getenv("AWS_SECRET_ACCESS_KEY")
    }
  } else {
    Sys.setenv("AWS_SECRET_ACCESS_KEY" = secret_key)
  }
  if (is.null(default_region)) {
    default_region = Sys.getenv("AWS_DEFAULT_REGION")
  } else {
    Sys.setenv("AWS_DEFAULT_REGION" = default_region)
  }
  make_null = function(x){
    if (is.null(x)) {
      return(x)
    }
    if (x == "") {
      x = NULL
    }
    return(x)
  }
  L = list(
    access_key = make_null(access_key),
    secret_key = make_null(secret_key),
    default_region = make_null(default_region)
  )
  not_null = !sapply(L, is.null)
  if (!all(not_null)) {
    miss = names(L)[!not_null]
    if (error) {
      stop(paste0(miss, collapse = " and "), " are not specified!")
    }
  }
  return(L)
}

#' @rdname set_aws_api_key
#' @export
have_aws_key = function() {
  L = set_aws_api_key(error = FALSE)
  not_null = !sapply(L, is.null)
  if (!all(not_null)) {
    return(FALSE)
  }
  return(TRUE)
}