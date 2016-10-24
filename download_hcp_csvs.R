ids = hcp_ids("HCP")
all_csvs =  paste0("HCP/", ids, "/unprocessed/3T/", ids, "_3T.csv")
destfile = file.path("data/hcp_csvs/",
                     basename(all_csvs))
mapply(function(x, y){
  if (!file.exists(y)) {
    download_hcp_file(path_to_file = x, destfile = y, error = FALSE)
    print(y)
  }
}, all_csvs, destfile)

# grep -l xml * | xargs rm