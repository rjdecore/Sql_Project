# 🦈 Shark Tank India SQL Project

## Project Overview

**Project Title**: Shark Tank India Data Analysis  
**Level**: Intermediate–Advanced  
**Database**: `sharktank`  

This project explores investment patterns, startup performance, and market insights from **Shark Tank India** datasets. It involves **data cleaning in Python** to prepare the raw CSV files, followed by advanced SQL analysis to answer business-driven questions.  

The project demonstrates real-world SQL applications such as **aggregations, window functions, stored procedures, and investment simulations**.  

---

## Data Cleaning (Python)

Before analysis, the raw `sharktank.csv` required preprocessing in **Python (Pandas)**:  
- ✅ **Removed nulls & inconsistencies** (e.g., `Not Mentioned` values in sales/revenue columns).  
- ✅ **Standardized column names** to remove spaces/special characters.  
- ✅ **Converted numeric fields** (e.g., investments, revenues) from text to integers/floats.  
- ✅ **Handled categorical fields** (yes/no → boolean for `Received_Offer` and `Accepted_Offer`).  
- ✅ **Exported cleaned dataset** as `sharktank_cleaned.csv`, then loaded into MySQL with `LOAD DATA INFILE`.  

---

## Objectives

1. **Funding Trends**: Identify the highest funded industries per season.  
2. **Diversity**: Find industries with female-to-male pitcher ratio > 70%.  
3. **Conversion Funnel**: Track pitches → offers received → offers converted, with conversion percentages.  
4. **Top Performing Seasons**: Determine season with the highest average monthly sales and top 5 industries in that season.  
5. **Growth Analysis**: Identify industries with consistent funding growth across all seasons.  
6. **Return on Investment (ROI)**: Create a procedure to calculate how many years sharks will take to recover their investments.  
7. **Investor Behavior**: Compare sharks to see who invests the most per deal on average.  
8. **Custom Procedure**: Build a procedure that takes season & shark name as input and outputs investment distribution across industries.  
9. **Diversification**: Identify which shark has the most diversified portfolio across industries and locations.  
10. **Indexing in MySQL**: Explain and discuss how indexes improve query performance.  

---

## Example Queries

**1. Highest funding per industry (season 4):**
```sql
SELECT * 
FROM (
    SELECT industry,
           total_deal_amount_in_lakhs,
           ROW_NUMBER() OVER(PARTITION BY industry ORDER BY total_deal_amount_in_lakhs DESC) AS rnk
    FROM sharktank
) t
WHERE rnk = 1;
```

**2. Female >70% pitcher ratio per industry:**
```sql
SELECT industry,
       SUM(female_presenters) AS female,
       SUM(male_presenters) AS male,
       (SUM(female_presenters)/SUM(male_presenters))*100 AS ratio
FROM sharktank
GROUP BY industry
HAVING SUM(female_presenters) > 0 
   AND SUM(male_presenters) > 0
   AND ratio > 70;
```

**3. Conversion funnel (per season):**
```sql
SELECT k.season_number, 
       k.total_pitches, 
       m.pitches_received,
       (pitches_received/total_pitches)*100 AS pct_received, 
       l.pitches_converted,
       (pitches_converted/pitches_received)*100 AS pct_converted
FROM (
    SELECT season_number, COUNT(startup_name) AS total_pitches
    FROM sharktank 
    GROUP BY season_number
) k
JOIN (
    SELECT season_number, COUNT(startup_name) AS pitches_received
    FROM sharktank 
    WHERE received_offer='Yes'
    GROUP BY season_number
) m ON k.season_number = m.season_number
JOIN (
    SELECT season_number, COUNT(startup_name) AS pitches_converted
    FROM sharktank 
    WHERE accepted_offer='Yes'
    GROUP BY season_number
) l ON m.season_number = l.season_number;
```

---

## Key Findings

- 📈 **Industry Leaders**: Certain industries dominate funding each season.  
- 👩 **Diversity**: Some industries have a high female-to-male founder ratio, highlighting inclusivity trends.  
- 🏆 **Seasonal Trends**: One season clearly outperforms others in terms of monthly sales.  
- 💰 **Investor Patterns**: Different sharks show varying average investment sizes and levels of portfolio diversification.  
- 🛡️ **Decision Support**: ROI and distribution procedures give investors practical insights into funding outcomes.  

---

## How to Use

1. **Clean the Dataset**: Use Python (Pandas) scripts to preprocess raw `sharktank.csv`.  
2. **Load into MySQL**: Run `LOAD DATA INFILE` with the cleaned CSV into `sharktank` table.  
3. **Run SQL Scripts**: Execute queries from `sharktank.sql` to reproduce the analyses.  
4. **Test Procedures**: Try out the stored procedures (`TOT`, `getseasoninvestment`) for ROI and shark-level analysis.  
5. **Explore Indexing**: Experiment with adding indexes on `industry`, `season_number`, and `sharkname` to optimize queries.  

---

## Author

This project is part of my SQL journey, combining **data cleaning in Python** with **advanced SQL problem-solving** to simulate real business analysis for Shark Tank India.  

🔗 [LinkedIn](https://linkedin.com) | [GitHub](https://github.com/your-username)  

---

✨ *This project blends database preparation, analytical SQL, and business insight generation — valuable skills for data analysts and data scientists.*
