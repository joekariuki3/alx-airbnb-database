BEGIN TRANSACTION;

-- roles
INSERT INTO role (role_id, role_name) VALUES
  ('r1', 'guest'),
  ('r2', 'host'),
  ('r3', 'admin');

-- users
INSERT INTO user (user_id, role_id, first_name, last_name, email, password_hash, phone_number, created_at) VALUES
  ('u1', 'r2', 'Alice', 'Hostman', 'alice@bnb.com', 'hash123', '1234567890', CURRENT_TIMESTAMP),
  ('u2', 'r1', 'Bob', 'Guestson', 'bob@bnb.com', 'hash456', '2345678901', CURRENT_TIMESTAMP),
  ('u3', 'r1', 'Charlie', 'Wanderer', 'charlie@bnb.com', 'hash789', NULL, CURRENT_TIMESTAMP),
  ('u4', 'r3', 'Diana', 'Admin', 'diana@bnb.com', 'adminhash', NULL, CURRENT_TIMESTAMP);

-- locations
INSERT INTO location (location_id, city, state, country) VALUES
  ('l1', 'Nairobi', 'Nairobi County', 'Kenya'),
  ('l2', 'Addis Ababa', 'Addis Ababa', 'Ethiopia'),
  ('l3', 'Cape Town', 'Western Cape', 'South Africa');

-- properties
INSERT INTO property (property_id, host_id, location_id, name, description, price_per_night, created_at, updated_at) VALUES
  ('p1', 'u1', 'l1', 'Modern Apartment', 'A cozy and modern apartment in Nairobi.', 50.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('p2', 'u1', 'l2', 'Traditional Ethiopian Home', 'Experience authentic living in Addis.', 40.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('p3', 'u1', 'l3', 'Sea View Villa', 'Luxury villa with sea view in Cape Town.', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('b1', 'p1', 'u2', '2025-07-01', '2025-07-03', 100.00, 'confirmed', CURRENT_TIMESTAMP),
  ('b2', 'p2', 'u3', '2025-07-05', '2025-07-08', 120.00, 'pending', CURRENT_TIMESTAMP),
  ('b3', 'p3', 'u2', '2025-07-10', '2025-07-12', 240.00, 'confirmed', CURRENT_TIMESTAMP);

-- payment_methods
INSERT INTO payment_method (payment_method_id, payment_name) VALUES
  ('pm1', 'credit_card'),
  ('pm2', 'paypal'),
  ('pm3', 'stripe'),
  ('pm4', 'mpesa');

-- payments
INSERT INTO payment (payment_id, booking_id, payment_method_id, amount, payment_date) VALUES
  ('pay1', 'b1', 'pm1', 100.00, CURRENT_TIMESTAMP),
  ('pay2', 'b3', 'pm2', 240.00, CURRENT_TIMESTAMP);

-- reviews
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('rev1', 'p1', 'u2', 5, 'Amazing host and very clean space!', CURRENT_TIMESTAMP),
  ('rev2', 'p3', 'u2', 4, 'Stunning view, worth the price.', CURRENT_TIMESTAMP);

-- messages
INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('m1', 'u2', 'u1', 'Hi Alice, is the Nairobi apartment available next week?', CURRENT_TIMESTAMP),
    ('m2', 'u1', 'u2', 'Yes Bob, it is available from July 1st to 3rd.', CURRENT_TIMESTAMP);

  COMMIT;
