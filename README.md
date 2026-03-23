# Clinical Programming R Demo

A simple, portfolio-ready GitHub project that demonstrates clinical programming skills in **R** using **mock clinical trial data**.

## Purpose

This repository is designed to showcase practical skills relevant to statistical programming roles in biotech, pharma, and CRO environments, including:

- Creating a mock ADSL-style subject-level dataset
- Deriving a simple efficacy summary dataset
- Generating a baseline demographic summary table
- Producing a treatment-wise change-from-baseline summary
- Writing clean, reusable R code suitable for a GitHub portfolio

> **Note:** This project uses fully simulated data for demonstration purposes only. It does not contain any real patient data or sponsor-confidential information.

## Project Structure

```
clinical_programming_r_demo/
├── README.md
├── .gitignore
├── run_all.R
├── R/
│   ├── generate_mock_adsl.R
│   ├── generate_mock_adlb.R
│   └── create_tlf_summary.R
├── data/
│   ├── adsl_mock.csv
│   └── adlb_mock.csv
└── output/
    ├── table_01_demographics.csv
    └── table_02_change_from_baseline.csv
```

## Skills Demonstrated

- R programming
- Data derivation logic
- Subject-level and longitudinal data handling
- Table generation for mock clinical reporting
- Reproducible workflow structure

## How to Run

1. Open the project in RStudio.
2. Set the working directory to the project folder.
3. Run:

```r
source("run_all.R")
```

This will:
- generate mock datasets in the `data/` folder
- create summary tables in the `output/` folder

## Example Use Cases for Interviews

You can describe this project as:

- "A simple R-based mock clinical programming workflow that simulates ADSL and ADLB-like datasets and produces summary outputs similar to TLF-style reporting."
- "A portfolio project demonstrating my ability to structure reproducible analysis code and create deliverables using mock clinical trial data."

## Suggested GitHub Description

**R-based mock clinical programming project demonstrating dataset derivation and TLF-style summaries using simulated trial data.**

## Suggested LinkedIn / Resume Line

Created a portfolio-ready R project using simulated clinical trial data to generate ADSL/ADLB-style datasets and TLF-like summary outputs in a reproducible workflow.
