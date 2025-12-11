# DukeEatz - Duke University Dining Guide

A comprehensive dining guide for Duke University students. 

## Final Video Demonstration

**[Watch the full demo here](https://drive.google.com/file/d/13a-J9nvw5fHT5hNauBc1ZJbUUKp2-Fla/view?usp=sharing)**

## Features

- **User Authentication**: Secure registration and login with password hashing
- **Browse Vendors**: View all dining options across Duke's campus with advanced filtering
- **Search & Filters**: Filter by location, cuisine type, payment methods, and dietary tags
- **Vendor Details**: View operating hours, contact info, menus, and customer reviews
- **Menu Items**: Browse detailed menus with prices, nutrition info, and allergen data
- **Review System**: Leave ratings and comments for vendors and specific menu items
- **Favorites**: Save favorite vendors to your profile
- **User Profiles**: Manage account info, view review history, and saved favorites
- **Responsive Design**: Works seamlessly on desktop and mobile devices

## Tech Stack

### Frontend
- React 18
- React Router DOM
- CSS3 with responsive design
- LocalStorage for session management

### Backend
- Flask (Python)
- Flask-CORS
- Flask-SQLAlchemy (ORM)
- Werkzeug (password hashing)
- RESTful API design

### Database
- PostgreSQL
- UUID primary keys
- JSONB for flexible data (operating hours, contact info, nutrition)
- ARRAY columns for payment methods and dietary tags
- ENUM types for categories
- pg_trgm extension for fuzzy search

## Quick Start

See **[SETUP.md](SETUP.md)** for detailed setup instructions and troubleshooting.

```bash
# 1. Create and load database
psql postgres -c "CREATE DATABASE dukeeatz;"
psql -d dukeeatz -f create.sql
psql -d dukeeatz -f load.sql
psql -d dukeeatz -f load_menu.sql

# 2. Set up Python environment
python3 -m venv dukeeatz
source dukeeatz/bin/activate  # On Windows: dukeeatz\Scripts\activate
pip install -r requirements.txt

# 3. Create .env file with your database credentials
echo "DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=dukeeatz" > .env

# 4. Install frontend dependencies
npm install

# 5. Start the application
npm run dev
```

Then open `http://localhost:3000` in your browser.

### Prerequisites
- Python 3.8 or higher
- PostgreSQL 12 or higher
- Node.js 14 or higher
- npm

## API Endpoints

### Authentication
- `POST /register` - Create new user account
- `POST /login` - User login with email/password
- `PUT /api/users/<user_id>` - Update user profile

### Vendors
- `GET /api/vendors` - Get all vendors with optional filters
  - Query params: `cuisine`, `location`, `payment_method`, `dietary_tag`, `q` (search), `sort_by`

### Menu Items
- `GET /api/menu-items` - Get all menu items with filters
- `GET /api/menu-items/vendor/<vendor_id>` - Get menu for specific vendor
- `GET /api/menu-items/<menu_item_id>` - Get single menu item details
- `GET /api/menu-items/vendor/<vendor_id>/trending` - Get top 3 trending items
- `GET /api/menu-items/search` - Search menu items

### Reviews
- `POST /api/reviews` - Submit new review (requires user_id, vendor_id, rating 1-5)
- `GET /api/reviews` - Get reviews with optional filters (vendor_id, user_id)
- `GET /api/reviews/vendor/<vendor_id>` - Get all reviews for vendor
- `GET /api/reviews/user/<user_id>` - Get all reviews by user
- `PUT /api/reviews/<review_id>` - Update review
- `DELETE /api/reviews/<review_id>` - Delete review (requires user_id authorization)

### Favorites
- `POST /api/favorites` - Add vendor to favorites (requires user_id, vendor_id)
- `DELETE /api/favorites` - Remove from favorites
- `GET /api/favorites/<user_id>` - Get user's favorite vendors
- `GET /api/favorites/<user_id>/<vendor_id>` - Check if vendor is favorited

## Database Schema

### 5 Main Tables

**vendors** - Dining locations
- `vendor_id` (UUID, Primary Key)
- `name`, `description`, `address`, `building_name`, `floor_level`
- `contact_info` (JSONB) - Phone, email, website
- `operating_hours` (JSONB) - Complex schedule data
- `location_category` (ENUM) - east_central_campus, west_campus, merchants_on_points, food_trucks, off_campus
- `cuisine_type` (ENUM) - 23 cuisine types (american, italian, asian, etc.)
- `payment_methods` (ARRAY of ENUM) - food_points, duke_card, credit_card, cash, etc.
- `dietary_tags` (ARRAY of ENUM) - vegetarian, vegan, gluten_free, halal, kosher, etc.
- `is_active`, `is_verified`, `created_at`, `updated_at`

**users** - User accounts
- `user_id` (UUID, Primary Key)
- `name`, `username` (unique), `email` (unique)
- `password_hash` - Hashed with Werkzeug
- `created_at`, `updated_at`

**menu_items** - Food items for each vendor
- `menu_item_id` (UUID, Primary Key)
- `vendor_id` (Foreign Key → vendors)
- `name`, `description`, `category`, `meal_type`, `price`
- `nutritional_info` (JSONB) - Calories, protein, carbs, fat
- `allergens` (JSONB) - Array of allergens
- `dietary_tags` (ARRAY of ENUM)
- `image_url`, `is_available`, `created_at`, `updated_at`

**reviews** - User reviews for vendors/menu items
- `review_id` (UUID, Primary Key)
- `user_id` (Foreign Key → users)
- `vendor_id` (Foreign Key → vendors)
- `menu_item_id` (Foreign Key → menu_items, optional)
- `rating` (INTEGER, 1-5), `comment` (TEXT)
- `created_at`, `updated_at`

**favorites** - User's saved vendors
- `favorite_id` (UUID, Primary Key)
- `user_id` (Foreign Key → users)
- `vendor_id` (Foreign Key → vendors)
- `created_at`

### Key Features
- **UUID Primary Keys** for all tables
- **JSONB Columns** for flexible data (hours, contact, nutrition)
- **ARRAY Columns** for multiple values (payment methods, dietary tags)
- **ENUM Types** for data consistency
- **Fuzzy Search** using PostgreSQL pg_trgm extension
- **Foreign Key Constraints** with CASCADE/SET NULL

## Project Structure

```
DukeEatz/
├── app.py                 # Flask backend server
├── models.py              # SQLAlchemy database models
├── config.py              # Configuration settings
├── requirements.txt       # Python dependencies
├── create.sql             # Database schema
├── load.sql               # Vendor data
├── load_menu.sql          # Menu items data
├── reload_database.sh     # Database reload script
├── package.json           # Node.js dependencies
├── .env                   # Environment variables (create this)
├── src/                   # React frontend
│   ├── App.js
│   ├── components/
│   │   ├── LandingPage.js
│   │   ├── BrowseVendors.js
│   │   ├── VendorDetailsPage.js
│   │   ├── MenuItemsPage.js
│   │   ├── ReviewsPage.js
│   │   ├── UserProfilePage.js
│   │   └── ...
│   ├── utils/
│   └── images/
└── public/
    └── index.html
```

## Development

### Backend (Flask)
- **app.py** - Main Flask application with all API routes
- **models.py** - SQLAlchemy ORM models for all 5 tables
- **config.py** - Database configuration and settings

### Frontend (React)
- **Components** - Modular React components for each page
- **Routing** - React Router for navigation
- **API Integration** - Fetch calls to Flask backend

### Database Management
- Use `reload_database.sh` to reset and reload the database
- Add vendors/menu items via SQL INSERT or build admin API endpoints

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues or questions, please create an issue in the repository or contact the development team.