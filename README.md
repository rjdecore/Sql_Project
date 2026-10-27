# SQL Analytics Portfolio

A collection of SQL case studies covering sales, retail, e-commerce, customer performance, media analytics and operational questions.

**Core stack:** SQL · MySQL · PostgreSQL · MySQL Workbench · Data Analysis

## Featured case studies

| Project | Business problem | Skills demonstrated |
|---|---|---|
| [Data Mart Sales & Performance](D-Mart/) | Compare weekly sales before/after an initiative; analyze region, platform and customer mix | Data cleaning, date derivation, segmentation, aggregations |
| [Zepto E-commerce & Inventory](Zepto-Ecommerce-Sales/) | Analyze price, discount, stock status and potential inventory value | Data profiling, cleaning, pricing analysis, category comparisons |
| [Spotify Advanced SQL](Spotify%20Advanced%20SQL%20Project/) | Explore track, artist, album and engagement patterns | CTEs, subqueries, window functions, ranking |
| [Pizza Sales](Pizza_Sales/) | Understand revenue, orders, product mix and time-of-day patterns | Joins, aggregation, date analysis, cumulative metrics |
| [Retail Sales Analysis](Retail%20Sales%20Analysis/) | Analyze category sales, customer behavior and monthly performance | CASE, GROUP BY/HAVING, date functions, ranking |
| [Online Bookstore](Online-Book-Store/) | Analyze book demand, customer spending and remaining inventory | Joins, aggregation, HAVING, top-N and stock calculations |
| [Netflix Movies & TV Shows](Netflix%20Movies%20and%20TV%20Shows/) | Explore catalog mix, ratings, genres, contributors and release trends | CTEs, string splitting, ranking, date analysis |
| [SQL Mentor User Performance](SQL%20Mentor%20User%20Performance%20Analysis/) | Compare daily and weekly user activity and scores | Conditional aggregation, CTEs, DENSE_RANK |

## Questions, solutions and findings notebooks

The [SQL Solutions Guide](SQL%20Solutions%20Guide.md) maps business questions to their SQL scripts and notebooks.

- [Data Mart README](D-Mart/README.md) · [SQL solutions](D-Mart/data_mart_solution.sql) · [solutions & findings notebook](D-Mart/Data_Mart_SQL_Solutions_Findings.ipynb)
- [Retail Sales README](Retail%20Sales%20Analysis/README.md) · [SQL solutions](Retail%20Sales%20Analysis/sql_query_p1.sql) · [solutions & findings notebook](Retail%20Sales%20Analysis/Retail_Sales_SQL_Solutions_Findings.ipynb)
- [Netflix README](Netflix%20Movies%20and%20TV%20Shows/README.md) · [15 SQL solutions](Netflix%20Movies%20and%20TV%20Shows/Solutions%20of%2015%20business%20problems.sql) · [solutions & findings notebook](Netflix%20Movies%20and%20TV%20Shows/Netflix_SQL_Solutions_Findings.ipynb)
- [Spotify README](Spotify%20Advanced%20SQL%20Project/README.md) · [SQL solutions](Spotify%20Advanced%20SQL%20Project/Query%20Solutions.sql) · [solutions & findings notebook](Spotify%20Advanced%20SQL%20Project/Spotify_SQL_Solutions_Findings.ipynb)
- [Online Bookstore questions](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql) · [worked solutions](Online-Book-Store/Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20-%20SOLVED%20-%20Copy.sql)

## Analytical workflow

1. Define the business question and expected output grain.
2. Inspect schema, data types, nulls, duplicates and key uniqueness.
3. Prepare/clean data with documented assumptions.
4. Run each query against the configured source database and validate totals.
5. Explain the result in business language and recommend a next action.
6. Distinguish descriptive findings from causal claims.

## Skills represented

- Joins, aggregations, CTEs and subqueries
- Window functions and ranking
- Conditional aggregation and CASE expressions
- Date/time and string analysis
- Data cleaning and transformation
- Query readability, EXPLAIN and performance investigation

## Validation standard

The notebooks read query results from the connected database and generate findings dynamically; they do not invent result totals when source data is missing. SQL parser checks establish syntax, not business correctness. For reproducible findings, load the documented source table, configure database environment variables and run the notebook top to bottom.

Each project README lists its SQL dialect, data requirements and available report artifacts.
