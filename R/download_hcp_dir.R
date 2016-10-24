

#' @title Download an entire directory from HCP
#' @description Downloads a directory/folder from HCP database
#' @param prefix Folder to downlaod
#' @param delimiter Delimiter for files
#' @param outdir Output directory
#' @param ... additional arguments to pass to \code{\link{hcp_list_files}}
#'
#' @return List of return from calling \code{\link{hcp_list_files}},
#' the output directory, and all destination files (not subsetted by those
#' that did in fact download)
#'
#' @export
#' @importFrom plyr m_ply
#' @examples
#' if (have_aws_key()) {
#'    prefix = "HCP/100307/release-notes"
#'    res = download_hcp_dir(prefix = prefix)
#' }
download_hcp_dir = function(
  prefix,
  delimiter = "",
  outdir = tempfile(),
  ...) {
  ret = hcp_list_files(prefix = prefix,
                       delimiter = delimiter,
                       ...)

  res = parse_list_files(ret)
  res = res$contents
  pref = ret$parsed_result$Prefix[[1]]
  res$sub_dir = sub(pref, "", res$Key, fixed = TRUE)
  res$destfile = file.path(outdir, res$sub_dir)

  sub_dirs = unique(dirname(res$sub_dir))
  sub_dirs = setdiff(sub_dirs, ".")
  sub_out_dirs = file.path(outdir, sub_dirs)

  de = dir.exists(sub_out_dirs)
  if (!all(de)) {
    sapply(sub_out_dirs[!de], dir.create, recursive = TRUE)
  }
  res$file = res$Key
  plyr::m_ply(.fun = function(file, destfile) {
    download_hcp_file(path_to_file = file,
                      destfile = destfile,
                      verbose = FALSE)
  }, .data = res[, c("file", "destfile")], .progress = "text")

  fe = file.exists(res$destfile)
  if (!all(fe)) {
    warning("Not all files were downloaded!")
  }
  L = list(outdir = outdir,
           output_files = res$destfile,
           list_ret = ret)
  return(L)

}