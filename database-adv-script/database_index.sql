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