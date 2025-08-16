create database Zepto_data;
use Zepto_data;
select * from Zepto limit 10;
-- chaning col name Category ï»¿Category to Category
ALTER TABLE Zepto CHANGE COLUMN `ï»¿Category` Category VARCHAR(255);
-- adding a colum sku_id which is unique id 
ALTER TABLE Zepto
ADD COLUMN sku_id INT PRIMARY KEY AUTO_INCREMENT first;


ALTER TABLE Zepto
modify column mrp  decimal(10,2);

ALTER TABLE Zepto
modify column discountedSellingPrice  decimal(10,2);



-- Checking Null
SELECT COUNT(*) AS rows_with_nulls
FROM Zepto
WHERE Category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR availableQuantity IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

-- so no missing Data
-- check for Diffrent Product Categorycategory 
select  
      distinct(Category) as Category 
from 
    zepto
order by
        Category;
-- so we have 14 unique Category

-- Compare in-stock vs out-of-stock product counts
SELECT 
  CASE 
    WHEN outOfStock = 'FALSE' THEN 'In Stock'
    ELSE 'Out of Stock'
  END AS Stock_Status,
  COUNT(*) AS Stock_Record
FROM Zepto
GROUP BY Stock_Status;
;

-- Product name present Multiple Times
select
	 name,
     count(sku_id) as num_of_sku
from 
     zepto
group by
        name 
having
      count(sku_id)>1
order by
       num_of_sku desc; 
-- Data Cleaning
-- Remove rows where mrp and discountedSellingPrice is Zero
select * 
from 
    zepto
where 
     mrp =0 or discountedSellingPrice =0;

SET SQL_SAFE_UPDATES = 0;

 -- deleting the records    
delete from zepto 
where mrp=0 ;

-- coverting mrp and discounted selling price into rupes 
UPDATE Zepto
SET 
  mrp = mrp / 100,
  discountedSellingPrice = discountedSellingPrice / 100;
  
-- Business Problem answers
select * from zepto;
-- Found top 10 best-value products based on discount percentage
SELECT distinct(name) as "Name", mrp, discountedSellingPrice, discountPercent
FROM Zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- Identified high-MRP products that are currently out of stock
SELECT distinct(name), mrp, outOfStock
FROM Zepto
WHERE mrp > 300 AND outOfStock = 'TRUE'
ORDER BY mrp DESC;


-- Estimated potential revenue for each product category
select Category,
	   sum(discountedSellingPrice *availableQuantity) as 'Total_Revenue'
from zepto 
group by Category
order by revenue desc;

-- Filtered expensive products (MRP > ₹500) with minimal discount(10%)
SELECT distinct (name), mrp, discountedSellingPrice,discountPercent
FROM Zepto
WHERE mrp > 500 AND discountPercent < 10
order by mrp desc,discountPercent desc;


-- Ranked top 5 categories offering highest average discounts
select Category,round(avg(discountPercent),2) as avg_discount
from zepto 
group by Category
order by avg_discount Desc limit 5;

-- Calculated price per gram  for products above 100 gm to identify value-for-money products
SELECT name, discountedSellingPrice, weightInGms,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM Zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;  -- Lower = better value


-- Grouped products based on weight into Low, Medium, and Bulk categories
SELECT *,
  CASE 
    WHEN weightInGms <= 250 THEN 'Low'
    WHEN weightInGms BETWEEN 251 AND 999 THEN 'Medium'
    ELSE 'Bulk'
  END AS weight_category
FROM Zepto;


-- Measured total inventory weight per product category
SELECT Category,
       SUM(availableQuantity * weightInGms) AS total_inventory_weight_gms
FROM Zepto
GROUP BY Category
ORDER BY total_inventory_weight_gms DESC;




