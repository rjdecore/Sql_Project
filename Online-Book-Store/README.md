# Online Bookstore Sales Analysis — SQL

## Business objective
Analyze books, customers and orders to understand revenue, product demand, customer value and inventory requirements.

## Data model
- **Books:** title, author, genre, publication year, price and stock.
- **Customers:** customer identity and location.
- **Orders:** order date, quantity and total amount.

## Business questions and worked solutions
The question-only file is for practice; the solved file contains the SQL answers. Both include setup and data-import examples.

- [Practice questions](Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20%E2%80%93%20Project%20on%20SQL%20Only%20Questions.sql)
- [Worked SQL solutions](Day%20%E2%80%93%2030%20%E2%80%93%20SQL%20-%20SOLVED%20-%20Copy.sql)

The core set covers Fiction books, publication year, Canadian customers, November 2023 orders, total stock, highest-priced book, multi-quantity orders, high-value orders, available genres, low-stock books and revenue. Advanced questions cover books sold by genre/author, Fantasy pricing, repeat customers, frequently ordered books, top-priced books, customer cities/spend and stock remaining after orders.

## Business value
These queries support assortment reviews, repeat-customer analysis, revenue summaries and inventory replenishment discussions. Stock remaining is only meaningful when the inventory snapshot and order-fulfillment assumptions are understood.

## Important setup notes
- **Dialect:** PostgreSQL. The scripts use psql's `\c` and `COPY`; adjust the import path for your machine and import method.
- The setup includes DROP TABLE statements. Run them only when intentionally rebuilding tables, and back up any loaded data first.
- Validate that each order references a valid customer and book, and confirm whether `Total_Amount` is line value or order value before interpreting revenue.
- Numeric findings must come from executing the solution queries on the loaded data; they are not hard-coded in this README.

## Skills
Joins, filtering, aggregation, GROUP BY/HAVING, ranking, top-N analysis, revenue calculation and inventory analysis.
