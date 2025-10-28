# DukeEatz Reviews Feature

## Overview
This is the Reviews feature implementation for the DukeEatz web application. It allows users to post, view, edit, and delete reviews for vendors and menu items at Duke University.

## Tech Stack (Strictly Adhered)
- **Frontend**: React.js with Bootstrap
- **Backend**: Flask (Python)
- **Database**: PostgreSQL with raw SQL queries (no ORM/SQLAlchemy)

## Project Structure

```
DukeEatz/
├── app/                          # Flask Backend
│   ├── __init__.py              # Flask app initialization with CORS
│   ├── config.py                # Configuration (database, secrets)
│   ├── db.py                    # PostgreSQL connection utilities
│   ├── models/
│   │   ├── __init__.py
│   │   └── review.py            # Review utility functions
│   └── routes/
│       ├── __init__.py
│       └── reviews.py           # Review API endpoints (4 endpoints)
├── db/
│   ├── create.sql               # Reviews table schema
│   └── load.sql                 # Sample review data
├── frontend/                     # React Frontend
│   ├── public/
│   │   └── index.html           # HTML template
│   ├── src/
│   │   ├── components/
│   │   │   └── reviews/
│   │   │       ├── ReviewList.jsx    # Main container
│   │   │       ├── ReviewItem.jsx    # Individual review
│   │   │       ├── ReviewForm.jsx    # Create/Edit form
│   │   │       └── Reviews.css       # Duke-themed styles
│   │   ├── services/
│   │   │   └── api.js           # API service layer
│   │   ├── App.js               # Main App component
│   │   ├── App.css              # App styles
│   │   ├── index.js             # React entry point
│   │   └── index.css            # Global styles
│   └── package.json             # Frontend dependencies
├── run.py                        # Flask entry point
├── requirements.txt              # Python dependencies
├── .env.example                  # Environment variables template
├── .gitignore                    # Git ignore rules
├── SETUP.md                      # Detailed setup instructions
└── REVIEWS_README.md            # This file
```

## API Endpoints (4+ Implemented)

### 1. POST /api/reviews
Create a new review
```json
{
  "user_id": 1,
  "vendor_id": 1,
  "menu_item_id": 1,
  "rating": 5,
  "review_text": "Great food!"
}
```

### 2. GET /api/reviews/vendor/:vendor_id
Get all reviews for a specific vendor

### 3. GET /api/reviews/user/:user_id
Get all reviews by a specific user

### 4. GET /api/reviews/:review_id
Get a specific review by ID

### 5. PUT /api/reviews/:review_id
Update an existing review
```json
{
  "rating": 4,
  "review_text": "Updated review"
}
```

### 6. DELETE /api/reviews/:review_id
Delete a review

## Features Implemented

### Backend (Flask + Raw PostgreSQL)
✅ Raw PostgreSQL queries (no SQLAlchemy)
✅ Context manager for database connections
✅ Proper error handling and validation
✅ CORS enabled for React frontend
✅ RESTful API design
✅ Input validation (rating 1-5, required fields)

### Frontend (React.js)
✅ Modern, responsive UI with Duke blue theme (#001A57)
✅ Interactive star rating system (1-5 stars)
✅ Review submission with validation
✅ Edit and delete functionality
✅ Real-time updates after CRUD operations
✅ User ownership checks (only edit/delete own reviews)
✅ Loading states and error handling
✅ Bootstrap components for professional UI
✅ Responsive design for mobile and desktop

### Database
✅ Reviews table with proper foreign keys
✅ Indexes for performance optimization
✅ Sample data for testing
✅ Timestamp tracking for reviews

## Quick Start

### 1. Database Setup
```bash
# Create database
createdb dukeeatz

# Run schema
psql -U postgres -d dukeeatz -f db/create.sql

# Load sample data
psql -U postgres -d dukeeatz -f db/load.sql
```

### 2. Backend Setup
```bash
# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run Flask server
python run.py
```
Server runs on: http://localhost:5000

### 3. Frontend Setup
```bash
cd frontend

# Install dependencies
npm install

# Start React app
npm start
```
App runs on: http://localhost:3000

## Design Features

### Duke University Theme
- Primary Color: Duke Blue (#001A57)
- Secondary Color: Duke Navy (#012169)
- Modern gradient headers
- Professional card-based layout
- Smooth animations and transitions

### User Experience
- Intuitive star rating with hover effects
- Immediate feedback on actions
- Confirmation dialogs for destructive actions
- Clear error messages
- Loading indicators
- Responsive design for all screen sizes

## Testing the Features

### Test Case 1: Post a Review
1. Navigate to vendor page
2. Click "Write a Review"
3. Select rating (1-5 stars)
4. Enter review text
5. Submit
6. **Expected**: Review appears immediately with correct rating and timestamp

### Test Case 2: Edit a Review
1. Find your review
2. Click "Edit" button
3. Modify rating or text
4. Click "Update Review"
5. **Expected**: Review updates immediately

### Test Case 3: Delete a Review
1. Find your review
2. Click "Delete" button
3. Confirm deletion
4. **Expected**: Review is removed from list

### Test Case 4: View Reviews
1. Navigate to vendor page
2. **Expected**: All reviews displayed with ratings, timestamps, and user info

## Database Schema

```sql
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    vendor_id INTEGER NOT NULL REFERENCES vendors(vendor_id),
    menu_item_id INTEGER REFERENCES menu_items(menu_item_id),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

## Integration with Main App

To integrate reviews into your main application:

```jsx
import ReviewList from './components/reviews/ReviewList';

function VendorDetailPage({ vendorId }) {
  const currentUser = {
    user_id: 1,
    username: 'john_doe',
    name: 'John Doe'
  };

  return (
    <div>
      <VendorInfo vendorId={vendorId} />
      <ReviewList 
        vendorId={vendorId} 
        currentUser={currentUser} 
      />
    </div>
  );
}
```

## Dependencies

### Python (Backend)
- Flask 3.0.0
- flask-cors 4.0.0
- psycopg2-binary 2.9.9
- python-dotenv 1.0.0

### JavaScript (Frontend)
- react 18.2.0
- react-bootstrap 2.9.1
- bootstrap 5.3.2
- react-bootstrap-icons 1.10.3

## Notes

- This implementation focuses solely on the Reviews feature as requested
- User authentication is assumed to be handled by the main application
- The frontend uses mock user data for demonstration
- All database queries use raw SQL (no ORM)
- CORS is configured for local development
- The design follows Duke University's color scheme

## Future Enhancements

- Add pagination for large review lists
- Implement sorting and filtering
- Add photo uploads to reviews
- Add "helpful" voting system
- Implement admin moderation
- Add email notifications
- Add review analytics dashboard

## Support

For detailed setup instructions, see `SETUP.md`
For issues or questions, refer to the project documentation
