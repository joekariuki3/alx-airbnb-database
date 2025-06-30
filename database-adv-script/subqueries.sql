-- all properties where the average rating is greater than 4.0 using a non-correlated subquery
-- here the subquery calculates the average rating for each property and the outer query filters properties based on that average rating
-- the subquery is executed once and its result is used by the outer query
SELECT p.property_id, p.name, p.description
FROM property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.property_id;

-- users who have made more than 3 bookings using correlated subquery
-- correlated subquery depends on the outer query and is executed for each row processed by the outer query
-- here for each row in the user table, we count the number of bookings that user has made and checks if it is greater than 3.
SELECT u.user_id, u.first_name, u.email
FROM user u
WHERE (SELECT COUNT(*)
       FROM booking b
       WHERE b.user_id = u.user_id) > 3
ORDER BY u.user_id;