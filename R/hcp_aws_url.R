#' @title Construct AWS S3 String
#' @description Constructs url string for AWS S3 Bucket to pass in for HCP
#' downloading
#' @param path_to_file Path to file on HCP S3 Bucket
#' @param bucket Bucket to download from
#' @param region Region of S3 Bucket
#' @param access_key Amazon S3 Access Key
#' @param secret_key Amazon S3 Secret Key
#' @param lifetime_minutes Time that connection can be opened
#'
#' @return Character of the url to be passed to \code{httr} VERBs
#' @export
#'
#' @examples \dontrun{
#' path_to_file <- "HCP_900/100206/MNINonLinear/100206.164k_fs_LR.wb.spec"
#' hcp_aws_url(path_to_file)
#' }
#' @importFrom digest hmac
#' @importFrom base64enc base64encode
#' @importFrom utils URLencode
hcp_aws_url <- function(
  path_to_file = "",
  bucket = "hcp-openaccess",
  region = "us-east-1",
  access_key = NULL,
  secret_key = NULL,
  lifetime_minutes = 5,
  query = NULL) {

  L = make_aws_call(
    path_to_file = path_to_file,
    bucket = bucket,
    region = region,
    access_key = access_key,
    secret_key = secret_key,
    lifetime_minutes = lifetime_minutes,
    query = query)

  authenticated_url = L$url
  ending = L$path
  query = query

  query = paste0(names(query), "=", query )
  query = paste(query, collapse = "&")
  query = paste0("?", query)

  authenticated_url <- paste0(
    "https://s3.amazonaws.com/",
    ending,
    query)

  return(authenticated_url)
}