# Netflix Movies & TV Shows — SQL Analysis

## Business objective
Analyze the catalog's content mix, ratings, countries, genres, release years, duration, contributors and description metadata.

## Questions and business use
- Movie vs TV Show mix — understand catalog composition.
- Most frequent rating by content type — review the maturity-rating mix.
- Titles released in a selected year — inspect catalog release cohorts.
- Top countries and genres — compare represented catalog markets and content categories.
- Longest movies and TV shows with more than five seasons — understand duration and series depth.
- Recently added titles — review additions by platform date-added field.
- Directors and actors — explore credited contributors.
- Missing director metadata — identify catalog completeness gaps.
- Description keyword classification — demonstrate rule-based text categorisation, not content safety scoring.

## SQL solutions and findings
The [Netflix SQL Solutions & Findings notebook](Netflix_SQL_Solutions_Findings.ipynb) contains executable PostgreSQL queries for all 15 questions, result tables and data-driven findings. It also corrects the country/genre analysis to split multi-valued fields and counts distinct titles, and distinguishes annual title counts from percentage share.

## Dataset and reproducibility
The main table is `netflix`, with fields such as `show_id`, `title`, `type`, `director`, `cast`, `country`, `release_year`, `rating`, `duration`, `listed_in`, `date_added` and `description`.

**Important:** the repository's `netflix_titles.csv` was previously found to be a 2-byte placeholder. Restore the actual dataset and load it into PostgreSQL before running the SQL or notebook. No catalog counts or top-country results should be presented as verified until this source-data check passes.

## Interpretation notes
- Country and genre fields can contain multiple comma-separated values. A title may contribute to more than one country or genre.
- Release year and date added answer different questions.
- Catalog presence does not measure viewership, popularity, revenue or audience satisfaction.
- Keyword rules can miss context and should not be interpreted as a safety or quality classifier.

## Files
- [15 SQL solutions](Solutions%20of%2015%20business%20problems.sql)
- [Business question list](Business%20Problems%20Netflix.sql)
- [SQL solutions and findings notebook](Netflix_SQL_Solutions_Findings.ipynb)

## Stack
PostgreSQL, CTEs, window functions, string splitting, date functions, ranking and data interpretation.
