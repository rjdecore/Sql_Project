# Retail Sales Analysis — SQL

## Business objective
Analyze transaction-level retail data to understand revenue, customer activity, category mix, high-value transactions, monthly performance, time-of-day demand and customer-sales concentration.

## Business questions → SQL solutions → business use

| # | Business question | SQL technique | Business use |
|---:|---|---|---|
| 1 | Which transactions occurred on 5 November 2022? | Date filter | Daily audit and event review |
| 2 | Which Clothing transactions sold over 10 units in November 2022? | Half-open date range + filters | Large-quantity order investigation |
| 3 | What are sales, transaction count and average transaction value by category? | Aggregation | Category and assortment review |
| 4 | What is the average age of customers purchasing Beauty? | Filtered AVG | Descriptive customer profiling |
| 5 | Which transactions exceed 1,000 in sales value? | Threshold filter | High-value transaction review |
| 6 | How do sales and units vary by gender/category? | Multi-column GROUP BY | Compare observed segment mix |
| 7 | Which month has the highest total sales in each year? | CTE + DENSE_RANK | Seasonal planning |
| 8 | Who are the top five customers by spend? | Aggregation + top-N | Customer follow-up and concentration |
| 9 | How many distinct customers buy from each category? | COUNT(DISTINCT) | Category reach comparison |
| 10 | Which time-of-day shift contributes most orders and revenue? | CASE + aggregation | Staffing and operating-hours review |
| 11 | What share of revenue comes from each category? | Revenue-share calculation | Category prioritisation |
| 12 | How do sales vary by weekday? | Date functions + grouping | Staffing and campaign planning |
| 13 | How concentrated is revenue among the highest-spending 20% of customers? | NTILE(5) + window logic | Understand dependence on high-spend customers |

## Query solutions and data-driven findings
Open [Retail Sales SQL Solutions & Findings notebook](Retail_Sales_SQL_Solutions_Findings.ipynb). It contains the 13 solved questions, displays query outputs from the connected MySQL table, and generates finding statements for category sales, peak sales months, high-value transactions, top customers, weekday/shift patterns, revenue share and customer concentration. Findings are calculated at run time from the loaded data.

## Data quality
The SQL profiles null and suspicious values before any cleanup. It does not silently delete rows. Review the flagged records, confirm the business rule, back up the table, and then apply a documented cleaning decision if required.

## Business interpretation
Use revenue, transaction volume, average transaction value, customer reach and customer concentration together. For example, a category with the highest sales may not have the highest margin; a busy shift may not have the highest average basket value. The findings are descriptive and do not prove that a demographic or time slot caused a sales result.

## Run order
1. Load the source dataset into MySQL database `sql_project_p2` and table `retail_sales`.
2. Review the table-creation block before running it: it drops and recreates `retail_sales`.
3. Run [sql_query_p1.sql](sql_query_p1.sql) for the full SQL solution set.
4. Configure MySQL environment variables and run [Retail_Sales_SQL_Solutions_Findings.ipynb](Retail_Sales_SQL_Solutions_Findings.ipynb) to generate findings from the loaded table.

**SQL dialect:** MySQL 8.0+.

## Files
- [SQL analysis script](sql_query_p1.sql)
- [SQL solutions and findings notebook](Retail_Sales_SQL_Solutions_Findings.ipynb)

## Skills demonstrated
Data profiling, safe cleaning workflow, aggregation, CASE, date/time analysis, CTEs, ranking, NTILE, revenue-share calculations and business interpretation.
