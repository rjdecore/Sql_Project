# Data Mart Sales & Performance Analysis — SQL

## Business context
Analyze weekly sales before and after the June 2020 sustainability initiative, comparing region, platform, customer type, age band and demographic. The SQL file prepares a reusable cleaned table and then runs the business analyses.

## Business questions and decision use

| Question | SQL approach | Business use |
|---|---|---|
| Which week numbers are missing? | Recursive CTE generating weeks 1–52 | Identify data-coverage gaps before trend reporting |
| How do transaction totals vary by year? | Annual aggregation | Track transaction-volume changes |
| What are sales by month and region? | Year + month + region grouping | Compare regional performance without mixing different years |
| How do Retail and Shopify compare? | Monthly platform share | Review channel mix over time |
| Which demographics contribute to sales? | Annual share using a window function | Describe sales mix by segment |
| Which groups lead Retail sales? | Segment aggregation and revenue share | Focus customer-segment review |
| How does regional sales change year over year? | LAG() and percentage change | Prioritize regions for deeper investigation |
| Which customer types have the highest transaction value? | Weighted sales / transaction ratio | Compare transaction economics consistently |

## Source schema
The source table is weekly_sales.

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
data_mart_solution.sql creates clean_weekly_sales and:
- Derives week, month and calendar year.
- Maps segment codes to age bands and demographic labels.
- Converts missing/literal null segment values to Unknown.
- Calculates average transaction value using NULLIF to avoid division by zero.
- Replaces the previous derived table on rerun.

## Business impact
The output can support weekly performance monitoring, channel-mix review, regional follow-up and customer-segment planning. The analyses are descriptive: they can identify where a change occurred, but cannot prove that the sustainability initiative caused it without a suitable comparison design.

## Reproducibility and limitations
- **SQL dialect:** MySQL 8.0+ (recursive CTE support required).
- Load the source data/schema before running data_mart_solution.sql.
- The missing-week query checks week numbers 1–52; confirm whether week 53 is relevant for the source calendar.
- Exact findings should be quoted only after executing the queries against the supplied data. This README does not invent result totals.

## Files
- [SQL solution](data_mart_solution.sql)
- [Schema/source SQL](data_mart_schema.sql)
- [Case-study PDF](Case%20Study%201%20Data%20Mart.pdf)
- Data_Mart_Solutions.docx — supporting solution document

## Skills demonstrated
MySQL, data cleaning, date functions, aggregations, CTEs, window functions, percentage calculations, LAG, segmentation and business interpretation.
