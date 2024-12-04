#### Preamble ####
# Purpose: Build and save a Bayesian regression model predicting the flying time of planes based on length and width using the `rstanarm` package with specified priors and a Gaussian family.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `rstanarm` and `tidyverse` packages must be installed.
#   - The cleaned data file must be available in the specified path.
#   - An organized project structure must be in place with a "models" directory.

#### Workspace setup ####
# Load required libraries
library(tidyverse)
library(rstanarm)
library(here)

#### Read data ####
# Define the path to the analysis dataset
data_path <- here("data", "analysis_data", "analysis_data.csv")

# Load the analysis dataset
if (!file.exists(data_path)) {
  stop("The file 'analysis_data.csv' does not exist. Please ensure the data file is available.")
}
analysis_data <- read_csv(data_path)

#### Model data ####
# Build the Bayesian regression model
plane_model <-
  stan_glm(
    formula = flying_time ~ length + width,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

#### Save model ####
# Define the path to save the model
model_path <- here("models", "plane_model.rds")

# Save the model to the models directory
dir.create(dirname(model_path), recursive = TRUE, showWarnings = FALSE)
saveRDS(
  plane_model,
  file = model_path
)
