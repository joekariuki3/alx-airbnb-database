# Normalization of Airbnb clone db to satisfy 3NF

## In property Table

- `location` as a `VARCHAR` could be expanded into a `Location table` if detailed reuse is needed like city, state, country.

#### Location

- `location_id`: Primary Key, UUID, Indexed
- `city`: VARCHAR, NOT NULL
- `state`: VARCHAR
- `country`: VARCHAR, NOT NULL

#### Property

- `property_id`: Primary Key, UUID, Indexed
- `host_id`: Foreign Key, references User(user_id)
- `location_id`: Foreign Key, references Location(location_id)
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

## In user Table

- Using `ENUM` can be limiting for future `role` expansion
- Create a `Role table` with `FK` in `user table`

#### Role

- `role_id`: Primary Key, UUID, Indexed
- `role_name`: VARCHAR, UNIQUE, NOT NULL

#### User

- `user_id`: Primary Key, UUID, Indexed
- `role_id`: Foreign Key, references Role(role_id)
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## In payment Table

- Storing `payment_method` as an ENUM makes changes harder or adding new payment methods.
- Expand `payment_method` to `PaymentMethod table` and add `FK: payment_method_id` in `Payment table`

#### PaymentMethod

- `payment_method_id`: Primary Key, UUID, Indexed
- `payment_name`: VARCHAR, UNIQUE, NOT NULL

#### Payment

- `payment_id`: Primary Key, UUID, Indexed
- `booking_id`: Foreign Key, references Booking(booking_id)
- `payment_method_id`: Foreign Key, references PaymentMethod(payment_method_id)
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Other Tables

#### Booking

- `booking_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references Property(property_id)
- `user_id`: Foreign Key, references User(user_id)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### Review

- `review_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references Property(property_id)
- `user_id`: Foreign Key, references User(user_id)
- `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### Message

- `message_id`: Primary Key, UUID, Indexed
- `sender_id`: Foreign Key, references User(user_id)
- `recipient_id`: Foreign Key, references User(user_id)
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
