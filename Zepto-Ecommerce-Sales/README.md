# Zepto E-commerce Sales & Inventory Analytics — SQL

## Business objective
Analyze a quick-commerce product/SKU catalog to understand price and discount patterns, stock availability, estimated inventory value, unit price and inventory weight.

## Business questions and decision use

| Question | SQL analysis | Business use |
|---|---|---|
| Which products have the highest discounts? | Top-N discount ranking | Review promotional positioning |
| Which high-MRP products are out of stock? | Price threshold + stock status | Replenishment prioritisation |
| What is estimated inventory value by category? | Selling price × available quantity | Compare on-hand stock value |
| Which expensive products have discounts below 10%? | Price/discount filters | Pricing review |
| Which categories have the highest average discount? | Grouped AVG | Compare discount strategy |
| Which products offer lower price per gram? | Unit-price calculation | Compare value within similar products |
| How does inventory weight vary by category? | Weight × available quantity | Storage and handling planning |

## Query solutions and findings
- [SQL analysis script](Zepto_SQL_data_analysis.sql) — non-destructive queries and a normalized view.
- [SQL solutions & findings notebook](Zepto_SQL_Solutions_Findings.ipynb) — runs each question against the database, displays query results and generates data-driven findings.
- [Setup / original SQL file](Zepto.sql)
- [Case study PDF](Zepto_sol.pdf)

## Data safety and price units
The analysis script no longer deletes zero-MRP source rows or divides source prices in-place on every run. It creates a view that converts paise to rupees and excludes invalid zero/negative MRP rows from the analysis view, leaving the source table unchanged.

**Important:** the conversion assumes imported MRP and discounted price values are stored in paise, matching the original SQL comments. Confirm the actual CSV units before running; if the source already contains rupees, remove the divide-by-100 conversion to avoid scaling prices incorrectly.

## Interpretation
The estimated category inventory value is discounted selling price × available quantity. It is **potential on-hand stock value, not realized sales revenue**. Price-per-gram comparisons should be made among comparable products and pack sizes. Check stock freshness, margin and category mix before making pricing or replenishment decisions.

## Setup
- **Dialect:** MySQL 8.0+.
- Load the source table as zepto.
- Run the Zepto_SQL_data_analysis.sql script.
- Configure MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASSWORD and MYSQL_DATABASE environment variables, then run the notebook top-to-bottom.

## Skills
SQL data profiling, safe transformation, aggregation, CASE expressions, unit-price analysis, inventory analysis and business interpretation.
