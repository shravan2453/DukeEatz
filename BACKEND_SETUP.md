# Backend Setup Instructions

## Issues Fixed

1. **Enum Conversion Error**: Fixed SQLAlchemy enum conversion to properly handle lowercase database enum values
2. **Error Handling**: Added better error handling in the `/api/vendors` endpoint
3. **BrowseVendors Component**: Removed duplicate/unused search handler

## How to Run the Backend

### Option 1: Run Both Frontend and Backend Together (Recommended)

```bash
npm run dev
```

This will start:
- Flask backend on `http://127.0.0.1:5001`
- React frontend on `http://localhost:3000`

### Option 2: Run Backend Separately

```bash
# Make sure you're in the project root directory
cd /Users/shravanselvavel/DukeEatz

# Activate virtual environment (if not already active)
source dukeeatz/bin/activate

# Run the Flask server
./dukeeatz/bin/python app.py
```

Or using npm:
```bash
npm run server
```

### Option 3: Run Frontend Separately

```bash
npm start
```

## Database Setup

Make sure your PostgreSQL database is running and has the data loaded:

```bash
# Check if database exists and has data
psql -d dukeeatz -c "SELECT COUNT(*) FROM vendors;"

# If you need to reload the database:
psql -d dukeeatz -f create.sql
psql -d dukeeatz -f load.sql
```

## Troubleshooting

### If you see "Failed to fetch" error:

1. **Check if backend is running:**
   ```bash
   curl http://127.0.0.1:5001/api/vendors
   ```
   Should return JSON data, not an error.

2. **Check database connection:**
   - Make sure PostgreSQL is running: `brew services list` (on macOS)
   - Verify `.env` file has correct database credentials
   - Check that database `dukeeatz` exists

3. **Check for enum errors:**
   - The backend now handles enum conversion errors gracefully
   - Check the terminal where Flask is running for any error messages

### If backend won't start:

1. **Check Python virtual environment:**
   ```bash
   which python
   # Should point to ./dukeeatz/bin/python
   ```

2. **Reinstall dependencies if needed:**
   ```bash
   source dukeeatz/bin/activate
   pip install -r requirements.txt
   ```

3. **Check database connection in `.env`:**
   ```
   DB_USER=shravanselvavel
   DB_PASSWORD=
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=dukeeatz
   ```

## Testing the API

Once the backend is running, test it:

```bash
# Get all vendors
curl http://127.0.0.1:5001/api/vendors

# Filter by location
curl "http://127.0.0.1:5001/api/vendors?location=west_campus"

# Search vendors
curl "http://127.0.0.1:5001/api/vendors?q=pizza"

# Sort vendors
curl "http://127.0.0.1:5001/api/vendors?sort_by=name_asc"
```

## Current Status

✅ Backend API endpoint `/api/vendors` is functional
✅ Location filtering works
✅ Search functionality works  
✅ Sorting works (name_asc, name_desc, location_asc, location_desc)
✅ Error handling improved
✅ Enum conversion fixed

