# Airbnb Clone Database Schema

This directory contains the SQL schema for the Airbnb Clone project. The [`schema.sql`](schema.sql) file defines the normalized relational database structure, supporting core features such as user management, property listings, bookings, payments, reviews, and messaging.

## Tables Overview

- **role**: Stores user roles (e.g., guest, host, admin).
- **user**: Stores user information and references a role.
- **location**: Stores normalized location data (city, state, country).
- **property**: Stores property listings, referencing host and location.
- **booking**: Stores booking records for properties.
- **payment_method**: Stores available payment methods.
- **payment**: Stores payment transactions for bookings.
- **review**: Stores user reviews for properties.
- **message**: Stores messages exchanged between users.

## Normalization

The schema is normalized to 3NF:

- Roles and payment methods are separated into their own tables.
- Locations are normalized to avoid redundancy.
- All foreign key relationships are explicitly defined.

## Indexes

Indexes are created on frequently queried columns (e.g., user email, foreign keys) to improve query performance.

## Usage

To create the database schema, run the SQL script in your database environment:

```sh
mysql -u <user> -p <database> < schema.sql
```

Replace `<user>` and `<database>` with your MySQL credentials and database name.

## ERD

See the ERD directory for entity-relationship diagrams and requirements.
