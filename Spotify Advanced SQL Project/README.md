# Spotify Advanced SQL Analytics

## Business objective
Analyze track, artist and album attributes alongside stream, view, like and comment metrics. The project progresses from basic filters and aggregation to subqueries, CTEs and window functions.

## Business questions
- Which tracks exceed one billion streams?
- Which artists and albums have the most recorded tracks?
- What is the engagement volume for licensed tracks and official videos?
- Which albums have higher average danceability or wider energy ranges?
- Which tracks have the highest energy or liveness values?
- How do recorded Spotify streams compare with YouTube views?
- Which tracks rank in the top three views for each artist?
- How concentrated are views and likes across the available rows?

## SQL solutions and findings
The [Spotify SQL Solutions & Findings notebook](Spotify_SQL_Solutions_Findings.ipynb) runs the analysis against the `spotify` table, displays results and generates findings from returned rows. It includes data checks, row-level counts, top-track rankings, album aggregates and a deterministic cumulative-likes calculation.

## Dataset and reproducibility
The source table is `spotify`. Expected columns include `artist`, `track`, `album`, `album_type`, `danceability`, `energy`, `liveness`, `views`, `likes`, `comments`, `stream`, `licensed`, `official_video` and `most_played_on`.

Set MySQL connection variables in the environment and run the notebook against a populated table. Check missing values and duplicate track rows before presenting exact totals. The notebook does not fabricate outputs if the source data is unavailable.

## Query optimization
The repository includes before/after EXPLAIN screenshots. They are evidence for a query-plan investigation, but claims about measured runtime improvement should be backed by comparable execution timings and plan details. An index is not automatically faster for every query.

## Interpretation notes
- Spotify streams and YouTube views may have different metric definitions and should be compared cautiously.
- A track-level row count may include duplicates or multiple records for the same track.
- Audio features such as energy and liveness are not direct measures of audience preference.
- Cumulative likes are a running total across ordered rows, not an album or artist aggregate.

## Files
- [SQL query solutions](Query%20Solutions.sql)
- [SQL solutions and findings notebook](Spotify_SQL_Solutions_Findings.ipynb)
- [Spotify SQL analytics PDF](Spotify_SQL_Analytics.pdf)
- [EXPLAIN before indexing](spotify_explain_before_index.png)
- [EXPLAIN after indexing](spotify_explain_after_index.png)

## Stack
MySQL 8.0+, CTEs, subqueries, window functions, ranking, aggregates, EXPLAIN and query-performance analysis.
