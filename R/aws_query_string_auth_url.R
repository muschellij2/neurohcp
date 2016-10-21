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
#' aws_query_string_auth_url(path_to_file)
#' }
#' @importFrom digest hmac
#' @importFrom base64enc base64encode
#' @importFrom utils URLencode
aws_query_string_auth_url <- function(
  path_to_file,
  bucket = "hcp-openaccess",
  region = "us-east-1",
  access_key = NULL,
  secret_key = NULL,
  lifetime_minutes = 5) {
  L = set_aws_api_key(
    access_key = access_key,
    secret_key = secret_key,
    default_region = region)

  access_key = L$access_key
  secret_key = L$secret_key
  region = L$default_region


  expiration_time <- as.integer(Sys.time() + lifetime_minutes * 60)

  canonical_string <- paste0("GET", "\n\n\n", expiration_time, "\n/",
                             bucket, "/", path_to_file)

  signature <- digest::hmac(
    enc2utf8(access_key),
    enc2utf8(canonical_string),
    "sha1",
    raw = TRUE)

  signature_url_encoded <- utils::URLencode(
    base64enc::base64encode(signature),
    reserved = TRUE)

  authenticated_url <- paste0(
    "https://s3.amazonaws.com/",
    bucket, "/", path_to_file,
    "?AWSAccessKeyId=", enc2utf8(secret_key),
    "&Expires=", expiration_time,
    "&Signature=", signature_url_encoded)

  return(authenticated_url)
}