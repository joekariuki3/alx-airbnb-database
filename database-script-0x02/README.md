# Database Seed Script

The `seed.sql` file contains sample data to populate the Airbnb Clone database with initial records for development and testing.

## What It Does

- Inserts roles (guest, host, admin)
- Adds sample users with different roles
- Populates locations (cities in Africa)
- Adds example properties for a host
- Creates bookings for users
- Inserts payment methods and payments
- Adds reviews for properties
- Seeds example messages between users

## Usage

1. Make sure your database schema is already created (run `schema.sql` first).
2. Run the seed script in your MySQL environment:

   ```sh
   mysql -u <user> -p <database> < seed.sql
   ```

   Replace `<user>` and `<database>` with your MySQL credentials and database name.

## Notes

- The script uses explicit IDs for easy reference; this is intended solely for testing/demo purposes and should not be used in production environments.
- All inserts are wrapped in a transaction for atomicity.
- Data is for testing/demo purposes only.
