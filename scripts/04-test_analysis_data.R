```r
#### Preamble ####
# Purpose: To validate the integrity of the cleaned beef dataset by performing tests for data loading, logical consistency, adherence to constraints, and correct calculations.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - Ensure the `tidyverse`, `testthat`, and `here` packages are installed.
#   - Ensure the cleaned dataset is available at the specified path.

#### Workspace setup ####
library(tidyverse)
library(testthat)
library(here)

# Define file path
file_path <- here("data", "02-analysis_data", "beef_data.parquet")

# Check if file exists before running tests
if (!file.exists(file_path)) {
  stop("The file 'beef_data.parquet' does not exist. Ensure the dataset is available.")
}

#### Load data ####
beef_data <- arrow::read_parquet(file_path)

#### Test data ####
# Test that the dataset is successfully loaded
test_that("Dataset loading", {
  expect_true(exists("beef_data"), label = "The dataset should be successfully loaded.")
})

# Test that there are no missing values in the dataset
test_that("No missing values", {
  expect_true(all(!is.na(beef_data)), label = "The dataset should not contain any missing values.")
})

# Test that there are no negative values in the price columns
test_that("No negative values in price columns", {
  expect_false(any(beef_data$current_price < 0), label = "current_price should not contain negative values.")
  expect_false(any(beef_data$old_price < 0), label = "old_price should not contain negative values.")
})

# Test that the `vendor` column contains only allowed values
test_that("Vendor column allowed values", {
  allowed_vendors <- c("Walmart", "TandT")
  expect_true(all(beef_data$vendor %in% allowed_vendors), label = "Vendor column should contain only allowed values.")
})

# Test that the `product_name` column contains "beef"
test_that("Product name contains 'beef'", {
  expect_true(all(str_detect(tolower(beef_data$product_name), "beef")), label = "All product names should contain 'beef'.")
})

# Test that the `year`, `month`, and `day` columns contain valid values
test_that("Date columns validation", {
  expect_true(all(beef_data$year >= 2021 & beef_data$year <= 2024), label = "Year column should contain values between 2021 and 2024.")
  expect_true(all(beef_data$month >= 1 & beef_data$month <= 12), label = "Month column should contain values between 1 and 12.")
  expect_true(all(beef_data$day >= 1 & beef_data$day <= 31), label = "Day column should contain values between 1 and 31.")
})

# Test that the `price_per_unit` column is correctly calculated
test_that("Price per unit calculation", {
  expect_equal(beef_data$price_per_unit, beef_data$current_price / beef_data$units, 
               label = "price_per_unit should be correctly calculated as current_price divided by units.")
})

# Test that the `old_price` is greater than or equal to `current_price`
test_that("Old price >= Current price", {
  expect_true(all(beef_data$old_price >= beef_data$current_price), 
              label = "old_price should be greater than or equal to current_price.")
})

# Test that the `vendor`, `product_name`, and `price_per_unit` columns have unique values
test_that("Unique values in key columns", {
  unique_vendors <- unique(beef_data$vendor)
  expect_true(length(unique_vendors) > 0, label = "Vendor column should have unique values.")
  
  unique_products <- unique(beef_data$product_name)
  expect_true(length(unique_products) > 0, label = "Product name column should have unique values.")
  
  expect_true(all(beef_data$price_per_unit >= 0), label = "price_per_unit should not contain negative values.")
})
```
