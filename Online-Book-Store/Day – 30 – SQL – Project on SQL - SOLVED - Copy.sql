-- Online Bookstore Sales Analysis — PostgreSQL / psql
-- Run the setup section only when intentionally rebuilding the tables.
-- Adjust the client-side CSV paths in the \copy commands for your machine.

-- One-time database setup:
-- CREATE DATABASE onlinebookstore;
-- \c onlinebookstore

-- Rebuild tables in foreign-key-safe order. Back up data before running.
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS books;

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    published_year INT,
    price NUMERIC(10, 2),
    stock INT
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    country VARCHAR(150)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    book_id INT REFERENCES books(book_id),
    order_date DATE,
    quantity INT,
    total_amount NUMERIC(10, 2)
);

-- Load CSVs with psql client-side COPY. Replace paths with your actual files.
-- \copy books(book_id,title,author,genre,published_year,price,stock) FROM 'data/Books.csv' CSV HEADER
-- \copy customers(customer_id,name,email,phone,city,country) FROM 'data/Customers.csv' CSV HEADER
-- \copy orders(order_id,customer_id,book_id,order_date,quantity,total_amount) FROM 'data/Orders.csv' CSV HEADER

-- Basic source validation.
SELECT COUNT(*) AS book_rows FROM books;
SELECT COUNT(*) AS customer_rows FROM customers;
SELECT COUNT(*) AS order_rows FROM orders;
SELECT COUNT(*) AS orders_without_customer
FROM orders o LEFT JOIN customers c ON c.customer_id=o.customer_id
WHERE c.customer_id IS NULL;
SELECT COUNT(*) AS orders_without_book
FROM orders o LEFT JOIN books b ON b.book_id=o.book_id
WHERE b.book_id IS NULL;

-- CORE QUESTIONS

-- 1. Retrieve all Fiction books.
SELECT * FROM books WHERE genre='Fiction' ORDER BY title;

-- 2. Books published after 1950.
SELECT * FROM books WHERE published_year>1950 ORDER BY published_year DESC;

-- 3. Customers from Canada.
SELECT * FROM customers WHERE country ILIKE 'Canada' ORDER BY city,name;

-- 4. Orders placed in November 2023.
SELECT * FROM orders
WHERE order_date >= DATE '2023-11-01' AND order_date < DATE '2023-12-01'
ORDER BY order_date;

-- 5. Total stock in the current Books stock snapshot.
SELECT SUM(stock) AS total_stock_units FROM books;

-- 6. Most expensive book(s); retain ties.
SELECT * FROM books WHERE price=(SELECT MAX(price) FROM books) ORDER BY title;

-- 7. Order lines where more than one unit was ordered.
SELECT * FROM orders WHERE quantity>1 ORDER BY quantity DESC;

-- 8. Orders whose recorded total amount exceeds 20.
SELECT * FROM orders WHERE total_amount>20 ORDER BY total_amount DESC;

-- 9. Available genres.
SELECT DISTINCT genre FROM books WHERE genre IS NOT NULL ORDER BY genre;

-- 10. Book(s) at the lowest stock level; retain ties.
SELECT * FROM books WHERE stock=(SELECT MIN(stock) FROM books) ORDER BY title;

-- 11. Total recorded order value. Confirm Total_Amount grain before calling it revenue.
SELECT SUM(total_amount) AS total_recorded_order_value FROM orders;

-- ADVANCED QUESTIONS

-- 1. Units sold and recorded order value by genre.
SELECT b.genre, SUM(o.quantity) AS units_sold,
       SUM(o.total_amount) AS recorded_order_value
FROM orders o JOIN books b ON b.book_id=o.book_id
GROUP BY b.genre
ORDER BY units_sold DESC;

-- 2. Average listed price of Fantasy books.
SELECT AVG(price) AS average_fantasy_price
FROM books WHERE genre='Fantasy';

-- 3. Customers with at least two order rows.
SELECT c.customer_id,c.name,COUNT(o.order_id) AS order_count,
       SUM(o.total_amount) AS recorded_spend
FROM orders o JOIN customers c ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.name
HAVING COUNT(o.order_id)>=2
ORDER BY order_count DESC,recorded_spend DESC;

-- 4. Most frequently ordered books: show order-row count separately from units.
SELECT b.book_id,b.title,b.author,
       COUNT(o.order_id) AS order_rows,
       SUM(o.quantity) AS units_ordered
FROM orders o JOIN books b ON b.book_id=o.book_id
GROUP BY b.book_id,b.title,b.author
ORDER BY order_rows DESC,units_ordered DESC
LIMIT 10;

-- 5. Top three most expensive Fantasy books.
SELECT * FROM books
WHERE genre='Fantasy'
ORDER BY price DESC,title
LIMIT 3;

-- 6. Total units sold by author.
SELECT b.author,SUM(o.quantity) AS units_sold,
       COUNT(DISTINCT o.order_id) AS order_rows,
       SUM(o.total_amount) AS recorded_order_value
FROM orders o JOIN books b ON b.book_id=o.book_id
GROUP BY b.author
ORDER BY units_sold DESC;

-- 7. Cities containing customers whose cumulative recorded spend exceeds 30.
WITH customer_spend AS (
    SELECT customer_id,SUM(total_amount) AS total_spend
    FROM orders
    GROUP BY customer_id
)
SELECT DISTINCT c.city,cs.customer_id,cs.total_spend
FROM customer_spend cs JOIN customers c ON c.customer_id=cs.customer_id
WHERE cs.total_spend>30
ORDER BY cs.total_spend DESC,c.city;

-- 8. Customer(s) with the highest recorded spend; retain ties.
WITH customer_spend AS (
    SELECT c.customer_id,c.name,SUM(o.total_amount) AS total_spend
    FROM customers c JOIN orders o ON o.customer_id=c.customer_id
    GROUP BY c.customer_id,c.name
)
SELECT * FROM customer_spend
WHERE total_spend=(SELECT MAX(total_spend) FROM customer_spend)
ORDER BY customer_id;

-- 9. Hypothetical stock remaining if Books.stock is the PRE-ORDER baseline
-- and orders contains all fulfilled orders in the same period.
-- If stock is already a current snapshot, do not subtract historical orders again.
SELECT b.book_id,b.title,b.stock AS stock_baseline,
       COALESCE(SUM(o.quantity),0) AS recorded_order_units,
       b.stock-COALESCE(SUM(o.quantity),0) AS hypothetical_remaining_stock
FROM books b LEFT JOIN orders o ON o.book_id=b.book_id
GROUP BY b.book_id,b.title,b.stock
ORDER BY b.book_id;
