#' @title Get list of HCP Ids
#' @description Returns list of IDs of folders in the HCP database
#' @param group Group of IDs to return
#'
#' @return Character vector
#' @export
#'
#' @examples
#' if (have_aws_key()) {
#' head(hcp_ids("HCP"))
#' head(hcp_ids("HCP_900"))
#' }
hcp_ids = function(group = c("HCP", "HCP_900", "HCP_1200")) {
  group = match.arg(group)

  prefix = paste0(group, "/")
  files = hcp_list_files(prefix = prefix, delimiter = "/")
  pc = parse_list_files(files)
  pc = pc$prefixes
  n = colnames(pc)
  n = n %in% "CommonPrefixes"
  pc = pc[, n]
  pc = unlist(pc)
  names(pc) = NULL
  pc = gsub(prefix, "", pc, fixed = TRUE)
  pc = sub("/$", "", pc)
  return(pc)
}

