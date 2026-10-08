# Data Mart Sales & Performance Analysis — SQL

## Business Context

This project analyzes Data Mart's weekly sales data before and after its sustainability initiative in June 2020, with the goal of understanding sales performance across time, region, platform, customer segment, age band, and demographic.

The project is structured as a practical SQL case study rather than a collection of isolated queries.

## Business Questions

The analysis answers questions such as:

- Which week numbers are missing from the dataset?
- How many transactions were recorded in each year?
- What are monthly sales by region?
- How do Retail and Shopify compare in sales contribution?
- How does sales mix vary by demographic and year?
- Which age-band and demographic combinations contribute most to Retail sales?

## Data & Schema

Primary table: `weekly_sales`

| Column | Description |
|---|---|
| `week_date` | Weekly sales date |
| `region` | Sales region |
| `platform` | Retail or Shopify |
| `segment` | Customer segment code |
| `customer_type` | Customer classification |
| `transactions` | Transaction count |
| `sales` | Sales value |

## SQL Data Preparation

A cleaned table, `clean_weekly_sales`, is created before analysis.

Transformations include:

- Deriving week, month, and calendar year from `week_date`
- Translating segment codes into age bands
- Translating segment prefixes into demographic groups
- Handling unknown segment values
- Calculating average transaction value
- Creating a reusable analysis layer instead of repeating cleaning logic in every query

Example:

```sql
CREATE TABLE clean_weekly_sales AS
SELECT
    week_date,
    WEEK(week_date) AS week_number,
    MONTH(week_date) AS month_number,
    YEAR(week_date) AS calendar_year,
    region,
    platform,
    segment,
    CASE
        WHEN RIGHT(segment, 1) = '1' THEN 'Young Adults'
        WHEN RIGHT(segment, 1) = '2' THEN 'Middle Aged'
        WHEN RIGHT(segment, 1) IN ('3', '4') THEN 'Retirees'
        ELSE 'Unknown'
    END AS age_band,
    CASE
        WHEN LEFT(segment, 1) = 'C' THEN 'Couples'
        WHEN LEFT(segment, 1) = 'F' THEN 'Families'
        ELSE 'Unknown'
    END AS demographic,
    customer_type,
    transactions,
    sales,
    ROUND(sales / NULLIF(transactions, 0), 2) AS avg_transaction
FROM weekly_sales;
```

## SQL Techniques Demonstrated

- Data cleaning and transformation
- Date functions
- Aggregations and grouping
- Conditional logic with `CASE`
- Common Table Expressions (CTEs)
- Window functions
- Percentage calculations
- Ranking and sorting
- Sequence generation for missing-week analysis

## Why This Project Matters

The project demonstrates how SQL can move from raw transactional data to a reusable analytical dataset and then answer business questions around sales mix, channel performance, customer segments, and time-based trends.

## Repository Files

- `data_mart_schema.sql` — source dataset/schema
- `data_mart_solution.sql` — cleaning and analytical SQL solutions
- `Data_Mart_Solutions.docx` — supporting solution document
- `Case Study 1 Data Mart.pdf` — case-study reference

## Tech Stack

**MySQL | SQL | CTEs | Window Functions | Data Cleaning | Business Analysis**
