🧵 Case Study – Texture Tales SQL Project
📌 Overview


This project analyzes sales transactions from Texture Tales, focusing on revenue, discounts, and product performance. Using SQL, we answer 12 business case study questions that provide insights into customer behavior, membership value, and best-performing products.

The project demonstrates SQL proficiency with:

Joins between sales and product_details

Aggregations and grouping

Common Table Expressions (CTEs)

Window functions (MySQL 8+)

Business-driven insights

📂 Database Schema
sales table
Column	Description
txn_id	Unique transaction ID
prod_id	Product ID (foreign key)
qty	Quantity sold
price	Unit price before discount
discount	Discount percentage
member	Membership status (Y/N)
product_details table
Column	Description
product_id	Unique product identifier
product_name	Name of the product
segment_id	Segment identifier
segment_name	Segment name
category_id	Category identifier
category_name	Category name
🛠️ Case Study Questions

1.What was the total quantity sold for all products?

2.What is the total generated revenue for all products before discounts?

3.What was the total discount amount for all products?

4.How many unique transactions were there?

5.What are the average unique products purchased in each transaction?

6.What is the average discount value per transaction?

7.What is the average revenue for member transactions and non-member transactions?

8.What are the top 3 products by total revenue before discount?

9.What are the total quantity, revenue, and discount for each segment?

10.What is the top selling product for each segment?

-- Q1. Total quantity sold for all products
SELECT 
    details.product_name,
    SUM(sales.qty) AS sale_counts
FROM sales AS sales
INNER JOIN product_details AS details
    ON sales.prod_id = details.product_id
GROUP BY details.product_name
ORDER BY sale_counts DESC;

-- Q7. Average revenue for member and non-member transactions
WITH cte_member_revenue AS (
  SELECT
    member,
    txn_id,
    SUM(price * qty) AS revenue
  FROM sales
  GROUP BY member, txn_id
)
SELECT
  member,
  ROUND(AVG(revenue), 2) AS avg_revenue
FROM cte_member_revenue
GROUP BY member;

🚀 How to Run the Project

Open MySQL Workbench (or any MySQL client).

Create a new database:

CREATE DATABASE cs4;
USE cs4;


Import the dataset into the sales and product_details tables.

Run queries from the provided file:

source cs4_queries.sql;


Analyze the results for each business question.


📈 Insights You Can Derive

Top revenue drivers across segments and categories

Discount impact on total revenue

Membership value (members vs non-members)

Best-selling products in each segment/category

Average basket size per transaction

🛠️ Technology Stack

Database: MySQL

SQL Concepts: Joins, Aggregations, CTEs, Window Functions

Tools: MySQL Workbench / DBeaver

What are the total quantity, revenue, and discount for each category?

What is the top selling product for each category?
