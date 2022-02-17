install.packages("tidyverse")
install.packages("countrycode")
install.packages("rworldmap")

library("tidyverse")
library("countrycode")
library("rworldmap")

get_country_code_from_name <- function(country_name){
  countrycode(sourcevar=country_name, origin = "country.name", destination = "iso3c")
}

add_country_code_to_df <- function(df){
  df <- df %>%
    mutate(country_code = countrycode(sourcevar=df$Country.Region, origin = "country.name", destination = "iso3c"))
  
  return(df)
}

drop_countries_no_isocode <- function(df){
  return(subset(df, !is.na(country_code)))
}

world_plot <- function(df, var_to_plot){
  df_plot <- data.frame(
    country_code = df$country_code,
    value = select(df, var_to_plot) %>% unlist(use.names = FALSE)
  )
  
  #Merge to map data
  mergerd_map <- joinCountryData2Map(df_plot, joinCode = "ISO3", nameJoinColumn = "country_code")
  
  mapCountryData(mergerd_map, nameColumnToPlot = "value", 
                 catMethod = "pretty", #seq(0, max(df_plot$value), by=10000),
                 mapTitle = "Positive Covid-19 cases by 2.10.22",
                 missingCountryCol = gray(.8), 
                 )
}
