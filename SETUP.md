# DukeEatz Reviews Feature - Setup Guide

This guide will help you set up and run the Reviews feature for the DukeEatz application.

## Tech Stack

- **Frontend**: React.js with Bootstrap
- **Backend**: Flask (Python)
- **Database**: PostgreSQL (raw SQL queries, no ORM)

## Prerequisites

- Python 3.8+
- Node.js 16+
- PostgreSQL 12+

## Database Setup

### 1. Create the Database

```bash
# Connect to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE dukeeatz;

# Exit psql
\q
```

### 2. Create Tables

**Note**: Before running the reviews table creation, ensure you have the following tables already created:
- `users` (with columns: user_id, username, name, email, password_hash)
- `vendors` (with columns: vendor_id, name, contact_info, location_category, address)
- `menu_items` (with columns: menu_item_id, vendor_id, name, description, price)

Run the reviews table creation:

```bash
psql -U postgres -d dukeeatz -f db/create.sql
```

### 3. Load Sample Data

```bash
psql -U postgres -d dukeeatz -f db/load.sql
```

## Backend Setup (Flask)

### 1. Create Virtual Environment

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Configure Environment Variables

```bash
# Copy the example environment file
cp .env.example .env

# Edit .env with your database credentials
# Update DB_USER, DB_PASSWORD, DB_NAME, etc.
```

### 4. Run the Flask Server

```bash
python run.py
```

The Flask server will start on `http://localhost:5000`

## Frontend Setup (React)

### 1. Navigate to Frontend Directory

```bash
cd frontend
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Start the Development Server

```bash
npm start
```

The React app will start on `http://localhost:3000`

## API Endpoints

The following endpoints are available for the Reviews feature:

### 1. Create Review
- **POST** `/api/reviews`
- **Body**:
  ```json
  {
    "user_id": 1,
    "vendor_id": 1,
    "menu_item_id": 1,  // optional
    "rating": 5,
    "review_text": "Great food!"
  }
  ```

### 2. Get Vendor Reviews
- **GET** `/api/reviews/vendor/<vendor_id>`
- Returns all reviews for a specific vendor

### 3. Get User Reviews
- **GET** `/api/reviews/user/<user_id>`
- Returns all reviews by a specific user

### 4. Get Single Review
- **GET** `/api/reviews/<review_id>`
- Returns a specific review

### 5. Update Review
- **PUT** `/api/reviews/<review_id>`
- **Body**:
  ```json
  {
    "rating": 4,
    "review_text": "Updated review text"
  }
  ```

### 6. Delete Review
- **DELETE** `/api/reviews/<review_id>`
- Deletes a review

## Using the Reviews Component

To integrate the reviews feature into your React app:

```jsx
import ReviewList from './components/reviews/ReviewList';

function VendorPage() {
  const currentUser = {
    user_id: 1,
    username: 'john_doe',
    name: 'John Doe'
  };

  return (
    <div>
      <h1>Vendor Details</h1>
      <ReviewList 
        vendorId={1} 
        currentUser={currentUser} 
      />
    </div>
  );
}
```

## File Structure

```
DukeEatz/
├── app/
│   ├── __init__.py           # Flask app initialization
│   ├── config.py             # Configuration settings
│   ├── db.py                 # Database connection utilities
│   ├── models/
│   │   └── review.py         # Review model utilities
│   └── routes/
│       └── reviews.py        # Review API endpoints
├── db/
│   ├── create.sql            # Database schema
│   └── load.sql              # Sample data
├── frontend/
│   └── src/
│       ├── components/
│       │   └── reviews/
│       │       ├── ReviewList.jsx    # Main reviews container
│       │       ├── ReviewItem.jsx    # Individual review display
│       │       ├── ReviewForm.jsx    # Review submission form
│       │       └── Reviews.css       # Duke-themed styling
│       └── services/
│           └── api.js                # API service functions
├── run.py                    # Flask entry point
├── requirements.txt          # Python dependencies
└── SETUP.md                  # This file
```

## Features Implemented

### Backend (Flask + PostgreSQL)
- ✅ Create new reviews
- ✅ Get reviews by vendor
- ✅ Get reviews by user
- ✅ Update existing reviews
- ✅ Delete reviews
- ✅ Raw PostgreSQL queries (no ORM)
- ✅ Proper error handling
- ✅ Input validation

### Frontend (React)
- ✅ Modern, responsive UI with Duke theme
- ✅ Star rating system (1-5 stars)
- ✅ Review submission form
- ✅ Review editing and deletion
- ✅ Real-time updates
- ✅ User authentication checks
- ✅ Loading states and error handling
- ✅ Bootstrap styling

## Testing the Application

### Test Review Creation

1. Open the React app at `http://localhost:3000`
2. Navigate to a vendor page
3. Click "Write a Review"
4. Select a rating (1-5 stars)
5. Write your review text
6. Click "Submit Review"
7. The review should appear immediately in the list

### Test Review Editing

1. Find a review you created
2. Click the "Edit" button
3. Modify the rating or text
4. Click "Update Review"
5. The review should update immediately

### Test Review Deletion

1. Find a review you created
2. Click the "Delete" button
3. Confirm the deletion
4. The review should be removed from the list

## Troubleshooting

### Database Connection Issues

If you get database connection errors:
1. Ensure PostgreSQL is running: `pg_isready`
2. Check your database credentials in `.env`
3. Verify the database exists: `psql -U postgres -l`

### CORS Issues

If you get CORS errors:
1. Ensure Flask is running on port 5000
2. Ensure React is running on port 3000
3. Check CORS configuration in `app/__init__.py`

### Module Not Found Errors

If you get Python import errors:
1. Ensure virtual environment is activated
2. Reinstall dependencies: `pip install -r requirements.txt`

### React Component Errors

If React components don't render:
1. Check browser console for errors
2. Ensure all dependencies are installed: `npm install`
3. Clear cache and restart: `npm start`

## Next Steps

1. Implement user authentication (JWT)
2. Add pagination for reviews
3. Add sorting and filtering options
4. Add photo upload functionality
5. Implement review moderation for admins
6. Add email notifications
7. Add review analytics

## Support

For issues or questions, please refer to the project documentation or contact the development team.
