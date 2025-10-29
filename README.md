# DukeEatz - Duke University Dining Guide

A comprehensive dining guide for Duke University students, featuring vendor information, search functionality, and location-based filtering.

## Features

- **Browse Vendors**: View all dining options across Duke's campus
- **Location Filtering**: Filter by East & Central Campus, West Campus, Merchants-On-Points, and Food Trucks
- **Search Functionality**: Search vendors by name or description
- **Detailed Information**: View operating hours, payment methods, dietary options, and locations
- **Responsive Design**: Works on desktop and mobile devices

## Tech Stack

### Frontend
- React 18
- React Router DOM
- CSS3 with responsive design

### Backend
- Node.js
- Express.js
- PostgreSQL
- CORS enabled for cross-origin requests

## Setup Instructions

### Prerequisites
- Node.js (v14 or higher)
- PostgreSQL (v12 or higher)
- npm or yarn

### Database Setup

1. **Install PostgreSQL** and create a database:
   ```sql
   CREATE DATABASE dukeeatz;
   ```

2. **Run the schema** to create tables and sample data:
   ```bash
   psql -d dukeeatz -f schema.sql
   ```

3. **Create environment file** (copy from .env.example):
   ```bash
   cp .env.example .env
   ```

4. **Update .env** with your database credentials:
   ```
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=dukeeatz
   DB_USER=your_username
   DB_PASSWORD=your_password
   PORT=5001
   ```

### Installation

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Start the development server**:
   ```bash
   npm run dev
   ```
   This will start both the backend API server (port 5001) and React development server (port 3000).

3. **Or start individually**:
   ```bash
   # Backend only
   npm run server
   
   # Frontend only
   npm start
   ```

## API Endpoints

### Vendors
- `GET /api/vendors` - Get all vendors (with optional filters)
- `GET /api/vendors/:id` - Get vendor by ID
- `GET /api/vendors/location/:category` - Get vendors by location category
- `GET /api/vendors/stats` - Get vendor statistics by location

### Query Parameters
- `location_category`: Filter by location (east_central_campus, west_campus, merchants_on_points, food_trucks, off_campus)
- `cuisine_type`: Filter by cuisine type
- `search`: Search in vendor names and descriptions

### Health Check
- `GET /api/health` - API health status

## Database Schema

### Vendors Table
- `vendor_id` (UUID, Primary Key)
- `name` (VARCHAR) - Vendor name
- `description` (TEXT) - Vendor description
- `contact_info` (JSONB) - Phone, email, website
- `location_category` (ENUM) - Campus location category
- `address` (VARCHAR) - Physical address
- `building_name` (VARCHAR) - Campus building
- `floor_level` (VARCHAR) - Floor/level information
- `operating_hours` (JSONB) - Complex schedule data
- `cuisine_type` (ENUM) - Type of cuisine
- `payment_methods` (ARRAY) - Accepted payment methods
- `dietary_tags` (ARRAY) - Dietary accommodations
- `is_active` (BOOLEAN) - Active status
- `is_verified` (BOOLEAN) - Admin verification status
- `created_at` (TIMESTAMP) - Creation timestamp
- `updated_at` (TIMESTAMP) - Last update timestamp

## Location Categories

1. **East & Central Campus** - Main dining halls and campus eateries
2. **West Campus** - West campus dining options
3. **Merchants-On-Points** - Off-campus delivery vendors
4. **Food Trucks** - Mobile food vendors

## Development

### Project Structure
```
DukeEatz/
├── src/
│   ├── components/
│   │   ├── LandingPage.js
│   │   ├── LandingPage.css
│   │   ├── BrowseVendors.js
│   │   └── BrowseVendors.css
│   ├── App.js
│   └── index.js
├── server.js
├── schema.sql
├── package.json
└── README.md
```

### Adding New Vendors

To add new vendors to the database, you can either:

1. **Use the schema file** - Add INSERT statements to `schema.sql`
2. **Direct SQL** - Insert directly into the vendors table
3. **API Extension** - Add POST endpoints for vendor management

### Customization

- **Styling**: Modify CSS files in `src/components/`
- **API Routes**: Extend `server.js` with new endpoints
- **Database**: Modify `schema.sql` for schema changes

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