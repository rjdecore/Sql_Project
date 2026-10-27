-- Netflix catalog analysis — PostgreSQL
-- Source table: netflix
-- Multi-valued country, listed_in and director/cast fields are comma-separated text.
-- These are catalog analyses; they do not measure viewing popularity or revenue.

-- Q1. Count Movies vs TV Shows.
SELECT type, COUNT(*) AS content_count
FROM netflix
GROUP BY type
ORDER BY content_count DESC;

-- Q2. Most frequent rating by content type; retain ties.
WITH rating_counts AS (
    SELECT type, rating, COUNT(*) AS rating_count
    FROM netflix
    WHERE rating IS NOT NULL
    GROUP BY type, rating
),
ranked AS (
    SELECT *, RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rating_rank
    FROM rating_counts
)
SELECT type, rating AS most_frequent_rating, rating_count
FROM ranked
WHERE rating_rank = 1
ORDER BY type;

-- Q3. Titles released in 2020.
SELECT show_id, title, type, release_year
FROM netflix
WHERE release_year = 2020
ORDER BY title;

-- Q4. Top five countries by distinct title count.
-- A multi-country title contributes once to each country listed.
WITH country_rows AS (
    SELECT n.show_id, BTRIM(c.country_name) AS country
    FROM netflix n
    CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(n.country, ',')) AS c(country_name)
    WHERE n.country IS NOT NULL AND BTRIM(c.country_name) <> ''
)
SELECT country, COUNT(DISTINCT show_id) AS title_count
FROM country_rows
GROUP BY country
ORDER BY title_count DESC, country
LIMIT 5;

-- Q5. Longest movies with parseable minute duration; retain top ten.
SELECT show_id, title, duration,
       SPLIT_PART(duration, ' ', 1)::INTEGER AS duration_minutes
FROM netflix
WHERE type = 'Movie' AND duration ~ '^[0-9]+ min$'
ORDER BY duration_minutes DESC, title
LIMIT 10;

-- Q6. Content added within the last five years.
-- Filter date strings to the expected format before conversion.
SELECT show_id, title, type, date_added
FROM netflix
WHERE date_added ~ '^[A-Za-z]+ [0-9]{1,2}, [0-9]{4}$'
  AND TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'
ORDER BY TO_DATE(date_added, 'Month DD, YYYY') DESC;

-- Q7. Titles credited to director Rajiv Chilaka.
SELECT n.show_id, n.title, n.type, n.release_year
FROM netflix n
WHERE EXISTS (
    SELECT 1
    FROM UNNEST(STRING_TO_ARRAY(COALESCE(n.director, ''), ',')) d(director_name)
    WHERE BTRIM(d.director_name) = 'Rajiv Chilaka'
)
ORDER BY n.release_year DESC, n.title;

-- Q8. TV shows with more than five seasons.
SELECT show_id, title, duration,
       SPLIT_PART(duration, ' ', 1)::INTEGER AS seasons
FROM netflix
WHERE type = 'TV Show'
  AND duration ~ '^[0-9]+ Seasons?$'
  AND SPLIT_PART(duration, ' ', 1)::INTEGER > 5
ORDER BY seasons DESC, title;

-- Q9. Title count by genre.
-- A title can belong to multiple listed genres.
WITH genre_rows AS (
    SELECT n.show_id, BTRIM(g.genre_name) AS genre
    FROM netflix n
    CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(n.listed_in, ',')) g(genre_name)
    WHERE n.listed_in IS NOT NULL AND BTRIM(g.genre_name) <> ''
)
SELECT genre, COUNT(DISTINCT show_id) AS title_count
FROM genre_rows
GROUP BY genre
ORDER BY title_count DESC, genre;

-- Q10. Top five release years by India-linked title count.
-- This reports annual counts and share; it is not an average release count.
WITH india_titles AS (
    SELECT DISTINCT n.show_id, n.release_year
    FROM netflix n
    CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(COALESCE(n.country, ''), ',')) c(country_name)
    WHERE BTRIM(c.country_name) = 'India'
      AND n.release_year IS NOT NULL
),
annual AS (
    SELECT release_year, COUNT(*) AS title_count
    FROM india_titles
    GROUP BY release_year
)
SELECT release_year, title_count,
       ROUND(100.0 * title_count / NULLIF(SUM(title_count) OVER (), 0), 2) AS share_of_india_titles_pct
FROM annual
ORDER BY title_count DESC, release_year DESC
LIMIT 5;

-- Q11. Titles listed under Documentaries.
SELECT show_id, title, type, listed_in
FROM netflix
WHERE listed_in ILIKE '%Documentaries%'
ORDER BY title;

-- Q12. Titles without director metadata.
SELECT show_id, title, type
FROM netflix
WHERE director IS NULL OR BTRIM(director) = ''
ORDER BY title;

-- Q13. Movies with Salman Khan in the cast and released within the last ten years.
SELECT show_id, title, release_year
FROM netflix
WHERE type = 'Movie'
  AND casts ILIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE)::INTEGER - 10
ORDER BY release_year DESC, title;

-- Q14. Top ten actors by appearances in India-linked titles.
WITH india_titles AS (
    SELECT DISTINCT n.show_id, n.casts
    FROM netflix n
    CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(COALESCE(n.country, ''), ',')) c(country_name)
    WHERE BTRIM(c.country_name) = 'India'
),
actor_rows AS (
    SELECT i.show_id, BTRIM(a.actor_name) AS actor
    FROM india_titles i
    CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(COALESCE(i.casts, ''), ',')) a(actor_name)
    WHERE BTRIM(a.actor_name) <> ''
)
SELECT actor, COUNT(DISTINCT show_id) AS title_count
FROM actor_rows
GROUP BY actor
ORDER BY title_count DESC, actor
LIMIT 10;

-- Q15. Description keyword flag.
-- This is a simple text rule, not a content-safety or suitability classifier.
SELECT keyword_flag, type, COUNT(*) AS content_count
FROM (
    SELECT type,
           CASE
               WHEN description ILIKE '%kill%' OR description ILIKE '%violence%'
                   THEN 'Keyword match'
               ELSE 'No keyword match'
           END AS keyword_flag
    FROM netflix
) AS classified
GROUP BY keyword_flag, type
ORDER BY type, keyword_flag;
