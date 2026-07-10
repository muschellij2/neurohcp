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
#' \dontrun{
#' if (have_aws_key()){
#' path_to_file <- "HCP_900/100206/MNINonLinear/100206.164k_fs_LR.wb.spec"
#' download_hcp_file(path_to_file = path_to_file)
#' }
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
        verb = "GET",
        sign = sign,
        show_progress = verbose,
        request_options = list(httr::write_disk(
          path = destfile,
          overwrite = TRUE
        ))
      ),
      args
    )
  )

  if (error) {
    s3_check_status(ret)
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
