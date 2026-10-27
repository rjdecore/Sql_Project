# Retail Sales Analysis — SQL

## Business objective
Analyze transaction-level retail data to understand revenue, customer activity, category mix, high-value transactions, monthly performance and time-of-day demand.

## Business questions → solutions

| # | Business question | Technique | Business use |
|---:|---|---|---|
| 1 | Which transactions occurred on 5 November 2022? | Date filter | Daily audit and event review |
| 2 | Which Clothing transactions sold over 10 units in November 2022? | Half-open date range + filters | Large-quantity order investigation |
| 3 | What are sales, transaction count and average transaction value by category? | Aggregation | Category and assortment review |
| 4 | What is the average age of Beauty customers? | AVG | Descriptive customer profiling |
| 5 | Which transactions exceed 1,000 in sales value? | Threshold filter | High-value transaction review |
| 6 | How do sales and units vary by gender/category? | Multi-column grouping | Compare observed segment mix without assuming causation |
| 7 | Which month has the highest total sales in each year? | CTE + DENSE_RANK | Seasonal planning based on revenue, not only average basket size |
| 8 | Who are the top five customers by spend? | Aggregation + top-N | Customer follow-up and concentration review |
| 9 | How many distinct customers buy from each category? | COUNT(DISTINCT ...) | Category reach comparison |
| 10 | Which time-of-day shift contributes the most orders and revenue? | CASE + aggregation | Staffing and operating-hours review |
| 11 | What share of revenue comes from each category? | Revenue-share calculation | Category prioritization |
| 12 | How do sales vary by weekday? | Day-of-week grouping | Staffing and campaign planning |
| 13 | How concentrated is revenue among the highest-spending 20% of customers? | NTILE(5) + window logic | Understand reliance on high-spend customers |

## Data fields
retail_sales contains transaction ID, sale date/time, customer ID, gender, age, category, quantity, unit price, COGS and total sale.

## Data quality and safety
The SQL first profiles nulls and suspicious values. It does not automatically delete records: review the result, document the business rule, back up the table and only then run the commented transaction-safe cleaning example. This avoids silently discarding potentially recoverable sales records.

## Business impact
Use revenue, transaction volume, average transaction value, customer reach and customer concentration together. Results can guide category review, shift planning and customer follow-up, but descriptive patterns do not prove that a demographic or time slot caused a sales result.

## Reproducibility and limitations
- **SQL dialect:** MySQL 8.0+.
- Create/load the source data before running analysis queries.
- The script's table-creation block drops and recreates retail_sales; do not rerun it over valuable loaded data unless the table is backed up or intentionally being rebuilt.
- The repository query file does not by itself provide executed output. State exact top categories, customers or totals only after running it on the dataset.

## Files
- [SQL analysis script](sql_query_p1.sql)
- Source CSV / dataset (if included in this folder)

## Skills demonstrated
Data profiling, safe cleaning workflow, aggregation, CASE, date/time analysis, CTEs, ranking, NTILE, revenue-share calculations and business interpretation.
