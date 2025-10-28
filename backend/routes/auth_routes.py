from flask import Blueprint, request, jsonify
from db import get_db_connection, release_db_connection
from utils.hash_utils import hash_password, check_password

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/register', methods=['POST'])
def register():
    """Register a new user"""
    conn = None
    try:
        data = request.get_json()
        
        # Validate required fields
        required_fields = ['name', 'username', 'email', 'password']
        for field in required_fields:
            if not data.get(field):
                return jsonify({'error': f'{field} is required'}), 400
        
        name = data['name']
        username = data['username']
        email = data['email']
        password = data['password']
        
        # Hash the password
        password_hash = hash_password(password)
        
        # Get database connection
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Check if username already exists
        cursor.execute("SELECT username FROM users WHERE username = %s", (username,))
        if cursor.fetchone():
            cursor.close()
            return jsonify({'error': 'Username already exists'}), 400
        
        # Check if email already exists
        cursor.execute("SELECT email FROM users WHERE email = %s", (email,))
        if cursor.fetchone():
            cursor.close()
            return jsonify({'error': 'Email already exists'}), 400
        
        # Insert new user
        cursor.execute(
            """
            INSERT INTO users (name, username, email, password_hash)
            VALUES (%s, %s, %s, %s)
            RETURNING user_id, name, username, email, registration_date
            """,
            (name, username, email, password_hash)
        )
        
        user = cursor.fetchone()
        conn.commit()
        cursor.close()
        
        return jsonify({
            'message': 'User registered successfully',
            'user': {
                'user_id': user[0],
                'name': user[1],
                'username': user[2],
                'email': user[3],
                'registration_date': user[4].isoformat()
            }
        }), 201
        
    except Exception as e:
        if conn:
            conn.rollback()
        return jsonify({'error': f'Registration failed: {str(e)}'}), 500
    
    finally:
        if conn:
            release_db_connection(conn)


@auth_bp.route('/login', methods=['POST'])
def login():
    """Login a user"""
    conn = None
    try:
        data = request.get_json()
        
        # Validate required fields
        if not data.get('email') or not data.get('password'):
            return jsonify({'error': 'Email and password are required'}), 400
        
        email = data['email']
        password = data['password']
        
        # Get database connection
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Find user by email
        cursor.execute(
            """
            SELECT user_id, name, username, email, password_hash, is_admin
            FROM users
            WHERE email = %s
            """,
            (email,)
        )
        
        user = cursor.fetchone()
        cursor.close()
        
        if not user:
            return jsonify({'error': 'Invalid email or password'}), 401
        
        # Verify password
        password_hash = user[4]
        if not check_password(password_hash, password):
            return jsonify({'error': 'Invalid email or password'}), 401
        
        return jsonify({
            'message': 'Login successful',
            'user': {
                'user_id': user[0],
                'name': user[1],
                'username': user[2],
                'email': user[3],
                'is_admin': user[5]
            }
        }), 200
        
    except Exception as e:
        return jsonify({'error': f'Login failed: {str(e)}'}), 500
    
    finally:
        if conn:
            release_db_connection(conn)


@auth_bp.route('/users', methods=['GET'])
def get_users():
    """Get all users (for testing purposes)"""
    conn = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        cursor.execute(
            """
            SELECT user_id, name, username, email, is_admin, registration_date
            FROM users
            ORDER BY registration_date DESC
            """
        )
        
        users = cursor.fetchall()
        cursor.close()
        
        users_list = [
            {
                'user_id': user[0],
                'name': user[1],
                'username': user[2],
                'email': user[3],
                'is_admin': user[4],
                'registration_date': user[5].isoformat()
            }
            for user in users
        ]
        
        return jsonify({'users': users_list}), 200
        
    except Exception as e:
        return jsonify({'error': f'Failed to fetch users: {str(e)}'}), 500
    
    finally:
        if conn:
            release_db_connection(conn)
