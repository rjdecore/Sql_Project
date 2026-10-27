# SQL Questions & Solutions Guide

This index makes it easy to find the business question and its worked SQL answer. Check the dialect and source-data prerequisites in each project README before running a script.

| Project | Question brief | Worked solution | Main business use |
|---|---|---|---|
| Data Mart | Weekly sales gaps, annual/monthly regional sales, channel mix, demographics and year-over-year change | [data_mart_solution.sql](D-Mart/data_mart_solution.sql) | Channel, region and customer-segment review |
| Retail Sales | Daily/monthly transactions, category revenue, top customers, weekday/shift mix and customer concentration | [sql_query_p1.sql](Retail%20Sales%20Analysis/sql_query_p1.sql) | Category, staffing and customer analysis |
| Online Bookstore | 11 core + 8 advanced questions covering stock, revenue, genre, author and customers | [Solved SQL](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20-%20SOLVED%20-%20Copy.sql) · [Question-only file](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql) | Product assortment, repeat purchases and stock |
| Netflix | 15 questions on title mix, ratings, countries, longest movies, genres, contributors and descriptions | [15 SQL solutions](Netflix%20Movies%20and%20TV%20Shows/Solutions%20of%2015%20business%20problems.sql) · [Question list](Netflix%20Movies%20and%20TV%20Shows/Business%20Problems%20Netflix.sql) | Catalog and content-mix analysis |
| Spotify Advanced SQL | Track/artist/album engagement, ranking and platform comparison | [Query solutions](Spotify%20Advanced%20SQL%20Project/Query%20Solutions.sql) | Music catalog engagement analysis |
| Zepto E-commerce | Pricing, discounts, stock and estimated inventory value | [Zepto SQL](Zepto-Ecommerce-Sales/Zepto.sql) · [Analysis SQL](Zepto-Ecommerce-Sales/Zepto_SQL_data_analysis.sql) | Pricing and inventory prioritization |
| Library Management | Borrowing/return operations and advanced reporting | [Advanced solution](Library%20Management%20System/lms_project_advanced_solution.sql) | Library operations and usage |

## How to present a solution

For each question, explain the expected output grain, why each filter/join is required, how nulls and duplicates are handled, and what decision the result can support. Do not invent result totals: execute the query against the source data and record the actual output. SQL parser checks establish syntax only; they do not prove the business result is correct.
