from flask import Flask, jsonify, request
from flask_cors import CORS
from models import db, Vendor
import os
from dotenv import load_dotenv
from sqlalchemy import text 

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)
CORS(app)

# Configure database
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'yourpassword')  # Replace with your actual password
DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_PORT = os.getenv('DB_PORT', '5432')
DB_NAME = os.getenv('DB_NAME', 'dukeeatz')

# Construct the database URL
app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize database
db.init_app(app)

with app.app_context():
    try:
        db.session.execute(text('SELECT 1'))
        print("✅ Database connection successful!")
    except Exception as e:
        print("❌ Database connection failed:", e)
        import traceback
        traceback.print_exc()  # This will show the full error trace

with app.app_context():
    db.create_all()  # This creates the tables if they don't exist

# Rest of your code...

# API Routes
@app.route('/api/vendors', methods=['GET'])
def get_vendors():
    cuisine = request.args.get('cuisine')
    location = request.args.get('location')
    search_query = request.args.get('q')
    
    query = Vendor.query
    
    if cuisine:
        query = query.filter_by(cuisine_type=cuisine)
    if location:
        query = query.filter_by(location_category=location)
    if search_query:
        query = query.filter(
            (Vendor.name.ilike(f'%{search_query}%')) |
            (Vendor.description.ilike(f'%{search_query}%'))
        )
    
    vendors = query.all()
    return jsonify([{
        'id': vendor.vendor_id,
        'name': vendor.name,
        'description': vendor.description,
        'location': vendor.location_category.value,  # Convert enum to string
        'cuisine': vendor.cuisine_type.value,  # Convert enum to string
        'payment_methods': [pm.value for pm in vendor.payment_methods],  # Convert each enum to string
        'dietary_tags': [dt.value for dt in vendor.dietary_tags],  # Convert each enum to string
        'operating_hours': vendor.operating_hours
    } for vendor in vendors])

if __name__ == '__main__':
    app.run(debug=True, port=5000)