-- Zepto e-commerce pricing and inventory analysis
-- Dialect: MySQL 8.0+
-- Assumes source table zepto is already loaded.
-- Safety: no DELETE or UPDATE against the raw source table.
-- IMPORTANT: this view assumes source prices are in paise, based on the original project comments.
-- If the imported data is already in rupees, remove the / 100.0 conversions.

CREATE OR REPLACE VIEW zepto_analysis AS
SELECT
    sku_id,
    category,
    name,
    mrp / 100.0 AS mrp_rupees,
    discountPercent,
    availableQuantity,
    discountedSellingPrice / 100.0 AS selling_price_rupees,
    weightInGms,
    outOfStock,
    quantity
FROM zepto
WHERE mrp > 0
  AND discountedSellingPrice >= 0;

-- Source profile: inspect quality issues before making cleaning decisions.
SELECT COUNT(*) AS source_rows,
       COUNT(DISTINCT sku_id) AS distinct_skus,
       SUM(mrp IS NULL) AS missing_mrp_rows,
       SUM(mrp = 0) AS zero_mrp_rows,
       SUM(discountedSellingPrice = 0) AS zero_selling_price_rows
FROM zepto;

-- Stock availability.
SELECT
    CASE WHEN outOfStock = TRUE THEN 'Out of stock'
         WHEN outOfStock = FALSE THEN 'In stock'
         ELSE 'Unknown' END AS stock_status,
    COUNT(*) AS sku_count
FROM zepto
GROUP BY stock_status
ORDER BY sku_count DESC;

-- Repeated product names may represent different SKUs/pack sizes.
SELECT name, COUNT(*) AS sku_count
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY sku_count DESC, name;

-- Q1. Top 10 products by discount percentage.
SELECT name, category, mrp_rupees, selling_price_rupees, discountPercent
FROM zepto_analysis
WHERE discountPercent IS NOT NULL
ORDER BY discountPercent DESC, name
LIMIT 10;

-- Q2. High-MRP products currently out of stock.
SELECT name, category, mrp_rupees, availableQuantity
FROM zepto_analysis
WHERE outOfStock = TRUE AND mrp_rupees > 300
ORDER BY mrp_rupees DESC;

-- Q3. Estimated on-hand inventory value by category.
-- This is potential stock value, not realized revenue.
SELECT category,
       SUM(selling_price_rupees * availableQuantity) AS estimated_inventory_value_rupees,
       SUM(availableQuantity) AS units_available
FROM zepto_analysis
GROUP BY category
ORDER BY estimated_inventory_value_rupees DESC;

-- Q4. High-MRP products with discounts below 10%.
SELECT name, category, mrp_rupees, selling_price_rupees, discountPercent
FROM zepto_analysis
WHERE mrp_rupees > 500 AND discountPercent < 10
ORDER BY mrp_rupees DESC, discountPercent;

-- Q5. Categories with the highest average discount.
SELECT category, ROUND(AVG(discountPercent), 2) AS avg_discount_pct,
       COUNT(*) AS sku_count
FROM zepto_analysis
GROUP BY category
ORDER BY avg_discount_pct DESC
LIMIT 5;

-- Q6. Unit price per gram for products of at least 100g.
SELECT name, category, weightInGms, selling_price_rupees,
       ROUND(selling_price_rupees / NULLIF(weightInGms, 0), 4) AS rupees_per_gram
FROM zepto_analysis
WHERE weightInGms >= 100
ORDER BY rupees_per_gram, name;

-- Q7. Product weight bands.
SELECT name, weightInGms,
       CASE WHEN weightInGms < 1000 THEN 'Low (<1kg)'
            WHEN weightInGms < 5000 THEN 'Medium (1-<5kg)'
            ELSE 'Bulk (5kg+)' END AS weight_band
FROM zepto_analysis
WHERE weightInGms IS NOT NULL;

-- Q8. Estimated inventory weight by category.
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_inventory_weight_gms,
       SUM(availableQuantity) AS units_available
FROM zepto_analysis
WHERE weightInGms IS NOT NULL AND availableQuantity IS NOT NULL
GROUP BY category
ORDER BY total_inventory_weight_gms DESC;

-- Business interpretation:
-- Use discount, selling price, stock status, units and inventory weight together.
-- Validate price units, stock freshness, pack sizes and margin before action.
