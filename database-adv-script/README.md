# Join Queries Script

The `joins_queries.sql` file demonstrates how to use different SQL JOIN operations to retrieve related data from the Airbnb Clone database.

## Contents

- **`INNER JOIN` (Bookings and Users):**
  - Retrieves all bookings along with the users who made those bookings.
  - Only includes records where a booking has a matching user.
- **`LEFT JOIN` (Properties and Reviews):**
  - Retrieves all properties and their reviews.
  - Includes properties even if they have no reviews (review fields will be `NULL`).
- **`FULL OUTER JOIN` (Users and Bookings):**
  - Retrieves all users and all bookings, including users without bookings and bookings not linked to a user.
  - Fields from missing matches are filled with `NULL`s.
  - **Note**: MySQL does not support `FULL OUTER JOIN` natively, you may need to use a combination of `LEFT` and `RIGHT JOIN` with `UNION` for equivalent results.

## Usage

1. Ensure your database is set up and populated.
2. Run the queries in your SQL client or MySQL shell as needed.

```sh
mysql -u <user> -p <database> < joins_queries.sql
```

Or copy and execute individual queries interactively.

## Notes

- These queries are for demonstration and learning purposes.
- See comments in the SQL file for explanations of each JOIN type.
