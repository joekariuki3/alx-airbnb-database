-- Unoptimal query that retrieves all bookings along with the user details, property details, and payment details
-- Excessive Data Transfer: SELECT * retrieves all columns from all joined tables.
-- Increased I/O: The database engine might have to read more data pages from disk if it's retrieving columns that are not part of indexes or frequently accessed
-- Increased Memory Usage: Retrieving all columns can lead to higher memory consumption, especially if the tables have many columns or large data types.
-- Reduced Performance: The database engine has to process more data than necessary, which can slow down
EXPLAIN SELECT *
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


-- Optimal query that retrieves all bookings along with the user details, property details, and payment details
-- Reduced Data Transfer: By selecting only the necessary columns, the amount of data transferred over the network is minimized.
-- Improved I/O: The database engine can read fewer data pages from disk, which can lead to faster query execution.
-- Lower Memory Usage: Selecting only the required columns reduces memory consumption, especially for large datasets.
EXPLAIN SELECT
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
