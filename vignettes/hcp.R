## ----setup, include=FALSE------------------------------------------------
library(hcp)
library(dplyr)
knitr::opts_chunk$set(echo = TRUE, cache = FALSE, comment = "")

## ---- eval = FALSE-------------------------------------------------------
#  source("http://neuroconductor.org/neurocLite.R")
#  neuro_install("hcp", release = "stable")

## ---- eval = FALSE-------------------------------------------------------
#  set_aws_api_key(access_key = "ACCESS_KEY", secret_key = "SECRET_KEY")

## ----blist_show, eval = FALSE--------------------------------------------
#  hcp::bucketlist()

