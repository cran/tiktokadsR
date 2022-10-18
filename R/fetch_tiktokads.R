#' fetch_tiktokads
#' A function to fetch TikTok Ads data from the windsor.ai API
#'
#' @param api_key Your api key to access Windsor.ai API
#' @param date_from The date from which to start getting data in format YYYY-MM-DD
#' @param date_to The date until which to start getting data in format YYYY-MM-DD
#' @param fields he fields fetched from the API for a given connector
#' See https://windsor.ai/api-fields/ for details.
#'
#' @return A data frame with the desired data
#' @export
#'
#' @examples
#' \dontrun{
#' my_tiktokads_data <- fetch_tiktokads(api_key = "your api key",
#' date_from = "2022-10-01",
#' date_to = "2022-10-02",
#' fields = c("campaign", "clicks",
#' "spend", "impressions", "date"))
#' }
fetch_tiktokads <-
  function(api_key,
           date_from = NULL,
           date_to = NULL,
           fields = c("campaign", "clicks",
                      "spend", "impressions", "date")) {
    if(is.null(date_from) | is.null(date_to)){
      if(is.null(date_from)){
        warning("date_from not defined. Extracting data for the last week as default.")
      }
      if(is.null(date_to)){
        warning("date_to not defined. Extracting data for the last week as default.")
      }
      date_to <- Sys.Date()
      date_from <- Sys.Date() - 7
    }


    json_data <- jsonlite::fromJSON(
      paste0(
        "https://connectors.windsor.ai/tiktok?api_key=",
        api_key,
        "&fields=",
        paste(fields, collapse = ","),
        "&date_from=", date_from, "&date_to=", date_to
      )
    )

    if("clicks" %in% fields){
      json_data$data$clicks <- as.numeric(json_data$data$clicks)
    }

    if("spend" %in% fields){
      json_data$data$spend <- as.numeric(json_data$data$spend)
    }

    if("impressions" %in% fields){
      json_data$data$impressions <- as.numeric(json_data$data$impressions)
    }

    if (typeof(json_data) == "list" && "data" %in% names(json_data)) {
      return(as.data.frame(json_data$data))
    }

    stop(paste("Invalid response from the API:", json_data))

  }
