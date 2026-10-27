# Data Mart Sales & Performance Analysis — SQL

## Business objective
Analyze weekly sales before and after the June 2020 sustainability initiative, comparing region, platform, customer type, age band and demographic. The analysis is descriptive and helps identify where performance changed; it does not by itself prove the initiative caused a change.

## Business questions, solutions and decision use

| Question | SQL approach | Business use |
|---|---|---|
| Which week numbers are missing? | Recursive CTE + NOT EXISTS | Find reporting-coverage gaps |
| How do transaction totals vary by year? | Annual aggregation | Compare transaction-volume changes |
| What are sales by year, month and region? | Year + month + region grouping | Compare regional performance without mixing years |
| How do Retail and Shopify compare? | Monthly platform share | Review channel mix |
| Which demographics contribute to sales? | Annual sales share + window function | Describe segment mix |
| Which groups lead Retail sales? | Segment aggregation and revenue share | Focus segment review |
| How does regional sales change year over year? | LAG() and percentage change | Prioritize regions for investigation |
| Which customer types have the highest transaction value? | Weighted sales / transaction ratio | Compare transaction economics |

## Findings workflow
The companion [Data Mart SQL Solutions & Findings notebook](Data_Mart_SQL_Solutions_Findings.ipynb) runs each solution against MySQL and generates findings from the returned data, including missing weeks, platform mix, demographic contribution, regional YoY movement and weighted transaction value. This keeps numeric findings tied to the dataset instead of hard-coding example totals.

## Source schema
The source table is `weekly_sales`.

| Column | Meaning |
|---|---|
| week_date | Weekly sales date |
| region | Sales region |
| platform | Retail or Shopify |
| segment | Customer segment code |
| customer_type | Customer classification |
| transactions | Transaction count |
| sales | Sales value |

## Data preparation
`data_mart_solution.sql` creates `clean_weekly_sales` and derives calendar fields, maps segment codes, replaces missing/literal-null segment values with `Unknown`, and calculates average transaction value with `NULLIF` protection.

## Business impact
Use the outputs to review reporting gaps, channel mix, regional performance, customer-segment mix and transaction economics. Treat any post-initiative change as a hypothesis until tested with an appropriate comparison design.

## Run order
1. Load the original `weekly_sales` table.
2. Run [data_mart_solution.sql](data_mart_solution.sql) to prepare `clean_weekly_sales` and execute the query set.
3. Configure the MySQL environment variables described in the notebook and run [Data_Mart_SQL_Solutions_Findings.ipynb](Data_Mart_SQL_Solutions_Findings.ipynb) to produce data-driven findings.

**SQL dialect:** MySQL 8.0+.

## Files
- [SQL solutions](data_mart_solution.sql)
- [SQL solutions and findings notebook](Data_Mart_SQL_Solutions_Findings.ipynb)
- [Schema/source SQL](data_mart_schema.sql)
- [Case-study PDF](Case%20Study%201%20Data%20Mart.pdf)
- `Data_Mart_Solutions.docx` — supporting solution document

## Skills demonstrated
MySQL, data cleaning, date functions, aggregations, CTEs, window functions, percentage calculations, LAG, segmentation and business interpretation.
