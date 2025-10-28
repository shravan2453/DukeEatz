# DukeEatz Setup Guide

Complete setup instructions for the DukeEatz login/registration system.

## Prerequisites

- Python 3.12+
- Node.js 16+ and npm
- PostgreSQL 14+

## 🗄️ Database Setup

### 1. Install PostgreSQL (if not already installed)

**macOS:**
```bash
brew install postgresql@14
brew services start postgresql@14
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
```

### 2. Create Database

```bash
# Connect to PostgreSQL
psql postgres

# Create database
CREATE DATABASE dukeeatz;

# Exit psql
\q
```

### 3. Apply Schema

```bash
psql dukeeatz < backend/db/schema.sql
```

### 4. Verify Table Creation

```bash
psql dukeeatz -c "\dt"
psql dukeeatz -c "\d users"
```

## 🐍 Backend Setup

### 1. Navigate to Backend Directory

```bash
cd backend
```

### 2. Create Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables

```bash
cp .env.example .env
```

Edit `.env` and update with your PostgreSQL credentials:

```
DATABASE_URL=postgresql://your_username:your_password@localhost:5432/dukeeatz
SECRET_KEY=your_random_secret_key_here
FLASK_ENV=development
```

**To generate a secure SECRET_KEY:**
```bash
python3 -c "import secrets; print(secrets.token_hex(32))"
```

### 5. Run Backend Server

```bash
python3 app.py
```

The backend will run on `http://localhost:5001`

## ⚛️ Frontend Setup

### 1. Navigate to Frontend Directory (new terminal)

```bash
cd frontend
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Start Development Server

```bash
npm start
```

The frontend will run on `http://localhost:3000` and automatically open in your browser.

## 🧪 Testing the Application

### 1. Test Registration

1. Open `http://localhost:3000` in your browser
2. Click "Register"
3. Fill in the form:
   - Name: John Doe
   - Username: johndoe
   - Email: john@duke.edu
   - Password: password123
   - Confirm Password: password123
4. Click "Register"
5. You should see a success message

### 2. Test Login

1. Click "Login"
2. Enter:
   - Email: john@duke.edu
   - Password: password123
3. Click "Login"
4. You should see a welcome message

### 3. Test API Endpoints Directly

**Register a user:**
```bash
curl -X POST http://localhost:5001/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Jane Smith",
    "username": "janesmith",
    "email": "jane@duke.edu",
    "password": "securepass123"
  }'
```

**Login:**
```bash
curl -X POST http://localhost:5001/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "jane@duke.edu",
    "password": "securepass123"
  }'
```

**Get all users:**
```bash
curl http://localhost:5001/users
```

**Health check:**
```bash
curl http://localhost:5001/health
```

## 📁 Project Structure

```
DukeEatz/
├── backend/
│   ├── app.py                 # Main Flask application
│   ├── db.py                  # Database connection pool
│   ├── requirements.txt       # Python dependencies
│   ├── .env.example          # Environment variables template
│   ├── routes/
│   │   ├── __init__.py
│   │   └── auth_routes.py    # Authentication endpoints
│   ├── utils/
│   │   └── hash_utils.py     # Password hashing utilities
│   └── db/
│       └── schema.sql        # Database schema
└── frontend/
    ├── package.json          # Node.js dependencies
    ├── public/
    │   └── index.html
    └── src/
        ├── index.js
        ├── index.css
        ├── App.js            # Main React component
        ├── App.css           # Styles
        └── components/
            ├── Login.js      # Login form component
            └── Register.js   # Registration form component
```

## 🔧 Troubleshooting

### Backend Issues

**Connection refused to PostgreSQL:**
- Check if PostgreSQL is running: `brew services list` (macOS) or `sudo systemctl status postgresql` (Linux)
- Verify DATABASE_URL in `.env` has correct credentials

**Module not found errors:**
- Ensure virtual environment is activated
- Run `pip install -r requirements.txt` again

**Port 5001 already in use:**
- Change port in `app.py`: `app.run(port=5002)`
- Update frontend API calls to use new port

### Frontend Issues

**Port 3000 already in use:**
- Choose different port when prompted
- Or kill existing process: `lsof -ti:3000 | xargs kill`

**Module not found errors:**
- Delete `node_modules` and `package-lock.json`
- Run `npm install` again

**CORS errors:**
- Verify backend is running on port 5001
- Check Flask-CORS configuration in `app.py`

### Database Issues

**Permission denied for database:**
- Grant permissions: `GRANT ALL PRIVILEGES ON DATABASE dukeeatz TO your_username;`

**Table already exists:**
- This is fine - the schema uses `CREATE TABLE IF NOT EXISTS`

## 📚 API Documentation

### POST /register
Register a new user.

**Request Body:**
```json
{
  "name": "string",
  "username": "string",
  "email": "string",
  "password": "string"
}
```

**Response (201 Created):**
```json
{
  "message": "User registered successfully",
  "user": {
    "user_id": 1,
    "name": "John Doe",
    "username": "johndoe",
    "email": "john@duke.edu",
    "registration_date": "2024-10-27T22:30:00"
  }
}
```

### POST /login
Authenticate a user.

**Request Body:**
```json
{
  "email": "string",
  "password": "string"
}
```

**Response (200 OK):**
```json
{
  "message": "Login successful",
  "user": {
    "user_id": 1,
    "name": "John Doe",
    "username": "johndoe",
    "email": "john@duke.edu",
    "is_admin": false
  }
}
```

### GET /users
List all users (testing only).

**Response (200 OK):**
```json
{
  "users": [
    {
      "user_id": 1,
      "name": "John Doe",
      "username": "johndoe",
      "email": "john@duke.edu",
      "is_admin": false,
      "registration_date": "2024-10-27T22:30:00"
    }
  ]
}
```

### GET /health
Health check endpoint.

**Response (200 OK):**
```json
{
  "status": "healthy",
  "message": "DukeEatz API is running"
}
```

## 🔐 Security Notes

- Passwords are hashed using bcrypt before storage
- Never commit `.env` file to version control
- Use strong SECRET_KEY in production
- Implement rate limiting for production
- Add input validation and sanitization
- Use HTTPS in production
