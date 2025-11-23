from flask import Flask, jsonify, request
from flask_cors import CORS
from models import db, Vendor, User, Review, Favorite, MenuItem
import os
from dotenv import load_dotenv
from sqlalchemy import text 
from sqlalchemy.exc import IntegrityError 
import pathlib
import traceback

# Load environment variables from .env file
# Explicitly specify the path to ensure it's loaded
env_path = pathlib.Path(__file__).parent / '.env'
print(f"📁 Loading .env from: {env_path.absolute()}")
print(f"📁 .env exists: {env_path.exists()}")

# Try loading from current directory first, then explicit path
load_dotenv()  # Try loading from current working directory
if env_path.exists():
    load_dotenv(dotenv_path=env_path, override=True)  # Override with explicit path if it exists

# Debug: Show what we loaded
db_user_from_env = os.getenv('DB_USER', 'NOT FOUND')
print(f"✅ After load_dotenv - DB_USER from env: {db_user_from_env}")
print(f"✅ Current working directory: {os.getcwd()}")

app = Flask(__name__)
CORS(app)

# Configure database
DB_USER = os.getenv('DB_USER', 'shravanselvavel')  # Default to macOS username
DB_PASSWORD = os.getenv('DB_PASSWORD', '')
DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_PORT = os.getenv('DB_PORT', '5432')
DB_NAME = os.getenv('DB_NAME', 'dukeeatz')

# Debug: Print database configuration (remove in production)
print(f"🔍 Database Config: USER={DB_USER}, HOST={DB_HOST}, PORT={DB_PORT}, DB={DB_NAME}, PASSWORD={'***' if DB_PASSWORD else '(empty)'}")

# Construct the database URL
if DB_PASSWORD and DB_PASSWORD.strip():
    app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
else:
    # No password (common for local Homebrew PostgreSQL)
    app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{DB_USER}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

print(f"🔗 Database URI: {app.config['SQLALCHEMY_DATABASE_URI'].replace(DB_PASSWORD if DB_PASSWORD else '', '***')}")
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
    payment_method = request.args.get('payment_method')
    dietary_tag = request.args.get('dietary_tag')
    search_query = request.args.get('q')
    sort_by = request.args.get('sort_by', 'name_asc')  # Default to name ascending
    
    query = Vendor.query.filter_by(is_active=True)  # Only show active vendors
    
    # Filter by cuisine
    if cuisine and cuisine != 'all':
        try:
            from models import CuisineType
            # Try to find by value (lowercase)
            cuisine_enum = None
            for ct in CuisineType:
                if ct.value == cuisine.lower():
                    cuisine_enum = ct
                    break
            if cuisine_enum:
                query = query.filter_by(cuisine_type=cuisine_enum)
        except (KeyError, AttributeError):
            pass  # Invalid cuisine, ignore filter
    
    # Filter by location
    if location and location != 'all':
        try:
            from models import LocationCategory
            # Handle both enum value and name formats
            location_value = location.lower().replace(' ', '_')
            location_enum = None
            
            # Try to find by value
            for loc in LocationCategory:
                if loc.value == location_value:
                    location_enum = loc
                    break
            
            # If not found by value, try by name
            if not location_enum:
                location_name = location.upper().replace(' ', '_')
                if hasattr(LocationCategory, location_name):
                    location_enum = getattr(LocationCategory, location_name)
            
            if location_enum:
                query = query.filter_by(location_category=location_enum)
        except (KeyError, AttributeError):
            pass  # Invalid location, ignore filter
    
    # Filter by payment method
    if payment_method and payment_method != 'all':
        try:
            from models import PaymentMethod
            payment_enum = None
            for pm in PaymentMethod:
                if pm.value == payment_method.lower():
                    payment_enum = pm
                    break
            if payment_enum:
                # Filter vendors that have this payment method in their array
                # Use ANY operator for PostgreSQL array filtering
                query = query.filter(Vendor.payment_methods.any(payment_enum))
        except (KeyError, AttributeError, Exception) as e:
            print(f"Payment method filter error: {e}")
            pass  # Invalid payment method, ignore filter
    
    # Filter by dietary tag
    if dietary_tag and dietary_tag != 'all':
        try:
            from models import DietaryTag
            dietary_enum = None
            for dt in DietaryTag:
                if dt.value == dietary_tag.lower():
                    dietary_enum = dt
                    break
            if dietary_enum:
                # Filter vendors that have this dietary tag in their array
                # Use ANY operator for PostgreSQL array filtering
                query = query.filter(Vendor.dietary_tags.any(dietary_enum))
        except (KeyError, AttributeError, Exception) as e:
            print(f"Dietary tag filter error: {e}")
            pass  # Invalid dietary tag, ignore filter
    
    # Search query
    if search_query:
        search_term = f'%{search_query}%'
        query = query.filter(
            (Vendor.name.ilike(search_term)) |
            (Vendor.description.ilike(search_term))
        )
    
    # Apply sorting
    if sort_by == 'name_asc':
        query = query.order_by(Vendor.name.asc())
    elif sort_by == 'name_desc':
        query = query.order_by(Vendor.name.desc())
    elif sort_by == 'location_asc':
        query = query.order_by(Vendor.location_category.asc())
    elif sort_by == 'location_desc':
        query = query.order_by(Vendor.location_category.desc())
    else:
        # Default to name ascending
        query = query.order_by(Vendor.name.asc())
    
    vendors = query.all()
    
    result = []
    for vendor in vendors:
        try:
            # Safely get enum values
            location_val = vendor.location_category.value if hasattr(vendor.location_category, 'value') else str(vendor.location_category)
            cuisine_val = vendor.cuisine_type.value if hasattr(vendor.cuisine_type, 'value') else str(vendor.cuisine_type)
            
            payment_methods_list = []
            if vendor.payment_methods:
                for pm in vendor.payment_methods:
                    if hasattr(pm, 'value'):
                        payment_methods_list.append(pm.value)
                    else:
                        payment_methods_list.append(str(pm))
            
            dietary_tags_list = []
            if vendor.dietary_tags:
                for dt in vendor.dietary_tags:
                    if hasattr(dt, 'value'):
                        dietary_tags_list.append(dt.value)
                    else:
                        dietary_tags_list.append(str(dt))
            
            result.append({
        'id': vendor.vendor_id,
        'name': vendor.name,
                'description': vendor.description or '',
                'location': location_val,
                'cuisine': cuisine_val,
                'payment_methods': payment_methods_list,
                'dietary_tags': dietary_tags_list,
                'operating_hours': vendor.operating_hours if vendor.operating_hours else {},
                'contact_info': vendor.contact_info if vendor.contact_info else {},
                'address': vendor.address or '',
                'building_name': vendor.building_name or '',
                'floor_level': vendor.floor_level or ''
            })
        except Exception as e:
            print(f"Error processing vendor {vendor.vendor_id}: {e}")
            traceback.print_exc()
            continue
    
    return jsonify(result)

# User Authentication Routes
@app.route('/register', methods=['POST'])
def register():
    try:
        data = request.get_json()
        
        # Validate required fields
        required_fields = ['name', 'username', 'email', 'password']
        for field in required_fields:
            if not data.get(field):
                return jsonify({'error': f'{field} is required'}), 400
        
        # Check if user already exists
        if User.query.filter_by(email=data['email']).first():
            return jsonify({'error': 'Email already registered'}), 400
        
        if User.query.filter_by(username=data['username']).first():
            return jsonify({'error': 'Username already taken'}), 400
        
        # Create new user
        user = User(
            name=data['name'],
            username=data['username'],
            email=data['email']
        )
        user.set_password(data['password'])
        
        db.session.add(user)
        db.session.commit()
        
        return jsonify({
            'message': 'Registration successful',
            'user': user.to_dict()
        }), 201
        
    except IntegrityError:
        db.session.rollback()
        return jsonify({'error': 'User already exists'}), 400
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500

@app.route('/login', methods=['POST'])
def login():
    try:
        data = request.get_json()
        
        if not data.get('email') or not data.get('password'):
            return jsonify({'error': 'Email and password are required'}), 400
        
        # Find user by email
        user = User.query.filter_by(email=data['email']).first()
        
        if not user or not user.check_password(data['password']):
            return jsonify({'error': 'Invalid email or password'}), 401
        
        return jsonify({
            'message': 'Login successful',
            'user': user.to_dict()
        }), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# User Profile Routes
@app.route('/api/users/<user_id>', methods=['PUT'])
def update_user(user_id):
    try:
        data = request.get_json()
        user = User.query.filter_by(user_id=user_id).first()
        
        if not user:
            return jsonify({'error': 'User not found'}), 404
        
        # Update fields if provided
        if 'name' in data and data['name']:
            user.name = data['name']
        
        if 'username' in data and data['username']:
            # Check if username is already taken by ANOTHER user (not the current user)
            existing_user = User.query.filter(
                User.username == data['username'],
                User.user_id != user_id
            ).first()
            if existing_user:
                return jsonify({'error': 'Username already taken'}), 400
            user.username = data['username']
        
        if 'email' in data and data['email']:
            # Check if email is already taken by ANOTHER user (not the current user)
            existing_user = User.query.filter(
                User.email == data['email'],
                User.user_id != user_id
            ).first()
            if existing_user:
                return jsonify({'error': 'Email already registered'}), 400
            user.email = data['email']
        
        if 'password' in data and data['password'] and data['password'].strip():
            user.set_password(data['password'])
        
        db.session.commit()
        
        return jsonify({
            'message': 'Profile updated successfully',
            'user': user.to_dict()
        }), 200
        
    except IntegrityError:
        db.session.rollback()
        return jsonify({'error': 'Database error, possibly duplicate entry'}), 400
    except Exception as e:
        db.session.rollback()
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

# Favorites Routes
@app.route('/api/favorites', methods=['POST'])
def add_favorite():
    try:
        data = request.get_json()
        user_id = data.get('user_id')
        vendor_id = data.get('vendor_id')
        
        if not user_id or not vendor_id:
            return jsonify({'error': 'user_id and vendor_id are required'}), 400
        
        # Check if favorite already exists using SQLAlchemy
        existing_favorite = Favorite.query.filter_by(user_id=user_id, vendor_id=vendor_id).first()
        
        if existing_favorite:
            return jsonify({'error': 'Already favorited'}), 400
        
        # Add favorite using SQLAlchemy
        favorite = Favorite(
            user_id=user_id,
            vendor_id=vendor_id
        )
        db.session.add(favorite)
        db.session.commit()
        
        return jsonify({'message': 'Favorite added', 'favorite': favorite.to_dict()}), 201
    except IntegrityError as e:
        db.session.rollback()
        return jsonify({'error': 'Favorite already exists'}), 400
    except Exception as e:
        db.session.rollback()
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/favorites', methods=['DELETE'])
def remove_favorite():
    try:
        data = request.get_json()
        user_id = data.get('user_id')
        vendor_id = data.get('vendor_id')
        
        if not user_id or not vendor_id:
            return jsonify({'error': 'user_id and vendor_id are required'}), 400
        
        # Remove favorite using SQLAlchemy
        favorite = Favorite.query.filter_by(user_id=user_id, vendor_id=vendor_id).first()
        
        if not favorite:
            return jsonify({'error': 'Favorite not found'}), 404
        
        db.session.delete(favorite)
        db.session.commit()
        
        return jsonify({'message': 'Favorite removed'}), 200
    except Exception as e:
        db.session.rollback()
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/favorites/<user_id>', methods=['GET'])
def get_favorites(user_id):
    try:
        # Get favorites using SQLAlchemy
        favorites = Favorite.query.filter_by(user_id=user_id).all()
        favorite_list = []
        
        for fav in favorites:
            vendor = Vendor.query.filter_by(vendor_id=fav.vendor_id).first()
            if vendor:
                favorite_list.append({
                    'vendor_id': fav.vendor_id,
                    'vendor_name': vendor.name,
                    'cuisine_type': vendor.cuisine_type.value if vendor.cuisine_type else None,
                    'location_category': vendor.location_category.value if vendor.location_category else None
                })
        
        return jsonify(favorite_list), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/favorites/<user_id>/<vendor_id>', methods=['GET'])
def check_favorite(user_id, vendor_id):
    try:
        # Check favorite using SQLAlchemy
        favorite = Favorite.query.filter_by(user_id=user_id, vendor_id=vendor_id).first()
        
        return jsonify({'isFavorite': favorite is not None, 'is_favorite': favorite is not None}), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

# Reviews Routes
@app.route('/api/reviews', methods=['POST'])
def add_review():
    try:
        data = request.get_json()
        user_id = data.get('user_id')
        vendor_id = data.get('vendor_id')
        menu_item_id = data.get('menu_item_id')  # Optional
        rating = data.get('rating')
        comment = data.get('comment', '')
        
        if not all([user_id, vendor_id, rating]):
            return jsonify({'error': 'user_id, vendor_id, and rating are required'}), 400
        
        if not (1 <= rating <= 5):
            return jsonify({'error': 'Rating must be between 1 and 5'}), 400
        
        # If menu_item_id is provided, validate it belongs to the vendor
        if menu_item_id:
            menu_item = MenuItem.query.filter_by(menu_item_id=menu_item_id, vendor_id=vendor_id).first()
            if not menu_item:
                return jsonify({'error': 'Menu item not found for this vendor'}), 400
        
        # Check if user already reviewed this vendor (and optionally this menu item)
        query = Review.query.filter_by(user_id=user_id, vendor_id=vendor_id)
        if menu_item_id:
            query = query.filter_by(menu_item_id=menu_item_id)
        else:
            query = query.filter_by(menu_item_id=None)
        
        existing_review = query.first()
        if existing_review:
            # Update existing review
            existing_review.rating = rating
            existing_review.comment = comment
            existing_review.menu_item_id = menu_item_id
            db.session.commit()
            return jsonify({'message': 'Review updated', 'review': existing_review.to_dict()}), 200
        
        # Create new review
        review = Review(
            user_id=user_id,
            vendor_id=vendor_id,
            menu_item_id=menu_item_id,
            rating=rating,
            comment=comment
        )
        db.session.add(review)
        db.session.commit()
        
        return jsonify({'message': 'Review added', 'review': review.to_dict()}), 201
    except Exception as e:
        db.session.rollback()
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/reviews/vendor/<vendor_id>', methods=['GET'])
def get_vendor_reviews(vendor_id):
    try:
        reviews = Review.query.filter_by(vendor_id=vendor_id).order_by(Review.created_at.desc()).all()
        return jsonify([review.to_dict() for review in reviews]), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/reviews', methods=['GET'])
def get_all_reviews():
    try:
        vendor_id = request.args.get('vendor_id')
        user_id = request.args.get('user_id')
        
        query = Review.query
        
        if vendor_id:
            query = query.filter_by(vendor_id=vendor_id)
        if user_id:
            query = query.filter_by(user_id=user_id)
        
        reviews = query.order_by(Review.created_at.desc()).all()
        return jsonify([review.to_dict() for review in reviews]), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/reviews/<review_id>', methods=['PUT'])
def update_review(review_id):
    try:
        data = request.get_json()
        review = Review.query.filter_by(review_id=review_id).first()
        
        if not review:
            return jsonify({'error': 'Review not found'}), 404
        
        if 'rating' in data:
            if not (1 <= data['rating'] <= 5):
                return jsonify({'error': 'Rating must be between 1 and 5'}), 400
            review.rating = data['rating']
        
        if 'comment' in data:
            review.comment = data['comment']
        
        db.session.commit()
        return jsonify({'message': 'Review updated', 'review': review.to_dict()}), 200
    except Exception as e:
        db.session.rollback()
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/reviews/<review_id>', methods=['DELETE'])
def delete_review(review_id):
    try:
        review = Review.query.filter_by(review_id=review_id).first()
        
        if not review:
            return jsonify({'error': 'Review not found'}), 404
        
        db.session.delete(review)
        db.session.commit()
        return jsonify({'message': 'Review deleted'}), 200
    except Exception as e:
        db.session.rollback()
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/reviews/user/<user_id>', methods=['GET'])
def get_user_reviews(user_id):
    try:
        reviews = Review.query.filter_by(user_id=user_id).order_by(Review.created_at.desc()).all()
        review_dicts = []
        for review in reviews:
            review_dict = review.to_dict()
            # Add vendor name if available
            vendor = Vendor.query.filter_by(vendor_id=review.vendor_id).first()
            if vendor:
                review_dict['vendor_name'] = vendor.name
                review_dict['vendor_id'] = vendor.vendor_id
            review_dicts.append(review_dict)
        return jsonify(review_dicts), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

# Menu Items Routes
@app.route('/api/menu-items/vendor/<vendor_id>', methods=['GET'])
def get_vendor_menu_items(vendor_id):
    try:
        menu_items = MenuItem.query.filter_by(vendor_id=vendor_id, is_available=True).order_by(MenuItem.category, MenuItem.name).all()
        return jsonify([item.to_dict() for item in menu_items]), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/menu-items/<menu_item_id>', methods=['GET'])
def get_menu_item(menu_item_id):
    try:
        menu_item = MenuItem.query.filter_by(menu_item_id=menu_item_id).first()
        if not menu_item:
            return jsonify({'error': 'Menu item not found'}), 404
        return jsonify(menu_item.to_dict()), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/menu-items/vendor/<vendor_id>/trending', methods=['GET'])
def get_trending_menu_items(vendor_id):
    try:
        # Get top 3 menu items by average rating
        # If there are ties, randomly select from tied items
        from sqlalchemy import func, case
        
        # Calculate average rating for each menu item
        trending_query = db.session.query(
            MenuItem.menu_item_id,
            MenuItem.name,
            MenuItem.description,
            MenuItem.category,
            MenuItem.price,
            MenuItem.image_url,
            func.avg(Review.rating).label('avg_rating'),
            func.count(Review.review_id).label('review_count')
        ).join(
            Review, MenuItem.menu_item_id == Review.menu_item_id, isouter=True
        ).filter(
            MenuItem.vendor_id == vendor_id,
            MenuItem.is_available == True
        ).group_by(
            MenuItem.menu_item_id
        ).having(
            func.count(Review.review_id) > 0
        ).order_by(
            func.avg(Review.rating).desc(),
            func.count(Review.review_id).desc()
        ).limit(3).all()
        
        # If we have less than 3 items with reviews, fill with random items
        trending_items = []
        for item in trending_query:
            trending_items.append({
                'menu_item_id': item.menu_item_id,
                'name': item.name,
                'description': item.description,
                'category': item.category,
                'price': float(item.price) if item.price else None,
                'image_url': item.image_url,
                'avg_rating': float(item.avg_rating) if item.avg_rating else 0.0,
                'review_count': item.review_count
            })
        
        # If we have less than 3 trending items, add random items without reviews
        if len(trending_items) < 3:
            remaining_count = 3 - len(trending_items)
            # Get items that don't have reviews yet
            items_with_reviews = [item['menu_item_id'] for item in trending_items]
            # Use PostgreSQL's random() function
            random_items = MenuItem.query.filter(
                MenuItem.vendor_id == vendor_id,
                MenuItem.is_available == True,
                ~MenuItem.menu_item_id.in_(items_with_reviews) if items_with_reviews else True
            ).order_by(db.text('RANDOM()')).limit(remaining_count).all()
            
            for item in random_items:
                trending_items.append({
                    'menu_item_id': item.menu_item_id,
                    'name': item.name,
                    'description': item.description,
                    'category': item.category,
                    'price': float(item.price) if item.price else None,
                    'image_url': item.image_url,
                    'avg_rating': 0.0,
                    'review_count': 0
                })
        
        return jsonify(trending_items[:3]), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/menu-items/search', methods=['GET'])
def search_menu_items():
    try:
        query = request.args.get('q', '')
        vendor_id = request.args.get('vendor_id')
        
        if not query:
            return jsonify({'error': 'Search query is required'}), 400
        
        # Build query
        search_query = MenuItem.query.filter(
            MenuItem.is_available == True,
            MenuItem.name.ilike(f'%{query}%')
        )
        
        if vendor_id:
            search_query = search_query.filter(MenuItem.vendor_id == vendor_id)
        
        menu_items = search_query.limit(20).all()
        return jsonify([item.to_dict() for item in menu_items]), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/api/menu-items', methods=['GET'])
def get_all_menu_items():
    try:
        from sqlalchemy import func
        
        # Get query parameters
        vendor_id = request.args.get('vendor_id')
        category = request.args.get('category')
        meal_type = request.args.get('meal_type')
        search_query = request.args.get('q', '')
        
        # Build base query
        query = MenuItem.query.filter(MenuItem.is_available == True)
        
        if vendor_id:
            query = query.filter(MenuItem.vendor_id == vendor_id)
        if category:
            query = query.filter(MenuItem.category == category)
        if meal_type:
            query = query.filter(MenuItem.meal_type == meal_type)
        if search_query:
            query = query.filter(MenuItem.name.ilike(f'%{search_query}%'))
        
        menu_items = query.all()
        
        # Get reviews and calculate ratings for each menu item
        result = []
        for item in menu_items:
            item_dict = item.to_dict()
            
            # Get reviews for this menu item
            reviews = Review.query.filter_by(menu_item_id=item.menu_item_id).all()
            
            if reviews:
                avg_rating = sum(r.rating for r in reviews) / len(reviews)
                review_count = len(reviews)
            else:
                avg_rating = 0.0
                review_count = 0
            
            item_dict['avg_rating'] = round(avg_rating, 1)
            item_dict['review_count'] = review_count
            
            # Get vendor info
            vendor = Vendor.query.filter_by(vendor_id=item.vendor_id).first()
            if vendor:
                item_dict['vendor_name'] = vendor.name
                item_dict['vendor_location'] = vendor.location_category.value if vendor.location_category else None
            
            result.append(item_dict)
        
        return jsonify(result), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5001)