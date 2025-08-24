# 📱 Playstore SQL Project

## Project Overview

**Project Title**: Google Playstore Data Analysis  
**Level**: Intermediate  
**Database**: `playstore`

This project analyzes a dataset of mobile applications from the Google Playstore. The aim is to explore app performance, revenue patterns, category trends, and user engagement using SQL. The project also demonstrates the use of triggers, stored procedures, and functions to handle real-world data management scenarios.

---

## Objectives

1. **Database Setup**: Load Playstore data into a SQL database and clean column names.
2. **Exploratory Analysis**: Explore categories, ratings, installs, and app pricing.
3. **Business Insights**: Answer strategic questions about categories, revenues, and ratings.
4. **Data Security & Monitoring**: Implement triggers to log malicious changes (hack scenario).
5. **Advanced SQL**: Use procedures, functions, and correlation analysis for deeper insights.

---

## Project Structure

- **Database Creation & Cleaning**  
  - Load Playstore data (`.csv`) into the database.  
  - Standardize column names (`Content_Rating`, `Current_Ver`, `Android_Ver`).  

- **Analysis Queries**  
  1. Top 5 categories for launching new free apps based on average ratings.  
  2. Top 3 categories generating highest revenue from paid apps.  
  3. Percentage of games within each category.  
  4. Free vs. Paid app recommendation for each category based on ratings.  
  5. Track price changes using triggers (cybersecurity simulation).  
  6. Restore original prices after hack attack.  
  7. Calculate correlation between ratings and number of reviews.  
  8. Clean multi-genre columns into two separate genres.  
  9. Dynamic procedure to flag underperforming apps (below category average).  
  10. Explain **Duration Time vs Fetch Time** in SQL query execution.  

---

## Example Queries

**1. Top 5 categories for free apps based on average ratings:**
```sql
SELECT category, ROUND(AVG(rating), 2) AS avg_rating
FROM playstore
WHERE type = 'Free'
GROUP BY category
ORDER BY avg_rating DESC
LIMIT 5;
```

**2. Create a trigger to log price changes (after update):**
```sql
DELIMITER //
CREATE TRIGGER price_change_update
AFTER UPDATE ON play
FOR EACH ROW
BEGIN
    INSERT INTO PriceChangeLog (app, old_price, new_price, operation_type, operation_date)
    VALUES (NEW.app, OLD.price, NEW.price, 'update', CURRENT_TIMESTAMP);
END;
//
DELIMITER ;
```

---

## Key Findings

- **Category Insights**: Certain app categories consistently show higher ratings for free apps, making them promising for new launches.  
- **Revenue Patterns**: Paid apps in a few categories dominate revenue generation.  
- **App Performance**: Dynamic procedures help quickly flag apps underperforming within their category.  
- **Data Security**: Trigger-based logging protects against malicious updates, enabling recovery of original values.  
- **Advanced Techniques**: Functions split multi-genre fields, and correlation analysis reveals relationships between ratings and reviews.  

---

## How to Use

1. **Set up the Database**: Run `Playstore.sql` to create tables, clean columns, and load data.  
2. **Run Queries**: Execute the provided SQL queries to answer the analysis questions.  
3. **Test Security**: Simulate price changes and verify that the trigger logs updates in `PriceChangeLog`.  
4. **Explore**: Use the stored procedure `checking()` to dynamically evaluate underperforming apps by category.  

---

## Author

This project is part of my SQL learning journey, showcasing the application of **intermediate to advanced SQL skills** in real-world scenarios such as business analysis and database security.  

Feel free to ⭐ the repo, suggest improvements, or connect with me for collaboration!  

🔗 [LinkedIn](https://linkedin.com) | [GitHub](https://github.com/your-username)  

---

✨ *This project demonstrates not just SQL querying skills, but also database management, security handling, and advanced SQL features like triggers, procedures, and functions.*
