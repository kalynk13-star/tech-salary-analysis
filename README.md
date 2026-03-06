# US Tech Salary Compensation Analysis (2020-2024)

## Overview
Analysis of compensation trends across US data roles exploring the impact of job title, experience level, company size, and remote work on average salaries.

## Live Dashboard
https://lookerstudio.google.com/reporting/a489db7f-bfcf-4574-87ce-c017e09ab987

## Business Question
- Which data roles command the highest compensation in the US?
- How does experience level impact salary progression?
- Do company size and remote ratio influence compensation?

## Key Findings
- Heads of Data command the highest average salaries in the US with an average salary over $220K
- Top data role average salaries range from $110K at entry-level to over $220K at executive in the US
- Company size and remote ratio influence average salaries with large, in-office roles commanding the highest salaries at over $170K
- Though both large and mid-size companies pay a premium for in-office work, large companies lead with an 8% premium compared to 4% at mid-size companies

## Methodology Decisions
- Filtered to US based, full time employees
- Minimum 10 records per group required for inclusion
- Small companies and hybrid remote excluded due to insufficient sample size
- Average salary used throughout; median would reduce outlier sensitivity in future iterations

## Tools
BigQuery SQL, Looker Studio

## Data Sources
Global Tech Salaries dataset via Kaggle
