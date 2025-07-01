# ALX Airbnb Clone Database

This repository contains the database schema and seed scripts for the ALX Airbnb Clone project. It is organized to support a robust, normalized relational database for an Airbnb-like platform, including user management, property listings, bookings, payments, reviews, and messaging.

## Structure

- **database-script-0x01/**
  Contains the main database schema (`schema.sql`) and a detailed README describing the tables, normalization, and usage.

- **database-script-0x02/**
  Contains the seed script (`seed.sql`) to populate the database with sample data for development and testing, along with a README explaining the sample data.

- **ERD/**
  Contains entity-relationship diagrams and requirements documentation.

- **database-adv-script/**
  Advanced SQL scripts demonstrating joins, subqueries, aggregations, window functions, indexing, partitioning, and performance optimization. Each script is documented with its own README or report.

## Getting Started

1. **Set up your database:**
   Run the schema script to create all tables and indexes.

   ```sh
   mysql -u <user> -p <database> < database-script-0x01/schema.sql
   ```

2. **Seed the database (optional):**
   Populate with sample data for testing.

   ```sh
   mysql -u <user> -p <database> < database-script-0x02/seed.sql
   ```

3. **Explore advanced scripts (optional):**
   Review and run advanced SQL examples for learning and performance testing.

   ```sh
   mysql -u <user> -p <database> < database-adv-script/joins_queries.sql
   mysql -u <user> -p <database> < database-adv-script/subqueries.sql
   mysql -u <user> -p <database> < database-adv-script/aggregations_and_window_functions.sql
   mysql -u <user> -p <database> < database-adv-script/database_index.sql
   mysql -u <user> -p <database> < database-adv-script/partitioning.sql
   ```

4. **See individual directories for more details:**
   Each directory contains its own README with specifics about its contents and usage.

## Notes

- Scripts are designed for MySQL.
- Sample data is for development/testing only.
- For more information on the schema or seed data, refer to the README files in each directory.

---
