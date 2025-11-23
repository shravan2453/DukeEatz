-- Insert menu items for vendors
-- Note: This is a sample set. Menu items should be linked to vendors by matching vendor names.
-- In production, you would scrape or import from NetNutrition or other sources.

-- First, we need to get vendor IDs. We'll use a subquery approach.
-- Note: This assumes vendors have been loaded from load.sql

-- Marketplace Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Wood-Fired Margherita Pizza',
    'Fresh mozzarella, basil, and tomato sauce on our signature wood-fired crust',
    'Entrees',
    'dinner',
    8.50,
    '{"calories": 320, "protein": 14, "carbs": 38, "fat": 12}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Marketplace'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Harvest Veggie Bowl',
    'Quinoa, roasted vegetables, chickpeas, and tahini dressing',
    'Entrees',
    'lunch',
    7.25,
    '{"calories": 420, "protein": 16, "carbs": 58, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Marketplace'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Durham Market Fried Chicken',
    'Southern-style fried chicken with mashed potatoes and collard greens',
    'Entrees',
    'dinner',
    9.75,
    '{"calories": 680, "protein": 42, "carbs": 45, "fat": 35}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Marketplace'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Leaf & Ladle Garden Salad',
    'Mixed greens, cherry tomatoes, cucumbers, carrots, and house vinaigrette',
    'Salads',
    'all_day',
    6.50,
    '{"calories": 180, "protein": 4, "carbs": 12, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free', 'nut_free']::dietarytag[]
FROM vendors WHERE name = 'Marketplace'
LIMIT 1;

-- The Skillet Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Allergen-Free Breakfast Bowl',
    'Scrambled eggs, hash browns, turkey sausage, and fresh fruit - free from top 9 allergens',
    'Entrees',
    'breakfast',
    7.50,
    '{"calories": 380, "protein": 22, "carbs": 35, "fat": 16}',
    '[]',
    ARRAY['nut_free', 'gluten_free', 'dairy_free']::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Safe Burger',
    'Allergen-free burger with lettuce, tomato, and special sauce',
    'Entrees',
    'lunch',
    8.25,
    '{"calories": 450, "protein": 28, "carbs": 32, "fat": 22}',
    '[]',
    ARRAY['nut_free', 'gluten_free', 'dairy_free']::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- Gyotaku Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Salmon Sashimi',
    'Fresh Atlantic salmon, sliced and served with wasabi and pickled ginger',
    'Sushi & Sashimi',
    'all_day',
    12.50,
    '{"calories": 180, "protein": 24, "carbs": 0, "fat": 8}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Spicy Tuna Roll',
    'Fresh tuna, spicy mayo, cucumber, and avocado wrapped in nori and rice',
    'Sushi & Sashimi',
    'all_day',
    9.75,
    '{"calories": 320, "protein": 18, "carbs": 42, "fat": 10}',
    '["fish", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Vegetable Tempura Roll',
    'Assorted vegetables tempura-fried and rolled with rice and avocado',
    'Sushi & Sashimi',
    'all_day',
    8.50,
    '{"calories": 380, "protein": 8, "carbs": 58, "fat": 14}',
    '["gluten", "soy"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- Il Forno Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Margherita Pizza',
    'Fresh mozzarella, basil, and San Marzano tomatoes on wood-fired crust',
    'Pizza',
    'all_day',
    10.50,
    '{"calories": 420, "protein": 18, "carbs": 52, "fat": 16}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Pepperoni Pizza',
    'Classic pepperoni with mozzarella cheese on our signature crust',
    'Pizza',
    'all_day',
    11.25,
    '{"calories": 480, "protein": 22, "carbs": 52, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Penne Arrabbiata',
    'Penne pasta with spicy tomato sauce, garlic, and red pepper flakes',
    'Pasta',
    'all_day',
    9.75,
    '{"calories": 380, "protein": 14, "carbs": 68, "fat": 8}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

-- Tandoor Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Chicken Tikka Masala',
    'Tender chicken in creamy tomato-based curry sauce, served with basmati rice',
    'Entrees',
    'all_day',
    11.50,
    '{"calories": 520, "protein": 32, "carbs": 45, "fat": 22}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Vegetable Biryani',
    'Fragrant basmati rice with mixed vegetables, spices, and herbs',
    'Entrees',
    'all_day',
    9.25,
    '{"calories": 380, "protein": 10, "carbs": 68, "fat": 12}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Garlic Naan',
    'Fresh-baked flatbread brushed with garlic and butter',
    'Sides',
    'all_day',
    3.50,
    '{"calories": 180, "protein": 6, "carbs": 28, "fat": 6}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

-- Sprout Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Quinoa Power Bowl',
    'Quinoa, black beans, roasted sweet potatoes, avocado, and tahini dressing',
    'Bowls',
    'all_day',
    9.50,
    '{"calories": 480, "protein": 18, "carbs": 68, "fat": 16}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free', 'organic']::dietarytag[]
FROM vendors WHERE name = 'Sprout'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Kale Caesar Salad',
    'Fresh kale, romaine, chickpeas, and vegan caesar dressing',
    'Salads',
    'all_day',
    8.75,
    '{"calories": 320, "protein": 12, "carbs": 28, "fat": 18}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free', 'organic']::dietarytag[]
FROM vendors WHERE name = 'Sprout'
LIMIT 1;

-- Farmstead Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Farm-to-Table Burger',
    'Grass-fed beef patty with local cheddar, lettuce, tomato, and house-made bun',
    'Entrees',
    'all_day',
    12.50,
    '{"calories": 580, "protein": 38, "carbs": 42, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY['local_sourced', 'sustainable']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Southern Fried Green Tomatoes',
    'Local green tomatoes, breaded and fried, served with remoulade',
    'Sides',
    'all_day',
    6.50,
    '{"calories": 280, "protein": 6, "carbs": 32, "fat": 14}',
    '["gluten", "egg"]',
    ARRAY['vegetarian', 'local_sourced']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- Gothic Grill Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Classic Cheeseburger',
    'Beef patty, American cheese, lettuce, tomato, onion, and pickles',
    'Burgers',
    'all_day',
    8.75,
    '{"calories": 520, "protein": 28, "carbs": 38, "fat": 26}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Buffalo Chicken Wings',
    'Crispy chicken wings tossed in buffalo sauce, served with celery and blue cheese',
    'Appetizers',
    'all_day',
    9.50,
    '{"calories": 480, "protein": 32, "carbs": 8, "fat": 32}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Sazón Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Carnitas Tacos',
    'Slow-cooked pork, onions, cilantro, and lime on corn tortillas',
    'Tacos',
    'all_day',
    10.25,
    '{"calories": 420, "protein": 28, "carbs": 38, "fat": 18}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazón'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Black Bean & Corn Bowl',
    'Black beans, roasted corn, rice, avocado, and chipotle crema',
    'Bowls',
    'all_day',
    9.75,
    '{"calories": 450, "protein": 16, "carbs": 68, "fat": 14}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazón'
LIMIT 1;

-- JB's Roasts & Chops Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Prime Rib',
    'Slow-roasted prime rib with au jus, mashed potatoes, and seasonal vegetables',
    'Entrees',
    'dinner',
    18.50,
    '{"calories": 720, "protein": 52, "carbs": 28, "fat": 42}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Herb-Crusted Pork Chop',
    'Thick-cut pork chop with herb crust, apple compote, and roasted potatoes',
    'Entrees',
    'dinner',
    16.75,
    '{"calories": 580, "protein": 48, "carbs": 32, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- It's Thyme Menu Items
INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Mediterranean Wrap',
    'Grilled chicken, hummus, feta, olives, and vegetables in a whole wheat wrap',
    'Wraps',
    'all_day',
    9.25,
    '{"calories": 480, "protein": 32, "carbs": 42, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

INSERT INTO menu_items (
    vendor_id,
    name,
    description,
    category,
    meal_type,
    price,
    nutritional_info,
    allergens,
    dietary_tags
) 
SELECT 
    vendor_id,
    'Greek Salad Bowl',
    'Mixed greens, tomatoes, cucumbers, olives, feta, and Greek vinaigrette',
    'Salads',
    'all_day',
    8.50,
    '{"calories": 320, "protein": 14, "carbs": 18, "fat": 22}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

