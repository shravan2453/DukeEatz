# Complete Installation & Setup Guide for DukeEatz Reviews

## Current Status
✅ Python 3 - Installed  
✅ Node.js v22.17.0 - Installed  
❌ PostgreSQL - **NOT INSTALLED** (need to install)

---

## Step 1: Install PostgreSQL

### Option A: Using Homebrew (Recommended)

```bash
# Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install PostgreSQL
brew install postgresql@15

# Start PostgreSQL service
brew services start postgresql@15

# Add PostgreSQL to PATH (add to ~/.zshrc)
echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Option B: Using Postgres.app (GUI Alternative)

1. Download from: https://postgresapp.com/
2. Move to Applications folder
3. Open Postgres.app
4. Click "Initialize" to create a new server
5. Add to PATH: `sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp`

### Verify PostgreSQL Installation

```bash
psql --version
# Should show: psql (PostgreSQL) 15.x or higher
```

---

## Step 2: Setup Database

### Create Database and User

```bash
# Start PostgreSQL (if not already running)
brew services start postgresql@15

# Create the database
createdb dukeeatz

# Or using psql:
psql postgres
CREATE DATABASE dukeeatz;
\q
```

### Create Required Tables (Prerequisites)

**IMPORTANT**: Before creating the reviews table, you need these tables:

```bash
# Connect to database
psql -d dukeeatz

# Create users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Create vendors table
CREATE TABLE vendors (
    vendor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255),
    location_category VARCHAR(50),
    address TEXT,
    operating_hours TEXT,
    cuisine_type VARCHAR(50),
    payment_methods TEXT,
    dietary_tags TEXT,
    created_by INTEGER REFERENCES users(user_id)
);

# Create menu_items table
CREATE TABLE menu_items (
    menu_item_id SERIAL PRIMARY KEY,
    vendor_id INTEGER REFERENCES vendors(vendor_id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    dietary_tags TEXT,
    is_active BOOLEAN DEFAULT TRUE
);

# Insert sample data for testing
INSERT INTO users (username, name, email, password_hash) VALUES
('john_doe', 'John Doe', 'john@duke.edu', 'hashed_password_1'),
('jane_smith', 'Jane Smith', 'jane@duke.edu', 'hashed_password_2'),
('bob_jones', 'Bob Jones', 'bob@duke.edu', 'hashed_password_3');

INSERT INTO vendors (name, contact_info, location_category, address, cuisine_type) VALUES
('The Marketplace', '919-123-4567', 'on-campus', 'West Campus', 'American'),
('Tandoor', '919-234-5678', 'on-campus', 'Bryan Center', 'Indian'),
('Saladelia', '919-345-6789', 'on-campus', 'Perkins Library', 'Healthy');

INSERT INTO menu_items (vendor_id, name, description, price) VALUES
(1, 'Duke Burger', 'Classic beef burger with Duke sauce', 8.99),
(1, 'Chicken Tenders', 'Crispy chicken tenders with fries', 7.99),
(2, 'Cheese Pizza', 'Large cheese pizza', 12.99),
(2, 'Pepperoni Pizza', 'Large pepperoni pizza', 14.99),
(3, 'Garden Salad', 'Fresh mixed greens', 6.99),
(3, 'Caesar Salad', 'Classic Caesar with croutons', 7.99);

\q
```

### Create Reviews Table

```bash
# Run the reviews schema
psql -d dukeeatz -f db/create.sql

# Load sample review data
psql -d dukeeatz -f db/load.sql
```

---

## Step 3: Setup Python Backend

### Create Virtual Environment and Install Dependencies

```bash
# Navigate to project root
cd /Users/abhinavmeduri/DukeEatz

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install Python dependencies
pip install -r requirements.txt
```

### Configure Environment Variables

```bash
# Copy example environment file
cp .env.example .env

# Edit .env file (use nano, vim, or any text editor)
nano .env
```

Update the `.env` file with your settings:
```
FLASK_APP=run.py
FLASK_ENV=development
SECRET_KEY=your-secret-key-here

DB_HOST=localhost
DB_PORT=5432
DB_NAME=dukeeatz
DB_USER=postgres
DB_PASSWORD=postgres
```

---

## Step 4: Setup React Frontend

```bash
# Navigate to frontend directory
cd frontend

# Install Node.js dependencies
npm install

# This will install:
# - react
# - react-bootstrap
# - bootstrap
# - react-bootstrap-icons
# - and other dependencies
```

---

## Step 5: Run the Application

### Terminal 1: Start Flask Backend

```bash
# Make sure you're in project root with venv activated
cd /Users/abhinavmeduri/DukeEatz
source venv/bin/activate

# Run Flask server
python run.py

# You should see:
# * Running on http://127.0.0.1:5000
```

### Terminal 2: Start React Frontend

```bash
# Open a new terminal
cd /Users/abhinavmeduri/DukeEatz/frontend

# Start React development server
npm start

# Browser should automatically open to http://localhost:3000
```

---

## Step 6: Test the Application

### Verify Backend is Running

```bash
# In a new terminal, test the API
curl http://localhost:5000/api/reviews/vendor/1

# Should return JSON with reviews
```

### Verify Frontend is Running

1. Open browser to http://localhost:3000
2. You should see the DukeEatz header
3. Reviews section should load with sample reviews
4. Click "Write a Review" to test creating reviews

---

## Troubleshooting

### PostgreSQL Issues

**Problem**: `psql: command not found`
```bash
# Solution: Add PostgreSQL to PATH
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
source ~/.zshrc
```

**Problem**: `connection refused`
```bash
# Solution: Start PostgreSQL service
brew services start postgresql@15
# Or
brew services restart postgresql@15
```

**Problem**: `database "dukeeatz" does not exist`
```bash
# Solution: Create the database
createdb dukeeatz
```

### Python Issues

**Problem**: `ModuleNotFoundError: No module named 'flask'`
```bash
# Solution: Activate venv and install dependencies
source venv/bin/activate
pip install -r requirements.txt
```

**Problem**: `psycopg2 installation failed`
```bash
# Solution: Install PostgreSQL development files
brew install postgresql@15
pip install psycopg2-binary
```

### React Issues

**Problem**: `npm: command not found`
```bash
# Solution: Install Node.js
brew install node
```

**Problem**: `Module not found: Can't resolve 'react-bootstrap'`
```bash
# Solution: Install dependencies
cd frontend
npm install
```

### CORS Issues

**Problem**: `CORS policy: No 'Access-Control-Allow-Origin' header`
- Make sure Flask is running on port 5000
- Make sure React is running on port 3000
- Check `app/__init__.py` has CORS enabled

---

## Quick Reference Commands

### Start Everything

```bash
# Terminal 1: Backend
cd /Users/abhinavmeduri/DukeEatz
source venv/bin/activate
python run.py

# Terminal 2: Frontend
cd /Users/abhinavmeduri/DukeEatz/frontend
npm start
```

### Stop Everything

```bash
# In each terminal, press: Ctrl + C
```

### Reset Database

```bash
# Drop and recreate database
dropdb dukeeatz
createdb dukeeatz

# Recreate tables
psql -d dukeeatz -f db/create.sql
psql -d dukeeatz -f db/load.sql
```

---

## Summary Checklist

- [ ] Install PostgreSQL
- [ ] Create dukeeatz database
- [ ] Create users, vendors, menu_items tables
- [ ] Create reviews table
- [ ] Load sample data
- [ ] Create Python virtual environment
- [ ] Install Python dependencies
- [ ] Configure .env file
- [ ] Install Node.js dependencies
- [ ] Start Flask backend (port 5000)
- [ ] Start React frontend (port 3000)
- [ ] Test the application

---

## Next Steps After Installation

1. Test creating a review
2. Test editing a review
3. Test deleting a review
4. Integrate with your main DukeEatz application
5. Add authentication if needed

---

## Need Help?

- Check `SETUP.md` for detailed feature documentation
- Check `REVIEWS_README.md` for API documentation
- Check `IMPLEMENTATION_SUMMARY.md` for overview
