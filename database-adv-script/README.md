# Advanced Query Scripts

This directory contains SQL scripts demonstrating advanced query techniques on the Airbnb Clone database.

## Contents

- **`joins_queries.sql`:**

  - Demonstrates different SQL JOIN operations to retrieve related data.
    - **`INNER JOIN` (Bookings and Users):** Retrieves all bookings with their users (only matching records).
    - **`LEFT JOIN` (Properties and Reviews):** Retrieves all properties and their reviews, including properties with no reviews.
    - **`FULL OUTER JOIN` (Users and Bookings):** Retrieves all users and all bookings, including unmatched records.
      _Note: MySQL does not support `FULL OUTER JOIN` natively; use `LEFT JOIN`/`RIGHT JOIN` with `UNION` for equivalent results._

- **`subqueries.sql`:**

  - Demonstrates the use of subqueries (both non-correlated and correlated).
    - **Non-correlated subquery:**
      - Lists all properties where the average rating is greater than 4.0.
      - The subquery calculates average ratings per property, the outer query filters based on this result.
    - **Correlated subquery:**
      - Lists users who have made more than 3 bookings.
      - The subquery counts bookings per user and is evaluated for each user row.

- **`aggregations_and_window_functions.sql`:**

  - Demonstrates aggregation and window functions.
    - **Aggregations:**
      - Retrieves the total number of bookings made by each user, including users with no bookings.
      - Retrieves the total number of bookings for each property, including properties with no bookings.
    - **Window Functions:**
      - Uses `ROW_NUMBER()` and `RANK()` to assign row numbers and ranks to properties based on the total number of bookings, allowing easy identification of the most booked properties.

- **`database_index.sql`:**

  - Shows how to create indexes on frequently queried columns to improve query performance.
  - Includes example usage of `EXPLAIN ANALYZE` to compare query performance before and after indexing.

- **`partitioning.sql`:**

  - Demonstrates how to partition the `booking` table by year using MySQL's `RANGE` partitioning.
  - Explains the benefits of partitioning for query performance and data management.

- **`perfomance.sql`:**

  - Compares unoptimized and optimized queries for retrieving booking and related data.
  - Highlights best practices such as using explicit JOINs and selecting only necessary columns.

- **Reports and Documentation:**
  - `index_performance.md`: Summarizes the impact of adding indexes, with visual evidence.
  - `partition_performance.md`: Explains the benefits and use cases of table partitioning.
  - `optimization_report.md`: Reviews query optimization strategies and their impact.

## Usage

1. Ensure your database is set up and populated.
2. Run the queries in your SQL client or MySQL shell as needed.

```sh
mysql -u <user> -p <database> < joins_queries.sql
mysql -u <user> -p <database> < subqueries.sql
mysql -u <user> -p <database> < aggregations_and_window_functions.sql
mysql -u <user> -p <database> < database_index.sql
mysql -u <user> -p <database> < partitioning.sql
mysql -u <user> -p <database> < perfomance.sql
```

Or copy and execute individual queries interactively.

## Notes

- These queries are for demonstration and learning purposes.
- See comments in each SQL file for explanations of the query logic.
