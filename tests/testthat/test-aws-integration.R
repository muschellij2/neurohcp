skip_if_no_aws_key <- function() {
  if (!have_aws_key()) {
    skip("AWS credentials are not configured")
  }
}

run_live_hcp <- function(expr) {
  expr <- substitute(expr)

  tryCatch(
    eval.parent(expr),
    error = function(cnd) {
      if (inherits(cnd, "curl_error_couldnt_resolve_host")) {
        skip(paste("Live AWS endpoint is unavailable:", conditionMessage(cnd)))
      }

      stop(cnd)
    }
  )
}

live_hcp_file <- "HCP/100307/T1w/Diffusion/bvals"

test_that("live HCP requests succeed when AWS credentials are configured", {
  skip_if_no_aws_key()

  head_result <- run_live_hcp(head_hcp_file(
    path_to_file = live_hcp_file,
    verbose = FALSE
  ))
  expect_true(isTRUE(head_result))

  get_result <- run_live_hcp(get_hcp_file(
    path_to_file = live_hcp_file,
    verbose = FALSE
  ))
  expect_s3_class(get_result, "response")
  expect_identical(get_result$status_code, 200L)
})

test_that("live HCP downloads write a non-empty file when AWS credentials are configured", {
  skip_if_no_aws_key()

  destfile <- tempfile(fileext = ".bvals")
  on.exit(unlink(destfile), add = TRUE)

  out <- run_live_hcp(download_hcp_file(
    path_to_file = live_hcp_file,
    destfile = destfile,
    verbose = FALSE
  ))

  expect_identical(out, destfile)
  expect_true(file.exists(destfile))
  expect_gt(file.info(destfile)$size, 0)

  first_line <- readLines(destfile, n = 1L, warn = FALSE)
  expect_length(first_line, 1L)
  expect_true(nzchar(first_line))
})

test_that("live HCP listings include the expected diffusion files when AWS credentials are configured", {
  skip_if_no_aws_key()

  result <- run_live_hcp(hcp_list_files(
    prefix = "HCP/100307/T1w/Diffusion",
    delimiter = "bval"
  ))
  parsed <- parse_list_files(result)

  expect_false(is.null(parsed$contents))
  expect_true(any(grepl("/bvecs$", parsed$contents$Key)))
})
