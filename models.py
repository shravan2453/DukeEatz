from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.postgresql import JSONB, ARRAY, ENUM
from sqlalchemy.ext.mutable import MutableList
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
    ASIAN = 'asian'  # Add this line
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
    CAFE = 'cafe'
    OTHER = 'other'

class Vendor(db.Model):
    __tablename__ = 'vendors'

    vendor_id = db.Column(db.String(36), primary_key=True, server_default=db.text("uuid_generate_v4()"))
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)
    contact_info = db.Column(JSONB, nullable=False)
    location_category = db.Column(db.Enum(LocationCategory), nullable=False)
    address = db.Column(db.String(500))
    building_name = db.Column(db.String(100))
    floor_level = db.Column(db.String(50))
    operating_hours = db.Column(JSONB, nullable=False)
    cuisine_type = db.Column(db.Enum(CuisineType), nullable=False)
    payment_methods = db.Column(MutableList.as_mutable(ARRAY(db.Enum(PaymentMethod))), nullable=False, default=[])
    dietary_tags = db.Column(MutableList.as_mutable(ARRAY(db.Enum(DietaryTag))), default=[])
    is_active = db.Column(db.Boolean, default=True)
    is_verified = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.now())

    def __repr__(self):
        return f'<Vendor {self.name}>'
