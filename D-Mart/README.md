# 🛒 Data Mart SQL Case Study

## Project Overview

**Project Title**: Data Mart Sales & Performance Analysis  
**Level**: Intermediate  
**Database**: `data_mart`  

This project is based on **Case Study #1 from 8 Week SQL Challenge**, analyzing weekly sales data from **Data Mart**.  
The focus is to measure sales performance before and after the **sustainability initiative in June 2020**, where Data Mart switched to eco-friendly packaging across all business areas.  

---

## Schema

We use the `weekly_sales` table:

| Column       | Data Type    |
|--------------|-------------|
| week_date    | DATE        |
| region       | VARCHAR(20) |
| platform     | VARCHAR(20) |
| segment      | VARCHAR(10) |
| customer     | VARCHAR(20) |
| transactions | INT         |
| sales        | INT         |

---

## Data Cleaning (SQL)

A new table **`clean_weekly_sales`** is generated with the following transformations:  
- ✅ Added `week_number` (1–52) based on `week_date`.  
- ✅ Added `month_number` for each `week_date`.  
- ✅ Added `calendar_year` (2018, 2019, 2020).  
- ✅ Created `age_band` from segment codes (1 = Young Adults, 2 = Middle Aged, 3/4 = Retirees).  
- ✅ Created `demographic` (C = Couples, F = Families).  
- ✅ Replaced NULLs with `"unknown"` in `segment`, `age_band`, and `demographic`.  
- ✅ Calculated `avg_transaction = sales / transactions` (rounded to 2 decimals).  

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
        WHEN RIGHT(segment, 1) IN ('3','4') THEN 'Retirees'
        ELSE 'unknown'
    END AS age_band,
    CASE
        WHEN LEFT(segment, 1) = 'C' THEN 'Couples'
        WHEN LEFT(segment, 1) = 'F' THEN 'Families'
        ELSE 'unknown'
    END AS demographic,
    customer,
    transactions,
    sales,
    ROUND(CAST(sales AS DECIMAL) / NULLIF(transactions,0), 2) AS avg_transaction
FROM weekly_sales;
