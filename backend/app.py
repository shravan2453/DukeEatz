from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from datetime import datetime
import os

app = Flask(__name__)
CORS(app)

# Database configuration
basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'dukeeatz.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Database Models
class User(db.Model):
    __tablename__ = 'users'
    user_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(50), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    is_admin = db.Column(db.Boolean, default=False)
    registration_date = db.Column(db.DateTime, default=datetime.utcnow)
    
    favorites = db.relationship('Favorite', backref='user', lazy=True)
    reviews = db.relationship('Review', backref='user', lazy=True)

class Vendor(db.Model):
    __tablename__ = 'vendors'
    vendor_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    contact_info = db.Column(db.String(200))
    location_category = db.Column(db.String(50))
    address = db.Column(db.String(200))
    operating_hours = db.Column(db.String(200))
    cuisine_type = db.Column(db.String(100))
    payment_methods = db.Column(db.String(200))
    dietary_tags = db.Column(db.String(200))
    
    favorites = db.relationship('Favorite', backref='vendor', lazy=True)
    menu_items = db.relationship('MenuItem', backref='vendor', lazy=True)
    reviews = db.relationship('Review', backref='vendor', lazy=True)

class Favorite(db.Model):
    __tablename__ = 'favorites'
    favorite_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    vendor_id = db.Column(db.Integer, db.ForeignKey('vendors.vendor_id'), nullable=False)
    favorited_date = db.Column(db.DateTime, default=datetime.utcnow)

class MenuItem(db.Model):
    __tablename__ = 'menu_items'
    menu_item_id = db.Column(db.Integer, primary_key=True)
    vendor_id = db.Column(db.Integer, db.ForeignKey('vendors.vendor_id'))
    name = db.Column(db.String(100))
    description = db.Column(db.String(255))
    price = db.Column(db.Float)
    dietary_tags = db.Column(db.String(200))
    is_active = db.Column(db.Boolean, default=True)

class Review(db.Model):
    __tablename__ = 'reviews'
    review_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    vendor_id = db.Column(db.Integer, db.ForeignKey('vendors.vendor_id'))
    rating = db.Column(db.Integer)
    review_text = db.Column(db.String(255))
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)

# API ENDPOINT 1: Get User Profile (Friend's API)
@app.route('/api/user/<int:user_id>', methods=['GET'])
def get_user_profile(user_id):
    """API 1: Get user profile information"""
    try:
        user = User.query.get(user_id)
        if not user:
            return jsonify({'error': 'User not found'}), 404
        
        user_data = {
            'user_id': user.user_id,
            'name': user.name,
            'username': user.username,
            'email': user.email,
            'is_admin': user.is_admin,
            'registration_date': user.registration_date.isoformat() if user.registration_date else None
        }
        
        return jsonify({
            'success': True,
            'message': 'User profile retrieved successfully',
            'data': user_data
        })
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# API ENDPOINT 2: Get User Favorites (Your API)
@app.route('/api/user/<int:user_id>/favorites', methods=['GET'])
def get_user_favorites(user_id):
    """API 2: Get user's favorite restaurants"""
    try:
        user = User.query.get(user_id)
        if not user:
            return jsonify({'error': 'User not found'}), 404
        
        # Get favorites with vendor information
        favorites = db.session.query(Favorite, Vendor)\
            .join(Vendor, Favorite.vendor_id == Vendor.vendor_id)\
            .filter(Favorite.user_id == user_id)\
            .order_by(Favorite.favorited_date.desc())\
            .all()
        
        favorites_data = []
        for favorite, vendor in favorites:
            vendor_data = {
                'vendor_id': vendor.vendor_id,
                'name': vendor.name,
                'contact_info': vendor.contact_info,
                'location_category': vendor.location_category,
                'address': vendor.address,
                'operating_hours': vendor.operating_hours,
                'cuisine_type': vendor.cuisine_type,
                'payment_methods': vendor.payment_methods,
                'dietary_tags': vendor.dietary_tags,
                'favorited_date': favorite.favorited_date.isoformat() if favorite.favorited_date else None
            }
            favorites_data.append(vendor_data)
        
        return jsonify({
            'success': True,
            'message': f'Found {len(favorites_data)} favorite restaurants',
            'data': {
                'user_id': user_id,
                'favorites': favorites_data
            }
        })
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Health check endpoint
@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({'status': 'healthy', 'message': 'DukeEatz API is running'})

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    print("DukeEatz Backend Server Starting...")
    print("API 1: GET /api/user/<user_id> - User Profile")
    print("API 2: GET /api/user/<user_id>/favorites - User Favorites")
    app.run(debug=True, port=5000)