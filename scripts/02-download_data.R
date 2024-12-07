#### Preamble ####
# Purpose: Download and save data from an online source for further analysis.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - Ensure the required packages (`httr`, `here`, `utils`, `readr`) are installed.
#   - Verify you are in the correct working directory with necessary subfolders created.

#### Workspace setup ####
# Load required libraries
library(httr)
library(here)
library(utils)
library(readr)

#### Download data ####
# Define the URL for the zip file
url <- "https://jacobfilipp.com/hammer/hammer-5-csv.zip"

# Define the local file path to save the downloaded zip file
zip_file <- here("data", "01-raw_data", "raw_data.zip")

# Create the directory if it doesn't exist
dir.create(dirname(zip_file), recursive = TRUE, showWarnings = FALSE)

# Download the file
response <- GET(url, write_disk(zip_file, overwrite = TRUE))

# Check if the download was successful
if (status_code(response) == 200) {
  message("Data successfully downloaded to: ", zip_file)
  
  # Extract the zip file into the `01-raw_data` directory
  unzip_dir <- here("data", "01-raw_data")
  unzip(zip_file, exdir = unzip_dir)
  message("Data successfully extracted to: ", unzip_dir)
  
  # List the extracted files
  extracted_files <- list.files(unzip_dir, full.names = TRUE)
  message("Extracted files:")
  print(extracted_files)
  
  # Load and preview the first CSV file
  csv_files <- extracted_files[grep("\\.csv$", extracted_files)]
  if (length(csv_files) > 0) {
    for (csv_file in csv_files) {
      dataset <- read_csv(csv_file)
      message("Preview of the CSV file: ", csv_file)
      print(head(dataset))
    }
  } else {
    message("No CSV files found in the extracted folder.")
  }
  
} else {
  stop("Failed to download the data. HTTP status code: ", status_code(response))
}
