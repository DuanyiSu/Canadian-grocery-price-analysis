# Canadian Grocery Price Analysis

This repository contains all resources required to replicate Duanyi Su's analysis of grocery pricing in Canada, ensuring adherence to reproducibility and transparency standards.

## Paper Overview

This study investigates beef pricing trends in the Canadian retail market using data from [Project Hammer](https://jacobfilipp.com/hammer/). Bayesian linear regression is employed to analyze pricing differences between Walmart and T&T, focusing on historical trends and vendor strategies. Results show that Walmart maintains stable pricing, while T&T demonstrates higher variability, reflecting unique market strategies and cultural influences. These findings offer valuable insights for retailers refining pricing approaches and policymakers addressing food affordability issues.

The analysis was conducted using the statistical programming language **R** [@R], ensuring robust and reproducible results.

## File Structure

The repository is organized as follows:

-   `data/00-simulated_data`: Simulated data as a preview of the actual dataset.
-   `data/01-raw_data`: Raw data obtained from Project Hammer.
-   `data/02-analysis_data`: Cleaned and processed data for analysis.
-   `models`: Models used in the study, including Bayesian regression models.
-   `other/datasheet`: A comprehensive datasheet of the Project Hammer dataset.
-   `other/sketches`: Preliminary visualizations and model outputs.
-   `other/llm`: Detailed records of ChatGPT interactions for project assistance.
-   `paper`: Quarto file, bibliography, and the finalized research paper.
-   `scripts`: R scripts for data simulation, cleaning, modeling, visualization, and testing.

## Data Citation

The data utilized in this project is sourced from [Project Hammer](https://jacobfilipp.com/hammer/) and is properly cited in both the paper and reference list, ensuring compliance with academic standards.

## Large Language Model (LLM) Usage Statement

This project employed ChatGPT (ChatGPT-4 model) during the research, development, and writing processes. ChatGPT was used to assist in generating ideas, structuring the analysis, and refining documentation. Detailed transcripts of all interactions with ChatGPT are available in the `other/llm` folder. This ensures transparency and compliance with reproducibility requirements. If auto-complete tools like Co-pilot were used, they are mentioned within the project documentation.

---

### References
```plaintext
@R
R Core Team (2024). R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. URL: https://www.R-project.org/.

@Hammer
Jacob Filipp (2024). Project Hammer: Canadian Grocery Prices. URL: https://jacobfilipp.com/hammer/.
```

---
