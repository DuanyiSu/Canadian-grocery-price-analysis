#### Preamble ####
# Purpose: To replicate and visualize graphs from the analysis of plane data using the cleaned dataset.
# Author: Duanyi Su
# Date: 3 December 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed.
  # - The cleaned dataset must be available in the specified path.
# Any other information needed? Ensure all paths and dependencies are correctly configured.

#### Workspace setup ####
# Load required libraries
library(tidyverse)

#### Load data ####
# Load the cleaned data for analysis and visualization
cleaned_data <- read_csv("data/analysis_data/analysis_data.csv")
