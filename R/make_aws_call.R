#' @title Construct AWS S3 Call
#' @description Constructs GET information string for AWS S3 Bucket
#' @param path_to_file Path to file on HCP S3 Bucket
#' @param bucket Bucket to download from
#' @param region Region of S3 Bucket
#' @param access_key Amazon S3 Access Key
#' @param secret_key Amazon S3 Secret Key
#' @param lifetime_minutes Time that connection can be opened
#' @param query additional query to add to \code{verb} command
#' @param verb httr VERB to be used
#' @param sign Should the url be signed?
#' @return Character of the url to be passed to \code{httr} `VERB`s
#' @export
#'
#' @examples
#' if (have_aws_key()){
#' path_to_file <- paste0(
#'    "HCP_900/100206/MNINonLinear/",
#'    "100206.164k_fs_LR.wb.spec")
#' result = make_aws_call(path_to_file)
#' # don't want this stuff printed because it has keys
#' result$headers$secret_key = NULL
#' result$headers$access_key = NULL
#' result$query$AWSAccessKeyId = NULL
#' result$query$Signature = NULL
#' result
#' }
#' @importFrom digest hmac
#' @importFrom base64enc base64encode
#' @importFrom utils URLencode
make_aws_call <- function(
  path_to_file = "/",
  bucket = "hcp-openaccess",
  region = "us-east-1",
  access_key = NULL,
  secret_key = NULL,
  lifetime_minutes = 5,
  query = NULL,
  verb = "GET",
  sign = TRUE) {

  L = set_aws_api_key(
    access_key = access_key,
    secret_key = secret_key,
    default_region = region,
    error = sign)

  access_key = L$access_key
  secret_key = L$secret_key

  if (!sign & is.null(access_key)) {
    access_key = ""
  }
  if (!sign & is.null(secret_key)) {
    secret_key = ""
  }
  region = L$default_region


  expiration_time <- as.integer(Sys.time() + lifetime_minutes * 60)

  # ending = paste0(bucket, "/", path_to_file)
  ending = path_to_file
  ending = sub("//$", "/", ending)
  if (length(ending) > 0) {
    if (ending == "/") {
      ending = ""
    }
  }
  # ending = sub("^/", "", ending)

  # CanonicalizedResource = ""
  canonical_string <- paste0(
    verb, "\n\n\n",
    expiration_time, "\n",
    ifelse(verb %in% c("GET", "HEAD"),
           "/", ""),
    ending)

  # run_date = format(Sys.time(), "%a %b %d %X %Y")
  # canonical_date_string <- paste0(
  #   verb, "\n\n\n",
  #   run_date, "\n",
  #   ifelse(verb %in% c("GET", "HEAD"),
  #          "/", ""),
  #   ending)

  signature <- digest::hmac(
    enc2utf8(secret_key),
    enc2utf8(canonical_string),
    algo = "sha1",
    raw = TRUE)

  # date_signature <- digest::hmac(
  #   enc2utf8(secret_key),
  #   enc2utf8(canonical_date_string),
  #   algo = "sha1",
  #   raw = TRUE)

  signature = base64enc::base64encode(signature)
  # date_signature = base64enc::base64encode(date_signature)

  signature_url_encoded <- utils::URLencode(
    signature,
    reserved = TRUE)


  q = list( "AWSAccessKeyId" = enc2utf8(access_key),
            "Expires" = expiration_time,
            "Signature" = signature_url_encoded
  )
  q = c(q, query)

  # L = list(
  #   "Authorization" = Authorization,
  #   "Date" = run_date)

  # authenticated_url <- paste0(
  #   "https://",
  #   bucket, ".",
  #   "s3.amazonaws.com"
  # )
  authenticated_url = paste0("https://",
                             bucket, ".",
                             "s3.",
                             region, ".",
                             "amazonaws.com/")
  if (!sign) {
    L$access_key = NULL
    L$secret_key = NULL
  }

  L = list(
    url = authenticated_url,
    path = ending,
    query = q,
    headers = L)
  attr(L, "canonical_string") = canonical_string
  # attr(L, "canonical_string") = canonical_string

  return(L)
}