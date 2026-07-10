s3_sha256 <- function(x, file = FALSE) {
  tolower(digest::digest(x, algo = "sha256", serialize = FALSE, file = file))
}

s3_canonical_request <- function(
  verb,
  canonical_uri,
  query_args = list(),
  canonical_headers,
  request_body = "",
  signed_body = FALSE
) {
  if (is.character(request_body) && length(request_body) == 1 && file.exists(request_body)) {
    body_hash = s3_sha256(request_body, file = TRUE)
  } else {
    body_hash = s3_sha256(request_body)
  }

  if (isTRUE(signed_body)) {
    canonical_headers[["x-amz-content-sha256"]] = body_hash
  }

  names(canonical_headers) = tolower(names(canonical_headers))
  canonical_headers = canonical_headers[order(names(canonical_headers))]
  trimmed_headers = gsub("[[:space:]]{2,}", " ", trimws(unlist(canonical_headers)))
  header_string = paste0(names(canonical_headers), ":", trimmed_headers, "\n", collapse = "")
  signed_headers = paste(names(canonical_headers), collapse = ";")

  if (length(query_args)) {
    query_args = unlist(query_args[order(names(query_args))])
    encoded = paste0(
      vapply(names(query_args), utils::URLencode, reserved = TRUE, FUN.VALUE = character(1)),
      "=",
      vapply(as.character(query_args), utils::URLencode, reserved = TRUE, FUN.VALUE = character(1))
    )
    query_string = paste(encoded, collapse = "&")
  } else {
    query_string = ""
  }

  canonical = paste(
    verb,
    canonical_uri,
    query_string,
    header_string,
    signed_headers,
    body_hash,
    sep = "\n"
  )

  list(
    headers = signed_headers,
    body = body_hash,
    canonical = canonical,
    hash = s3_sha256(canonical)
  )
}

s3_string_to_sign <- function(datetime, region, service, request_hash, algorithm = "AWS4-HMAC-SHA256") {
  paste(
    algorithm,
    datetime,
    paste(substring(datetime, 1, 8), region, service, "aws4_request", sep = "/"),
    request_hash,
    sep = "\n"
  )
}

s3_v4_signature <- function(secret, date, region, service, string_to_sign) {
  k_date = digest::hmac(paste0("AWS4", secret), date, "sha256", raw = TRUE)
  k_region = digest::hmac(k_date, region, "sha256", raw = TRUE)
  k_service = digest::hmac(k_region, service, "sha256", raw = TRUE)
  k_signing = digest::hmac(k_service, "aws4_request", "sha256", raw = TRUE)
  digest::hmac(k_signing, string_to_sign, "sha256")
}

s3_base_url <- function(region) {
  if (is.null(region) || identical(region, "") || identical(region, "us-east-1")) {
    return("https://s3.amazonaws.com")
  }
  paste0("https://s3-", region, ".amazonaws.com")
}

s3_public_bucket_url <- function(bucket, region) {
  if (is.null(region) || identical(region, "") || identical(region, "us-east-1")) {
    return(paste0("https://", bucket, ".s3.amazonaws.com/"))
  }
  paste0("https://", bucket, ".s3-", region, ".amazonaws.com/")
}

s3_build_url <- function(bucket, path_to_file, region) {
  path_to_file = sub("^/+", "", path_to_file)
  path_parts = c(bucket, strsplit(path_to_file, "/", fixed = TRUE)[[1]])
  path_parts = path_parts[nzchar(path_parts)]
  encoded_path = paste(vapply(path_parts, utils::URLencode, reserved = TRUE, FUN.VALUE = character(1)), collapse = "/")
  paste0(s3_base_url(region), "/", encoded_path)
}

s3_auth_headers <- function(url, verb, region, query, key, secret) {
  timestamp = format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC")
  parsed_url = httr::parse_url(url)
  action = if (identical(parsed_url$path, "")) "/" else paste0("/", parsed_url$path)
  host = parsed_url$hostname
  if (!is.null(parsed_url$port) && nzchar(parsed_url$port)) {
    host = paste(host, parsed_url$port, sep = ":")
  }

  canonical_headers = list(
    host = host,
    `x-amz-date` = timestamp
  )
  request = s3_canonical_request(
    verb = verb,
    canonical_uri = action,
    query_args = query,
    canonical_headers = canonical_headers,
    request_body = ""
  )
  string_to_sign = s3_string_to_sign(
    datetime = timestamp,
    region = region,
    service = "s3",
    request_hash = request$hash
  )
  credential = paste(key, substring(timestamp, 1, 8), region, "s3", "aws4_request", sep = "/")
  signature = s3_v4_signature(
    secret = secret,
    date = substring(timestamp, 1, 8),
    region = region,
    service = "s3",
    string_to_sign = string_to_sign
  )
  signature_header = paste0(
    "AWS4-HMAC-SHA256 ",
    paste(
      c(
      paste0("Credential=", credential),
      paste0("SignedHeaders=", request$headers),
      paste0("Signature=", signature)
      ),
      collapse = ", "
    )
  )

  list(
    `x-amz-date` = timestamp,
    `x-amz-content-sha256` = request$body,
    Authorization = signature_header
  )
}

s3_perform_request <- function(
  verb,
  url,
  query = NULL,
  headers = list(),
  show_progress = FALSE,
  request_options = list()
) {
  header_option = do.call(httr::add_headers, headers)
  args = c(list(url = url, header_option, query = query), request_options)

  if (isTRUE(show_progress)) {
    progress_type = if (identical(verb, "GET")) "down" else "up"
    args = c(args, list(httr::progress(type = progress_type)))
  }

  if (identical(verb, "GET")) {
    return(do.call(httr::GET, args = args))
  }
  if (identical(verb, "HEAD")) {
    response = do.call(httr::HEAD, args = args)
    status = httr::http_status(response)
    out = identical(tolower(status$category), "success")
    attributes(out) = c(attributes(out), httr::headers(response))
    return(out)
  }

  do.call(httr::VERB, args = c(list(verb = verb), args))
}

s3_http_request <- function(
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
  L = set_aws_api_key(
    access_key = access_key,
    secret_key = secret_key,
    default_region = region,
    error = sign
  )

  url = s3_build_url(bucket = bucket, path_to_file = path_to_file, region = L$default_region)
  headers = list()
  if (isTRUE(sign)) {
    headers = s3_auth_headers(
      url = url,
      verb = verb,
      region = L$default_region,
      query = query,
      key = L$access_key,
      secret = L$secret_key
    )
  }

  s3_perform_request(
    verb = verb,
    url = url,
    query = query,
    headers = headers,
    show_progress = show_progress,
    request_options = request_options
  )
}

s3_service_http_request <- function(
  bucket = NULL,
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
  L = set_aws_api_key(
    access_key = access_key,
    secret_key = secret_key,
    default_region = region,
    error = sign
  )

  url = if (is.null(bucket)) {
    paste0(s3_base_url(L$default_region), "/")
  } else if (isTRUE(sign)) {
    s3_build_url(bucket = bucket, path_to_file = "", region = L$default_region)
  } else {
    s3_public_bucket_url(bucket = bucket, region = L$default_region)
  }
  headers = list()
  if (isTRUE(sign)) {
    headers = s3_auth_headers(
      url = url,
      verb = verb,
      region = L$default_region,
      query = query,
      key = L$access_key,
      secret = L$secret_key
    )
  }

  s3_perform_request(
    verb = verb,
    url = url,
    query = query,
    headers = headers,
    show_progress = show_progress,
    request_options = request_options
  )
}

s3_response_text <- function(response) {
  httr::content(response, as = "text", encoding = "UTF-8")
}

s3_check_status <- function(response) {
  httr::stop_for_status(response)
}

s3_parse_xml_text <- function(text) {
  if (identical(text, "")) {
    return(NULL)
  }
  xml2::as_list(xml2::read_xml(text))
}

parse_bucket_list_response <- function(response) {
  s3_check_status(response)
  cr = s3_response_text(response)
  if (identical(cr, "")) {
    return(NULL)
  }

  res = xml2::as_list(xml2::read_xml(cr))
  if ("ListAllMyBucketsResult" %in% names(res)) {
    res = res$ListAllMyBucketsResult
  }
  buckets = res$Buckets
  if (is.null(buckets)) {
    return(NULL)
  }
  buckets = t(sapply(buckets, unlist))
  rownames(buckets) = NULL
  as.data.frame(buckets, stringsAsFactors = FALSE)
}
