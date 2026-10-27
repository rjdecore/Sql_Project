# Zepto E-commerce Sales & Inventory Analytics — SQL

## Business Objective
Analyze a quick-commerce product catalog to understand pricing, discounts, stock availability, inventory value, and product/category performance.

## Data
Each row represents a product/SKU with fields such as category, MRP, discount, discounted selling price, quantity, weight, availability, and stock status.

## Data Preparation
The project covers a realistic analyst workflow:
1. Create the database/table
2. Import the raw CSV
3. Inspect record structure and nulls
4. Identify duplicate/product-SKU patterns
5. Remove invalid zero-price records
6. Convert prices from paise to rupees
7. Build business-focused analysis queries

## Business Questions
- Which products provide the highest discounts?
- Which expensive products are out of stock?
- What is potential revenue by category?
- Which categories provide the highest average discount?
- What is price per gram?
- How does inventory weight vary by category?
- Which products combine high price with low discount?

## Tech Stack
**PostgreSQL | SQL | Data Cleaning | E-commerce Analytics | Inventory Analysis | Pricing Analytics**

## Findings & Business Value
The query set examines product pricing and discounting, category mix, stock status and estimated inventory value. Use the executed results to identify low-stock products, discount patterns and high-value stock; do not describe inventory value as realized sales revenue.

## Business Use
Supports pricing review, stock-prioritization and category-level inventory analysis. Decisions should consider data freshness, stock availability and the business definition of price/value.

## Case Study / PDF
[Open the Zepto SQL solution PDF](Zepto_sol.pdf) and use the SQL files plus CSV data to reproduce the results.
