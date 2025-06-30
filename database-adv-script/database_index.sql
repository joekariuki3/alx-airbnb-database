-- before index creation
EXPLAIN ANALYZE SELECT u.user_id, u.first_name, COUNT(b.booking_id) AS total_bookings FROM user u LEFT JOIN booking b ON u.user_id = b.user_id GROUP BY u.user_id, u.first_name ORDER BY u.user_id;

-- most used columns on user table
-- user_id -> as primary key index is created automatically
-- first_name
CREATE INDEX idx_user_first_name ON user(first_name);

-- most used column on booking table
-- booking_index -> as a primary key index is created automatically

-- most used columns on property table
-- property_id -> as a primary key index is created automatically
-- property_name
CREATE INDEX idx_property_name ON property(name)


-- after index creation
EXPLAIN ANALYZE SELECT u.user_id, u.first_name, COUNT(b.booking_id) AS total_bookings FROM user u LEFT JOIN booking b ON u.user_id = b.user_id GROUP BY u.user_id, u.first_name ORDER BY u.user_id;