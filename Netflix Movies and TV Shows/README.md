# Netflix Movies & TV Shows — SQL Analysis

## Business Objective
Analyze Netflix's content catalog to understand content mix, ratings, geography, release trends, genres, directors, actors, and content characteristics.

## Dataset
The `netflix` table contains fields such as title, type, director, cast, country, release year, rating, duration, genre, and description.

## Business Questions
- What is the split between Movies and TV Shows?
- What ratings are most common for each content type?
- Which countries contribute the most content?
- Which movies are longest?
- Which shows have more than five seasons?
- Which genres are most represented?
- Which directors and actors appear most frequently?
- How has content production changed over time?
- How can description keywords be classified?

## SQL Techniques
- Aggregations and filtering
- CTEs
- Window functions and ranking
- String splitting
- Date calculations
- Conditional classification
- Top-N analysis

## Interview Value
This project is useful for explaining how messy multi-valued fields such as countries, genres, directors, and cast can be transformed into analytical outputs.

## Tech Stack
**SQL | CTEs | Window Functions | String Functions | Date Analysis | EDA**

## Findings to Report
Queries surface the movie/TV-show mix, common ratings, represented countries and genres, long-running shows, frequent directors/actors and release-year patterns. These describe the catalog, not audience popularity or viewing performance.

## Business Value
Content teams can understand catalog composition and identify areas for further content-market research.

## Report Artifact
No project-specific PDF was identified in the repository listing. SQL solutions and source data are the reproducible artifacts.


## Reproducibility Note
The committed `netflix_titles.csv` currently appears to be an empty placeholder (2 bytes in the repository tree). Restore the actual source CSV before running the SQL case study; the README's analytical questions do not substitute for source data.
