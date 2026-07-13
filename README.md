# Reducing Product Returns Through Data Analytics
### An Amazon-style E-Commerce Case Study

## The Problem
E-commerce return rates typically run 5–30% depending on category, and returns quietly erode profitability well beyond the lost sale — through processing fees, wasted advertising spend, and even reduced product visibility. Most companies react to returns individually instead of spotting the patterns that would let them fix root causes.

## The Question
**Which products and return reasons drive the greatest return-related costs, and what data-backed changes would most reduce them?**

## Dataset
5,000 e-commerce orders (2022–2025) across 5 product categories, including order details, return status/reason, days-to-return, and cost data.
Source: [Kaggle — Synthetic E-Commerce Returns Management Dataset](https://www.kaggle.com/datasets/sowmihari/returns-management)

## Tools Used
- **SQL** (SQLite) — data extraction, aggregation, return-rate calculations
- **Python** (pandas, scipy) — data cleaning, feature engineering, statistical testing
- **Tableau** — dashboards and visualization

## Key Findings So Far
- **Overall return rate: 29%** (1,450 of 5,000 orders)
- **Clothing is the top offender** — highest return rate (37.4%) *and* highest total return cost ($132,200), more than double the next category
- Return reasons are fairly evenly split company-wide (Defective 26%, Changed Mind 26%, Wrong Item 24%, Size Issue 24%) — no single dominant cause
- **Tested and ruled out:** a hypothesis that fast returns signal listing/expectation mismatches while slow returns signal quality issues — statistically no relationship in this data (chi-square p = 0.47)

*(This section will be updated as the analysis progresses through Python and Tableau.)*

## Project Structure
```
/sql        → SQL extraction & aggregation queries
/python     → data cleaning, feature engineering, analysis notebook
/tableau    → dashboards and workbook
README.md   → this file
```

## Status
In progress 

## Author
Barbra Mtisi — [LinkedIn](https://www.linkedin.com/in/barbra-mtisi-89602422b/)
