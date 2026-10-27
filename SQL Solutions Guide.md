# SQL Questions, Solutions & Findings Guide

Use this index to move from the business question to the worked query, result notebook and decision use. All numeric findings should come from the source dataset rather than hard-coded example values.

| Project | Business questions | Worked SQL | Solutions & findings notebook | Business use |
|---|---|---|---|---|
| Data Mart | Weekly gaps, annual transaction totals, regional/monthly sales, channel mix, demographics, regional YoY and transaction value | [data_mart_solution.sql](D-Mart/data_mart_solution.sql) | [Data Mart notebook](D-Mart/Data_Mart_SQL_Solutions_Findings.ipynb) | Channel, region and segment review |
| Retail Sales | Date filters, category sales, high-value transactions, monthly peaks, top customers, weekday/shift mix and customer concentration | [sql_query_p1.sql](Retail%20Sales%20Analysis/sql_query_p1.sql) | [Retail Sales notebook](Retail%20Sales%20Analysis/Retail_Sales_SQL_Solutions_Findings.ipynb) | Category, staffing and customer analysis |
| Online Bookstore | 11 core + 8 advanced questions on stock, revenue, genre, author and customers | [Solved SQL](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20-%20SOLVED%20-%20Copy.sql) · [Question-only file](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql) | See the solved SQL and run it against the bookstore schema | Product assortment, repeat purchases and stock |
| Netflix | 15 questions on title mix, ratings, countries, movie length, genres, contributors and descriptions | [15 SQL solutions](Netflix%20Movies%20and%20TV%20Shows/Solutions%20of%2015%20business%20problems.sql) · [Question list](Netflix%20Movies%20and%20TV%20Shows/Business%20Problems%20Netflix.sql) | Run the solutions against the Netflix source table | Catalog and content-mix analysis |
| Spotify Advanced SQL | Track/artist/album engagement, ranking and platform comparison | [Query solutions](Spotify%20Advanced%20SQL%20Project/Query%20Solutions.sql) | Run against the project database | Music catalog engagement analysis |
| Zepto E-commerce | Pricing, discounts, stock and estimated inventory value | [Zepto SQL](Zepto-Ecommerce-Sales/Zepto.sql) · [Analysis SQL](Zepto-Ecommerce-Sales/Zepto_SQL_data_analysis.sql) | Run against the Zepto source table | Pricing and inventory prioritisation |
| Library Management | Borrowing/return operations and advanced reporting | [Advanced solution](Library%20Management%20System/lms_project_advanced_solution.sql) | Run against the library schema | Library operations and usage |

## What a complete SQL case study contains

1. Business objective and business questions.
2. Query solution for each question.
3. Explanation of filters, joins, grain, aggregation and null handling.
4. Query result and finding generated from actual data.
5. Business implication and a practical next action.
6. Validation notes for data quality and assumptions.

The Data Mart and Retail Sales notebooks automate query execution and generate findings from the connected MySQL data. Parser checks only verify SQL syntax; running the notebooks verifies the returned data-dependent findings for the configured source database.
