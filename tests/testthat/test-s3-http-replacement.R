test_that("get_hcp_file forwards request options through the internal S3 helper", {
  seen = NULL
  response = structure(list(status_code = 200L), class = "response")

  result = with_mocked_bindings(
    get_hcp_file(
      path_to_file = "HCP/example/file.txt",
      bucket = "example-bucket",
      sign = FALSE,
      verbose = FALSE
    ),
    s3_http_request = function(
      path_to_file = "",
      ...,
      bucket = "hcp-openaccess",
      region = "us-east-1",
      access_key = NULL,
      secret_key = NULL,
      lifetime_minutes = 5,
      query = NULL,
      verb = "GET",
      sign = TRUE,
      show_progress = FALSE,
      request_options = list()
    ) {
      seen <<- list(
        path_to_file = path_to_file,
        bucket = bucket,
        verb = verb,
        sign = sign,
        show_progress = show_progress
      )
      response
    },
    .package = "neurohcp"
  )

  expect_identical(result, response)
  expect_identical(seen$path_to_file, "HCP/example/file.txt")
  expect_identical(seen$bucket, "example-bucket")
  expect_identical(seen$verb, "GET")
  expect_false(seen$sign)
  expect_false(seen$show_progress)
})

test_that("download_hcp_file returns the destination path and checks status", {
  seen = list(check_status = FALSE, request = NULL)
  response = structure(list(status_code = 200L), class = "response")
  destfile = tempfile(fileext = ".txt")

  result = with_mocked_bindings(
    download_hcp_file(
      path_to_file = "HCP/example/file.txt",
      destfile = destfile,
      verbose = FALSE
    ),
    s3_http_request = function(
      path_to_file = "",
      ...,
      bucket = "hcp-openaccess",
      region = "us-east-1",
      access_key = NULL,
      secret_key = NULL,
      lifetime_minutes = 5,
      query = NULL,
      verb = "GET",
      sign = TRUE,
      show_progress = FALSE,
      request_options = list()
    ) {
      seen$request <<- list(
        path_to_file = path_to_file,
        bucket = bucket,
        verb = verb,
        sign = sign,
        show_progress = show_progress,
        request_options = request_options
      )
      response
    },
    s3_check_status = function(response) {
      seen$check_status <<- TRUE
      invisible(response)
    },
    .package = "neurohcp"
  )

  expect_identical(result, destfile)
  expect_true(seen$check_status)
  expect_identical(seen$request$path_to_file, "HCP/example/file.txt")
  expect_identical(seen$request$verb, "GET")
  expect_true(seen$request$sign)
  expect_false(seen$request$show_progress)
  expect_length(seen$request$request_options, 1L)
})

test_that("hcp_list_files_once preserves parsing and list query behavior", {
  seen = NULL
  xml = paste0(
    "<ListBucketResult>",
    "<Name>hcp-openaccess</Name>",
    "<Prefix>HCP/100307/</Prefix>",
    "<Marker></Marker>",
    "<MaxKeys>1000</MaxKeys>",
    "<IsTruncated>false</IsTruncated>",
    "<Contents><Key>HCP/100307/file1.txt</Key><Size>10</Size></Contents>",
    "<CommonPrefixes><Prefix>HCP/100307/T1w/</Prefix></CommonPrefixes>",
    "</ListBucketResult>"
  )

  result = with_mocked_bindings(
    neurohcp:::hcp_list_files_once(
      prefix = "HCP/100307/",
      delimiter = "/",
      marker = "start",
      sign = FALSE,
      bucket = "example-bucket"
    ),
    s3_http_request = function(
      path_to_file = "",
      ...,
      bucket = "hcp-openaccess",
      region = "us-east-1",
      access_key = NULL,
      secret_key = NULL,
      lifetime_minutes = 5,
      query = NULL,
      verb = "GET",
      sign = TRUE,
      show_progress = FALSE,
      request_options = list()
    ) {
      seen <<- list(
        path_to_file = path_to_file,
        bucket = bucket,
        query = query,
        sign = sign,
        show_progress = show_progress,
        verb = verb
      )
      structure(list(status_code = 200L), class = "response")
    },
    s3_check_status = function(response) invisible(response),
    s3_response_text = function(response) xml,
    .package = "neurohcp"
  )

  parsed = parse_list_files(result)

  expect_identical(seen$path_to_file, "")
  expect_identical(seen$bucket, "example-bucket")
  expect_identical(seen$verb, "GET")
  expect_false(seen$sign)
  expect_false(seen$show_progress)
  expect_identical(seen$query$delimiter, "/")
  expect_identical(seen$query$prefix, "HCP/100307/")
  expect_identical(seen$query$marker, "start")
  expect_identical(parsed$contents$Key, "HCP/100307/file1.txt")
  expect_identical(parsed$prefixes$CommonPrefixes, "HCP/100307/T1w/")
})

test_that("hcp_list_files appends paginated responses without changing parsed output", {
  page1 = list(
    get_result = "first",
    content = "xml1",
    parsed_result = neurohcp:::s3_parse_xml_text(paste0(
      "<ListBucketResult>",
      "<IsTruncated>true</IsTruncated>",
      "<Contents><Key>HCP/file1.txt</Key><Size>1</Size></Contents>",
      "</ListBucketResult>"
    ))
  )
  page2 = list(
    get_result = "second",
    content = "xml2",
    parsed_result = neurohcp:::s3_parse_xml_text(paste0(
      "<ListBucketResult>",
      "<IsTruncated>false</IsTruncated>",
      "<Contents><Key>HCP/file2.txt</Key><Size>2</Size></Contents>",
      "</ListBucketResult>"
    ))
  )
  calls = 0L

  result = with_mocked_bindings(
    hcp_list_files(prefix = "HCP"),
    hcp_list_files_once = function(
      prefix = "",
      delimiter = NULL,
      query = NULL,
      marker = NULL,
      ...,
      sign = TRUE
    ) {
      calls <<- calls + 1L
      if (calls == 1L) {
        return(page1)
      }
      expect_identical(marker, "HCP/file1.txt")
      page2
    },
    .package = "neurohcp"
  )

  parsed = parse_list_files(result)

  expect_identical(calls, 2L)
  expect_identical(result$get_result, c("first", "second"))
  expect_identical(parsed$contents$Key, c("HCP/file1.txt", "HCP/file2.txt"))
})

test_that("bucketlist still returns the same data.frame structure from AWS XML", {
  xml = paste0(
    "<ListAllMyBucketsResult>",
    "<Buckets>",
    "<Bucket><Name>bucket-one</Name><CreationDate>2024-01-01T00:00:00.000Z</CreationDate></Bucket>",
    "<Bucket><Name>bucket-two</Name><CreationDate>2024-01-02T00:00:00.000Z</CreationDate></Bucket>",
    "</Buckets>",
    "</ListAllMyBucketsResult>"
  )

  result = with_mocked_bindings(
    bucketlist(),
    s3_service_http_request = function(
      region = "us-east-1",
      access_key = NULL,
      secret_key = NULL,
      lifetime_minutes = 5,
      query = NULL,
      verb = "GET",
      show_progress = FALSE,
      request_options = list()
    ) {
      structure(list(status_code = 200L), class = "response")
    },
    s3_check_status = function(response) invisible(response),
    s3_response_text = function(response) xml,
    .package = "neurohcp"
  )

  expect_s3_class(result, "data.frame")
  expect_identical(result$Name, c("bucket-one", "bucket-two"))
  expect_identical(
    result$CreationDate,
    c("2024-01-01T00:00:00.000Z", "2024-01-02T00:00:00.000Z")
  )
})

test_that("s3_service_http_request signs requests by default", {
  seen = list(headers = NULL)

  with_mocked_bindings(
    neurohcp:::s3_service_http_request(),
    set_aws_api_key = function(...) {
      list(
        access_key = "AKIA_TEST",
        secret_key = "SECRET_TEST",
        default_region = "us-east-1"
      )
    },
    s3_auth_headers = function(...) list(Authorization = "test"),
    s3_perform_request = function(verb, url, query, headers, show_progress, request_options) {
      seen$headers <<- headers
      structure(list(status_code = 200L), class = "response")
    },
    .package = "neurohcp"
  )

  expect_identical(seen$headers$Authorization, "test")
})

test_that("s3_service_http_request can make unsigned requests", {
  seen = list(headers = NULL)

  with_mocked_bindings(
    neurohcp:::s3_service_http_request(sign = FALSE),
    set_aws_api_key = function(...) {
      list(
        access_key = NULL,
        secret_key = NULL,
        default_region = "us-east-1"
      )
    },
    s3_auth_headers = function(...) {
      stop("should not sign unsigned requests")
    },
    s3_perform_request = function(verb, url, query, headers, show_progress, request_options) {
      seen$headers <<- headers
      structure(list(status_code = 200L), class = "response")
    },
    .package = "neurohcp"
  )

  expect_identical(seen$headers, list())
})

test_that("s3_service_http_request can target public bucket listings", {
  seen = list(url = NULL, headers = NULL, query = NULL)

  with_mocked_bindings(
    neurohcp:::s3_service_http_request(
      bucket = "fcp-indi",
      query = list(prefix = "data/Projects/", delimiter = "/"),
      sign = FALSE
    ),
    set_aws_api_key = function(...) {
      list(
        access_key = NULL,
        secret_key = NULL,
        default_region = "us-east-1"
      )
    },
    s3_perform_request = function(verb, url, query, headers, show_progress, request_options) {
      seen$url <<- url
      seen$query <<- query
      seen$headers <<- headers
      structure(list(status_code = 200L), class = "response")
    },
    .package = "neurohcp"
  )

  expect_identical(seen$url, "https://fcp-indi.s3.amazonaws.com/")
  expect_identical(seen$query$prefix, "data/Projects/")
  expect_identical(seen$query$delimiter, "/")
  expect_identical(seen$headers, list())
})

test_that("s3_http_request signs authenticated requests with SigV4 headers", {
  seen = list(headers = NULL, url = NULL, query = NULL)
  response = structure(list(status_code = 200L), class = "response")

  result = with_mocked_bindings(
    neurohcp:::s3_http_request(
      path_to_file = "HCP/example/file.txt",
      bucket = "example-bucket",
      access_key = "AKIA_TEST",
      secret_key = "SECRET_TEST",
      query = list(prefix = "HCP/example"),
      show_progress = FALSE
    ),
    s3_auth_headers = function(url, verb, region, query, key, secret) {
      expect_identical(verb, "GET")
      expect_identical(region, "us-east-1")
      expect_identical(key, "AKIA_TEST")
      expect_identical(secret, "SECRET_TEST")
      list(
        `x-amz-date` = "20260710T150000Z",
        `x-amz-content-sha256` = "body-hash",
        Authorization = "AWS4-HMAC-SHA256 SignedHeaders=host;x-amz-date, Signature=test"
      )
    },
    s3_perform_request = function(verb, url, query, headers, show_progress, request_options) {
      seen$url <<- url
      seen$query <<- query
      seen$headers <<- headers
      response
    },
    .package = "neurohcp"
  )

  expect_identical(result, response)
  expect_identical(
    seen$url,
    "https://s3.amazonaws.com/example-bucket/HCP/example/file.txt"
  )
  expect_identical(seen$query$prefix, "HCP/example")
  expect_identical(seen$headers$`x-amz-content-sha256`, "body-hash")
  expect_match(seen$headers$Authorization, "^AWS4-HMAC-SHA256")
})

test_that("s3_perform_request preserves aws.s3 HEAD semantics", {
  result = with_mocked_bindings(
    neurohcp:::s3_perform_request(
      verb = "HEAD",
      url = "https://example-bucket.s3.us-east-1.amazonaws.com/test.txt",
      headers = list()
    ),
    HEAD = function(url, config, query = NULL, ...) {
      structure(
        list(status_code = 200L, headers = list(etag = "abc123")),
        class = "response"
      )
    },
    http_status = function(response) {
      list(category = "Success", message = "OK")
    },
    headers = function(response) response$headers,
    .package = "httr"
  )

  expect_true(isTRUE(result))
  expect_identical(attr(result, "etag"), "abc123")
})
