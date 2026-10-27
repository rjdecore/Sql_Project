# SQL Mentor User Performance Analysis

## Business Objective
Analyze user submissions from an online learning platform to understand activity, points, correctness, and performance rankings over time.

## Dataset
The submission data includes:
- User ID / username
- Question ID
- Points earned
- Submission timestamp

## Business Questions
- How many submissions and points does each user have?
- What is each user's daily average score?
- Who are the top performers each day?
- Which users have the most incorrect submissions?
- Who are the top performers each week?

## SQL Techniques
- COUNT, SUM, AVG
- Conditional aggregation with CASE
- Date extraction
- GROUP BY
- DENSE_RANK()
- CTEs
- Daily and weekly ranking

## Interview Value
A useful practice project for explaining ranking problems, conditional aggregation, and time-based user-performance analysis.

## Tech Stack
**SQL | CTEs | Window Functions | Conditional Aggregation | Date Analysis**

## Findings & Business Value
Query outputs can identify users with the most submissions/points, top daily and weekly performers, average daily scores and users with many incorrect submissions. Report exact names and scores only from the executed query results.

## Business Value
Learning-platform teams can monitor engagement and performance, spot users who may need support and recognize consistently active learners. Scores should be interpreted alongside participation and question difficulty.

## Report Artifact
No project-specific PDF was identified in the folder; the SQL script and dataset are the reproducible artifacts.
