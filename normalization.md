# Normalization of Airbnb Clone Database to Satisfy 3NF

This document outlines the normalization of the Airbnb clone database to eliminate redundancy and achieve Third Normal Form (3NF).

---

## Property Table Normalization

**Problem:**

- The `location` field stores composite information (e.g., city, country) as a single string.
- This leads to redundancy and difficulty in querying/filtering by location components.

**Solution:**

- Extract `location` into a separate `Location` table and use a foreign key.

### Location

- `location_id`: Primary Key, UUID, Indexed
- `city`: VARCHAR, NOT NULL
- `state`: VARCHAR
- `country`: VARCHAR, NOT NULL

### Updated Property

- `property_id`: Primary Key, UUID, Indexed
- `host_id`: Foreign Key, references `User(user_id)`
- `location_id`: Foreign Key, references `Location(location_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

## User Table Normalization

**Problem:**

- `role` stored as an ENUM is inflexible and violates 3NF by encoding meaning within a non-key attribute.

**Solution:**

- Create a `Role` table and reference it with a foreign key.

### Role

- `role_id`: Primary Key, UUID, Indexed
- `role_name`: VARCHAR, UNIQUE, NOT NULL

### Updated User

- `user_id`: Primary Key, UUID, Indexed
- `role_id`: Foreign Key, references `Role(role_id)`
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Payment Table Normalization

**Problem:**

- `payment_method` ENUM limits extensibility and introduces a transitive dependency.

**Solution:**

- Extract to a `PaymentMethod` table and use a foreign key.

### PaymentMethod

- `payment_method_id`: Primary Key, UUID, Indexed
- `payment_name`: VARCHAR, UNIQUE, NOT NULL

### Updated Payment

- `payment_id`: Primary Key, UUID, Indexed
- `booking_id`: Foreign Key, references `Booking(booking_id)`
- `payment_method_id`: Foreign Key, references `PaymentMethod(payment_method_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Other Tables (Already 3NF Compliant)

### Booking

- `booking_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Review

- `review_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message

- `message_id`: Primary Key, UUID, Indexed
- `sender_id`: Foreign Key, references `User(user_id)`
- `recipient_id`: Foreign Key, references `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Summary

After normalization:

- The schema adheres fully to **3NF** by removing transitive dependencies and separating repeating or multi-valued fields.
- This improves **scalability**, **data integrity**, and **query performance**.
