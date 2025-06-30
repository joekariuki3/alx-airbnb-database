-- all bookings and the respective users who made those bookings
-- (INNER JOIN selects only records that have matching values in both tables)
SELECT * FROM booking
INNER JOIN user
ON booking.user_id = user.user_id;

-- all properties and their reviews, including properties that have no reviews.
-- (LEFT JOIN selects all records from left table(table 1), and matching records from right table(table 2) if nothing matches in right table returns 0/NULL)
SELECT * from property
LEFT JOIN review
ON property.property_id = review.property_id
ORDER BY property.property_id;

-- all users and all bookings, even if the user has no booking or a booking is not linked to a user.
-- (FULL OUTER JOIN selects all records from both tables, and fills in NULLs for missing matches on either side)
SELECT * FROM user
FULL OUTER JOIN booking
ON user.user_id = booking.user_id;