# Spotify Advanced SQL Analytics

## Project Overview

This project uses a Spotify track dataset to demonstrate progressively more advanced SQL analysis—from filtering and aggregation to subqueries, CTEs, window functions, and query-performance investigation.

The objective is to answer business-style questions about track performance, artists, albums, engagement, and platform behavior while also demonstrating how SQL queries can be optimized.

## Dataset

The main table is `spotify`, containing track, artist, album, audio-feature, engagement, and platform-related fields such as:

- `artist`
- `track`
- `album`
- `album_type`
- `danceability`
- `energy`
- `liveness`
- `views`
- `likes`
- `comments`
- `stream`
- `licensed`
- `official_video`
- `most_played_on`

## Analytical Questions

### Basic

- Find tracks with more than 1 billion streams
- Count tracks by artist
- Identify single releases
- Calculate licensed-track comments

### Intermediate

- Calculate average danceability by album
- Find high-energy tracks
- Aggregate views by album
- Compare Spotify streams with YouTube views

### Advanced

- Find the top 3 viewed tracks for every artist
- Compare track liveness with the dataset average
- Calculate energy range by album using a CTE
- Identify tracks with a high energy-to-liveness ratio
- Calculate cumulative likes using a window function

## SQL Techniques

The project demonstrates:

- SELECT / WHERE / ORDER BY
- GROUP BY and aggregate functions
- Subqueries
- Common Table Expressions (CTEs)
- `ROW_NUMBER()` with `PARTITION BY`
- Windowed cumulative calculations
- NULL-safe division
- Conditional filtering
- Indexing and execution-plan analysis

Example — top 3 tracks per artist:

```sql
SELECT artist, track, views
FROM (
    SELECT
        artist,
        track,
        views,
        ROW_NUMBER() OVER (
            PARTITION BY artist
            ORDER BY views DESC
        ) AS rn
    FROM spotify
) t
WHERE rn <= 3;
```

## Query Optimization

The repository includes before/after `EXPLAIN` evidence to investigate the effect of indexing and query optimization.

This is important because the project is not limited to obtaining the correct answer—it also considers how SQL queries behave from a performance perspective.

## Repository Files

- `Query Solutions.sql` — analytical SQL queries
- `spotify_explain_before_index.png` — execution-plan evidence before indexing
- `spotify_explain_after_index.png` — execution-plan evidence after indexing
- `Spotify_SQL_Analytics.pdf` — supporting project document
- `spotify_graphical view *.png` — supporting visual outputs

## Tech Stack

**MySQL | SQL | CTEs | Window Functions | Subqueries | Query Optimization | EXPLAIN**
