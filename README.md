
# tiktokadsR

<!-- badges: start -->
<!-- badges: end -->

The goal of `tiktokadsR` is to help `R` users to access google Ads data via `Windsor.ai` `API` in a convenient way from `R`.

[Windsor.ai](https://windsor.ai/) allows to get marketing data from any platform. It beautifully simplifies the complexity of dealing with multiple platforms, unlocking unified, valuable information in a format that matters to you. For more details checkout [onboard.windsor.ai](https://onboard.windsor.ai/).

## Installation

You can install the development version of tiktokadsR from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pablosanchezmart/tiktokadsR")
```

# Usage

### Registration

You need to get a free API key to access windsor.ai's APIs. Register your account first and add a datasource like TikTok ads and then get the API key. For more details check out our official API documentation and this article. Get the API key at https://onboard.windsor.ai

## Example

The package currently has only one function `fetch_tiktokadsR` which will return a `data.frame` provided that all of the arguments are supplied to it: 

- your API key, 
- date range, (startind and ending date)
- and fields you require.

Running: 

``` r
library(tiktokadsR)

my_tiktokads_data <-
  fetch_tiktokads(api_key = "your api key",
           date_from = Sys.Date()-100,
           date_to = Sys.Date(),
           fields = c("campaign", "clicks",
                      "spend", "impressions", "date")) 
```

```r

'data.frame':	14 obs. of  5 variables:
 $ campaign   : chr  "retageting APAC" "retargeting UK&CO" "retageting APAC" "retargeting UK&CO" ...
 $ clicks     : num  4 0 5 7 0 0 4 2 3 0 ...
 $ spend      : num  2.57 2.48 2.39 2.54 0.94 0.71 2.59 2.12 2.43 0.13 ...
 $ impressions: num  806 693 819 689 299 190 682 688 822 135 ...
 $ date       : chr  "2022-09-28" "2022-09-28" "2022-09-29" "2022-09-29" ...
```

Will return a `data.frame` with TikTok Ads marketing data.  

For more details see the API documentation at [https://windsor.ai//api-fields/](https://windsor.ai/api-fields/).
