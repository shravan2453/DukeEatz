-- DukeEatz PostgreSQL Schema
-- Clean and consistent schema for Duke University dining vendor management system

-- Drop existing objects if they exist
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
    'vietnamese',
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