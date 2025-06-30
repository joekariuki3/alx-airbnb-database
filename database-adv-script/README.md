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

## Usage

1. Ensure your database is set up and populated.
2. Run the queries in your SQL client or MySQL shell as needed.

```sh
mysql -u <user> -p <database> < joins_queries.sql
mysql -u <user> -p <database> < subqueries.sql
```

Or copy and execute individual queries interactively.

## Notes

- These queries are for demonstration and learning purposes.
- See comments in each SQL file for explanations of the query logic.
