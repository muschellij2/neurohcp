#' @title Retrieve S3 Bucket List
#' @description Lists the Buckets available with the Key/Secrete
#' @param region Region of S3 Bucket
#' @param access_key Amazon S3 Access Key
#' @param secret_key Amazon S3 Secret Key
#'
#' @return List of Buckets
#' @export
#'
#' @examples \dontrun{
#' bucketlist()
#' }
#' @importFrom httr stop_for_status content
#' @importFrom xml2 as_list read_xml
bucketlist <- function(
  region = "us-east-1",
  access_key = NULL,
  secret_key = NULL) {

  ret = get_hcp_file(
    path_to_file = "",
                     bucket = "",
                     access_key = access_key,
                     secret_key = secret_key,
                     region = region)
  httr::stop_for_status(ret)
  cr = httr::content(ret, as = "text", encoding = "UTF-8")

  if (cr != "") {
    res = read_xml(cr)
    res = as_list(res)
    res = res$Buckets
    res = t(sapply(res, unlist))
    rownames(res) = NULL
    res = as.data.frame(res, stringsAsFactors = FALSE)
  } else {
    res = NULL
  }

  return(res)
}