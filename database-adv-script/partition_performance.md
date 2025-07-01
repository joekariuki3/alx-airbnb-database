# Partitioning Performance Report

This report explains the use and benefits of table partitioning as implemented in `partitioning.sql` for the Airbnb Clone database.

## Overview

A new table, `booking_partitioned`, is created to store booking records. This table is partitioned by the year of the `start_date` column using MySQL's `RANGE` partitioning. Each partition holds bookings for a specific year or range of years, with a catch-all partition for future dates.

## Partitioning Strategy

- **Partition Key:**
  The table is partitioned by `YEAR(start_date)`.
- **Defined Partitions:**
  - `p_before_2024`: Bookings before 2024
  - `p2024`: Bookings in 2024
  - `p2025`: Bookings in 2025
  - `p2026`: Bookings in 2026
  - `p2027`: Bookings in 2027
  - `p_future`: Bookings in 2028 and beyond

## Indexes

To further improve performance, indexes are created on:

- `property_id`
- `user_id`
- `start_date`

## Performance Benefits

- **Faster Queries:**
  Queries that filter by `start_date` or year can quickly target the relevant partition, reducing the amount of data scanned.
- **Efficient Data Management:**
  Old data can be archived or dropped by removing partitions, making maintenance easier.
- **Improved Insert Performance:**
  New records are inserted into the appropriate partition, reducing contention and improving scalability.
- **Better Index Efficiency:**
  Indexes on partitioned tables are smaller and more efficient within each partition.

## Use Cases

- **Time-based Reporting:**
  Quickly generate reports for bookings in a specific year or range.
- **Archiving:**
  Easily move or delete old bookings by dropping partitions.
- **Scalability:**
  Handle large volumes of booking data efficiently as the application grows.

## Conclusion

Partitioning the `booking_partitioned` table by year, combined with targeted indexes, significantly improves query performance and data management for time-based data in the Airbnb Clone database.
