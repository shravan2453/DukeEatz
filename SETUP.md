# DukeEatz Setup Guide

This guide will help you set up and run the DukeEatz application with PostgreSQL database and Python Flask backend.

## Prerequisites

- **PostgreSQL** (v12 or higher) - [Download here](https://www.postgresql.org/download/)
- **Python** (v3.8 or higher) - [Download here](https://www.python.org/downloads/)
- **Node.js** (v14 or higher) - [Download here](https://nodejs.org/)
- **npm** (comes with Node.js)

## Step 1: Set Up PostgreSQL Database

### 1.1 Start PostgreSQL Service

**On macOS:**
```bash
# If installed via Homebrew
brew services start postgresql

# Or start manually
pg_ctl -D /usr/local/var/postgres start
```

**On Linux:**
```bash
sudo systemctl start postgresql
# or
sudo service postgresql start
```

**On Windows:**
- Start PostgreSQL from Services or use pgAdmin

### 1.2 Create the Database

Open a terminal and connect to PostgreSQL:
```bash
psql postgres
```

Then create the database:
```sql
CREATE DATABASE dukeeatz;
\q
```

### 1.3 Run SQL Schema Files

Run the SQL files in order to create tables and load sample data:

```bash
# Navigate to your project directory
cd /Users/shravanselvavel/DukeEatz

# Run the schema creation file
psql -d dukeeatz -f create.sql

# Run the data loading file
psql -d dukeeatz -f load.sql
```

**Alternative (if you need to specify user):**
```bash
psql -U your_username -d dukeeatz -f create.sql
psql -U your_username -d dukeeatz -f load.sql
```

## Step 2: Set Up Python Environment

### 2.1 Create Virtual Environment (Recommended)

```bash
# Navigate to project directory
cd /Users/shravanselvavel/DukeEatz

# Create virtual environment (if not already created)
python3 -m venv dukeeatz

# Activate virtual environment
# On macOS/Linux:
source dukeeatz/bin/activate

# On Windows:
# dukeeatz\Scripts\activate
```

### 2.2 Install Python Dependencies

```bash
# Make sure virtual environment is activated
pip install -r requirements.txt
```

## Step 3: Configure Environment Variables

### 3.1 Create .env File

Create a `.env` file in the project root directory:

```bash
touch .env
```

### 3.2 Add Database Credentials

Edit the `.env` file with your database credentials:

```env
DB_USER=postgres
DB_PASSWORD=your_postgres_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=dukeeatz
```

**Note:** Replace `your_postgres_password` with your actual PostgreSQL password. If you don't have a password set, you can leave it empty or use your system username.

## Step 4: Install Frontend Dependencies

```bash
# Make sure you're in the project root directory
npm install
```

## Step 5: Start the Application

### Option A: Start Both Backend and Frontend Together (Recommended)

```bash
npm run dev
```

This will start:
- Python Flask backend on `http://localhost:5001`
- React frontend on `http://localhost:3000`

### Option B: Start Separately

**Terminal 1 - Start Python Backend:**
```bash
# Make sure virtual environment is activated
source dukeeatz/bin/activate  # macOS/Linux
# or
# dukeeatz\Scripts\activate  # Windows

# Start Flask server
python app.py
# or
npm run server
```

**Terminal 2 - Start React Frontend:**
```bash
npm start
```

## Step 6: Access the Application

1. Open your browser and navigate to: `http://localhost:3000`
2. You should see the registration/login page
3. Register a new account or login to access the main application

## Troubleshooting

### Database Connection Issues

**Error: "could not connect to server"**
- Make sure PostgreSQL is running
- Check your DB_HOST and DB_PORT in `.env`
- Verify your PostgreSQL password

**Error: "database does not exist"**
- Make sure you created the database: `CREATE DATABASE dukeeatz;`
- Check DB_NAME in `.env` matches the database name

**Error: "password authentication failed"**
- Check your DB_USER and DB_PASSWORD in `.env`
- Try connecting manually: `psql -U postgres -d dukeeatz`

### Python/Flask Issues

**Error: "Module not found"**
- Make sure virtual environment is activated
- Run: `pip install -r requirements.txt`

**Error: "Port already in use"**
- Backend runs on port 5001 by default
- If port is taken, change it in `app.py` or kill the process using that port:
  ```bash
  # Find process using port 5001
  lsof -i :5001
  # Kill the process (replace PID with actual process ID)
  kill -9 PID
  ```

### Frontend Issues

**Error: "Cannot connect to backend"**
- Make sure Flask backend is running on port 5001
- Check that CORS is enabled in `app.py`
- Verify the API URL in frontend components matches your backend URL

## Quick Start Commands Summary

```bash
# 1. Create database
psql postgres -c "CREATE DATABASE dukeeatz;"

# 2. Run SQL files
psql -d dukeeatz -f create.sql
psql -d dukeeatz -f load.sql

# 3. Activate virtual environment
source dukeeatz/bin/activate

# 4. Install Python dependencies
pip install -r requirements.txt

# 5. Create .env file with database credentials
# (Edit .env file manually)

# 6. Install frontend dependencies
npm install

# 7. Start everything
npm run dev
```

## Next Steps

- Register a new user account
- Browse vendors
- Test the search and filter functionality
- Explore the application features

For more information, see the main README.md file.

