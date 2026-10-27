# SQL Questions, Solutions & Findings Guide

Use this index to move from the business question to the worked query, runnable results notebook and decision use. Numeric findings must come from the actual source dataset, not hard-coded examples.

| Project | Business questions | Worked SQL | Solutions & findings notebook | Business use |
|---|---|---|---|---|
| Data Mart | Weekly gaps, annual transaction totals, regional/monthly sales, channel mix, demographics, regional YoY and transaction value | [SQL](D-Mart/data_mart_solution.sql) | [Notebook](D-Mart/Data_Mart_SQL_Solutions_Findings.ipynb) | Channel, region and segment review |
| Retail Sales | Date filters, category sales, high-value transactions, monthly peaks, top customers, weekday/shift mix and customer concentration | [SQL](Retail%20Sales%20Analysis/sql_query_p1.sql) | [Notebook](Retail%20Sales%20Analysis/Retail_Sales_SQL_Solutions_Findings.ipynb) | Category, staffing and customer analysis |
| Netflix | 15 questions on title mix, ratings, countries, movie length, genres, contributors and descriptions | [15 SQL solutions](Netflix%20Movies%20and%20TV%20Shows/Solutions%20of%2015%20business%20problems.sql) | [Notebook](Netflix%20Movies%20and%20TV%20Shows/Netflix_SQL_Solutions_Findings.ipynb) | Catalog and content-mix analysis |
| Spotify Advanced SQL | Track/artist/album engagement, ranking and platform comparison | [SQL solutions](Spotify%20Advanced%20SQL%20Project/Query%20Solutions.sql) | [Notebook](Spotify%20Advanced%20SQL%20Project/Spotify_SQL_Solutions_Findings.ipynb) | Music catalog engagement analysis |
| Online Bookstore | Core + advanced questions on stock, recorded order value, genre, author and customers | [Solved SQL](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20-%20SOLVED%20-%20Copy.sql) · [Question-only file](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql) | [Notebook](Online-Book-Store/Online_Bookstore_SQL_Solutions_Findings.ipynb) | Product assortment, repeat purchases and stock |
| Zepto E-commerce | Pricing, discounts, stock and estimated inventory value | [Setup SQL](Zepto-Ecommerce-Sales/Zepto.sql) · [Safe analysis SQL](Zepto-Ecommerce-Sales/Zepto_SQL_data_analysis.sql) | [Notebook](Zepto-Ecommerce-Sales/Zepto_SQL_Solutions_Findings.ipynb) | Pricing and inventory prioritisation |
| Library Management | Borrowing/return operations and advanced reporting | [Advanced solution](Library%20Management%20System/lms_project_advanced_solution.sql) | Run against the library schema | Library operations and usage |

## What a complete SQL case study contains

1. Business objective and business questions.
2. Query solution for each question.
3. Explanation of filters, joins, grain, aggregation and null handling.
4. Query result and finding generated from actual data.
5. Business implication and a practical next action.
6. Validation notes for data quality and assumptions.

Data Mart, Retail Sales, Spotify and Zepto use MySQL; Netflix and Online Bookstore use PostgreSQL. Configure the matching database before running each notebook. The Netflix README flags the source CSV as an empty placeholder, so its notebook cannot produce genuine findings until the dataset is restored. Parser checks verify syntax only; query execution against the correct source is required to validate data-dependent findings.
