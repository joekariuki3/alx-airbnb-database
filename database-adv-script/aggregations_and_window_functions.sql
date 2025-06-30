-- This query retrieves the total number of bookings made by each user, including those who have not made any bookings.
-- It uses a LEFT JOIN to include all users and counts the number of bookings for each user
-- The result is grouped by user and ordered by user_id.
SELECT u.user_id, u.first_name, COUNT(b.booking_id) AS total_bookings
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name
ORDER BY u.user_id;

-- This query retrieves the total number of bookings made for each property, including properties with no bookings.
-- It uses a LEFT JOIN to include all properties and counts the number of bookings for each property
-- The result is grouped by property and ordered by property_id.
-- It also includes window functions to assign a row number and rank based on the total bookings.
-- The row number is assigned based on the total bookings in descending order, and the rank is assigned similarly.
-- The final result is ordered by booking rank and row number.
-- This allows for easy identification of the most booked properties and their respective ranks.
SELECT p.property_id, p.name, COUNT(b.booking_id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS "row_number",
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank, "row_number";