from flask_bcrypt import Bcrypt

bcrypt = Bcrypt()

def hash_password(password):
    """Hash a password using bcrypt"""
    return bcrypt.generate_password_hash(password).decode('utf-8')

def check_password(password_hash, password):
    """Verify a password against its hash"""
    return bcrypt.check_password_hash(password_hash, password)
