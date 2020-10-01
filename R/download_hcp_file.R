#' @title Download HCP file
#' @description Downloads a file from HCP S3 Bucket
#' @param path_to_file Path to file on HCP S3 Bucket
#' @param destfile Destination filename
#' @param verbose should progress be added to downloading?
#' @param error Should the function error if the return was bad?
#' @param ... arguments to pass to \code{\link{hcp_aws_url}}
#'
#' @return Output filename that was downloaded
#' @export
#' @importFrom httr stop_for_status write_disk progress
#' @examples
#' if (have_aws_key()){
#' path_to_file <- "HCP_900/100206/MNINonLinear/100206.164k_fs_LR.wb.spec"
#' download_hcp_file(path_to_file = path_to_file)
#' }
download_hcp_file = function(path_to_file,
                             destfile = NULL,
                             verbose = TRUE,
                             error = TRUE,
                             ...) {
  if (is.null(destfile)) {
    destfile = file.path(tempdir(),
                         basename(path_to_file))
  }
  L = make_aws_call(path_to_file = path_to_file, ...)

  # url <- hcp_aws_url(path_to_file = path_to_file, ...)
  bucket = list(...)$bucket
  if (is.null(bucket)) bucket = formals(hcp_aws_url)$bucket
  query = L$query
  query$AWSAccessKeyId = NULL
  query$Expires = NULL
  query$Signature = NULL
  ret = aws.s3::s3HTTP(
    bucket = bucket,
    path = path_to_file,
    verb = "GET",
    key = L$headers$access_key,
    secret = L$headers$secret_key,
    show_progress = verbose,
    region = L$headers$default_region,
    write_disk = httr::write_disk(
      path = destfile,
      overwrite = TRUE))

  if (error) {
    httr::stop_for_status(ret)
  }
  return(destfile)
}

#' @export
#' @rdname download_hcp_file
download_fcp_file = function(
  ...) {
  download_hcp_file(...,
                    bucket = "fcp-indi",
                    sign = FALSE)
}

#' @export
#' @rdname download_hcp_file
download_openneuro_file = function(
  ...) {
  download_hcp_file(...,
                    bucket = "openneuro",
                    sign = FALSE)
}