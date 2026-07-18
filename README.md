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
- **Tableau** — interactive dashboard and visualization

## Dashboard
🔗 **[View the live interactive dashboard on Tableau Public](https://public.tableau.com/views/AmazonReturnsAnalysis/ReturnsOverviewDashboard?)

## Key Findings

**1. Discount level is the strongest predictor of returns — and it's actionable**
Orders with **31%+ discounts** show a **33–35% return rate**, compared to **24–27%** for orders discounted below 30%. This relationship is statistically significant (t-test, p < 0.0001), not just a visual pattern. Unlike category or customer demographics, discount policy is a lever the business can directly control.

**2. Clothing is the top problem category — on every measure**
Clothing has both the **highest return rate (37.4%)** and the **highest total return cost ($132,200)** — more than double the next closest category (Electronics, $62,800). It also dominates the list of individual highest-cost products.

**3. No single dominant return reason — ruling out a one-size-fits-all fix**
Return reasons (Defective, Changed Mind, Wrong Item, Size Issue) are fairly evenly split, both company-wide and *within* each category (all roughly 22–29%). This rules out simple fixes like "just improve sizing charts" — the problem is spread across causes and needs a multi-pronged response, particularly for Clothing.

**4. A small watch-list of individual products carries outsized risk**
Several specific products show near-100% return rates even at lower order volumes — worth targeted investigation (listing accuracy, defective batches, mismatched expectations) independent of category-wide trends.

**5. Tested and correctly ruled out:** Price, customer age, and return speed (days-to-return) showed **no statistically significant relationship** with return likelihood (all p > 0.05). Notably, a hypothesis that fast returns signal listing mismatches while slow returns signal quality issues did not hold up (chi-square p = 0.47) — an important negative finding that kept the analysis focused on what the data actually supports.

## Recommendations
1. **Review discount strategy above the 30% threshold** — audit whether deep-discount campaigns are worth the return costs they generate; consider tighter return windows or final-sale terms for heavily discounted items.
2. **Prioritize Clothing for root-cause review** — since no single reason dominates, effective fixes likely require a combined approach: clearer sizing guidance, better product photography/descriptions, and tighter quality control.
3. **Investigate watch-list products individually** rather than applying category-wide policy changes.
4. **Deprioritize return-speed as a triage signal** — resources are better spent on discount policy and category-level fixes, which show real statistical relationships.

## Project Structure
```
/sql        → SQL extraction & aggregation queries
/python     → data cleaning, feature engineering, statistical analysis
/tableau    → dashboard workbook (also published to Tableau Public)
README.md   → this file
```

## Status
✅ Complete — SQL exploration, Python analysis, and Tableau dashboard all finished.

## Author
Barbra Mtisi — [LinkedIn](https://www.linkedin.com/in/barbra-mtisi-89602422b/)
