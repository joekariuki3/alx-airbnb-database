-- This query retrieves the total number of bookings made by each user, including those who have not made any bookings.
-- It uses a LEFT JOIN to include all users and counts the number of bookings for each user
-- The result is grouped by user and ordered by user_id.
SELECT u.user_id, u.first_name, COUNT(b.booking_id) AS total_bookings
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name
ORDER BY u.user_id;

-- This query retrieves the total number of bookings for each property, including those with no bookings.
-- It uses a LEFT JOIN to include all properties and counts the number of bookings for each property
-- The result is grouped by property and ordered by property_id.
-- Additionally, it ranks properties based on the total number of bookings using the ROW_NUMBER() window function.
-- The properties with the highest number of bookings will have the lowest rank number.
-- The result is ordered by the booking rank.
SELECT p.property_id, p.name, COUNT(b.booking_id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;