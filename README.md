🚀 Built to demonstrate R-based clinical programming capabilities for regulatory and analysis workflows

# Clinical Programming R Demo

This project demonstrates a simplified clinical programming workflow using R, inspired by CDISC ADaM dataset structures and TLF (Tables, Listings, Figures) generation.

## 🔍 Overview
The goal of this project is to simulate key steps in clinical trial data analysis:
- Creation of subject-level dataset (ADSL)
- Creation of lab dataset (ADLB)
- Generation of summary TLF outputs

## 🧰 Tools & Technologies
- R (tidyverse)
- Clinical data simulation
- Basic statistical summaries

## 📂 Project Structure
- `generate_mock_adsl.R` → Creates mock ADSL dataset
- `generate_mock_adlb.R` → Creates mock ADLB dataset
- `create_tlf_summary.R` → Generates summary statistics
- `run_all.R` → Runs full workflow

## 🚀 How to Run
```r
source("run_all.R")
