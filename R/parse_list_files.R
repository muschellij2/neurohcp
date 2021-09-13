#' @title Parse listed files from HCP bucket
#' @description This parses the result from \code{\link{hcp_list_files}} and
#' organizes the files into \code{data.frame}s
#' @param ret object with element \code{parsed_result}, usually from
#' \code{\link{hcp_list_files}}
#'
#' @return List of 2 data.frames, the contents and the
#' \code{commonprefixes}
#' elements from the list
#' @export
#'
#' @examples
#' if (have_aws_key()){
#'    ret = hcp_list_files(prefix = "HCP/100307/unprocessed/3T/Diffusion")
#'    parsed = parse_list_files(ret)
#'    stopifnot(!is.null(parsed$contents))
#'  }
parse_list_files = function(ret) {
  res = ret$parsed_result
  nres = names(res)
  if (sum(nres %in% "ListBucketResult") > 1) {
    res = res[nres %in% "ListBucketResult"]
    result = vector(mode = 'list', length = length(res))
    for (i in seq_along(res)) {
      result[[i]]  = parse_list_files(list(parsed_result = res[[i]]))
    }
    rr = list()
    rr$contents = do.call(rbind, lapply(result, `[[`, "contents"))
    rr$prefixes = do.call(rbind, lapply(result, `[[`, "prefixes"))
    return(rr)
  }
  if ("ListBucketResult" %in% nres) {
    res = res$ListBucketResult
    nres = names(res)
  }

  xml_to_df = function(x) {
    df = t(sapply(x, unlist))
    rownames(df) = NULL
    df = as.data.frame(df, stringsAsFactors = FALSE)
    return(df)
  }

  contents = nres %in% "Contents"
  if (any(contents)) {
    contents = res[ contents ]
    contents = xml_to_df(contents)
  } else {
    contents = NULL
  }
  prefs = nres %in% "CommonPrefixes"
  if (any(prefs)) {
    prefs = res[ prefs ]
    prefs = lapply(prefs, function(x) x$Prefix)
    prefs = xml_to_df(prefs)
  } else {
    prefs = NULL
  }
  L = list(contents = contents,
           prefixes = prefs)
  return(L)
}
