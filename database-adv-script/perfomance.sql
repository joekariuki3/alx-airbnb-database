-- Unoptimal query that retrieves all bookings along with the user details, property details, and payment details
-- This query uses implicit joins, which can be harder to read and maintain compared to explicit JOIN syntax.
-- This query will perform poorly on large datasets due to the use of implicit joins
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
    booking b,
    user u,
    property p,
    location l,
    payment pay,
    payment_method pm
WHERE
    b.user_id = u.user_id AND
    b.property_id = p.property_id AND
    p.location_id = l.location_id AND
    b.booking_id = pay.booking_id AND
    pay.payment_method_id = pm.payment_method_id;


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
