# Quick Start Guide

Get DukeEatz running in 5 minutes!

## Prerequisites
- Python 3.12+
- Node.js 16+
- PostgreSQL 14+

## Setup Commands

### 1. Database Setup
```bash
# Create database
createdb dukeeatz

# Apply schema
psql dukeeatz < backend/db/schema.sql

# Verify
psql dukeeatz -c "\d users"
```

### 2. Backend Setup
```bash
cd backend

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your PostgreSQL credentials

# Generate secret key
python3 -c "import secrets; print(secrets.token_hex(32))"
# Copy output to SECRET_KEY in .env

# Start server
python3 app.py
```

Backend runs on: **http://localhost:5001**

### 3. Frontend Setup (New Terminal)
```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm start
```

Frontend runs on: **http://localhost:3000**

## Test It Out

1. Open http://localhost:3000
2. Click "Register" and create an account
3. Click "Login" and sign in
4. Success! 🎉

## Quick API Test

```bash
# Register
curl -X POST http://localhost:5001/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","username":"testuser","email":"test@duke.edu","password":"pass123"}'

# Login
curl -X POST http://localhost:5001/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@duke.edu","password":"pass123"}'

# List users
curl http://localhost:5001/users

# Health check
curl http://localhost:5001/health
```

## Common Issues

**PostgreSQL not running?**
```bash
# macOS
brew services start postgresql@14

# Linux
sudo systemctl start postgresql
```

**Port already in use?**
- Backend: Change port in `backend/app.py`
- Frontend: Choose different port when prompted

**Database connection error?**
- Check DATABASE_URL in `backend/.env`
- Ensure PostgreSQL username/password are correct

## Next Steps

- See `SETUP.md` for detailed documentation
- Add more features to your application
- Deploy to production when ready

Happy coding! 🚀
