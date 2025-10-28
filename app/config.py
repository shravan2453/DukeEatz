import os
import getpass

class Config:
    """Flask application configuration"""
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-key-please-change-in-production'
    
    # Database configuration
    DATABASE_HOST = os.environ.get('DB_HOST') or 'localhost'
    DATABASE_PORT = os.environ.get('DB_PORT') or '5432'
    DATABASE_NAME = os.environ.get('DB_NAME') or 'dukeeatz'
    DATABASE_USER = os.environ.get('DB_USER') or getpass.getuser()
    DATABASE_PASSWORD = os.environ.get('DB_PASSWORD') or ''
    
    # Construct database URI
    if DATABASE_PASSWORD:
        DATABASE_URI = f"postgresql://{DATABASE_USER}:{DATABASE_PASSWORD}@{DATABASE_HOST}:{DATABASE_PORT}/{DATABASE_NAME}"
    else:
        DATABASE_URI = f"postgresql://{DATABASE_USER}@{DATABASE_HOST}:{DATABASE_PORT}/{DATABASE_NAME}"
