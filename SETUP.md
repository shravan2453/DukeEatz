# DukeEatz Setup Guide

Complete setup instructions for running the DukeEatz application with PostgreSQL database and React frontend.

## Prerequisites

- **PostgreSQL** (v12 or higher) - [Download here](https://www.postgresql.org/download/)
- **Python** (v3.8 or higher) - [Download here](https://www.python.org/downloads/)
- **Node.js** (v14 or higher) - [Download here](https://nodejs.org/)
- **npm** (comes with Node.js)

## Quick Start

```bash
# 1. Create database
psql postgres -c "CREATE DATABASE dukeeatz;"

# 2. Run SQL files in order
psql -d dukeeatz -f create.sql
psql -d dukeeatz -f load.sql
psql -d dukeeatz -f load_menu.sql

# 3. Set up Python environment
python3 -m venv dukeeatz
source dukeeatz/bin/activate  # On Windows: dukeeatz\Scripts\activate
pip install -r requirements.txt

# 4. Create .env file (see Step 3 below)

# 5. Install frontend dependencies
npm install

# 6. Start the application
npm run dev
```

Then open `http://localhost:3000` in your browser.

---

## Detailed Setup Instructions

### Step 1: Set Up PostgreSQL Database

#### 1.1 Start PostgreSQL Service

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

#### 1.2 Create the Database

Open a terminal and connect to PostgreSQL:
```bash
psql postgres
```

Then create the database:
```sql
CREATE DATABASE dukeeatz;
\q
```

#### 1.3 Run SQL Schema and Data Files

Run the SQL files in order to create tables and load data:

```bash
# Navigate to your project directory
cd /path/to/DukeEatz

# 1. Create schema (tables, enums, indexes)
psql -d dukeeatz -f create.sql

# 2. Load vendor data
psql -d dukeeatz -f load.sql

# 3. Load menu items data
psql -d dukeeatz -f load_menu.sql
```

**If you need to specify a PostgreSQL user:**
```bash
psql -U your_username -d dukeeatz -f create.sql
psql -U your_username -d dukeeatz -f load.sql
psql -U your_username -d dukeeatz -f load_menu.sql
```

**Verify the data loaded correctly:**
```bash
# Check vendor count
psql -d dukeeatz -c "SELECT COUNT(*) FROM vendors;"

# Check menu items count
psql -d dukeeatz -c "SELECT COUNT(*) FROM menu_items;"
```

### Step 2: Set Up Python Environment

#### 2.1 Create Virtual Environment

```bash
# Navigate to project directory
cd /path/to/DukeEatz

# Create virtual environment
python3 -m venv dukeeatz

# Activate virtual environment
# On macOS/Linux:
source dukeeatz/bin/activate

# On Windows:
# dukeeatz\Scripts\activate
```

#### 2.2 Install Python Dependencies

```bash
# Make sure virtual environment is activated
# (You should see (dukeeatz) in your terminal prompt)
pip install -r requirements.txt
```

### Step 3: Configure Environment Variables

#### 3.1 Create .env File

Create a `.env` file in the project root directory:

```bash
touch .env
```

#### 3.2 Add Database Credentials

Edit the `.env` file with your database credentials:

```env
DB_USER=postgres
DB_PASSWORD=your_postgres_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=dukeeatz
```

**Notes:**
- Replace `your_postgres_password` with your actual PostgreSQL password
- If you don't have a password set, you can leave `DB_PASSWORD` empty
- If your PostgreSQL user is different (e.g., your system username), update `DB_USER` accordingly
- On macOS with Homebrew PostgreSQL, the default user is often your system username with no password

### Step 4: Install Frontend Dependencies

```bash
# Make sure you're in the project root directory
npm install
```

### Step 5: Start the Application

#### Option A: Start Both Backend and Frontend Together (Recommended)

```bash
npm run dev
```

This will start:
- Python Flask backend on `http://localhost:5001`
- React frontend on `http://localhost:3000`

#### Option B: Start Separately

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

### Step 6: Access the Application

1. Open your browser and navigate to: `http://localhost:3000`
2. You should see the DukeEatz landing page
3. Register a new account or login to access the full application

---

## Troubleshooting

### Database Connection Issues

**Error: "could not connect to server"**
- Make sure PostgreSQL is running:
  ```bash
  # macOS
  brew services list | grep postgresql
  
  # Linux
  sudo systemctl status postgresql
  ```
- Check your `DB_HOST` and `DB_PORT` in `.env`
- Verify PostgreSQL is listening on the correct port (default: 5432)

**Error: "database does not exist"**
- Make sure you created the database: `CREATE DATABASE dukeeatz;`
- Check `DB_NAME` in `.env` matches the database name

**Error: "password authentication failed"**
- Check your `DB_USER` and `DB_PASSWORD` in `.env`
- Try connecting manually: `psql -U postgres -d dukeeatz`
- On macOS, if using your system username, you may not need a password

**Error: "relation does not exist"**
- Make sure you ran `create.sql` before `load.sql` and `load_menu.sql`
- Check that all SQL files ran successfully without errors

### Python/Flask Issues

**Error: "Module not found"**
- Make sure virtual environment is activated (you should see `(dukeeatz)` in terminal)
- Run: `pip install -r requirements.txt`
- Verify installation: `pip list`

**Error: "Port already in use"**
- Backend runs on port 5001 by default
- If port is taken, find and kill the process:
  ```bash
  # Find process using port 5001
  lsof -i :5001  # macOS/Linux
  # Kill the process (replace PID with actual process ID)
  kill -9 PID
  ```
- Or change the port in `app.py`

### Frontend Issues

**Error: "Cannot connect to backend"**
- Make sure Flask backend is running on port 5001
- Check that CORS is enabled in `app.py`
- Verify the API URL in frontend components matches your backend URL
- Check browser console for specific error messages

**Error: "npm install failed"**
- Make sure you have Node.js v14 or higher: `node --version`
- Try deleting `node_modules` and `package-lock.json`, then run `npm install` again
- On some systems, you may need: `npm install --legacy-peer-deps`

### Database Reload

If you need to reload the database:

**Option 1: Use the reload script (Recommended)**
```bash
# Stop the backend first (Ctrl+C in the terminal where it's running)
./reload_database.sh
```

**Option 2: Manual reload**
```bash
# Step 1: Stop the backend (Ctrl+C)

# Step 2: Terminate all active connections
psql -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();"

# Step 3: Drop and recreate database
psql -d postgres -c "DROP DATABASE IF EXISTS dukeeatz;"
psql -d postgres -c "CREATE DATABASE dukeeatz;"

# Step 4: Run SQL files in order
psql -d dukeeatz -f create.sql
psql -d dukeeatz -f load.sql
psql -d dukeeatz -f load_menu.sql

# Step 5: Verify data loaded
psql -d dukeeatz -c "SELECT COUNT(*) as vendors FROM vendors; SELECT COUNT(*) as menu_items FROM menu_items;"

# Step 6: Restart the application
npm run dev
```

---

## Project Structure

```
DukeEatz/
├── app.py                 # Flask backend server
├── config.py              # Configuration settings
├── models.py              # SQLAlchemy database models
├── create.sql             # Database schema (tables, enums)
├── load.sql               # Vendor data
├── load_menu.sql          # Menu items data
├── requirements.txt       # Python dependencies
├── package.json           # Node.js dependencies
├── .env                   # Environment variables (create this)
├── dukeeatz/              # Python virtual environment
├── src/                   # React frontend source code
│   ├── components/        # React components
│   └── ...
└── public/                # Static assets
```

---

## Next Steps

After setup is complete:

1. **Register a new user account** at `http://localhost:3000`
2. **Browse vendors** to see all dining options
3. **Search and filter** vendors by location, cuisine, etc.
4. **View menu items** for each vendor
5. **Leave reviews** and manage your profile

---

## Support

For issues or questions:
- Check the troubleshooting section above
- Review error messages in terminal and browser console
- Verify all prerequisites are installed correctly
- Ensure database is running and accessible
