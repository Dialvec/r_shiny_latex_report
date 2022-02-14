require(tidyverse)

describe_df <- function(df){
  if(!is.data.frame(df)) stop("Given argument must me a data frame")
  writeLines(
    c(
      str_df_row_count(df),
      str_df_column_count(df),
      str_column_type_count(df)
    )
  )
}

str_df_row_count <- function(df){
  return ( paste("row count:", nrow(df), collapse = " ") )
}


str_df_column_count <- function(df){
  return ( paste("column count:", ncol(df), collapse = " ") )
}


str_column_type_count <- function(df){
  column_types_list  <- count_df_column_types(df)
  colnames  <- names(column_types_list)
  str_column_type_count <- NULL
  
  for (index in 1:length(column_types_list)){
    str_column_type_count = c(
      str_column_type_count, 
      paste(" - ", colnames[index], ": " ,column_types_list[[index]], collapse = "") 
      )
  }
  return (str_column_type_count)
}


count_df_column_types <- function(df){
  return ( table(list_df_column_types(df)) )
}


list_df_column_types <- function(df){
  return( sapply(df, class ) )
}


get_df_columns_by_type <- function(df, type){
  column_types_list  <- list_df_column_types(df)
  coltypes <- names(column_types_list)
  colnames <- NULL
  
  for (index in 1:length(coltypes)){
    if(column_types_list[[index]] == type){
      colnames <- c(colnames, coltypes[index]) 
    }
  }
  
  return(colnames)
}

print_df_columns_by_type <- function(df, type){
  writeLines(
    c(
      paste("columns of type:", type),
      get_df_columns_by_type(df, type)
    )
  )
}


df_get_empty_count_df <- function(df){
  na_count <- sapply(df, function(y) sum(length(which(is.na(y) | y == "" ))))
  na_count <- data.frame(na_count, stringsAsFactors = FALSE)
  na_count <- filter(na_count, na_count>0) 

  return(na_count)
}


print_empty_count_df <- function(df){
  print(df_get_empty_count_df(df))
}


df_get_non_empty_state_countries <- function(df){
  df_output <- df %>%
    subset(subset = Province.State != "", select = Country.Region) %>%
    unique()
  return( df_output )
}


array_get_non_empty_state_countries <- function(df){
  array_output <- df %>% 
    df_get_non_empty_state_countries() %>%
    unlist( use.names = FALSE) 
  return( array_output )
}


print_non_empty_state_countries <- function(df){
  writeLines(
    c(
      "Countries that contain States:",
      array_get_non_empty_state_countries(df)
    )
  )
}

remove_duplicated_elements_columnwise <- function(df){
  for(i in 1:ncol(df)){
    df[,i][duplicated(df[,i])] <- NA 
  }
  return(df)
}