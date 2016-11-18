library(hcp)
library(plyr)
library(dplyr)
library(readr)


# group = "HCP_900"
group = "HCP"
ids = hcp_ids(group = group)
all_csvs =  paste0(group, "/", ids, "/unprocessed/3T/", ids, "_3T.csv")
destfile = file.path("data", paste0(group, "_csvs"),
                     basename(all_csvs))
mapply(function(x, y){
  if (!file.exists(y)) {
    download_hcp_file(path_to_file = x, destfile = y, error = FALSE)
    print(y)
  }
}, all_csvs, destfile)

destfile = destfile[file.exists(destfile)]

system(paste0("grep -l xml data/", group, "_csvs/*.csv | xargs rm"))
destfile = destfile[file.exists(destfile)]
sizes = sapply(destfile, file.size)

if (any(sizes == 0)){
  bad = destfile[ sizes == 0]
  file.remove(bad)
}
destfile = destfile[file.exists(destfile)]

types = paste(rep("c", 17), collapse = "")
res = llply(destfile, read_csv,
            col_names = FALSE,
            col_types = types,
            .progress = "text")
ids = gsub("(.*)_3T.*", "\\1", basename(destfile))
res = mapply(function(df, id) {
  df$id = id
  return(df)
}, res, ids, SIMPLIFY = FALSE)
outname = paste0(tolower(group), "_scanning_info")
df =  bind_rows(res)
assign(outname, df)

cn = c("Session_Day",
       "Acquisition_Time",
       "Session",
       "Scan_Number",
       "Scan_Type",
       "Scan_Description",
       "Shim_Group",
       "BiasField_group",
       "SE_FieldMap_group",
       "GE_FieldMap_group",
       "PE_Direction",
       "Readout_Direction",
       "E_Prime_Script",
       "Scan_Order",
       "Scan_Complete",
       "Percent_Complete",
       "Percent_Pair_Complete",
       "id")
cn = tolower(cn)
colnames(df) = cn

outfile = file.path("data", paste0(outname, ".rda"))
save(list = outname,
     file = outfile,
     compression_level = 9)

