-- Create the new partitioned booking_partitioned table
-- We are partitioning by YEAR(start_date.
CREATE TABLE booking_partitioned (
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
)

-- This is the core of the partitioning. It tells MySQL to partition the table based on the year extracted from the start_date column.
PARTITION BY RANGE ( YEAR(start_date) ) (
    PARTITION p_before_2024 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027),
    PARTITION p2027 VALUES LESS THAN (2028),
    -- A 'catch-all' partition for any dates beyond explicitly defined ones.
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Create indexes on the new booking_partitioned table
CREATE INDEX idx_booking_property_id ON booking_partitioned(property_id);
CREATE INDEX idx_booking_user_id ON booking_partitioned(user_id);
CREATE INDEX idx_booking_start_date ON booking_partitioned(start_date);