import psycopg2
from psycopg2.extras import RealDictCursor
from contextlib import contextmanager
from app.config import Config

def get_db_connection():
    """Create and return a database connection"""
    return psycopg2.connect(Config.DATABASE_URI)

@contextmanager
def get_cursor():
    """Context manager for database cursor with automatic commit/rollback"""
    conn = get_db_connection()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            yield cur
            conn.commit()
    except Exception as e:
        conn.rollback()
        raise e
    finally:
        conn.close()
