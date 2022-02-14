URL_POSITIVE_CASES  <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"

URL_DECEASES_CASES  <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/1dd60c4dfe9e89429f1c185a5ecc20d36c5e2461/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

URL_RECOVERED_CASES <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/1dd60c4dfe9e89429f1c185a5ecc20d36c5e2461/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"

get_positive_cases_df <- function(){
  return(read.csv(url(URL_POSITIVE_CASES)))
}


get_deceases_cases_df <- function(){
  return(read.csv(url(URL_DECEASES_CASES)))
}


get_recovered_cases_df <- function(){
  return(read.csv(url(URL_RECOVERED_CASES)))
}