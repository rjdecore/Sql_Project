# 🚗 Exploring Trends in the Automotive Industry – SQL Project

## Project Overview

**Project Title**: Automotive Industry Data Analysis  
**Level**: Intermediate  
**Database**: `cars_info`  

This project analyzes car sales and performance data to uncover insights about **selling prices, mileage, ownership trends, and transmission types**.  
It uses advanced SQL queries including **window functions, CTEs, and analytical conditions** to derive business insights from raw automotive data.  

---

## Dataset

The analysis is performed on the `car_info` table with the following key fields:

| Column          | Description |
|-----------------|-------------|
| Name            | Car model name |
| year            | Manufacturing year |
| selling_price   | Selling price of the car |
| km_driven       | Kilometers driven |
| fuel            | Fuel type (Petrol/Diesel/CNG/etc.) |
| seller_type     | Type of seller (Dealer/Individual) |
| transmission    | Transmission type (Manual/Automatic) |
| owner           | Ownership type (First Owner/Second Owner/etc.) |
| mileage         | Car mileage (km/litre or equivalent) |
| seats           | Number of seats in the car |

---

## Key Analyses & Queries

1. **Average Selling Price** – For manual, first-owner cars grouped by fuel type.  
2. **Top Mileage Cars** – Top 3 models with highest average mileage (for cars with >5 seats).  
3. **Price Range Outliers** – Models where price difference > $10,000.  
4. **Above Avg Price & Below Avg Mileage** – Cars outperforming in price but underperforming in mileage.  
5. **Cumulative Selling Price** – Running total of selling prices over years by model.  
6. **Cars Near Avg Price** – Cars priced within 10% of overall average selling price.  
7. **Exponential Moving Average (EMA)** – Trend of selling prices with a smoothing factor (0.2).  
8. **Yearly Price Drops** – Cars that saw price decreases compared to previous year.  
9. **Highest Mileage by Transmission** – Car with maximum mileage for each transmission type.  
10. **Top Selling Cars per Year** – Average price per year for top 3 models with highest overall selling prices.  

---

## Example Queries

**Average selling price by fuel type (Manual & First Owner):**
```sql
SELECT fuel, AVG(selling_price) AS avg_selling_price
FROM car_info
WHERE transmission = 'Manual' AND owner = 'First Owner'
GROUP BY fuel;
