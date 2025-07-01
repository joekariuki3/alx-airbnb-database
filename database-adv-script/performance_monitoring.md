# Database Performance Monitoring Report - Booking Query Optimization

**Date of Analysis:** 2025-07-01

## 1. Monitored Query

The following frequently used query was selected for performance monitoring:

```sql
SELECT
    b.booking_id,
    b.user_id,
    u.first_name AS user_first_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    l.city AS property_location_city,
    b.start_date,
    b.end_date,
    b.total_price,
    pm.payment_name AS payment_method,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    booking b
JOIN
    user u ON b.user_id = u.user_id
JOIN
    property p ON b.property_id = p.property_id
JOIN
    location l ON p.location_id = l.location_id
JOIN
    payment pay ON b.booking_id = pay.booking_id
JOIN
    payment_method pm ON pay.payment_method_id = pm.payment_method_id;
```

## 2. Initial Performance Analysis (Before Changes)

#### Tool Used: `EXPLAIN`, `EXPLAIN ANALYZE`.

### Bottlenecks Identified:

- `booking` table `type: ALL`: The booking table (aliased as `b`) shows a `type` of `ALL`, indicating a full table scan for the initial access. While partitions are listed, the optimizer might not be fully pruning if no `WHERE` clause limits the `start_date` effectively, leading to scanning all relevant partitions or even the entire logical table. This can be slow on large datasets.
- No specific composite index: For anticipated **future queries** that filter by `user_id` and `start_date` together (e.g., `WHERE b.user_id = '...' AND b.start_date BETWEEN '...' AND '...'`), there isn't a dedicated composite index. This might lead to the database using one index and then performing additional filtering/sorting operations.

## 3.Changes to improve performance (Schema Adjustments/New Indexes)

- **Adjustment to Partitioning Maintenance**: Implement a regular process to add new `RANGE` partitions for future years to the `booking_partitioned` table (e.g., for 2028, 2029, etc.). This ensures that the `p_future` catch-all partition doesn't become excessively large, maximizing the benefits of partition pruning for recent data.

  ```sql
  ALTER TABLE booking ADD PARTITION (PARTITION p2028 VALUES LESS THAN (2029));
  ```

- **New Composite Index on `booking_partitioned` table (for specific query patterns)**:
  - If a common pattern emerges where bookings are queried by both `user_id` and `start_date`, a composite index will be highly beneficial.
  - This index will allow the database to efficiently locate specific user bookings within a date range without scanning large portions of the table.
  ```sql
  CREATE INDEX idx_booking_user_date ON booking (user_id, start_date);
  ```

## 4. Post-Implementation Performance Analysis

### Observed Improvements:

- **Composite Index Usage**: For queries utilizing both `user_id` and `start_date` in the `WHERE` clause, the `key` column for the `booking_partitioned` table now shows `idx_booking_user_date`, and the `type` is likely `ref` or `range`. This demonstrates that the database is now using the more efficient composite index.
- **Partition Pruning**: For queries that filter on `start_date` (e.g., `WHERE b.start_date BETWEEN '2025-07-01' AND '2025-07-31'`), the `EXPLAIN` output for the `booking_partitioned` table now shows `partitions` explicitly listing only `p2025`, and the `type` might have changed from `ALL` to `range` or `ref`, indicating effective partition pruning. This significantly reduces the number of rows scanned.
