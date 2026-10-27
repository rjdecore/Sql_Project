-- Data Mart weekly sales analysis (MySQL 8.0+)
-- Expected source table: weekly_sales
-- Re-runs safely by replacing only the derived table created by this script.

DROP TABLE IF EXISTS clean_weekly_sales;

CREATE TABLE clean_weekly_sales AS
SELECT
    week_date,
    WEEK(week_date) AS week_number,
    MONTH(week_date) AS month_number,
    YEAR(week_date) AS calendar_year,
    region,
    platform,
    CASE
        WHEN segment IS NULL OR LOWER(segment) = 'null' THEN 'Unknown'
        ELSE segment
    END AS segment,
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

-- Quick validation: inspect the cleaned rows and resulting grain.
SELECT * FROM clean_weekly_sales LIMIT 10;
SELECT COUNT(*) AS cleaned_rows FROM clean_weekly_sales;

-- Q1. Which week numbers from 1 to 52 are absent?
-- Recursive CTE avoids manually building a sequence table or duplicate-key errors.
WITH RECURSIVE week_sequence AS (
    SELECT 1 AS week_number
    UNION ALL
    SELECT week_number + 1
    FROM week_sequence
    WHERE week_number < 52
)
SELECT ws.week_number AS missing_week_number
FROM week_sequence AS ws
WHERE NOT EXISTS (
    SELECT 1
    FROM clean_weekly_sales AS c
    WHERE c.week_number = ws.week_number
)
ORDER BY ws.week_number;

-- Q2. How many transactions were recorded in each calendar year?
SELECT
    calendar_year,
    SUM(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY calendar_year
ORDER BY calendar_year;

-- Q3. What are sales by year, month and region?
-- Include year: grouping only by month would combine different years.
SELECT
    calendar_year,
    month_number,
    region,
    SUM(sales) AS total_sales
FROM clean_weekly_sales
GROUP BY calendar_year, month_number, region
ORDER BY calendar_year, month_number, total_sales DESC;

-- Q4. What is the total transaction volume by platform?
SELECT
    platform,
    SUM(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY platform
ORDER BY total_transactions DESC;

-- Q5. What percentage of each calendar month's sales comes from Retail vs Shopify?
WITH monthly_platform_sales AS (
    SELECT
        calendar_year,
        month_number,
        platform,
        SUM(sales) AS platform_sales
    FROM clean_weekly_sales
    GROUP BY calendar_year, month_number, platform
),
monthly_totals AS (
    SELECT
        calendar_year,
        month_number,
        SUM(platform_sales) AS all_platform_sales
    FROM monthly_platform_sales
    GROUP BY calendar_year, month_number
)
SELECT
    p.calendar_year,
    p.month_number,
    ROUND(
        100 * SUM(CASE WHEN p.platform = 'Retail' THEN p.platform_sales ELSE 0 END)
        / NULLIF(MAX(t.all_platform_sales), 0),
        2
    ) AS retail_percentage,
    ROUND(
        100 * SUM(CASE WHEN p.platform = 'Shopify' THEN p.platform_sales ELSE 0 END)
        / NULLIF(MAX(t.all_platform_sales), 0),
        2
    ) AS shopify_percentage
FROM monthly_platform_sales AS p
JOIN monthly_totals AS t
    ON t.calendar_year = p.calendar_year
   AND t.month_number = p.month_number
GROUP BY p.calendar_year, p.month_number
ORDER BY p.calendar_year, p.month_number;

-- Q6. What share of each year's sales comes from each demographic?
SELECT
    calendar_year,
    demographic,
    SUM(sales) AS demographic_sales,
    ROUND(
        100 * SUM(sales)
        / NULLIF(SUM(SUM(sales)) OVER (PARTITION BY calendar_year), 0),
        2
    ) AS sales_percentage
FROM clean_weekly_sales
GROUP BY calendar_year, demographic
ORDER BY calendar_year, sales_percentage DESC;

-- Q7. Which age-band/demographic groups contribute most to Retail sales?
SELECT
    age_band,
    demographic,
    SUM(sales) AS total_sales,
    ROUND(100 * SUM(sales) / NULLIF(SUM(SUM(sales)) OVER (), 0), 2) AS retail_sales_percentage
FROM clean_weekly_sales
WHERE platform = 'Retail'
GROUP BY age_band, demographic
ORDER BY total_sales DESC;

-- Q8. Which regions have the strongest year-over-year sales change?
-- Descriptive comparison only; it does not prove what caused the change.
WITH regional_yearly_sales AS (
    SELECT calendar_year, region, SUM(sales) AS yearly_sales
    FROM clean_weekly_sales
    GROUP BY calendar_year, region
),
with_previous_year AS (
    SELECT
        calendar_year,
        region,
        yearly_sales,
        LAG(yearly_sales) OVER (PARTITION BY region ORDER BY calendar_year) AS prior_year_sales
    FROM regional_yearly_sales
)
SELECT
    calendar_year,
    region,
    yearly_sales,
    prior_year_sales,
    yearly_sales - prior_year_sales AS sales_change,
    ROUND(
        100 * (yearly_sales - prior_year_sales) / NULLIF(prior_year_sales, 0),
        2
    ) AS sales_change_percentage
FROM with_previous_year
ORDER BY calendar_year, sales_change_percentage DESC;

-- Q9. Which customer types have the highest average transaction value?
SELECT
    customer_type,
    ROUND(SUM(sales) / NULLIF(SUM(transactions), 0), 2) AS weighted_average_transaction_value,
    SUM(transactions) AS total_transactions,
    SUM(sales) AS total_sales
FROM clean_weekly_sales
GROUP BY customer_type
ORDER BY weighted_average_transaction_value DESC;

-- Business interpretation:
-- Use these outputs to identify sales mix, regional movement and customer segments
-- worth investigating. Do not infer causation from these descriptive aggregates alone.
