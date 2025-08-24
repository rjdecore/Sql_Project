# 📚 Online Bookstore SQL Project
## 📌 Overview

**This project analyzes an Online Bookstore dataset using SQL. It involves working with three core tables — Books, Customers, and Orders — to answer a series of basic and advanced business questions.**

# The project demonstrates SQL skills in:

- Database schema design

- Data importing from CSV files

- Aggregations & filtering

- Joins across multiple tables

- Advanced analytics (ranking, grouping, stock tracking)

# 📂 Database Schema
Books Table
Column	Description
Book_ID	Unique book identifier
Title	Title of the book
Author	Author name
Genre	Book genre (Fiction, etc.)
Published_Year	Year of publication
Price	Price of the book
Stock	Available stock
Customers Table
Column	Description
Customer_ID	Unique customer identifier
Name	Customer name
Email	Customer email
Phone	Contact number
City	City of customer
Country	Country of customer
Orders Table
Column	Description
Order_ID	Unique order identifier
Customer_ID	References Customers(Customer_ID)
Book_ID	References Books(Book_ID)
Order_Date	Date of order
Quantity	Number of books ordered
Total_Amount	Order total (price × quantity)
🛠️ Project Setup

# Create the database and tables:

<pre> '''CREATE DATABASE OnlineBookstore;
\c OnlineBookstore; </pre>'''


# Import CSV files (Books.csv, Customers.csv, Orders.csv) into their respective tables.



# ❓ Business Questions
# 🔹 Basic Queries

- Retrieve all books in the "Fiction" genre.

- Find books published after the year 1950.

- List all customers from Canada.

- Show orders placed in November 2023.

- Retrieve the total stock of books available.

- Find the details of the most expensive book.

- Show all customers who ordered more than 1 quantity of a book.

- Retrieve all orders where the total amount exceeds $20.

- List all genres available in the Books table.

- Find the book with the lowest stock.

- Calculate the total revenue generated from all orders.

🔹**Advanced Queries**

- Retrieve the total number of books sold for each genre.

- Find the average price of books in the "Fantasy" genre.

- List customers who have placed at least 2 orders.

- Find the most frequently ordered book.

- Show the top 3 most expensive books of the 'Fantasy' genre.

- Retrieve the total quantity of books sold by each author.

- List the cities where customers who spent over $30 are located.

- Find the customer who spent the most on orders.

- Calculate the stock remaining after fulfilling all orders.

# 📊 Example Queries
<pre>''' sql -- Q1. Retrieve all books in the "Fiction" genre
SELECT * 
FROM Books
WHERE Genre = 'Fiction';</pre>'''

<pre>''' sql -- Q11. Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Revenue 
FROM Orders;</pre>'''

<pre>''' sql -- Advanced Q4. Find the most frequently ordered book
SELECT o.Book_ID, b.Title, COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID, b.Title
ORDER BY Order_Count DESC
LIMIT 1;</pre>'''

# 🚀 Insights

- Fiction and Fantasy genres dominate in volume and price.

- High-value customers are concentrated in specific cities.

- Certain authors consistently generate high book sales.

- Revenue analysis shows the most frequently ordered and high-value books.

- Stock tracking highlights low-stock books requiring replenishment.

# 🛠️ Tech Stack

- **Database:** - PostgreSQL / MySQL

- **Tools:** - pgAdmin / MySQL Workbench

**SQL Concepts:** - Aggregations, Joins, Grouping, CTEs, Advanced filtering


