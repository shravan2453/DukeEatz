from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.postgresql import JSONB, ARRAY, ENUM
from sqlalchemy.ext.mutable import MutableList
from werkzeug.security import generate_password_hash, check_password_hash
import enum

# Initialize SQLAlchemy
db = SQLAlchemy()

# Create enums that match your SQL enums
class LocationCategory(enum.Enum):
    east_central_campus = 'east_central_campus'
    west_campus = 'west_campus'
    merchants_on_points = 'merchants_on_points'
    food_trucks = 'food_trucks'
    off_campus = 'off_campus'

class PaymentMethod(enum.Enum):
    food_points = 'food_points'
    duke_card = 'duke_card'
    credit_card = 'credit_card'
    cash = 'cash'
    apple_pay = 'apple_pay'
    google_pay = 'google_pay'
    meal_swipe = 'meal_swipe'
    board_plan = 'board_plan'

class DietaryTag(enum.Enum):
    vegetarian = 'vegetarian'
    vegan = 'vegan'
    gluten_free = 'gluten_free'
    nut_free = 'nut_free'
    dairy_free = 'dairy_free'
    halal = 'halal'
    kosher = 'kosher'
    organic = 'organic'
    local_sourced = 'local_sourced'
    sustainable = 'sustainable'

class CuisineType(enum.Enum):
    AMERICAN = 'american'
    ASIAN = 'asian'
    MEXICAN = 'mexican'
    ITALIAN = 'italian'
    MEDITERRANEAN = 'mediterranean'
    INDIAN = 'indian'
    CHINESE = 'chinese'
    JAPANESE = 'japanese'
    THAI = 'thai'
    VIETNAMESE = 'vietnamese'
    KOREAN = 'korean'
    FRENCH = 'french'
    GREEK = 'greek'
    SPANISH = 'spanish'
    LATIN = 'latin'
    CARIBBEAN = 'caribbean'
    VEGETARIAN = 'vegetarian'
    VEGAN = 'vegan'
    COMFORT_FOOD = 'comfort_food'
    SOUTHERN = 'southern'
    MIDDLE_EASTERN = 'middle_eastern'
    CAFE = 'cafe'
    OTHER = 'other'

class Vendor(db.Model):
    __tablename__ = 'vendors'

    vendor_id = db.Column(db.String(36), primary_key=True, server_default=db.text("uuid_generate_v4()"))
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)
    contact_info = db.Column(JSONB, nullable=False)
    location_category = db.Column(db.Enum(LocationCategory, values_callable=lambda x: [e.value for e in x]), nullable=False)
    address = db.Column(db.String(500))
    building_name = db.Column(db.String(100))
    floor_level = db.Column(db.String(50))
    operating_hours = db.Column(JSONB, nullable=False)
    cuisine_type = db.Column(db.Enum(CuisineType, values_callable=lambda x: [e.value for e in x]), nullable=False)
    payment_methods = db.Column(MutableList.as_mutable(ARRAY(db.Enum(PaymentMethod, values_callable=lambda x: [e.value for e in x]))), nullable=False, default=[])
    dietary_tags = db.Column(MutableList.as_mutable(ARRAY(db.Enum(DietaryTag, values_callable=lambda x: [e.value for e in x]))), default=[])
    is_active = db.Column(db.Boolean, default=True)
    is_verified = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())

    def __repr__(self):
        return f'<Vendor {self.name}>'

class User(db.Model):
    __tablename__ = 'users'

    user_id = db.Column(db.String(36), primary_key=True, server_default=db.text("uuid_generate_v4()"))
    name = db.Column(db.String(255), nullable=False)
    username = db.Column(db.String(100), unique=True, nullable=False)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())

    def set_password(self, password):
        """Hash and set the password"""
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        """Check if the provided password matches the hash"""
        return check_password_hash(self.password_hash, password)

    def to_dict(self):
        """Convert user to dictionary (excluding password)"""
        return {
            'user_id': self.user_id,
            'name': self.name,
            'username': self.username,
            'email': self.email,
            'created_at': self.created_at.isoformat() if self.created_at else None
        }

    def __repr__(self):
        return f'<User {self.username}>'

class MenuItem(db.Model):
    __tablename__ = 'menu_items'

    menu_item_id = db.Column(db.String(36), primary_key=True, server_default=db.text("uuid_generate_v4()"))
    vendor_id = db.Column(db.String(36), db.ForeignKey('vendors.vendor_id', ondelete='CASCADE'), nullable=False)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)
    category = db.Column(db.String(100))  # e.g., "Entrees", "Sides", "Desserts", "Beverages"
    meal_type = db.Column(db.String(50))  # e.g., "breakfast", "lunch", "dinner", "brunch", "all_day"
    price = db.Column(db.Numeric(10, 2))  # Optional price if available
    nutritional_info = db.Column(JSONB)  # Store calories, protein, carbs, etc.
    allergens = db.Column(JSONB)  # Array of allergens
    dietary_tags = db.Column(MutableList.as_mutable(ARRAY(db.Enum(DietaryTag, values_callable=lambda x: [e.value for e in x]))), default=[])
    image_url = db.Column(db.String(500))  # Optional image URL
    is_available = db.Column(db.Boolean, default=True)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())

    # Relationships
    vendor = db.relationship('Vendor', backref='menu_items')

    def to_dict(self):
        """Convert menu item to dictionary"""
        return {
            'menu_item_id': self.menu_item_id,
            'vendor_id': self.vendor_id,
            'name': self.name,
            'description': self.description,
            'category': self.category,
            'meal_type': self.meal_type,
            'price': float(self.price) if self.price else None,
            'nutritional_info': self.nutritional_info,
            'allergens': self.allergens,
            'dietary_tags': [tag.value for tag in self.dietary_tags] if self.dietary_tags else [],
            'image_url': self.image_url,
            'is_available': self.is_available,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }

    def __repr__(self):
        return f'<MenuItem {self.name}>'

class Review(db.Model):
    __tablename__ = 'reviews'

    review_id = db.Column(db.String(36), primary_key=True, server_default=db.text("uuid_generate_v4()"))
    user_id = db.Column(db.String(36), db.ForeignKey('users.user_id', ondelete='CASCADE'), nullable=False)
    vendor_id = db.Column(db.String(36), db.ForeignKey('vendors.vendor_id', ondelete='CASCADE'), nullable=False)
    menu_item_id = db.Column(db.String(36), db.ForeignKey('menu_items.menu_item_id', ondelete='SET NULL'), nullable=True)  # Optional link to menu item
    rating = db.Column(db.Integer, nullable=False)
    comment = db.Column(db.Text)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())

    # Relationships
    user = db.relationship('User', backref='reviews')
    vendor = db.relationship('Vendor', backref='reviews')
    menu_item = db.relationship('MenuItem', backref='reviews')

    def to_dict(self):
        """Convert review to dictionary"""
        return {
            'review_id': self.review_id,
            'user_id': self.user_id,
            'vendor_id': self.vendor_id,
            'menu_item_id': self.menu_item_id,
            'menu_item_name': self.menu_item.name if self.menu_item else None,
            'vendor_name': self.vendor.name if self.vendor else None,
            'rating': self.rating,
            'comment': self.comment,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None,
            'user_name': self.user.name if self.user else None
        }

    def __repr__(self):
        return f'<Review {self.review_id} - Rating: {self.rating}>'

class Favorite(db.Model):
    __tablename__ = 'favorites'

    favorite_id = db.Column(db.String(36), primary_key=True, server_default=db.text("uuid_generate_v4()"))
    user_id = db.Column(db.String(36), db.ForeignKey('users.user_id', ondelete='CASCADE'), nullable=False)
    vendor_id = db.Column(db.String(36), db.ForeignKey('vendors.vendor_id', ondelete='CASCADE'), nullable=False)
    created_at = db.Column(db.DateTime, server_default=db.func.now())

    # Relationships
    user = db.relationship('User', backref='favorites')
    vendor = db.relationship('Vendor', backref='favorites')

    def to_dict(self):
        """Convert favorite to dictionary"""
        return {
            'favorite_id': self.favorite_id,
            'user_id': self.user_id,
            'vendor_id': self.vendor_id,
            'created_at': self.created_at.isoformat() if self.created_at else None
        }

    def __repr__(self):
        return f'<Favorite {self.favorite_id} - User: {self.user_id}, Vendor: {self.vendor_id}>'
