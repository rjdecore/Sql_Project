# Online Bookstore Sales Analysis — SQL

## Business objective
Analyze books, customers and orders to understand product demand, customer value, recorded order value and inventory requirements.

## Data model
- **Books:** title, author, genre, publication year, price and stock.
- **Customers:** customer identity and location.
- **Orders:** order date, quantity and total amount.

## Business questions and worked solutions
- [Practice questions](Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql)
- [Worked SQL solutions](Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20-%20SOLVED%20-%20Copy.sql)
- [SQL solutions & findings notebook](Online_Bookstore_SQL_Solutions_Findings.ipynb)

The notebook covers 11 core and 9 advanced questions, displays query outputs and derives findings from the database. It also corrects several analysis details: November date filtering uses a half-open date range; ties are retained for maximum price/lowest stock; the “customer spent over $30” question aggregates spend per customer; and the frequent-book query reports order-row count separately from units ordered.

## Business value
The analysis supports assortment review, repeat-customer analysis, recorded order-value summaries and inventory replenishment discussions. Stock remaining is only meaningful when the stock snapshot and order-fulfillment assumptions are understood.

## Setup and reproducibility
- **Dialect:** PostgreSQL.
- The notebook expects populated books, customers and orders tables and uses environment variables for the connection. It does not embed machine-specific Windows file paths or credentials.
- The legacy setup SQL uses psql's \\c and server-side COPY. Adapt data loading for your environment and run DROP TABLE statements only when intentionally rebuilding tables.
- Confirm whether Total_Amount is line value or whole-order value before interpreting it as revenue.
- The notebook derives numeric findings at runtime; do not report totals until the notebook completes against the actual dataset.

## Skills
Joins, filtering, aggregation, GROUP BY/HAVING, ranking, top-N analysis, revenue calculation, customer analysis and inventory interpretation.
