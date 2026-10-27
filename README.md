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
| [SQL Mentor User Performance](SQL%20Mentor%20User%20Performance%20Analysis/) | Compare daily and weekly user activity and scores | Conditional aggregation, CTEs, DENSE_RANK |

## Analytical workflow

1. Define the business question and expected output grain.
2. Inspect schema, data types, nulls, duplicates and key uniqueness.
3. Prepare/clean data with documented assumptions.
4. Build queries incrementally and validate totals against source records.
5. Use CTEs and window functions when they make the logic clearer.
6. Explain what the result means for a business decision and state relevant limitations.

## Skills represented

- Joins and aggregations
- CTEs and subqueries
- Window functions and ranking
- Conditional aggregation and CASE expressions
- Date/time analysis
- Data cleaning and transformation
- Query readability and performance awareness

## Quality standard

The repository documents analytical questions and SQL techniques. Individual outputs should be verified by running the queries against the included dataset/schema before presenting any result as a confirmed business finding. Avoid claiming query optimization or business impact without supporting execution-plan evidence or measured results.

Each project folder contains its own README and available SQL/data files.
