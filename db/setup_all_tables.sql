-- Create prerequisite tables for DukeEatz

-- 1. Create users table
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create vendors table
CREATE TABLE IF NOT EXISTS vendors (
    vendor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255),
    location_category VARCHAR(50),
    address TEXT,
    operating_hours TEXT,
    cuisine_type VARCHAR(50),
    payment_methods TEXT,
    dietary_tags TEXT,
    created_by INTEGER REFERENCES users(user_id)
);

-- 3. Create menu_items table
CREATE TABLE IF NOT EXISTS menu_items (
    menu_item_id SERIAL PRIMARY KEY,
    vendor_id INTEGER REFERENCES vendors(vendor_id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    dietary_tags TEXT,
    is_active BOOLEAN DEFAULT TRUE
);

-- 4. Create reviews table
CREATE TABLE IF NOT EXISTS reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    vendor_id INTEGER NOT NULL REFERENCES vendors(vendor_id) ON DELETE CASCADE,
    menu_item_id INTEGER REFERENCES menu_items(menu_item_id) ON DELETE SET NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_reviews_user_id ON reviews(user_id);
CREATE INDEX IF NOT EXISTS idx_reviews_vendor_id ON reviews(vendor_id);
CREATE INDEX IF NOT EXISTS idx_reviews_menu_item_id ON reviews(menu_item_id);

-- Insert sample users
INSERT INTO users (username, name, email, password_hash) VALUES
('john_doe', 'John Doe', 'john@duke.edu', 'hashed_password_1'),
('jane_smith', 'Jane Smith', 'jane@duke.edu', 'hashed_password_2'),
('bob_jones', 'Bob Jones', 'bob@duke.edu', 'hashed_password_3');

-- Insert sample vendors (Duke Dining Locations)
INSERT INTO vendors (name, contact_info, location_category, address, cuisine_type) VALUES
('Ginger + Soy', '919-684-2896', 'on-campus', 'West Union', 'Asian'),
('Gyotaku', '919-684-2897', 'on-campus', 'West Union', 'Japanese'),
('JB''s Roasts & Chops', '919-684-2898', 'on-campus', 'West Union', 'American'),
('Sazón', '919-684-2899', 'on-campus', 'West Union', 'Latin'),
('Cafe', '919-684-2900', 'on-campus', 'West Union', 'Cafe'),
('Sprout', '919-684-2901', 'on-campus', 'West Union', 'Healthy'),
('Tandoor', '919-684-2902', 'on-campus', 'West Union', 'Indian'),
('The Chef''s Kitchen', '919-684-2903', 'on-campus', 'West Union', 'American'),
('The Commons', '919-684-2904', 'on-campus', 'West Union', 'Dining Hall'),
('The Devil''s Krafthouse', '919-684-2905', 'on-campus', 'West Union', 'Pub Food'),
('Farmstead', '919-684-2906', 'on-campus', 'West Union', 'Farm-to-Table'),
('The Skillet', '919-684-2907', 'on-campus', 'West Union', 'Breakfast'),
('Il Forno', '919-684-2908', 'on-campus', 'West Union', 'Italian'),
('Panera Bread', '919-684-2909', 'on-campus', 'West Union', 'Bakery-Cafe');

-- Insert sample menu items
INSERT INTO menu_items (vendor_id, name, description, price) VALUES
(1, 'Teriyaki Bowl', 'Chicken teriyaki with rice and vegetables', 9.99),
(1, 'Pad Thai', 'Traditional Thai noodles', 10.99),
(2, 'Sushi Roll Combo', 'California, spicy tuna, and salmon rolls', 14.99),
(2, 'Ramen Bowl', 'Tonkotsu ramen with pork', 11.99),
(3, 'Rotisserie Chicken', 'Half chicken with sides', 12.99),
(3, 'Prime Rib Sandwich', 'Slow-roasted prime rib', 10.99),
(4, 'Empanadas', 'Beef and chicken empanadas', 7.99),
(4, 'Burrito Bowl', 'Rice, beans, and choice of protein', 9.99),
(5, 'Latte', 'Espresso with steamed milk', 4.50),
(5, 'Breakfast Sandwich', 'Egg, cheese, and bacon', 6.99),
(6, 'Acai Bowl', 'Acai with granola and fruit', 8.99),
(6, 'Green Smoothie', 'Kale, spinach, and mango', 6.99),
(7, 'Chicken Tikka Masala', 'Creamy tomato curry with rice', 11.99),
(7, 'Samosas', 'Vegetable samosas with chutney', 5.99),
(8, 'Chef Special Pasta', 'Daily pasta creation', 10.99),
(8, 'Grilled Salmon', 'Atlantic salmon with vegetables', 14.99),
(9, 'Buffet Style', 'All-you-can-eat dining', 15.99),
(10, 'Craft Beer Flight', 'Four local craft beers', 12.99),
(10, 'Gourmet Burger', 'Specialty burger with fries', 11.99),
(11, 'Farm Fresh Salad', 'Seasonal vegetables and greens', 9.99),
(11, 'Grass-Fed Steak', 'Local grass-fed beef', 16.99),
(12, 'Pancake Stack', 'Buttermilk pancakes with syrup', 7.99),
(12, 'Breakfast Burrito', 'Eggs, cheese, and salsa', 8.99),
(13, 'Margherita Pizza', 'Fresh mozzarella and basil', 11.99),
(13, 'Pasta Carbonara', 'Creamy pasta with bacon', 10.99),
(14, 'You Pick Two', 'Choose soup, salad, or sandwich', 9.99),
(14, 'Broccoli Cheddar Soup', 'Creamy soup in bread bowl', 7.99);

-- Insert sample reviews for multiple vendors
INSERT INTO reviews (user_id, vendor_id, menu_item_id, rating, review_text, created_at) VALUES
-- Ginger + Soy reviews
(1, 1, 1, 5, 'The teriyaki bowl is incredible! Perfect portion and amazing flavor.', '2025-10-20 12:30:00-04'),
(2, 1, 2, 4, 'Pad Thai was delicious and authentic. Great value for the price.', '2025-10-21 13:15:00-04'),
-- Gyotaku reviews
(3, 2, 3, 5, 'Best sushi on campus! Fresh fish and perfectly seasoned rice.', '2025-10-22 18:30:00-04'),
(1, 2, 4, 4, 'Ramen bowl was hearty and flavorful. Will definitely come back.', '2025-10-23 19:45:00-04'),
-- JB's Roasts & Chops reviews
(2, 3, 5, 5, 'Rotisserie chicken is amazing! Juicy and well-seasoned.', '2025-10-24 11:30:00-04'),
(3, 3, 6, 4, 'Prime rib sandwich was delicious. Great portion size.', '2025-10-25 12:15:00-04'),
-- Sazón reviews
(1, 4, 7, 5, 'Empanadas are to die for! Authentic Latin flavors.', '2025-10-26 14:00:00-04'),
(2, 4, 8, 4, 'Burrito bowl was fresh and filling. Love the variety of toppings.', '2025-10-26 18:20:00-04'),
-- Cafe reviews
(3, 5, 9, 4, 'Best latte on campus! Perfect for studying.', '2025-10-20 09:00:00-04'),
(1, 5, 10, 5, 'Breakfast sandwich is my go-to. Always fresh and tasty.', '2025-10-21 08:30:00-04'),
-- Sprout reviews
(2, 6, 11, 5, 'Acai bowl is refreshing and healthy. Perfect after a workout!', '2025-10-22 10:00:00-04'),
(3, 6, 12, 4, 'Green smoothie is delicious and energizing.', '2025-10-23 11:00:00-04'),
-- Tandoor reviews
(1, 7, 13, 5, 'Chicken tikka masala is the best I have had! Authentic Indian flavors.', '2025-10-24 18:00:00-04'),
(2, 7, 14, 5, 'Samosas are crispy and flavorful. Great appetizer!', '2025-10-25 17:30:00-04'),
-- The Chef's Kitchen reviews
(3, 8, 15, 4, 'Chef special pasta changes daily and is always creative.', '2025-10-26 12:00:00-04'),
(1, 8, 16, 5, 'Grilled salmon was perfectly cooked. High quality ingredients.', '2025-10-26 19:00:00-04'),
-- The Commons reviews
(2, 9, 17, 4, 'Great variety at the buffet. Something for everyone!', '2025-10-20 18:00:00-04'),
(3, 9, NULL, 5, 'Love the all-you-can-eat option. Perfect for hungry students!', '2025-10-21 18:30:00-04'),
-- The Devil's Krafthouse reviews
(1, 10, 18, 5, 'Craft beer selection is excellent! Great atmosphere too.', '2025-10-22 20:00:00-04'),
(2, 10, 19, 4, 'Gourmet burger was juicy and flavorful. Fries were crispy!', '2025-10-23 19:00:00-04'),
-- Farmstead reviews
(3, 11, 20, 5, 'Farm fresh salad with local ingredients. You can taste the quality!', '2025-10-24 12:30:00-04'),
(1, 11, 21, 5, 'Grass-fed steak is worth every penny. Cooked to perfection.', '2025-10-25 19:30:00-04'),
-- The Skillet reviews
(2, 12, 22, 5, 'Pancakes are fluffy and delicious. Best breakfast on campus!', '2025-10-26 08:00:00-04'),
(3, 12, 23, 4, 'Breakfast burrito is huge and filling. Great start to the day.', '2025-10-26 09:00:00-04'),
-- Il Forno reviews
(1, 13, 24, 5, 'Margherita pizza is authentic and delicious. Fresh basil!', '2025-10-20 19:00:00-04'),
(2, 13, 25, 4, 'Pasta carbonara was creamy and rich. Very satisfying.', '2025-10-21 19:30:00-04'),
-- Panera Bread reviews
(3, 14, 26, 4, 'You Pick Two is great value. Love the variety.', '2025-10-22 12:00:00-04'),
(1, 14, 27, 5, 'Broccoli cheddar soup in a bread bowl is comfort food at its best!', '2025-10-23 12:30:00-04');
