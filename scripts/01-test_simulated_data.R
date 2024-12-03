```r
#### Preamble ####
# Purpose: To validate the structure and consistency of the simulated Canadian grocery dataset,
#          ensuring accurate data loading, logical constraints, and adherence to expected values.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `tidyverse` package must be installed and loaded.
#   - Ensure 00-simulate_data.R has been run to generate the dataset.
#   - Verify you are in the appropriate project directory.

#### Workspace setup ####
library(tidyverse)

# Load the simulated dataset
file_path <- "data/00-simulated_data/simulate_beef_data.csv"

if (file.exists(file_path)) {
  simulate_data <- read_csv(file_path)
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The file 'simulate_beef_data.csv' does not exist. Ensure 00-simulate_data.R has been run.")
}

#### Test data ####

# Check if the dataset has 200 rows
if (nrow(simulate_data) == 200) {
  message("Test Passed: The dataset has 200 rows.")
} else {
  stop("Test Failed: The dataset does not have 200 rows.")
}

# Check if the dataset has 11 columns
if (ncol(simulate_data) == 11) {
  message("Test Passed: The dataset has 11 columns.")
} else {
  stop("Test Failed: The dataset does not have 11 columns.")
}

# Check if all values in the 'product_id' column are unique
if (n_distinct(simulate_data$product_id) == nrow(simulate_data)) {
  message("Test Passed: All values in 'product_id' are unique.")
} else {
  stop("Test Failed: The 'product_id' column contains duplicate values.")
}

# Check if the 'vendor' column contains only valid vendor names
valid_vendors <- c("Walmart", "T&T")

if (all(simulate_data$vendor %in% valid_vendors)) {
  message("Test Passed: The 'vendor' column contains only valid vendor names.")
} else {
  stop("Test Failed: The 'vendor' column contains invalid vendor names.")
}

# Check if all product names contain "beef"
if (all(str_detect(tolower(simulate_data$product_name), "beef"))) {
  message("Test Passed: All product names contain 'beef'.")
} else {
  stop("Test Failed: Some product names do not contain 'beef'.")
}

# Check if all date columns contain valid values
if (all(simulate_data$year >= 2021 & simulate_data$year <= 2024)) {
  message("Test Passed: The 'year' column contains valid values.")
} else {
  stop("Test Failed: The 'year' column contains invalid values.")
}

if (all(simulate_data$month >= 1 & simulate_data$month <= 12)) {
  message("Test Passed: The 'month' column contains valid values.")
} else {
  stop("Test Failed: The 'month' column contains invalid values.")
}

if (all(simulate_data$day >= 1 & simulate_data$day <= 28)) {
  message("Test Passed: The 'day' column contains valid values.")
} else {
  stop("Test Failed: The 'day' column contains invalid values.")
}

# Check for missing values in the dataset
if (all(!is.na(simulate_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check that `price_per_unit` is correctly calculated
if (all(simulate_data$price_per_unit == simulate_data$current_price / simulate_data$units)) {
  message("Test Passed: The 'price_per_unit' column is correctly calculated.")
} else {
  stop("Test Failed: The 'price_per_unit' column is not correctly calculated.")
}

# Check that `current_price` and `old_price` have no negative values
if (all(simulate_data$current_price >= 0 & simulate_data$old_price >= 0)) {
  message("Test Passed: The 'current_price' and 'old_price' columns have no negative values.")
} else {
  stop("Test Failed: The 'current_price' or 'old_price' column contains negative values.")
}

# Check if the 'brand' column contains at least two unique brands
if (n_distinct(simulate_data$brand) >= 2) {
  message("Test Passed: The 'brand' column contains at least two unique brands.")
} else {
  stop("Test Failed: The 'brand' column contains less than two unique brands.")
}
```
