#### Preamble ####
# Purpose: Simulate and save a dataset of Canadian grocery store products, including vendor,
#          product details, and pricing information for analysis and testing.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `tidyverse` package must be installed.
#   - Ensure that you are in the appropriate project directory.
#   - The directory structure matches your project organization.
#   - Output files will be stored in `simulate_data.csv` and referenced `ppu_data.parquet`.

#### Workspace setup ####
library(tidyverse)
set.seed(123)

#### Simulate data ####
# Number of rows to simulate
n <- 200

# Simulation
simulated_data <- tibble(
  vendor = sample(c("Walmart", "T&T"), n, replace = TRUE),
  product_id = sample(1000:9999, n, replace = TRUE),
  product_name = sample(c("beef steak", "beef ribs", "beef brisket", "beef shank"), n, replace = TRUE),
  brand = sample(c("BrandA", "BrandB", "BrandC", "BrandD"), n, replace = TRUE),
  current_price = round(runif(n, 5, 50), 2),
  old_price = ifelse(runif(n) > 0.3, round(runif(n, 5, 50), 2), NA),
  units = sample(1:10, n, replace = TRUE),
  price_per_unit = current_price / units,
  year = sample(2021:2024, n, replace = TRUE),
  month = sample(1:12, n, replace = TRUE),
  day = sample(1:28, n, replace = TRUE)
)

# Replace NA values in old_price with current_price
simulated_data <- simulated_data %>%
  mutate(old_price = ifelse(is.na(old_price), current_price, old_price))

#### Save data ####
# Save the dataset as a CSV file
write_csv(simulated_data, "simulate_data.csv")

# Save the dataset as a parquet file (for ppu_data.parquet)
library(arrow)
write_parquet(simulated_data, "ppu_data.parquet")
