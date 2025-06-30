-- role table
CREATE TABLE IF NOT EXISTS role(
    role_id  VARCHAR(60) PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- user table
CREATE TABLE IF NOT EXISTS user(
    user_id VARCHAR(60) PRIMARY KEY,
    role_id VARCHAR(60) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- location table
CREATE TABLE IF NOT EXISTS location(
    location_id VARCHAR(60) PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    country VARCHAR(100) NOT NULL
);

-- property table
CREATE TABLE IF NOT EXISTS property(
    property_id VARCHAR(60) PRIMARY KEY,
    host_id VARCHAR(60) NOT NULL,
    location_id VARCHAR(60) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES user(user_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

-- index of host_id on property table
CREATE INDEX idx_property_host_id ON property(host_id);

-- index of location_id on property table
CREATE INDEX idx_property_location_id ON property(location_id);

-- booking table
CREATE TABLE IF NOT EXISTS booking(
    booking_id VARCHAR(60) PRIMARY KEY,
    property_id VARCHAR(60) NOT NULL,
    user_id VARCHAR(60) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- index of property_id on booking table
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- index of user_id on booking table
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- payment method table
CREATE TABLE IF NOT EXISTS payment_method(
    payment_method_id VARCHAR(60) PRIMARY KEY,
    payment_name VARCHAR(50) UNIQUE NOT NULL
);

-- payment table
CREATE TABLE IF NOT EXISTS payment(
    payment_id VARCHAR(60) PRIMARY KEY,
    booking_id VARCHAR(60) NOT NULL,
    payment_method_id VARCHAR(60) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id)
);

-- index of booking_id on payment table
CREATE INDEX idx_payment_booking_id ON payment(booking_id);

-- review table
CREATE TABLE IF NOT EXISTS review(
    review_id VARCHAR(60) PRIMARY KEY,
    property_id VARCHAR(60) NOT NULL,
    user_id VARCHAR(60) NOT NULL,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- index of property_id on review table
CREATE INDEX idx_review_property_id ON review(property_id);

-- index of user_id on review table
CREATE INDEX idx_review_user_id ON review(user_id);

-- message table
CREATE TABLE IF NOT EXISTS message(
    message_id VARCHAR(60) PRIMARY KEY,
    sender_id VARCHAR(60) NOT NULL,
    recipient_id VARCHAR(60) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(user_id),
    FOREIGN KEY (recipient_id) REFERENCES user(user_id)
);

-- index of sender_id on message table
CREATE INDEX idx_message_sender_id ON message(sender_id);

-- index of recipient_id on message table
CREATE INDEX idx_message_recipient_id ON message(recipient_id);