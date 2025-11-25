# DukeEatz - Duke University Dining Guide

A comprehensive dining guide for Duke University students, featuring vendor information, search functionality, location-based filtering, user reviews, favorites, and menu browsing.

## Features

- **Browse Vendors**: View all dining options across Duke's campus with filtering and search
- **Vendor Details**: View complete vendor information including menus, reviews, and operating hours
- **Menu Browsing**: Browse menu items across all vendors with detailed information
- **User Authentication**: Register and login to access personalized features
- **Reviews System**: Write, edit, and view reviews for vendors and menu items
- **Favorites**: Save favorite vendors for quick access
- **User Profiles**: View your account details, favorites, and review history
- **Search & Filters**: Search and filter vendors by location, cuisine, payment methods, and dietary tags
- **Responsive Design**: Works on desktop and mobile devices

## Tech Stack

### Frontend
- React 18
- React Router DOM
- CSS3 with responsive design

### Backend
- Python 3.8+
- Flask
- Flask-SQLAlchemy
- PostgreSQL
- Flask-CORS for cross-origin requests

## Setup Instructions

### Prerequisites
- Python 3.8 or higher
- PostgreSQL (v12 or higher)
- Node.js (v14 or higher)
- npm or yarn

### Database Setup

1. **Install PostgreSQL** and create a database:
   ```sql
   CREATE DATABASE dukeeatz;
   ```

2. **Run the schema files** to create tables and load sample data:
   ```bash
   psql -d dukeeatz -f create.sql
   psql -d dukeeatz -f load.sql
   ```

3. **Create environment file**:
   ```bash
   touch .env
   ```

4. **Update .env** with your database credentials:
   ```
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=dukeeatz
   DB_USER=your_username
   DB_PASSWORD=your_password
   ```

### Installation

1. **Set up Python virtual environment**:
   ```bash
   python3 -m venv dukeeatz
   source dukeeatz/bin/activate  # On macOS/Linux
   # dukeeatz\Scripts\activate  # On Windows
   ```

2. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Install frontend dependencies**:
   ```bash
   npm install
   ```

4. **Start the development server**:
   ```bash
   npm run dev
   ```
   This will start both the Flask backend server (port 5001) and React development server (port 3000).

5. **Or start individually**:
   ```bash
   # Backend only (make sure virtual environment is activated)
   python app.py
   # or
   npm run server
   
   # Frontend only
   npm start
   ```

## API Endpoints

### 1. Vendor Management

#### 1.1 List Vendors
- `GET /api/vendors` - Retrieves a list of all active vendors with optional filtering and sorting
  - Query Parameters:
    - `cuisine` (string): Filter by cuisine type
    - `location` (string): Filter by location
    - `payment_method` (string): Filter by accepted payment methods
    - `dietary_tag` (string): Filter by dietary accommodations
    - `q` (string): Search query for vendor names/descriptions
    - `sort_by` (string): Sort order (default: name_asc)

### 2. User Authentication

#### 2.1 User Registration
- `POST /api/register` - Creates a new user account
  - Request Body: User registration details

#### 2.2 User Login
- `POST /api/login` - Authenticates a user and returns an access token
  - Request Body: User credentials

### 3. User Profile Management

#### 3.1 Update User Profile
- `PUT /api/users/<int:user_id>` - Updates user profile information
  - URL Parameters: `user_id` (integer): ID of the user to update
  - Request Body: Updated user information

### 4. Favorites Management

#### 4.1 Add to Favorites
- `POST /api/favorites` - Adds a vendor to a user's favorites
  - Request Body: User and vendor information

#### 4.2 Remove from Favorites
- `DELETE /api/favorites/<int:user_id>/<int:vendor_id>` - Removes a vendor from favorites
  - URL Parameters:
    - `user_id` (integer): ID of the user
    - `vendor_id` (integer): ID of the vendor to remove

#### 4.3 List User Favorites
- `GET /api/favorites/<int:user_id>` - Retrieves all vendors favorited by a user
  - URL Parameters: `user_id` (integer): ID of the user

#### 4.4 Check Favorite Status
- `GET /api/favorites/check/<int:user_id>/<int:vendor_id>` - Checks if a vendor is in a user's favorites
  - URL Parameters:
    - `user_id` (integer): ID of the user
    - `vendor_id` (integer): ID of the vendor to check

### 5. Reviews System

#### 5.1 Create Review
- `POST /api/reviews` - Creates a new review for a vendor
  - Request Body: Review details including rating, comment, and vendor ID

#### 5.2 Get Vendor Reviews
- `GET /api/reviews/vendor/<int:vendor_id>` - Retrieves all reviews for a specific vendor
  - URL Parameters: `vendor_id` (integer): ID of the vendor

#### 5.3 List All Reviews
- `GET /api/reviews` - Retrieves all reviews across all vendors

#### 5.4 Update Review
- `PUT /api/reviews/<int:review_id>` - Updates an existing review
  - URL Parameters: `review_id` (integer): ID of the review to update
  - Request Body: Updated review details

#### 5.5 Delete Review
- `DELETE /api/reviews/<int:review_id>` - Deletes a review
  - URL Parameters: `review_id` (integer): ID of the review to delete

#### 5.6 Get User Reviews
- `GET /api/users/<int:user_id>/reviews` - Retrieves all reviews written by a specific user
  - URL Parameters: `user_id` (integer): ID of the user

### 6. Menu Management

#### 6.1 Get Vendor Menu
- `GET /api/vendors/<int:vendor_id>/menu` - Retrieves all menu items for a specific vendor
  - URL Parameters: `vendor_id` (integer): ID of the vendor

#### 6.2 Get Menu Item
- `GET /api/menu/<int:menu_item_id>` - Retrieves details of a specific menu item
  - URL Parameters: `menu_item_id` (integer): ID of the menu item

#### 6.3 Get Trending Items
- `GET /api/trending` - Retrieves currently trending menu items

#### 6.4 Search Menu Items
- `GET /api/menu/search` - Searches menu items based on query parameters

#### 6.5 List All Menu Items
- `GET /api/menu` - Retrieves all menu items across all vendors

## Database Schema

### 1. User
- `user_id` (PK, UUID)
- `name` (string)
- `username` (string, unique)
- `email` (string, unique)
- `password_hash` (string)
- `created_at` (timestamp)
- `updated_at` (timestamp)

### 2. Vendor
- `vendor_id` (PK, UUID)
- `name` (string)
- `description` (text)
- `contact_info` (JSONB)
- `location_category` (enum: 'east_central_campus', 'west_campus', 'merchants_on_points', 'food_trucks', 'off_campus')
- `address` (string)
- `building_name` (string)
- `floor_level` (string)
- `operating_hours` (JSONB)
- `cuisine_type` (enum: 'american', 'asian', 'mexican', 'italian', etc.)
- `payment_methods` (array of enums: 'food_points', 'duke_card', 'credit_card', 'cash', 'apple_pay', 'google_pay', 'meal_swipe', 'board_plan')
- `dietary_tags` (array of enums: 'vegetarian', 'vegan', 'gluten_free', 'nut_free', 'dairy_free', 'halal', 'kosher', 'organic', 'local_sourced', 'sustainable')
- `is_active` (boolean, default: true)
- `is_verified` (boolean, default: false)
- `created_at` (timestamp)
- `updated_at` (timestamp)

### 3. Menu_Item
- `menu_item_id` (PK, UUID)
- `vendor_id` (FK → Vendor.vendor_id)
- `name` (string)
- `description` (text)
- `category` (string)
- `meal_type` (string)
- `price` (decimal)
- `nutritional_info` (JSONB)
- `allergens` (JSONB)
- `dietary_tags` (array of enums)
- `image_url` (string)
- `is_available` (boolean, default: true)
- `created_at` (timestamp)
- `updated_at` (timestamp)

### 4. Review
- `review_id` (PK, UUID)
- `user_id` (FK → User.user_id)
- `vendor_id` (FK → Vendor.vendor_id)
- `menu_item_id` (FK → Menu_Item.menu_item_id, optional)
- `rating` (integer)
- `comment` (text)
- `created_at` (timestamp)
- `updated_at` (timestamp)

### 5. Favorite
- `favorite_id` (PK, UUID)
- `user_id` (FK → User.user_id)
- `vendor_id` (FK → Vendor.vendor_id)
- `created_at` (timestamp)

## Location Categories

1. **East & Central Campus** - Main dining halls and campus eateries
2. **West Campus** - West campus dining options
3. **Merchants-On-Points** - Off-campus delivery vendors
4. **Food Trucks** - Mobile food vendors
5. **Off Campus** - Off-campus dining locations

## Website Components & Navigation

### a) Landing Page
The landing page is the entry point for all visitors. It introduces the purpose of the DukeEatz platform and provides clear navigation options to explore vendors or sign in, and gives users a starting point whether they want to search for food options directly, browse available vendors, or create an account.

- Introductory text explaining the DukeEatz platform
- Navigation links to Browse Vendors, Log In / Sign Up
- Search bar for quick keyword-based access to vendors, cuisines, or menu items

### b) Log In/Registration Page
The registration page allows a new user to create an account to access personalized features (e.g., writing reviews, marking vendors as favorites). These details will be used to establish a user profile.

- For registration: name/username, email, password, and confirmation
- For login: email and password fields
- Option to reset password if needed
- Button to submit the chosen action (sign up or log in)

### c) Browse Vendors (Vendor Directory) Page
The vendor directory lists all dining locations available within the system. It allows both guests and logged-in users to browse, filter, and search for vendors based on different attributes (e.g., location, cuisine type).

- Search bar to look up vendors, cuisines, or menu items
- Filters for attributes such as location type, cuisine type, payment methods, or dietary tags
- Sort controls (e.g., alphabetical, rating)
- Vendor previews showing basic vendor details and average rating
- Links from each vendor card to open the full vendor detail page

### d) Vendor Details Page (Specific to Vendors)
Page shows full information about a single vendor (gives users everything they need to know to decide if they want to visit, including menu, payment options, and reviews).

- Vendor details such as name, contact info, location category (on-campus or off-campus), and operating hours
- Full menu listing with links to item-level pages
- Average vendor rating and list of user reviews
- Option for logged-in users to favorite the vendor
- Option for logged-in users to submit a vendor-level review

### e) Browse Menu Items Page (All Menu Items Across Vendors)
This page lets users view menu items from all vendors in one place. It provides a consolidated list of items so users can compare options without navigating vendor-by-vendor.

- Displays all menu items with basic details such as name, description, price, vendor, and dietary tags
- Supports search to quickly look up specific items
- Includes filters for vendor, category, meal type, and dietary preferences
- Shows average item rating and review count
- Links each item to its full detail page for more information

### f) Menu Item Detail Page
Each menu item has its own page with description, price, dietary tags, and item-level reviews.

- Complete menu item information including description, price, and nutritional info
- Dietary tags and allergen information
- Item-level reviews and ratings
- Link back to the vendor page

### g) User Profile Page
Provides a personalized view of a logged-in user's activity on the platform, and shows saved favorites/previously submitted reviews to help users track interactions.

- User account details such as name/username and email
- List of favorite vendors with links to each vendor's detail page
- List of user-submitted reviews with ratings and targets (vendor or menu item)

## Development

### Project Structure
```
DukeEatz/
├── src/
│   ├── components/
│   │   ├── LandingPage.js
│   │   ├── LandingPage.css
│   │   ├── BrowseVendors.js
│   │   ├── BrowseVendors.css
│   │   ├── BrowseMenuItems.js
│   │   ├── BrowseMenuItems.css
│   │   ├── VendorDetailsPage.js
│   │   ├── VendorDetailsPage.css
│   │   ├── MenuItemsPage.js
│   │   ├── MenuItemsPage.css
│   │   ├── VendorReviewsPage.js
│   │   ├── VendorReviewsPage.css
│   │   ├── LeaveReviewPage.js
│   │   ├── LeaveReviewPage.css
│   │   ├── UserProfilePage.js
│   │   ├── UserProfilePage.css
│   │   ├── Login.js
│   │   ├── Register.js
│   │   └── RegistrationLanding.js
│   ├── utils/
│   │   └── formatText.js
│   ├── App.js
│   ├── App.css
│   ├── index.js
│   └── index.css
├── public/
│   ├── index.html
│   └── duke-blue-devil-logo.png
├── app.py
├── models.py
├── config.py
├── create.sql
├── load.sql
├── load_menu.sql
├── requirements.txt
├── package.json
└── README.md
```

### Adding New Vendors

To add new vendors to the database, you can either:

1. **Use the SQL files** - Add INSERT statements to `load.sql`
2. **Direct SQL** - Insert directly into the vendors table using psql
3. **API Extension** - Add POST endpoints for vendor management in `app.py`

### Customization

- **Styling**: Modify CSS files in `src/components/`
- **API Routes**: Extend `app.py` with new endpoints
- **Database**: Modify `create.sql` for schema changes or `load.sql` for data changes

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