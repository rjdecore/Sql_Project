# SQL Questions, Solutions & Findings Guide

This guide connects each case study's business questions to its worked SQL, analysis notebook and practical decision use.

| Project | Business questions | Worked SQL | Solutions & findings notebook | Business use |
|---|---|---|---|---|
| Data Mart | Weekly gaps, annual transaction totals, regional/monthly sales, channel mix, demographics, regional YoY and transaction value | [SQL](D-Mart/data_mart_solution.sql) | [Notebook](D-Mart/Data_Mart_SQL_Solutions_Findings.ipynb) | Channel, region and segment review |
| Retail Sales | Date filters, category sales, high-value transactions, monthly peaks, top customers, weekday/shift mix and customer concentration | [SQL](Retail%20Sales%20Analysis/sql_query_p1.sql) | [Notebook](Retail%20Sales%20Analysis/Retail_Sales_SQL_Solutions_Findings.ipynb) | Category, staffing and customer analysis |
| Netflix | 15 questions on title mix, ratings, countries, movie length, genres, contributors and descriptions | [15 SQL solutions](Netflix%20Movies%20and%20TV%20Shows/Solutions%20of%2015%20business%20problems.sql) | [Notebook](Netflix%20Movies%20and%20TV%20Shows/Netflix_SQL_Solutions_Findings.ipynb) | Catalog and content-mix analysis |
| Spotify Advanced SQL | Track/artist/album engagement, ranking and platform comparison | [SQL solutions](Spotify%20Advanced%20SQL%20Project/Query%20Solutions.sql) | [Notebook](Spotify%20Advanced%20SQL%20Project/Spotify_SQL_Solutions_Findings.ipynb) | Music catalog engagement analysis |
| Online Bookstore | Core + advanced questions on stock, recorded order value, genre, author and customers | [Solved SQL](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20-%20SOLVED%20-%20Copy.sql) · [Question-only file](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql) | [Notebook](Online-Book-Store/Online_Bookstore_SQL_Solutions_Findings.ipynb) | Product assortment, repeat purchases and stock |
| Zepto E-commerce | Pricing, discounts, stock and estimated inventory value | [Setup SQL](Zepto-Ecommerce-Sales/Zepto.sql) · [Analysis SQL](Zepto-Ecommerce-Sales/Zepto_SQL_data_analysis.sql) | [Notebook](Zepto-Ecommerce-Sales/Zepto_SQL_Solutions_Findings.ipynb) | Pricing and inventory prioritisation |
| Library Management | Borrowing/return operations and advanced reporting | [Advanced solution](Library%20Management%20System/lms_project_advanced_solution.sql) | [Project files](Library%20Management%20System/) | Library operations and usage |

## How to read each case study

1. **Business objective:** the operational or commercial question being investigated.
2. **SQL solution:** the query structure, joins, filters, grouping and calculations used to answer it.
3. **Findings:** the patterns visible in the query output, such as category contribution, customer concentration, ranking or changes over time.
4. **Business interpretation:** why the pattern matters to a decision-maker.
5. **Recommended action:** a practical next step connected to the analysis.

Data Mart, Retail Sales, Spotify and Zepto use MySQL; Netflix and Online Bookstore use PostgreSQL. Follow the database setup and execution instructions included with each project.
