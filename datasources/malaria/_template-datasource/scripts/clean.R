# Clean Script
# 
# This script contains code for cleaning and processing the raw data.
# 
# Usage:
# - Read raw data from the data/ folder
# - Perform data cleaning operations (remove NA, fix formats, etc.)
# - Create derived variables if needed
# - Save cleaned data back to the data/ folder
#
# Example:
# 
# clean_data <- function() {
#   raw_data <- read_csv(here::here("datasources/malaria/_template-datasource/data/raw_data.csv"))
#   
#   cleaned_data <- raw_data |>
#     filter(!is.na(important_variable)) |>
#     mutate(date = as.Date(date))
#   
#   write_csv(cleaned_data, here::here("datasources/malaria/_template-datasource/data/cleaned_data.csv"))
# }
