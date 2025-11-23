# How to Delete and Reload the Database

## Quick Commands

```bash
# 1. Drop and recreate the database
psql -c "DROP DATABASE IF EXISTS dukeeatz;"
psql -c "CREATE DATABASE dukeeatz;"

# 2. Run the schema (creates tables and enums)
psql -d dukeeatz -f create.sql

# 3. Load the data
psql -d dukeeatz -f load.sql
```

## Step-by-Step Instructions

### Step 1: Stop the Backend (if running)
Press `Ctrl+C` in the terminal where the backend is running.

### Step 2: Drop the Existing Database
```bash
psql -c "DROP DATABASE IF EXISTS dukeeatz;"
```

**Note:** If you get a "database is being accessed by other users" error:
```bash
# First, disconnect all connections
psql -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();"

# Then drop the database
psql -c "DROP DATABASE IF EXISTS dukeeatz;"
```

### Step 3: Create a Fresh Database
```bash
psql -c "CREATE DATABASE dukeeatz;"
```

### Step 4: Run the Schema File
This creates all tables, enums, and triggers:
```bash
psql -d dukeeatz -f create.sql
```

You should see output like:
```
CREATE TYPE
CREATE TYPE
CREATE TYPE
CREATE TYPE
CREATE TABLE
CREATE TABLE
...
```

### Step 5: Load the Data
This inserts all the vendor data:
```bash
psql -d dukeeatz -f load.sql
```

You should see output like:
```
INSERT 0 1
INSERT 0 1
...
```

# Terminate all connections
psql -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();"

# Then drop the database
psql -d postgres -c "DROP DATABASE IF EXISTS dukeeatz;"

### Step 6: Verify the Data
```bash
# Check vendor count
psql -d dukeeatz -c "SELECT COUNT(*) FROM vendors;"

# Check a sample vendor
psql -d dukeeatz -c "SELECT name, location_category, cuisine_type FROM vendors LIMIT 3;"
```

### Step 7: Restart the Backend
```bash
npm run dev
# or
npm run server
```

## Complete One-Liner Script

If you want to do it all at once:

```bash
psql -c "DROP DATABASE IF EXISTS dukeeatz;" && \
psql -c "CREATE DATABASE dukeeatz;" && \
psql -d dukeeatz -f create.sql && \
psql -d dukeeatz -f load.sql && \
echo "✅ Database reloaded successfully!"
```

## Troubleshooting

### Error: "database is being accessed by other users"
The backend or another connection is using the database. Solution:
```bash
# Kill all connections
psql -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();"

# Then try dropping again
psql -c "DROP DATABASE IF EXISTS dukeeatz;"
```

### Error: "role does not exist"
Make sure you're using the correct PostgreSQL user. Check your `.env` file:
```bash
cat .env | grep DB_USER
```

Then use that user:
```bash
psql -U shravanselvavel -c "DROP DATABASE IF EXISTS dukeeatz;"
```

### Error: "permission denied"
You might need superuser privileges. Try:
```bash
psql -U postgres -c "DROP DATABASE IF EXISTS dukeeatz;"
psql -U postgres -c "CREATE DATABASE dukeeatz;"
```

## What Gets Deleted

When you drop the database, **everything** is deleted:
- All tables (vendors, users, favorites, reviews)
- All data
- All enums and types
- All indexes and triggers

## What Gets Recreated

After running `create.sql` and `load.sql`:
- ✅ All tables with proper schema
- ✅ All enum types
- ✅ All indexes and triggers
- ✅ Sample vendor data
- ❌ User accounts (users table is empty - users need to register again)
- ❌ Favorites and reviews (these tables are empty)

## Alternative: Just Reload Data (Keep Schema)

If you only want to reload the vendor data without dropping everything:

```bash
# Clear existing vendor data
psql -d dukeeatz -c "TRUNCATE TABLE vendors CASCADE;"

# Reload the data
psql -d dukeeatz -f load.sql
```

This keeps:
- ✅ User accounts
- ✅ Favorites
- ✅ Reviews
- ✅ Database schema

But replaces all vendor data.

