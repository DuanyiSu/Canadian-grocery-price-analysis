```r
#### Preamble ####
# Purpose: To build and save a Bayesian regression model that predicts the flying time of planes based on length and width using the `rstanarm` package with specified priors and a Gaussian family.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `rstanarm` and `tidyverse` packages must be installed.
  # - The cleaned data file must be available in the specified path.
  # - An organized project structure must be in place with a "models" directory.
# Any other information needed? Make sure all dependencies are installed and paths are correct.

#### Workspace setup ####
# Load required libraries
library(tidyverse)
library(rstanarm)

#### Read data ####
# Load the analysis dataset
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

#### Model data ####
# Build the Bayesian regression model
first_model <-
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
# Save the model to the models directory
saveRDS(
  first_model,
  file = "models/first_model.rds"
)
``` 
