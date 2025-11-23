-- DukeEatz PostgreSQL Schema
-- Clean and consistent schema for Duke University dining vendor management system

-- Drop existing objects if they exist
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS favorites CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS vendors CASCADE;
DROP TYPE IF EXISTS locationcategory CASCADE;
DROP TYPE IF EXISTS paymentmethod CASCADE;
DROP TYPE IF EXISTS dietarytag CASCADE;
DROP TYPE IF EXISTS cuisinetype CASCADE;

-- Enable UUID extension for generating unique IDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create enum types with consistent naming (no underscores)
CREATE TYPE locationcategory AS ENUM (
    'east_central_campus',
    'west_campus', 
    'merchants_on_points',
    'food_trucks',
    'off_campus'
);

CREATE TYPE paymentmethod AS ENUM (
    'food_points',
    'duke_card',
    'credit_card',
    'cash',
    'apple_pay',
    'google_pay',
    'meal_swipe',
    'board_plan'
);

CREATE TYPE dietarytag AS ENUM (
    'vegetarian',
    'vegan',
    'gluten_free',
    'nut_free',
    'dairy_free',
    'halal',
    'kosher',
    'organic',
    'local_sourced',
    'sustainable'
);

CREATE TYPE cuisinetype AS ENUM (
    'american',
    'asian',
    'mexican',
    'italian',
    'mediterranean',
    'indian',
    'thai',
    'chinese',
    'japanese',
    'korean',
    'southern',
    'comfort_food',
    'latin',
    'middle_eastern',
    'french',
    'vietnamese'
);

-- Create vendors table
CREATE TABLE vendors (
    vendor_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    contact_info JSONB NOT NULL,
    location_category locationcategory NOT NULL,
    address VARCHAR(500),
    building_name VARCHAR(100),
    floor_level VARCHAR(50),
    operating_hours JSONB NOT NULL,
    cuisine_type cuisinetype NOT NULL,
    payment_methods paymentmethod[] NOT NULL,
    dietary_tags dietarytag[] DEFAULT '{}',
    is_active BOOLEAN DEFAULT TRUE,
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX idx_vendors_location ON vendors(location_category);
CREATE INDEX idx_vendors_cuisine ON vendors(cuisine_type);
CREATE INDEX idx_vendors_payment ON vendors USING GIN(payment_methods);
CREATE INDEX idx_vendors_dietary ON vendors USING GIN(dietary_tags);

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to update updated_at column
CREATE TRIGGER update_vendors_updated_at
BEFORE UPDATE ON vendors
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Create users table for authentication
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index for users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);

-- Create trigger to update updated_at column for users
CREATE TRIGGER update_users_updated_at
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Create favorites table
CREATE TABLE favorites (
    favorite_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    vendor_id UUID NOT NULL REFERENCES vendors(vendor_id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id, vendor_id)
);

-- Create indexes for favorites
CREATE INDEX idx_favorites_user ON favorites(user_id);
CREATE INDEX idx_favorites_vendor ON favorites(vendor_id);

-- Create menu_items table
CREATE TABLE menu_items (
    menu_item_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    vendor_id UUID NOT NULL REFERENCES vendors(vendor_id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100), -- e.g., "Entrees", "Sides", "Desserts", "Beverages"
    meal_type VARCHAR(50), -- e.g., "breakfast", "lunch", "dinner", "brunch", "all_day"
    price DECIMAL(10, 2), -- Optional price if available
    nutritional_info JSONB, -- Store calories, protein, carbs, etc.
    allergens JSONB, -- Array of allergens
    dietary_tags dietarytag[] DEFAULT '{}', -- Reuse dietary tags enum
    image_url VARCHAR(500), -- Optional image URL
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for menu_items
CREATE INDEX idx_menu_items_vendor ON menu_items(vendor_id);
CREATE INDEX idx_menu_items_category ON menu_items(category);
CREATE INDEX idx_menu_items_meal_type ON menu_items(meal_type);
CREATE INDEX idx_menu_items_dietary ON menu_items USING GIN(dietary_tags);

-- Create trigger to update updated_at column for menu_items
CREATE TRIGGER update_menu_items_updated_at
BEFORE UPDATE ON menu_items
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Create reviews table
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    vendor_id UUID NOT NULL REFERENCES vendors(vendor_id) ON DELETE CASCADE,
    menu_item_id UUID REFERENCES menu_items(menu_item_id) ON DELETE SET NULL, -- Optional link to menu item
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for reviews
CREATE INDEX idx_reviews_user ON reviews(user_id);
CREATE INDEX idx_reviews_vendor ON reviews(vendor_id);
CREATE INDEX idx_reviews_menu_item ON reviews(menu_item_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);

-- Create trigger to update updated_at column for reviews
CREATE TRIGGER update_reviews_updated_at
BEFORE UPDATE ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();