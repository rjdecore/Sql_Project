# Library Management System — SQL

## Business Objective
A relational SQL case study for managing library branches, employees, members, books, issues, and returns while generating operational reports.

## What This Project Demonstrates
- Relational database design and foreign keys
- CRUD operations
- Multi-table joins
- CTAS summary tables
- Aggregations and business reporting
- Date-based analysis and overdue tracking
- Stored procedures for issue/return workflows

## Core Tables
`branch`, `employees`, `members`, `books`, `issued_status`, and `return_status`.

## Business Questions
- Which books are issued most frequently?
- Which members have overdue books?
- Which employees process the most issues?
- What is rental revenue by branch/category?
- Which books have not yet been returned?
- Which members are active?
- How can book availability be updated automatically after issue/return?

## Advanced SQL
The project includes CTAS, joins, conditional logic, date calculations, branch-level reporting, and stored procedures for issuing and returning books.

## Tech Stack
**SQL | Relational Database Design | Joins | Aggregations | CTAS | Stored Procedures | Business Reporting**

## Findings to Report
The query outputs can show the most frequently issued books, overdue/unreturned items, active members, employee issue activity and branch/category revenue. Populate any numeric finding only after running the supplied SQL against the included schema and data.

## Business Value
Library staff can monitor circulation, follow up on overdue items, improve book availability and compare branch activity.

## Report Artifact
No project-specific PDF was identified in the repository listing; the SQL solution and schema are the primary reproducible artifacts.
