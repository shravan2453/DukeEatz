import os
import psycopg2
from psycopg2 import pool
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Database connection pool
connection_pool = None

def init_db_pool():
    """Initialize the database connection pool"""
    global connection_pool
    try:
        connection_pool = psycopg2.pool.SimpleConnectionPool(
            1,  # minimum connections
            10,  # maximum connections
            os.getenv('DATABASE_URL')
        )
        if connection_pool:
            print("✅ Database connection pool created successfully")
    except Exception as e:
        print(f"❌ Error creating connection pool: {e}")
        raise

def get_db_connection():
    """Get a connection from the pool"""
    if connection_pool:
        return connection_pool.getconn()
    raise Exception("Connection pool is not initialized")

def release_db_connection(conn):
    """Return a connection to the pool"""
    if connection_pool:
        connection_pool.putconn(conn)

def close_all_connections():
    """Close all connections in the pool"""
    if connection_pool:
        connection_pool.closeall()
        print("✅ All database connections closed")
