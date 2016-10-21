#' @title Download HCP file
#' @description Downloads a file from HCP S3 Bucket
#' @param path_to_file Path to file on HCP S3 Bucket
#' @param destfile Destination filename
#' @param ... arguments to pass to \code{\link{hcp_aws_url}}
#'
#' @return Output filename that was downloaded
#' @export
#' @importFrom httr stop_for_status write_disk progress
download_hcp_file = function(path_to_file, destfile = NULL, ...) {
  if (is.null(destfile)) {
    destfile = file.path(tempdir(),
                        basename(path_to_file))
  }
  url <- hcp_aws_url(path_to_file = path_to_file, ...)
  ret <- httr::GET(url,
                  write_disk(path = destfile,
                    overwrite = TRUE),
                  progress())
  stop_for_status(ret)
  return(destfile)
}