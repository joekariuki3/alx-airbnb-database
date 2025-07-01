# Query Optimization Report

This report analyzes two queries from `perfomance.sql` that retrieve booking information along with related user, property, location, and payment details in the Airbnb Clone database. The focus is on optimizing data retrieval for better performance and resource efficiency.

---

## 1. Unoptimized Query

The unoptimized query uses `SELECT *` to retrieve all columns from all joined tables. This approach has several drawbacks:

- **Excessive Data Transfer:**
  All columns from every joined table are returned, including unnecessary data.
- **Increased I/O:**
  The database engine reads more data pages from disk, especially for columns not indexed or frequently accessed.
- **Higher Memory Usage:**
  More columns and larger data types increase memory consumption.
- **Reduced Performance:**
  Processing and transferring more data than needed slows down query execution.

---

## 2. Optimized Query

The optimized query selects only the necessary columns required for the result. This approach offers several benefits:

- **Reduced Data Transfer:**
  Only the necessary columns are selected, minimizing the amount of data sent over the network.
- **Improved I/O:**
  Fewer data pages are read from disk, leading to faster query execution.
- **Lower Memory Usage:**
  Selecting only required columns reduces memory consumption, especially for large datasets.
- **Better Performance:**
  The database engine processes less data, resulting in quicker response times.

---

## Conclusion

- **Avoid using `SELECT *` in production queries.**
  Always specify only the columns you need.
- **Optimized queries** improve performance, reduce resource usage, and scale better with large datasets.
- **Use `EXPLAIN`** to analyze query execution plans and identify potential bottlenecks.

---

Optimizing SQL queries is essential for efficient database operations, especially as your data
