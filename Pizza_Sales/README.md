# 🍕 Pizza Sales SQL Project
## 📌 Overview

**This project analyzes pizza sales data to generate insights on orders, revenue, product performance, and customer behavior. Using SQL, we answer business-driven questions ranging from basic aggregations to advanced analytics.** 

**The project demonstrates skills in:**

- Database design and querying

- Aggregations, grouping, and joins

- Window functions and advanced SQL analysis

# 📂 Database Schema

The database consists of the following tables:

**orders**
Column	Description
order_id	Unique order identifier
order_date	Date of the order
order_time	Time of the order
orders_details
Column	Description
orders_details_id	Unique detail ID
order_id	Order identifier (foreign key)
pizza_id	Pizza identifier
quantity	Number of pizzas ordered

(Other reference tables like pizza_types and pizzas would typically store pizza name, category, size, and price.)

# 🛠️ Case Study Questions
- 🔹 Basic Queries

Retrieve the total number of orders placed.

Calculate the total revenue generated from pizza sales.

Identify the highest-priced pizza.

Identify the most common pizza size ordered.

List the top 5 most ordered pizza types along with their quantities.

- 🔹 Intermediate Queries

Find the total quantity of each pizza category ordered.

Determine the distribution of orders by hour of the day.

Find the category-wise distribution of pizzas.

Group the orders by date and calculate the average number of pizzas ordered per day.

Determine the top 3 most ordered pizza types based on revenue.

- 🔹 Advanced Queries

Calculate the percentage contribution of each pizza type to total revenue.

Analyze the cumulative revenue generated over time.

Determine the top 3 most ordered pizza types based on revenue for each pizza category.

📊 Example SQL Queries
<pre> ''' sql -- Q1. Retrieve the total number of orders placed
SELECT COUNT(order_id) AS total_orders
FROM orders;</pre> '''

<pre> ''' sql -- Q2. Calculate the total revenue generated from pizza sales
SELECT ROUND(SUM(quantity * price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;</pre>'''

<pre> ''' sql -- Q7. Determine the distribution of orders by hour of the day
SELECT HOUR(order_time) AS order_hour,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY HOUR(order_time)
ORDER BY order_hour; </pre>'''

🚀 How to Run the Project

Open MySQL Workbench (or any MySQL client).

Run the schema script:

source pizza_sales.sql;


Load the dataset (insert statements for orders, orders_details, pizzas, pizza_types).

Run queries from the provided file to answer the 13 business questions.

## 📈 Insights You Can Derive

Which pizzas generate the most revenue

Popular pizza sizes and categories

Sales trends by date and time of day

Revenue contribution by product type

Cumulative sales growth over time

# 🛠️ Technology Stack

- Database: MySQL

- SQL Concepts: Joins, Aggregations, Window Functions, CTEs

Tools: MySQL Workbench / DBeaver
