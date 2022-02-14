require(dplyr)
require(data.table)

rename_df_timestamp_colums <- function(df){
  colnames <- names(df)
  new_colnames <- ifelse(startsWith(colnames, "X"), gsub(pattern = 'X', replacement = '', colnames ), colnames)
  names(df) <- new_colnames
  return(df)
} 


get_df_integer_columns <- function(df){
  column_types_list  <- list_df_column_types(df)
  coltypes <- names(column_types_list)
  colnames <- NULL
  
  for (index in 1:length(coltypes)){
    if(column_types_list[[index]] == "integer"){
      colnames <- c(colnames, coltypes[index]) 
    }
  }
  
  return(colnames)
}

sum_up_countries <- function(df){
  return (df %>% group_by(country_code) %>% summarise(across(where(is.integer), sum)) %>% drop_na() )
}