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

-- The Skillet - Additional Menu Items from Images

-- BREAKFAST PLATES
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
    '2 Eggs Any Style',
    'Two eggs cooked to your preference',
    'Breakfast',
    'breakfast',
    1.99,
    '{"calories": 140, "protein": 12, "carbs": 1, "fat": 10}',
    '["egg"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Pancake Breakfast',
    'Stack of pancakes served with butter and syrup',
    'Breakfast',
    'breakfast',
    9.99,
    '{"calories": 520, "protein": 12, "carbs": 88, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'French Toast',
    'Thick slices of bread dipped in egg batter and griddled, served with syrup',
    'Breakfast',
    'breakfast',
    9.99,
    '{"calories": 480, "protein": 14, "carbs": 68, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Fast Lane Blue Plate Eggs Your Way',
    'Two eggs cooked to order with hash browns and choice of meat',
    'Breakfast',
    'breakfast',
    9.49,
    '{"calories": 420, "protein": 24, "carbs": 28, "fat": 22}',
    '["egg"]',
    ARRAY[]::dietarytag[]
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
    'Fast Lane Blue Plate',
    'Classic breakfast plate with eggs, hash browns, and choice of meat',
    'Breakfast',
    'breakfast',
    9.49,
    '{"calories": 480, "protein": 28, "carbs": 32, "fat": 26}',
    '["egg"]',
    ARRAY[]::dietarytag[]
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
    'Build Your Own Omelette',
    'Custom omelette with choice of fillings including cheese, vegetables, and meats',
    'Breakfast',
    'breakfast',
    10.59,
    '{"calories": 420, "protein": 28, "carbs": 8, "fat": 30}',
    '["egg", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Biscuits and Gravy',
    'Flaky biscuits smothered in creamy sausage gravy',
    'Breakfast',
    'breakfast',
    6.49,
    '{"calories": 580, "protein": 16, "carbs": 58, "fat": 32}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Chicken and Waffles',
    'Crispy fried chicken served with Belgian waffles and syrup',
    'Breakfast',
    'breakfast',
    10.49,
    '{"calories": 780, "protein": 42, "carbs": 78, "fat": 32}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
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
    'Biscuit Plain',
    'Fresh baked plain biscuit',
    'Breakfast',
    'breakfast',
    1.99,
    '{"calories": 180, "protein": 4, "carbs": 28, "fat": 6}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Biscuit Egg and Cheese',
    'Biscuit with scrambled egg and cheese',
    'Breakfast',
    'breakfast',
    3.99,
    '{"calories": 320, "protein": 16, "carbs": 28, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Biscuit with Protein',
    'Biscuit with choice of protein (bacon, sausage, or ham)',
    'Breakfast',
    'breakfast',
    5.49,
    '{"calories": 420, "protein": 22, "carbs": 28, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Biscuit Egg Cheese with Protein',
    'Biscuit with scrambled egg, cheese, and choice of protein',
    'Breakfast',
    'breakfast',
    6.49,
    '{"calories": 520, "protein": 28, "carbs": 28, "fat": 30}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- LUNCH HANDHELDS
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
    'BLT',
    'Classic bacon, lettuce, and tomato sandwich on toasted bread',
    'Sandwiches',
    'lunch',
    10.49,
    '{"calories": 480, "protein": 18, "carbs": 38, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
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
    'Big Country Fried Chicken Sandwich',
    'Crispy fried chicken breast on a bun with lettuce, tomato, and special sauce',
    'Sandwiches',
    'lunch',
    11.99,
    '{"calories": 680, "protein": 38, "carbs": 58, "fat": 32}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Shrimp Po Boy',
    'Fried shrimp on a French roll with lettuce, tomato, and remoulade sauce',
    'Sandwiches',
    'lunch',
    11.79,
    '{"calories": 580, "protein": 32, "carbs": 52, "fat": 26}',
    '["gluten", "shellfish", "egg"]',
    ARRAY[]::dietarytag[]
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
    'Smoked Beef Brisket Sandwich',
    'Tender smoked beef brisket on a bun with barbecue sauce',
    'Sandwiches',
    'lunch',
    14.99,
    '{"calories": 620, "protein": 48, "carbs": 42, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
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
    'Pulled Pork Sandwich',
    'Slow-cooked pulled pork on a bun with barbecue sauce',
    'Sandwiches',
    'lunch',
    10.29,
    '{"calories": 520, "protein": 32, "carbs": 42, "fat": 22}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- LUNCH-DINNER PLATES
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
    'Shrimp and Grits',
    'Sautéed shrimp served over creamy stone-ground grits',
    'Entrees',
    'all_day',
    12.99,
    '{"calories": 580, "protein": 38, "carbs": 68, "fat": 18}',
    '["shellfish", "milk"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Traditional NC style bbq',
    'North Carolina style pulled pork barbecue with sides',
    'Entrees',
    'all_day',
    11.49,
    '{"calories": 520, "protein": 38, "carbs": 48, "fat": 20}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Homestyle Meatloaf',
    'Classic meatloaf with mashed potatoes and gravy',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 580, "protein": 38, "carbs": 42, "fat": 28}',
    '["egg", "gluten"]',
    ARRAY[]::dietarytag[]
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
    'Pulled Pork and Tenders',
    'Pulled pork with fried chicken tenders, served with sides',
    'Entrees',
    'all_day',
    12.79,
    '{"calories": 680, "protein": 48, "carbs": 52, "fat": 32}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
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
    'Catfish Platter',
    'Fried catfish fillets served with sides',
    'Entrees',
    'all_day',
    14.99,
    '{"calories": 720, "protein": 42, "carbs": 58, "fat": 36}',
    '["fish", "gluten", "egg"]',
    ARRAY[]::dietarytag[]
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
    'Smoked Beef Brisket(5oz)',
    '5oz portion of slow-smoked beef brisket with sides',
    'Entrees',
    'all_day',
    15.99,
    '{"calories": 480, "protein": 42, "carbs": 8, "fat": 32}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    '2 PC Fried Chicken',
    'Two pieces of crispy fried chicken with sides',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 580, "protein": 38, "carbs": 42, "fat": 28}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
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
    '3 PC Fried Chicken',
    'Three pieces of crispy fried chicken with sides',
    'Entrees',
    'all_day',
    14.39,
    '{"calories": 840, "protein": 54, "carbs": 58, "fat": 42}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
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
    'Fried Chicken Tenders(3)',
    'Three crispy fried chicken tenders with sides',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 32, "carbs": 38, "fat": 26}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
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
    '3 Sides Platter',
    'Choose any three sides from our selection',
    'Entrees',
    'all_day',
    8.99,
    '{"calories": 480, "protein": 12, "carbs": 68, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- NOURISH MEALS
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
    'Beef Brisket Sandwich Combo',
    'Smoked beef brisket sandwich with sides and drink',
    'Entrees',
    'all_day',
    13.99,
    '{"calories": 720, "protein": 48, "carbs": 58, "fat": 32}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
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
    'Vegetarian Omelet Combo',
    'Vegetarian omelet with sides and drink',
    'Breakfast',
    'all_day',
    10.59,
    '{"calories": 480, "protein": 24, "carbs": 42, "fat": 24}',
    '["egg", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Sauteed Catfish Combo',
    'Sautéed catfish with sides and drink',
    'Entrees',
    'all_day',
    14.99,
    '{"calories": 580, "protein": 42, "carbs": 48, "fat": 24}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- SPECIALS
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
    '$5 Meal Deal',
    'Daily promotional meal deal including main item, side, and drink',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- LUNCH SIDES
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
    'Mashed Potatoes',
    'Creamy mashed potatoes',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 240, "protein": 4, "carbs": 38, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Mashed Potatoes with Gravy',
    'Creamy mashed potatoes topped with gravy',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 280, "protein": 6, "carbs": 38, "fat": 12}',
    '["milk", "gluten"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Pinto Beans',
    'Seasoned pinto beans',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 180, "protein": 10, "carbs": 32, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Succotash',
    'Corn and lima beans sautéed together',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 120, "protein": 4, "carbs": 24, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Watermelon Salad',
    'Fresh watermelon chunks with mint',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 80, "protein": 2, "carbs": 18, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Vanilla Greek Yogurt Cup',
    'Cup of vanilla Greek yogurt',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 160, "protein": 14, "carbs": 18, "fat": 4}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Griddled Squash & Onions',
    'Sautéed squash and onions',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 100, "protein": 2, "carbs": 18, "fat": 4}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Whole Banana',
    'Fresh whole banana',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 105, "protein": 1, "carbs": 27, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Whole Orange',
    'Fresh whole orange',
    'Sides',
    'all_day',
    1.29,
    '{"calories": 62, "protein": 1, "carbs": 15, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Whole Red Delicious Apple',
    'Fresh whole red delicious apple',
    'Sides',
    'all_day',
    1.49,
    '{"calories": 80, "protein": 0, "carbs": 21, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Fruit Salad',
    'Mixed fresh fruit salad',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 120, "protein": 2, "carbs": 28, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Bacon Collard Greens',
    'Collard greens cooked with bacon',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 120, "protein": 6, "carbs": 8, "fat": 8}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Country Green Beans',
    'Southern-style green beans cooked with seasonings',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 60, "protein": 2, "carbs": 10, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Cole Slaw',
    'Creamy coleslaw with cabbage and carrots',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 180, "protein": 2, "carbs": 18, "fat": 12}',
    '["milk", "egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Mixed Fruit',
    'Assorted fresh mixed fruit',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 100, "protein": 1, "carbs": 24, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Seasoned Diced Potato',
    'Diced potatoes seasoned and cooked',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 220, "protein": 4, "carbs": 42, "fat": 4}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Mac and Cheese',
    'Creamy macaroni and cheese',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 380, "protein": 14, "carbs": 42, "fat": 16}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Sourdough or Wheat Toast',
    'Two slices of sourdough or wheat toast with butter',
    'Sides',
    'all_day',
    1.19,
    '{"calories": 180, "protein": 6, "carbs": 32, "fat": 4}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Brioche Roll',
    'Fresh baked brioche roll',
    'Sides',
    'all_day',
    1.59,
    '{"calories": 220, "protein": 6, "carbs": 38, "fat": 6}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- DESSERTS
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
    'Banana Pudding',
    'Classic Southern banana pudding with vanilla wafers',
    'Desserts',
    'all_day',
    4.99,
    '{"calories": 380, "protein": 6, "carbs": 58, "fat": 14}',
    '["milk", "egg", "gluten"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Apple Cobbler',
    'Warm apple cobbler with cinnamon and crumb topping',
    'Desserts',
    'all_day',
    4.99,
    '{"calories": 420, "protein": 4, "carbs": 68, "fat": 16}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Skillet'
LIMIT 1;

-- BEVERAGES
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
    'Dasani Water 20 oz',
    'Purified bottled water, 20oz',
    'Beverages',
    'all_day',
    1.69,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Orange Juice',
    'Fresh orange juice, 16oz',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 240, "protein": 2, "carbs": 58, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Apple Juice',
    'Refreshing apple juice, 16oz',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 220, "protein": 0, "carbs": 56, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Body Armor',
    'Sports drink with electrolytes and vitamins',
    'Beverages',
    'all_day',
    4.19,
    '{"calories": 140, "protein": 0, "carbs": 36, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Vitamin Water Acai Blueberry Pomegranate',
    'Vitamin-enhanced water with acai, blueberry, and pomegranate flavors',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 50, "protein": 0, "carbs": 13, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Fair Life Chocolate Milk',
    'Ultra-filtered chocolate milk, 14oz',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 200, "protein": 14, "carbs": 24, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Fair Life Strawberry Milk',
    'Ultra-filtered strawberry milk, 14oz',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 200, "protein": 14, "carbs": 24, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Smartwater 20oz',
    'Vapor-distilled water with electrolytes, 20oz',
    'Beverages',
    'all_day',
    2.09,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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

-- Gyotaku - Additional Menu Items from Images

-- SPECIALS
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
    '$5 Meal',
    'Daily promotional meal deal',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- STARTERS & SALADS
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
    'Salmon Tower',
    'Layered salmon tower with avocado and special sauce',
    'Appetizers',
    'all_day',
    13.89,
    '{"calories": 380, "protein": 28, "carbs": 18, "fat": 22}',
    '["fish", "soy"]',
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
    'Tuna Tower',
    'Layered tuna tower with avocado and special sauce',
    'Appetizers',
    'all_day',
    13.89,
    '{"calories": 360, "protein": 32, "carbs": 18, "fat": 18}',
    '["fish", "soy"]',
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
    'MISO SOUP',
    'Traditional Japanese miso soup with tofu and seaweed',
    'Appetizers',
    'all_day',
    2.19,
    '{"calories": 40, "protein": 2, "carbs": 4, "fat": 2}',
    '["soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'EDAMAME',
    'Steamed soybeans, lightly salted',
    'Appetizers',
    'all_day',
    4.19,
    '{"calories": 120, "protein": 12, "carbs": 10, "fat": 5}',
    '["soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'SEAWEED SALAD',
    'Fresh seaweed salad with sesame dressing',
    'Salads',
    'all_day',
    4.19,
    '{"calories": 60, "protein": 2, "carbs": 8, "fat": 2}',
    '["fish", "soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- SUSHI ROLL
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
    'Dancing Eel',
    'Eel roll with cucumber and special eel sauce',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 380, "protein": 18, "carbs": 48, "fat": 12}',
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
    'Rainbow',
    'Assorted fish with avocado, cucumber, and masago',
    'Sushi & Sashimi',
    'all_day',
    10.99,
    '{"calories": 360, "protein": 20, "carbs": 48, "fat": 10}',
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
    'Spicy Tuna',
    'Fresh tuna with spicy mayo, cucumber, and avocado',
    'Sushi & Sashimi',
    'all_day',
    9.29,
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
    'Red Dragon',
    'Spicy tuna and cucumber topped with eel and avocado',
    'Sushi & Sashimi',
    'all_day',
    10.99,
    '{"calories": 400, "protein": 22, "carbs": 48, "fat": 14}',
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
    'Salmon Crunch Roll',
    'Salmon with cucumber, avocado, and tempura crunch',
    'Sushi & Sashimi',
    'all_day',
    9.29,
    '{"calories": 380, "protein": 20, "carbs": 48, "fat": 12}',
    '["fish", "gluten", "soy"]',
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
    'Shrimp Tempura',
    'Tempura shrimp with cucumber, avocado, and eel sauce',
    'Sushi & Sashimi',
    'all_day',
    10.99,
    '{"calories": 420, "protein": 18, "carbs": 52, "fat": 14}',
    '["shellfish", "gluten", "soy"]',
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
    'Blossom Roll',
    'Specialty roll with assorted fish and vegetables',
    'Sushi & Sashimi',
    'all_day',
    10.99,
    '{"calories": 380, "protein": 20, "carbs": 48, "fat": 12}',
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
    'Coco Roll',
    'Coconut shrimp roll with vegetables and special sauce',
    'Sushi & Sashimi',
    'all_day',
    10.29,
    '{"calories": 400, "protein": 18, "carbs": 48, "fat": 14}',
    '["shellfish", "gluten", "soy"]',
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
    'California Roll Combo',
    'California roll with miso soup and salad',
    'Sushi & Sashimi',
    'all_day',
    9.25,
    '{"calories": 420, "protein": 14, "carbs": 58, "fat": 14}',
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
    'Fire Cracker Roll',
    'Spicy roll with tuna, jalapeño, and special sauce',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 360, "protein": 20, "carbs": 48, "fat": 10}',
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
    'Mary roll',
    'Specialty roll with assorted fish and vegetables',
    'Sushi & Sashimi',
    'all_day',
    10.29,
    '{"calories": 380, "protein": 20, "carbs": 48, "fat": 12}',
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
    'Nigiri Combo',
    'Assorted nigiri sushi selection',
    'Sushi & Sashimi',
    'all_day',
    12.39,
    '{"calories": 320, "protein": 28, "carbs": 38, "fat": 8}',
    '["fish", "soy"]',
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
    'White Tiger Roll',
    'Specialty roll with white fish and vegetables',
    'Sushi & Sashimi',
    'all_day',
    10.29,
    '{"calories": 360, "protein": 18, "carbs": 48, "fat": 10}',
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
    'California Roll',
    'Classic California roll with crab, avocado, and cucumber',
    'Sushi & Sashimi',
    'all_day',
    7.89,
    '{"calories": 280, "protein": 10, "carbs": 38, "fat": 10}',
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
    'Veggie',
    'Vegetable roll with cucumber, avocado, and carrots',
    'Sushi & Sashimi',
    'all_day',
    7.89,
    '{"calories": 240, "protein": 6, "carbs": 42, "fat": 8}',
    '["soy"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Salmon Avocado',
    'Salmon and avocado roll',
    'Sushi & Sashimi',
    'all_day',
    9.29,
    '{"calories": 320, "protein": 18, "carbs": 42, "fat": 12}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- YUBU SUSHI
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
    'Shrimp Tempura Yubu Sushi',
    'Yubu sushi with shrimp tempura filling',
    'Sushi & Sashimi',
    'all_day',
    10.49,
    '{"calories": 360, "protein": 16, "carbs": 48, "fat": 12}',
    '["shellfish", "gluten", "soy"]',
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
    'Salmon Yubu Sushi',
    'Yubu sushi with fresh salmon filling',
    'Sushi & Sashimi',
    'all_day',
    10.49,
    '{"calories": 320, "protein": 20, "carbs": 42, "fat": 10}',
    '["fish", "soy"]',
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
    'Amago Yubu Sushi',
    'Yubu sushi with sweet eel filling',
    'Sushi & Sashimi',
    'all_day',
    10.49,
    '{"calories": 340, "protein": 18, "carbs": 42, "fat": 12}',
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
    'Seaweed Salad Yubu Sushi',
    'Yubu sushi with seaweed salad filling',
    'Sushi & Sashimi',
    'all_day',
    10.49,
    '{"calories": 280, "protein": 8, "carbs": 42, "fat": 8}',
    '["fish", "soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Avocado Yubu Sushi',
    'Yubu sushi with avocado filling',
    'Sushi & Sashimi',
    'all_day',
    10.49,
    '{"calories": 300, "protein": 6, "carbs": 42, "fat": 12}',
    '["soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- SUSHI BURRITO
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
    'Southern',
    'Sushi burrito with Southern-style fillings',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 24, "carbs": 68, "fat": 16}',
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
    'Arctic',
    'Sushi burrito with Arctic-style fillings',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 500, "protein": 22, "carbs": 68, "fat": 14}',
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
    'Atlantic',
    'Sushi burrito with Atlantic-style fillings',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 24, "carbs": 68, "fat": 16}',
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
    'Pacific',
    'Sushi burrito with Pacific-style fillings',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 500, "protein": 22, "carbs": 68, "fat": 14}',
    '["fish", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- MAKE YOUR OWN SUSHI
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
    'Make Your Own Sushi',
    'Build your own sushi roll with choice of fish, vegetables, and sauces',
    'Sushi & Sashimi',
    'all_day',
    11.99,
    '{"calories": 400, "protein": 20, "carbs": 58, "fat": 12}',
    '["fish", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- SASHIMI & NIGIRI
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
    'Nigiri & Sashimi',
    'Assorted nigiri and sashimi selection',
    'Sushi & Sashimi',
    'all_day',
    13.99,
    '{"calories": 320, "protein": 32, "carbs": 28, "fat": 10}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- SASHIMI BOWL
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
    'Sashimi Bowl',
    'Bowl of fresh sashimi over rice with vegetables',
    'Sushi & Sashimi',
    'all_day',
    13.59,
    '{"calories": 420, "protein": 36, "carbs": 48, "fat": 12}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Gyotaku'
LIMIT 1;

-- EXTRAS
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
    'Extra Proteins per piece',
    'Additional protein per piece',
    'Sides',
    'all_day',
    1.79,
    '{"calories": 40, "protein": 8, "carbs": 0, "fat": 1}',
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
    'Extra Proteins Proteins per piece',
    'Additional proteins per piece',
    'Sides',
    'all_day',
    1.79,
    '{"calories": 40, "protein": 8, "carbs": 0, "fat": 1}',
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
    'Extra Proteins per piece',
    'Additional protein per piece for make your own sushi',
    'Sides',
    'all_day',
    1.85,
    '{"calories": 40, "protein": 8, "carbs": 0, "fat": 1}',
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
    'Extra Vegetables',
    'Additional vegetables for your sushi',
    'Sides',
    'all_day',
    1.29,
    '{"calories": 20, "protein": 1, "carbs": 4, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Extra Veggies',
    'Additional vegetables for make your own sushi',
    'Sides',
    'all_day',
    1.29,
    '{"calories": 20, "protein": 1, "carbs": 4, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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

-- Il Forno - Additional Menu Items from Images

-- PIZZA
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
    'Blaise',
    'Wood-fired pizza with specialty toppings',
    'Pizza',
    'all_day',
    11.99,
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
    'Bruschetta',
    'Pizza topped with fresh bruschetta, tomatoes, basil, and mozzarella',
    'Pizza',
    'all_day',
    11.99,
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
    'Quattro',
    'Four cheese pizza with mozzarella, provolone, parmesan, and ricotta',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 24, "carbs": 52, "fat": 24}',
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
    'Harvest',
    'Pizza with seasonal vegetables and herbs',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 420, "protein": 16, "carbs": 52, "fat": 16}',
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
    'Kyles BBQ',
    'BBQ chicken pizza with red onions and mozzarella',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 28, "carbs": 52, "fat": 20}',
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
    'Margherita',
    'Classic margherita with fresh mozzarella, basil, and San Marzano tomatoes',
    'Pizza',
    'all_day',
    9.99,
    '{"calories": 400, "protein": 18, "carbs": 48, "fat": 16}',
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
    'Pjs New Yorker',
    'New York style pizza with pepperoni, sausage, and mozzarella',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 560, "protein": 26, "carbs": 52, "fat": 24}',
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
    'Rustic',
    'Rustic pizza with roasted vegetables and herbs',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 440, "protein": 18, "carbs": 52, "fat": 18}',
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
    'Vegan Pizza',
    'Plant-based pizza with vegan cheese and vegetables',
    'Pizza',
    'all_day',
    9.99,
    '{"calories": 380, "protein": 12, "carbs": 52, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Heritage Honey',
    'Pizza with honey, prosciutto, and arugula',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 500, "protein": 22, "carbs": 52, "fat": 20}',
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
    'Stinger',
    'Spicy pizza with pepperoni, jalapeños, and mozzarella',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 24, "carbs": 52, "fat": 22}',
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
    '1 Slice Cheese',
    'Single slice of cheese pizza',
    'Pizza',
    'all_day',
    3.99,
    '{"calories": 280, "protein": 12, "carbs": 32, "fat": 12}',
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
    '1 Slice Meat',
    'Single slice of pizza with meat toppings',
    'Pizza',
    'all_day',
    4.49,
    '{"calories": 320, "protein": 16, "carbs": 32, "fat": 14}',
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
    '2 Slice Meat',
    'Two slices of pizza with meat toppings',
    'Pizza',
    'all_day',
    8.49,
    '{"calories": 640, "protein": 32, "carbs": 64, "fat": 28}',
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
    '2 Slices Cheese',
    'Two slices of cheese pizza',
    'Pizza',
    'all_day',
    7.49,
    '{"calories": 560, "protein": 24, "carbs": 64, "fat": 24}',
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
    'Breadstick',
    'Fresh baked breadstick',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 120, "protein": 4, "carbs": 22, "fat": 2}',
    '["gluten"]',
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
    'Buffalo Chicken',
    'Pizza with buffalo chicken, blue cheese, and mozzarella',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 540, "protein": 30, "carbs": 52, "fat": 22}',
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
    'Chicken Pesto',
    'Pizza with grilled chicken, pesto sauce, and mozzarella',
    'Pizza',
    'all_day',
    11.99,
    '{"calories": 500, "protein": 28, "carbs": 52, "fat": 20}',
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
    'Personal Cheese Pizza',
    'Personal size cheese pizza',
    'Pizza',
    'all_day',
    10.49,
    '{"calories": 680, "protein": 28, "carbs": 84, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

-- CHEF PASTA
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
    'Blackened Shrimp Scampi',
    'Blackened shrimp with garlic, white wine, and lemon over pasta',
    'Pasta',
    'all_day',
    13.99,
    '{"calories": 580, "protein": 38, "carbs": 68, "fat": 16}',
    '["shellfish", "gluten"]',
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
    'Veggie Pasta',
    'Pasta with mixed vegetables in marinara sauce',
    'Pasta',
    'all_day',
    9.89,
    '{"calories": 420, "protein": 14, "carbs": 72, "fat": 10}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Pasta and Sauce Only',
    'Pasta with your choice of sauce',
    'Pasta',
    'all_day',
    6.99,
    '{"calories": 320, "protein": 12, "carbs": 58, "fat": 6}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Custom Pasta',
    'Build your own pasta with choice of pasta, sauce, and toppings',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 480, "protein": 18, "carbs": 68, "fat": 14}',
    '["gluten"]',
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
    'Chicken Alfredo',
    'Creamy alfredo sauce with grilled chicken over pasta',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 680, "protein": 38, "carbs": 68, "fat": 28}',
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
    'Garden Pesto',
    'Pasta with pesto sauce and fresh vegetables',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 16, "carbs": 68, "fat": 20}',
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
    'Salmon Alfredo',
    'Creamy alfredo sauce with grilled salmon over pasta',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 720, "protein": 42, "carbs": 68, "fat": 30}',
    '["fish", "gluten", "milk"]',
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
    'Meatballs & Spaghetti',
    'Classic spaghetti with meatballs in marinara sauce',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 680, "protein": 38, "carbs": 78, "fat": 22}',
    '["gluten", "egg"]',
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
    'Braised Beef',
    'Tender braised beef over pasta with rich sauce',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 620, "protein": 42, "carbs": 68, "fat": 20}',
    '["gluten"]',
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
    'Chicken Basil Pesto',
    'Grilled chicken with basil pesto over pasta',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 560, "protein": 36, "carbs": 68, "fat": 18}',
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
    'Parma Rosa',
    'Pasta with parma rosa sauce, a blend of marinara and alfredo',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 580, "protein": 20, "carbs": 68, "fat": 22}',
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
    'Spicy Il Forno',
    'Spicy pasta with peppers, garlic, and red pepper flakes',
    'Pasta',
    'all_day',
    11.99,
    '{"calories": 480, "protein": 16, "carbs": 68, "fat": 16}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

-- TAPAS
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
    'Stuffed Arepa',
    'Traditional arepa stuffed with choice of fillings',
    'Tapas',
    'all_day',
    6.49,
    '{"calories": 320, "protein": 12, "carbs": 42, "fat": 12}',
    '["gluten"]',
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
    'Stuffed Arepa + one side',
    'Stuffed arepa with one side dish',
    'Tapas',
    'all_day',
    10.00,
    '{"calories": 520, "protein": 18, "carbs": 68, "fat": 18}',
    '["gluten"]',
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
    '3 sides',
    'Choose any three sides from our selection',
    'Tapas',
    'all_day',
    10.00,
    '{"calories": 480, "protein": 12, "carbs": 68, "fat": 16}',
    '[]',
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
    'Panini',
    'Grilled panini sandwich with choice of fillings',
    'Tapas',
    'all_day',
    10.00,
    '{"calories": 480, "protein": 24, "carbs": 48, "fat": 20}',
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
    'Lunch Slice Combo',
    'Pizza slice with side and drink',
    'Tapas',
    'lunch',
    10.00,
    '{"calories": 580, "protein": 20, "carbs": 68, "fat": 22}',
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
    'Single Empanada',
    'One empanada with choice of filling',
    'Tapas',
    'all_day',
    3.29,
    '{"calories": 280, "protein": 12, "carbs": 32, "fat": 12}',
    '["gluten"]',
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
    '1 Empanada + 2 sides',
    'One empanada with two side dishes',
    'Tapas',
    'all_day',
    10.00,
    '{"calories": 520, "protein": 18, "carbs": 68, "fat": 18}',
    '["gluten"]',
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
    '2 Empanadas + 1 side',
    'Two empanadas with one side dish',
    'Tapas',
    'all_day',
    10.00,
    '{"calories": 560, "protein": 20, "carbs": 64, "fat": 20}',
    '["gluten"]',
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
    'Any 3 Empanadas',
    'Choose any three empanadas',
    'Tapas',
    'all_day',
    10.00,
    '{"calories": 840, "protein": 36, "carbs": 96, "fat": 36}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

-- DESSERTS
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
    'Iced Brownie',
    'Chocolate brownie served iced',
    'Desserts',
    'all_day',
    2.89,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["gluten", "milk", "egg"]',
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
    'Chocolate Chip Cookie',
    'Fresh baked chocolate chip cookie',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 280, "protein": 4, "carbs": 38, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

-- BEVERAGES
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
    'Topo Chico',
    'Sparkling mineral water, 12oz',
    'Beverages',
    'all_day',
    2.29,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    '1L Smart Water',
    'Vapor-distilled water with electrolytes, 1 liter',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Sports Water',
    'Electrolyte-enhanced sports water',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 10, "protein": 0, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Smart Water 20oz',
    'Vapor-distilled water with electrolytes, 20oz',
    'Beverages',
    'all_day',
    2.09,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Blood Orange Pelligrino',
    'San Pellegrino sparkling water with blood orange flavor',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 30, "protein": 0, "carbs": 8, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Lemon Pelligrino',
    'San Pellegrino sparkling water with lemon flavor',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 30, "protein": 0, "carbs": 8, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'San Pelligrino Sparkling Water',
    'Italian sparkling mineral water',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Il Forno'
LIMIT 1;

-- ILFORNO SPECIALS
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
    '$5 Meal Deal',
    'Daily promotional meal deal including main item, side, and drink',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
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

-- Tandoor - Additional Menu Items from Images

-- SPECIALS
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
    '$5 Meal Deal',
    'Daily promotional meal deal including main item, side, and drink',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

-- WEDNESDAY COMBOS
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
    'Wednesday Specialty Non-Vegetarian Combo',
    'Wednesday special non-vegetarian combo with curry, rice, and sides',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 680, "protein": 38, "carbs": 78, "fat": 24}',
    '[]',
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
    'Wednesday Non-Vegetarian Combo',
    'Wednesday non-vegetarian combo with curry, rice, and sides',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 640, "protein": 36, "carbs": 72, "fat": 22}',
    '[]',
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
    'Wednesday Specialty Vegetarian Combo',
    'Wednesday special vegetarian combo with curry, rice, and sides',
    'Entrees',
    'all_day',
    10.89,
    '{"calories": 580, "protein": 18, "carbs": 88, "fat": 18}',
    '[]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Wednesday Vegetarian Combo',
    'Wednesday vegetarian combo with curry, rice, and sides',
    'Entrees',
    'all_day',
    10.89,
    '{"calories": 540, "protein": 16, "carbs": 82, "fat": 16}',
    '[]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

-- APPETIZERS
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
    'Vegetable Dosai',
    'Crispy South Indian crepe filled with spiced vegetables',
    'Appetizers',
    'all_day',
    10.29,
    '{"calories": 420, "protein": 12, "carbs": 68, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Vegetable Samosa',
    'Crispy pastry filled with spiced potatoes and vegetables',
    'Appetizers',
    'all_day',
    4.99,
    '{"calories": 280, "protein": 6, "carbs": 38, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Chicken Dosai',
    'Crispy South Indian crepe filled with spiced chicken',
    'Appetizers',
    'all_day',
    11.49,
    '{"calories": 480, "protein": 24, "carbs": 68, "fat": 14}',
    '["gluten"]',
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
    'Masala Dosai',
    'Crispy South Indian crepe filled with spiced potato masala',
    'Appetizers',
    'all_day',
    10.29,
    '{"calories": 440, "protein": 10, "carbs": 72, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Sada Dosai',
    'Plain crispy South Indian crepe, served with chutney and sambar',
    'Appetizers',
    'all_day',
    8.59,
    '{"calories": 320, "protein": 8, "carbs": 58, "fat": 8}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

-- BREAD
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
    'Naan',
    'Fresh-baked traditional Indian flatbread',
    'Bread',
    'all_day',
    2.49,
    '{"calories": 160, "protein": 5, "carbs": 24, "fat": 4}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Bread',
    'all_day',
    3.79,
    '{"calories": 180, "protein": 6, "carbs": 28, "fat": 6}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Tandoor'
LIMIT 1;

-- DESSERTS-LASSI
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
    'Gulab Jamun',
    'Sweet milk dumplings soaked in rose-flavored syrup',
    'Desserts',
    'all_day',
    4.25,
    '{"calories": 320, "protein": 6, "carbs": 58, "fat": 10}',
    '["milk", "gluten"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Mango Lassi',
    'Creamy yogurt drink blended with sweet mango',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 240, "protein": 8, "carbs": 42, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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

-- Farmstead - Additional Menu Items from Images

-- SPROUT ENTREES
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
    'Meatless Moroccan Chicken',
    'Plant-based chicken alternative with Moroccan spices, served with rice and vegetables',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 420, "protein": 24, "carbs": 48, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    '3 Composed Salad',
    'Three composed salads featuring chickpea, beet, and orange with mixed greens',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 320, "protein": 12, "carbs": 42, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Plant-Based Chicken Nuggets Meal',
    'Plant-based chicken nuggets served with fries and a drink',
    'Entrees',
    'all_day',
    12.49,
    '{"calories": 580, "protein": 22, "carbs": 68, "fat": 22}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Chickpea Stew',
    'Hearty chickpea stew with rice and Brussels sprouts',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 480, "protein": 18, "carbs": 72, "fat": 12}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Falafel bowl',
    'Falafel served over grains with vegetables and tahini sauce',
    'Entrees',
    'all_day',
    10.99,
    '{"calories": 520, "protein": 16, "carbs": 68, "fat": 18}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Plant-Based Chicken Nuggets',
    'Crispy plant-based chicken nuggets, served a la carte',
    'Entrees',
    'all_day',
    6.99,
    '{"calories": 320, "protein": 14, "carbs": 38, "fat": 14}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Lentil Stew',
    'Hearty lentil stew with vegetables and herbs',
    'Entrees',
    'all_day',
    12.74,
    '{"calories": 420, "protein": 22, "carbs": 68, "fat": 8}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    '3 Bean Chili',
    'Hearty three-bean chili with vegetables and spices',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 380, "protein": 20, "carbs": 58, "fat": 10}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Black pepper tofu',
    'Pan-seared tofu with black pepper seasoning, served with rice and vegetables',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 360, "protein": 24, "carbs": 42, "fat": 12}',
    '["soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Avocado Toast',
    'Sliced avocado on toasted bread with seasonings and optional toppings',
    'Breakfast',
    'breakfast',
    7.99,
    '{"calories": 320, "protein": 8, "carbs": 32, "fat": 18}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- SPROUT SPECIALS
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
    'Yogurt Bar 3 Toppings',
    'Yogurt with choice of three toppings including fruits, granola, and nuts',
    'Breakfast',
    'all_day',
    6.29,
    '{"calories": 280, "protein": 12, "carbs": 42, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Spicy Cauliflower Wrap',
    'Roasted spicy cauliflower with vegetables and sauce in a wrap',
    'Wraps',
    'all_day',
    9.99,
    '{"calories": 380, "protein": 12, "carbs": 48, "fat": 16}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Falafel Wrap',
    'Falafel with vegetables and tahini sauce wrapped in pita',
    'Wraps',
    'all_day',
    9.99,
    '{"calories": 420, "protein": 14, "carbs": 52, "fat": 16}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Black Bean Burger',
    'Plant-based black bean burger patty on a bun with toppings',
    'Handhelds',
    'all_day',
    9.99,
    '{"calories": 420, "protein": 18, "carbs": 58, "fat": 14}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Falafel Pita Pocket',
    'Falafel balls in a pita pocket with vegetables and tahini',
    'Handhelds',
    'all_day',
    6.99,
    '{"calories": 380, "protein": 12, "carbs": 48, "fat": 14}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- FARMSTEAD SANDWICHES
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
    'Bratwurst',
    'German-style bratwurst sausage on a bun with sauerkraut and mustard',
    'Handhelds',
    'all_day',
    10.89,
    '{"calories": 480, "protein": 22, "carbs": 38, "fat": 24}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
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
    '2 Sliders',
    'Two mini burgers with choice of protein and toppings',
    'Handhelds',
    'all_day',
    11.49,
    '{"calories": 520, "protein": 28, "carbs": 42, "fat": 24}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Turkey Swiss Avocado',
    'Sliced turkey with Swiss cheese and avocado on bread with lettuce and tomato',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 480, "protein": 32, "carbs": 38, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Farmstead Chicken Shawarma',
    'Marinated chicken shawarma with vegetables and garlic sauce in a wrap',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 38, "carbs": 42, "fat": 18}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
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
    'Farmstead Lamb Gyro',
    'Roasted lamb with vegetables and tzatziki sauce in a pita wrap',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 580, "protein": 32, "carbs": 42, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Chicken Caesar Wrap',
    'Grilled chicken with romaine lettuce, parmesan cheese, and Caesar dressing in a wrap',
    'Wraps',
    'all_day',
    9.99,
    '{"calories": 480, "protein": 32, "carbs": 38, "fat": 22}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- FARMSTEAD ENTREES
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
    'Bourbon Garlic Chicken',
    'Chicken breast marinated in bourbon and garlic, grilled to perfection',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 420, "protein": 42, "carbs": 8, "fat": 20}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Spanakopita',
    'Greek spinach and feta cheese pie wrapped in phyllo pastry',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 480, "protein": 18, "carbs": 42, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Honey Garlic Chicken',
    'Chicken breast glazed with honey and garlic, served with sides',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 440, "protein": 40, "carbs": 32, "fat": 18}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Bratwurst',
    'German-style bratwurst sausage served as an entree with sides',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 520, "protein": 24, "carbs": 8, "fat": 38}',
    '[]',
    ARRAY[]::dietarytag[]
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
    'Quarter Chicken',
    'Quarter portion of roasted chicken, tender and juicy',
    'Entrees',
    'all_day',
    11.49,
    '{"calories": 380, "protein": 42, "carbs": 2, "fat": 22}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Atlantic Blackened Salmon Fillets',
    'Fresh Atlantic salmon fillets with blackened seasoning, grilled to perfection',
    'Entrees',
    'all_day',
    15.99,
    '{"calories": 420, "protein": 38, "carbs": 4, "fat": 26}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- FARMSTEAD SPECIALS
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
    '$5 Meal Deal',
    'Daily promotional meal deal including main item, side, and drink',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- CARVING STATION
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
    'Gyro',
    'Traditional Greek gyro meat, carved to order and served with pita and tzatziki',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 480, "protein": 28, "carbs": 38, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Smoked Beef Brisket',
    'Slow-smoked beef brisket, carved to order',
    'Entrees',
    'all_day',
    13.89,
    '{"calories": 520, "protein": 48, "carbs": 4, "fat": 34}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Roasted Turkey',
    'Roasted turkey breast, carved to order',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 320, "protein": 48, "carbs": 2, "fat": 12}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- NOURISH MEALS
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
    'Salmon Burger',
    'Grilled salmon patty on a bun with lettuce, tomato, and special sauce',
    'Handhelds',
    'all_day',
    9.99,
    '{"calories": 480, "protein": 32, "carbs": 38, "fat": 22}',
    '["fish", "gluten"]',
    ARRAY['gluten_free']::dietarytag[]
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
    '3 Composed Salads',
    'Three composed salads featuring chickpea, beet, and orange with mixed greens',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 320, "protein": 12, "carbs": 42, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Chickpea Stew',
    'Hearty chickpea stew with rice and Brussels sprouts',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 480, "protein": 18, "carbs": 72, "fat": 12}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Nourish Salad',
    'Fresh mixed greens with vegetables, grains, and house dressing',
    'Salads',
    'all_day',
    8.89,
    '{"calories": 280, "protein": 10, "carbs": 32, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Tangy Bourbon Chicken',
    'Chicken glazed with tangy bourbon sauce, served with sweet potatoes',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 480, "protein": 38, "carbs": 42, "fat": 18}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Salad',
    'Fresh mixed greens salad with vegetables and house dressing',
    'Salads',
    'all_day',
    8.89,
    '{"calories": 180, "protein": 4, "carbs": 12, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- SIDES
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
    'Single Slider',
    'One mini burger slider with choice of protein and toppings',
    'Sides',
    'all_day',
    3.49,
    '{"calories": 260, "protein": 14, "carbs": 21, "fat": 12}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
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
    'Whole Fruit',
    'Fresh whole fruit selection',
    'Sides',
    'all_day',
    1.99,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Side',
    'Choice of side dish from daily selection',
    'Sides',
    'all_day',
    3.49,
    '{"calories": 200, "protein": 4, "carbs": 28, "fat": 8}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Farmstead'
LIMIT 1;

-- BYO SALAD
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
    'Salad Bar',
    'Build your own salad from our salad bar with unlimited toppings',
    'Salads',
    'all_day',
    8.89,
    '{"calories": 300, "protein": 12, "carbs": 28, "fat": 16}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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

-- Additional Gothic Grill Menu Items
-- Non-Alcoholic Beverages
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
    'Core Power',
    'Protein-enhanced sports drink for recovery and hydration',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 240, "protein": 26, "carbs": 20, "fat": 0}',
    '["milk"]',
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
    'Calypso',
    'Refreshing lemonade-style beverage',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 120, "protein": 0, "carbs": 30, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Yerbamate',
    'Traditional South American herbal tea beverage',
    'Beverages',
    'all_day',
    4.49,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Powerade',
    'Electrolyte-enhanced sports drink',
    'Beverages',
    'all_day',
    2.19,
    '{"calories": 80, "protein": 0, "carbs": 21, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Gold Peak',
    'Premium iced tea',
    'Beverages',
    'all_day',
    1.89,
    '{"calories": 90, "protein": 0, "carbs": 24, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'San Pellegrino',
    'Italian sparkling mineral water',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Beverage Special',
    'Rotating special non-alcoholic beverage offer',
    'Beverages',
    'all_day',
    6.00,
    '{"calories": 150, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
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
    'Smartwater 1 liter',
    'Electrolyte-enhanced bottled water',
    'Beverages',
    'all_day',
    3.79,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Smartwater 20oz',
    'Electrolyte-enhanced bottled water',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Bottled Soda 20oz',
    'Assorted bottled carbonated soft drinks',
    'Beverages',
    'all_day',
    2.25,
    '{"calories": 160, "protein": 0, "carbs": 40, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Fairlife Milk',
    'Lactose-free, ultra-filtered milk',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 150, "protein": 13, "carbs": 6, "fat": 5}',
    '["milk"]',
    ARRAY['lactose_free']::dietarytag[]
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
    'Liquid Death',
    'Canned mountain water',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Vitamin Water',
    'Flavored water with added vitamins and electrolytes',
    'Beverages',
    'all_day',
    3.09,
    '{"calories": 50, "protein": 0, "carbs": 13, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Prime',
    'Hydration and energy drink',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 30, "protein": 0, "carbs": 8, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Minute Maid',
    'Refreshing juice beverage',
    'Beverages',
    'all_day',
    2.99,
    '{"calories": 150, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Peace Tea',
    'Sweetened iced tea beverage',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 180, "protein": 0, "carbs": 45, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
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
    'Fountain Beverage',
    'Customizable selection of carbonated fountain drinks',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 160, "protein": 0, "carbs": 40, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Sides
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
    'Chips',
    'Crispy potato chips',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 250, "protein": 3, "carbs": 25, "fat": 15}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Fries',
    'Classic crispy french fries',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 350, "protein": 4, "carbs": 40, "fat": 20}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Side Fresh Fruit',
    'Fresh seasonal fruit medley',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
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
    'Mac and Cheese Cup',
    'Creamy macaroni and cheese in a cup',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 12, "carbs": 35, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Side Salad',
    'Fresh mixed greens with vegetables',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 50, "protein": 2, "carbs": 8, "fat": 2}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Pizzas
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
    'Cheese Pizza',
    'Classic pizza with marinara sauce and mozzarella cheese',
    'Pizza',
    'all_day',
    9.49,
    '{"calories": 280, "protein": 12, "carbs": 35, "fat": 10}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Build your own pizza',
    'Customize your pizza with your choice of toppings',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 300, "protein": 14, "carbs": 36, "fat": 12}',
    '["gluten", "milk"]',
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
    'Cali Chicken Pizza',
    'Pizza topped with chicken and California-inspired toppings',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 380, "protein": 24, "carbs": 36, "fat": 16}',
    '["gluten", "milk"]',
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
    'Buffalo Chicken Pizza',
    'Pizza topped with spicy buffalo chicken and cheese',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 400, "protein": 25, "carbs": 36, "fat": 18}',
    '["gluten", "milk"]',
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
    'Meateater Pizza',
    'Pizza loaded with various meat toppings',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 450, "protein": 28, "carbs": 36, "fat": 22}',
    '["gluten", "milk"]',
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
    'Veg G Pizza',
    'Vegetarian pizza featuring garlic and vegetables',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 320, "protein": 14, "carbs": 36, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Pepperoni Calzone',
    'Folded pizza dough filled with pepperoni and cheese',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 520, "protein": 26, "carbs": 48, "fat": 24}',
    '["gluten", "milk"]',
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
    'Veggie Calzone',
    'Folded pizza dough filled with vegetables and cheese',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 420, "protein": 18, "carbs": 48, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Island Pizza',
    'Pizza with tropical-inspired toppings',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 360, "protein": 16, "carbs": 36, "fat": 16}',
    '["gluten", "milk"]',
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
    'BBQ Chicken Pizza',
    'Pizza topped with BBQ chicken and cheese',
    'Pizza',
    'all_day',
    11.49,
    '{"calories": 390, "protein": 24, "carbs": 36, "fat": 17}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Sandwiches
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
    'Grilled Cheese',
    'Classic grilled cheese sandwich with melted cheese',
    'Sandwiches',
    'all_day',
    7.99,
    '{"calories": 450, "protein": 18, "carbs": 38, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Chicken Focaccia',
    'Chicken sandwich served on focaccia bread',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 520, "protein": 32, "carbs": 42, "fat": 20}',
    '["gluten", "milk"]',
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
    'Crispy Sweet Chili Chicken Sandwich',
    'Crispy chicken with sweet chili sauce on a bun',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 580, "protein": 28, "carbs": 48, "fat": 26}',
    '["gluten", "milk", "soy"]',
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
    'Turkey Club Wrap',
    'Sliced turkey with bacon, lettuce, tomato, and mayonnaise in a wrap',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 30, "carbs": 38, "fat": 24}',
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
    'Teriyaki Grilled Chicken Sandwich',
    'Grilled chicken with teriyaki sauce on a bun',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 480, "protein": 30, "carbs": 42, "fat": 18}',
    '["gluten", "milk", "soy"]',
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
    'Crispy Buffalo Chicken Sandwich',
    'Crispy chicken with buffalo sauce on a bun',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 560, "protein": 28, "carbs": 46, "fat": 28}',
    '["gluten", "milk"]',
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
    'Chicken Ciabatta',
    'Chicken sandwich served on ciabatta bread',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 500, "protein": 30, "carbs": 40, "fat": 20}',
    '["gluten", "milk"]',
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
    'Chicken Philly',
    'Philly-style sandwich with chicken, cheese, and peppers',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 540, "protein": 32, "carbs": 42, "fat": 24}',
    '["gluten", "milk"]',
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
    'Southern Fried Chicken Sandwich',
    'Classic fried chicken sandwich with pickles and sauce',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 620, "protein": 30, "carbs": 48, "fat": 32}',
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
    'Famous Thrive Chicken Salad',
    'Signature chicken salad',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 380, "protein": 28, "carbs": 18, "fat": 22}',
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
    'Chicken Caesar Wrap',
    'Wrap filled with chicken, romaine lettuce, Caesar dressing, and croutons',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 480, "protein": 28, "carbs": 36, "fat": 24}',
    '["gluten", "milk", "egg", "fish"]',
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
    'Grilled Chicken Sandwich',
    'Grilled chicken with lettuce, tomato, and choice of bread',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 420, "protein": 32, "carbs": 38, "fat": 14}',
    '["gluten", "milk"]',
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
    'Buffalo Cauliflower Wrap',
    'Vegetarian wrap featuring buffalo-sauced cauliflower',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 320, "protein": 8, "carbs": 42, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Philly Cheesesteak',
    'Classic sandwich with thinly sliced steak, melted cheese, and onions on a long roll',
    'Sandwiches',
    'all_day',
    13.99,
    '{"calories": 680, "protein": 38, "carbs": 48, "fat": 36}',
    '["gluten", "milk", "soy"]',
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
    'Buffalo Chicken Wrap',
    'Wrap filled with buffalo chicken, lettuce, tomato, and creamy dressing',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 500, "protein": 28, "carbs": 36, "fat": 26}',
    '["gluten", "milk", "soy"]',
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
    'Grilled Chicken Parm Sandwich',
    'Grilled chicken breast with marinara sauce and melted cheese on a roll',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 560, "protein": 36, "carbs": 42, "fat": 24}',
    '["gluten", "milk"]',
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
    'BLTA',
    'Bacon, lettuce, tomato, and avocado sandwich with mayonnaise on toasted bread',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 18, "carbs": 38, "fat": 32}',
    '["gluten", "milk", "egg", "soy"]',
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
    'Vegetable Cheesesteak',
    'Vegetarian cheesesteak with grilled vegetables and melted cheese on a roll',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 420, "protein": 16, "carbs": 48, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Turkey Grinder',
    'Sub sandwich with sliced turkey, cheese, lettuce, tomato, onion, and condiments',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 540, "protein": 32, "carbs": 42, "fat": 24}',
    '["gluten", "milk", "soy"]',
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
    'Buffalo Shrimp Wrap',
    'Wrap filled with shrimp tossed in buffalo sauce, lettuce, tomato, and creamy dressing',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 480, "protein": 28, "carbs": 36, "fat": 24}',
    '["gluten", "shellfish", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Tacos
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
    'Taco Tuesday Special',
    'Special taco offer available on Tuesdays',
    'Tacos',
    'all_day',
    2.50,
    '{"calories": 180, "protein": 12, "carbs": 18, "fat": 8}',
    '["gluten", "milk"]',
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
    'Veggie Taco',
    'Vegetarian taco with fresh vegetables',
    'Tacos',
    'all_day',
    6.99,
    '{"calories": 200, "protein": 8, "carbs": 24, "fat": 10}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Tacos Calamari',
    'Tacos filled with crispy fried calamari',
    'Tacos',
    'all_day',
    7.99,
    '{"calories": 320, "protein": 18, "carbs": 24, "fat": 16}',
    '["gluten", "milk", "shellfish"]',
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
    'Tacos Blackened Mahi',
    'Tacos filled with blackened mahi mahi',
    'Tacos',
    'all_day',
    7.99,
    '{"calories": 280, "protein": 24, "carbs": 24, "fat": 12}',
    '["gluten", "milk", "fish"]',
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
    'Tacos Crispy Shrimp',
    'Tacos filled with crispy fried shrimp',
    'Tacos',
    'all_day',
    7.99,
    '{"calories": 300, "protein": 20, "carbs": 24, "fat": 14}',
    '["gluten", "milk", "shellfish"]',
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
    'Tacos Steak',
    'Tacos filled with grilled steak',
    'Tacos',
    'all_day',
    7.99,
    '{"calories": 320, "protein": 26, "carbs": 24, "fat": 14}',
    '["gluten", "milk"]',
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
    'Tacos Pulled Chicken',
    'Tacos filled with tender pulled chicken',
    'Tacos',
    'all_day',
    6.99,
    '{"calories": 260, "protein": 22, "carbs": 24, "fat": 10}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Soups and Salads
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
    'Soup Cup or Bowl',
    'Daily soup selection available in cup or bowl size',
    'Soups',
    'all_day',
    6.00,
    '{"calories": 200, "protein": 8, "carbs": 20, "fat": 10}',
    '["gluten", "milk"]',
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
    'Caprese Salad',
    'Fresh mozzarella, tomatoes, and basil with balsamic glaze',
    'Salads',
    'all_day',
    10.99,
    '{"calories": 280, "protein": 14, "carbs": 12, "fat": 20}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Crispy Chicken Caesar Salad',
    'Crispy chicken on romaine lettuce with Caesar dressing and croutons',
    'Salads',
    'all_day',
    11.99,
    '{"calories": 480, "protein": 32, "carbs": 24, "fat": 28}',
    '["gluten", "milk", "egg", "fish"]',
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
    'Crispy Buffalo Chicken Salad',
    'Crispy buffalo chicken on mixed greens with ranch dressing',
    'Salads',
    'all_day',
    12.99,
    '{"calories": 520, "protein": 30, "carbs": 26, "fat": 30}',
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
    'Greek Salad',
    'Mixed greens with feta cheese, olives, tomatoes, cucumbers, and Greek dressing',
    'Salads',
    'all_day',
    10.99,
    '{"calories": 320, "protein": 12, "carbs": 18, "fat": 24}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Chopped Salad',
    'Fresh chopped mixed greens with vegetables and choice of dressing',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 180, "protein": 6, "carbs": 16, "fat": 12}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
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
    'Caesar Salad',
    'Romaine lettuce with Caesar dressing and croutons',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 280, "protein": 8, "carbs": 18, "fat": 20}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Grilled Chicken salad',
    'Grilled chicken on mixed greens with vegetables',
    'Salads',
    'all_day',
    11.99,
    '{"calories": 380, "protein": 36, "carbs": 18, "fat": 18}',
    '["gluten", "milk"]',
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
    'Fiesta Chicken Salad',
    'Chicken salad with Mexican-inspired toppings and dressing',
    'Salads',
    'all_day',
    10.99,
    '{"calories": 400, "protein": 32, "carbs": 20, "fat": 22}',
    '["gluten", "milk"]',
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
    'Build Your Own Salad',
    'Customize your salad with your choice of greens, vegetables, and toppings',
    'Salads',
    'all_day',
    8.89,
    '{"calories": 200, "protein": 8, "carbs": 16, "fat": 12}',
    '[]',
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
    'Grilled Mahi Mahi salad',
    'Grilled mahi mahi on mixed greens with vegetables',
    'Salads',
    'all_day',
    14.99,
    '{"calories": 320, "protein": 32, "carbs": 18, "fat": 14}',
    '["gluten", "milk", "fish"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Small Plates
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
    'Fried Calamari',
    'Crispy fried calamari rings served with marinara sauce',
    'Appetizers',
    'all_day',
    9.99,
    '{"calories": 420, "protein": 20, "carbs": 32, "fat": 22}',
    '["gluten", "milk", "shellfish"]',
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
    'Crispy Cauliflower',
    'Crispy fried cauliflower florets with dipping sauce',
    'Appetizers',
    'all_day',
    5.99,
    '{"calories": 280, "protein": 6, "carbs": 32, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Fried Shrimp Basket',
    'Basket of crispy fried shrimp with dipping sauce',
    'Appetizers',
    'all_day',
    12.99,
    '{"calories": 480, "protein": 24, "carbs": 38, "fat": 24}',
    '["gluten", "milk", "shellfish"]',
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
    'Wings (6)',
    'Six crispy chicken wings with choice of sauce',
    'Appetizers',
    'all_day',
    9.49,
    '{"calories": 480, "protein": 32, "carbs": 8, "fat": 32}',
    '["gluten", "milk"]',
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
    'Mozzarella Sticks(5)',
    'Five breaded mozzarella sticks served with marinara sauce',
    'Appetizers',
    'all_day',
    7.49,
    '{"calories": 380, "protein": 18, "carbs": 32, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Sweet Potato Waffle Fries',
    'Crispy sweet potato waffle-cut fries',
    'Appetizers',
    'all_day',
    5.99,
    '{"calories": 320, "protein": 4, "carbs": 48, "fat": 14}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
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
    'Mega Pretzel',
    'Large soft pretzel served with cheese sauce',
    'Appetizers',
    'all_day',
    9.49,
    '{"calories": 420, "protein": 12, "carbs": 56, "fat": 16}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Buffalo Chicken Mac and Cheese',
    'Creamy macaroni and cheese topped with spicy buffalo chicken',
    'Appetizers',
    'all_day',
    8.99,
    '{"calories": 580, "protein": 32, "carbs": 48, "fat": 28}',
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
    'Shredded Chicken and Cheese Nachos',
    'Crispy tortilla chips loaded with shredded chicken and melted cheese',
    'Appetizers',
    'all_day',
    9.49,
    '{"calories": 620, "protein": 28, "carbs": 48, "fat": 32}',
    '["gluten", "milk"]',
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
    'Tortilla Chips with Guacamole',
    'Freshly made tortilla chips served with a side of creamy guacamole',
    'Appetizers',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 6, "carbs": 36, "fat": 18}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
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
    'Nachos',
    'Classic crispy tortilla chips with melted cheese and toppings',
    'Appetizers',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 18, "carbs": 48, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Chicken Tenders',
    'Golden-fried chicken tenders, perfect for dipping',
    'Appetizers',
    'all_day',
    9.99,
    '{"calories": 420, "protein": 24, "carbs": 28, "fat": 22}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Burgers
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
    'The NC Burger',
    'North Carolina-inspired burger with signature toppings',
    'Burgers',
    'all_day',
    14.99,
    '{"calories": 720, "protein": 38, "carbs": 48, "fat": 42}',
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
    'Cali Smash Burger',
    'California-style smashed burger with fresh toppings',
    'Burgers',
    'all_day',
    14.99,
    '{"calories": 680, "protein": 36, "carbs": 46, "fat": 38}',
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
    'Double Patty Melt Burger',
    'Double burger patties with melted cheese on grilled bread',
    'Burgers',
    'all_day',
    14.99,
    '{"calories": 820, "protein": 48, "carbs": 50, "fat": 46}',
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
    'Gothic Smash Burger',
    'Signature smashed burger with classic toppings',
    'Burgers',
    'all_day',
    9.99,
    '{"calories": 620, "protein": 32, "carbs": 44, "fat": 34}',
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
    'Duke Blue Cheese Burger',
    'Burger topped with blue cheese and signature Duke-inspired toppings',
    'Burgers',
    'all_day',
    14.99,
    '{"calories": 700, "protein": 36, "carbs": 46, "fat": 40}',
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
    'Build your own Burger',
    'Customize your burger with your choice of toppings',
    'Burgers',
    'all_day',
    9.99,
    '{"calories": 600, "protein": 30, "carbs": 42, "fat": 32}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Gothic Grill'
LIMIT 1;

-- Specials
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
    'Gothic $5 Meal',
    'Special meal offer from Gothic Grill',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 400, "protein": 20, "carbs": 40, "fat": 18}',
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
FROM vendors WHERE name = 'Sazon'
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
FROM vendors WHERE name = 'Sazon'
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

-- JB's Roasts & Chops - Additional Menu Items from Images

-- CARVED TO ORDER
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
    'JBs London 5oz',
    'Tender 5oz London broil, slow-roasted and carved to order',
    'Entrees',
    'dinner',
    13.99,
    '{"calories": 320, "protein": 45, "carbs": 2, "fat": 14}',
    '[]',
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
    'JBs London 8oz',
    'Tender 8oz London broil, slow-roasted and carved to order',
    'Entrees',
    'dinner',
    15.99,
    '{"calories": 480, "protein": 68, "carbs": 2, "fat": 20}',
    '[]',
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
    'Prime Rib 5oz',
    'Premium 5oz prime rib, slow-roasted and carved to order with au jus',
    'Entrees',
    'dinner',
    18.99,
    '{"calories": 380, "protein": 38, "carbs": 0, "fat": 24}',
    '[]',
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
    'Prime Rib 8oz',
    'Premium 8oz prime rib, slow-roasted and carved to order with au jus',
    'Entrees',
    'dinner',
    25.99,
    '{"calories": 600, "protein": 58, "carbs": 0, "fat": 38}',
    '[]',
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
    'Rosemary Rubbed Pork Loin 5oz',
    'Herb-rubbed 5oz pork loin, roasted and carved to order',
    'Entrees',
    'dinner',
    10.99,
    '{"calories": 280, "protein": 35, "carbs": 2, "fat": 14}',
    '[]',
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
    'Rosemary Rubbed Pork Loin 8oz',
    'Herb-rubbed 8oz pork loin, roasted and carved to order',
    'Entrees',
    'dinner',
    12.99,
    '{"calories": 440, "protein": 54, "carbs": 3, "fat": 22}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- ROTISSERIE
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
    'Beef Skewer',
    'Tender beef skewer, rotisserie-grilled to perfection',
    'Entrees',
    'dinner',
    14.99,
    '{"calories": 420, "protein": 48, "carbs": 4, "fat": 22}',
    '[]',
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
    'Ribeye 8oz',
    'Premium 8oz ribeye steak, rotisserie-grilled',
    'Entrees',
    'dinner',
    18.99,
    '{"calories": 580, "protein": 52, "carbs": 0, "fat": 40}',
    '[]',
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
    'Bone-In Pork Chop 8 oz',
    'Thick-cut 8oz bone-in pork chop, rotisserie-grilled',
    'Entrees',
    'dinner',
    15.39,
    '{"calories": 480, "protein": 52, "carbs": 2, "fat": 28}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- CHOP HOUSE CLASSICS
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
    'Quarter Flame Roasted Chicken',
    'Quarter portion of flame-roasted chicken, tender and juicy',
    'Entrees',
    'dinner',
    11.99,
    '{"calories": 380, "protein": 42, "carbs": 2, "fat": 22}',
    '[]',
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
    'Half Flame Roasted Chicken',
    'Half portion of flame-roasted chicken, tender and juicy',
    'Entrees',
    'dinner',
    14.49,
    '{"calories": 720, "protein": 78, "carbs": 4, "fat": 42}',
    '[]',
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
    'Wood Fired Boneless Chicken Breast',
    'Tender boneless chicken breast, wood-fired to perfection',
    'Entrees',
    'dinner',
    11.99,
    '{"calories": 320, "protein": 48, "carbs": 2, "fat": 12}',
    '[]',
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
    'Paella Mixta',
    'Traditional Spanish paella with mixed seafood, chicken, and saffron rice',
    'Entrees',
    'dinner',
    13.99,
    '{"calories": 580, "protein": 38, "carbs": 68, "fat": 16}',
    '["shellfish", "gluten"]',
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
    'BBQ Ribs 1-3 Rack',
    'Tender BBQ ribs, slow-cooked and glazed with house barbecue sauce',
    'Entrees',
    'dinner',
    13.99,
    '{"calories": 680, "protein": 52, "carbs": 28, "fat": 38}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- SEAFOOD ON THE GRILL
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
    'Mahi Mahi',
    'Fresh 6oz mahi mahi, grilled to perfection',
    'Entrees',
    'dinner',
    16.99,
    '{"calories": 240, "protein": 42, "carbs": 0, "fat": 6}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Yellow Fin Tuna',
    'Fresh 6oz yellow fin tuna, grilled to perfection',
    'Entrees',
    'dinner',
    14.99,
    '{"calories": 280, "protein": 48, "carbs": 0, "fat": 8}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Shrimp Skewer',
    'Grilled shrimp skewer, seasoned and cooked to perfection',
    'Entrees',
    'dinner',
    14.99,
    '{"calories": 220, "protein": 38, "carbs": 4, "fat": 6}',
    '["shellfish"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Atlantic Salmon Filet 6oz',
    'Fresh 6oz Atlantic salmon filet, grilled to perfection',
    'Entrees',
    'dinner',
    15.99,
    '{"calories": 320, "protein": 38, "carbs": 0, "fat": 16}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- HANDHELDS
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
    'Black and Blue Burger',
    'Beef burger with blue cheese, caramelized onions, and blackened seasoning',
    'Handhelds',
    'all_day',
    11.99,
    '{"calories": 720, "protein": 42, "carbs": 48, "fat": 38}',
    '["gluten", "milk", "egg"]',
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
    'Ultimate Grilled Chicken Sandwich',
    'Grilled chicken breast with lettuce, tomato, and special sauce on a brioche bun',
    'Handhelds',
    'all_day',
    12.99,
    '{"calories": 520, "protein": 38, "carbs": 42, "fat": 18}',
    '["gluten", "egg"]',
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
    'Prime Rib Steak and Cheese',
    'Tender prime rib with melted cheese on a toasted roll',
    'Handhelds',
    'all_day',
    17.99,
    '{"calories": 680, "protein": 48, "carbs": 38, "fat": 36}',
    '["gluten", "milk"]',
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
    'Chophouse Burger',
    'Classic beef burger with lettuce, tomato, onion, and house special sauce',
    'Handhelds',
    'all_day',
    11.49,
    '{"calories": 680, "protein": 38, "carbs": 48, "fat": 32}',
    '["gluten", "egg", "milk"]',
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
    'Loaded GOAT Cheeseburger',
    'Beef burger topped with goat cheese, bacon, and caramelized onions',
    'Handhelds',
    'all_day',
    12.29,
    '{"calories": 780, "protein": 42, "carbs": 48, "fat": 42}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- SALADS
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
    'Smoke House Chopped Salad',
    'Mixed greens with smoked meats, cheese, vegetables, and house dressing',
    'Salads',
    'all_day',
    9.49,
    '{"calories": 420, "protein": 28, "carbs": 18, "fat": 28}',
    '["milk"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'The Wedge Salad',
    'Iceberg lettuce wedge with blue cheese, bacon, tomatoes, and blue cheese dressing',
    'Salads',
    'all_day',
    6.99,
    '{"calories": 320, "protein": 12, "carbs": 8, "fat": 26}',
    '["milk"]',
    ARRAY['gluten_free']::dietarytag[]
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
    'Apple and Fennel Salad',
    'Fresh apple and fennel with mixed greens, walnuts, and vinaigrette',
    'Salads',
    'all_day',
    8.70,
    '{"calories": 280, "protein": 6, "carbs": 32, "fat": 16}',
    '["tree_nuts"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Classic Caesar',
    'Romaine lettuce with Caesar dressing, parmesan cheese, and croutons',
    'Salads',
    'all_day',
    6.99,
    '{"calories": 320, "protein": 10, "carbs": 18, "fat": 24}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- SIDES
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
    'Grilled Asparagus',
    'Fresh asparagus spears, grilled to perfection',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 40, "protein": 4, "carbs": 6, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Steak House Wedges',
    'Crispy seasoned potato wedges, steakhouse-style',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 280, "protein": 6, "carbs": 42, "fat": 12}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Cranberry Quinoa',
    'Quinoa cooked with cranberries and herbs',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 180, "protein": 6, "carbs": 32, "fat": 4}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Roasted Seasonal Vegetables',
    'Assorted seasonal vegetables, roasted with herbs',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 120, "protein": 4, "carbs": 18, "fat": 4}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Brown Rice',
    'Steamed brown rice',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 220, "protein": 5, "carbs": 46, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Sweet Potato Fries',
    'Crispy sweet potato fries, seasoned and fried',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 320, "protein": 4, "carbs": 48, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Baked Potato',
    'Classic baked potato with butter',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 220, "protein": 5, "carbs": 48, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Sub Side Paella Mixta',
    'Smaller portion of traditional Spanish paella with mixed seafood and chicken',
    'Sides',
    'all_day',
    6.19,
    '{"calories": 320, "protein": 22, "carbs": 38, "fat": 10}',
    '["shellfish", "gluten"]',
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
    'Pick 2 Sides',
    'Choose any two sides from our selection',
    'Sides',
    'all_day',
    5.99,
    '{"calories": 300, "protein": 8, "carbs": 45, "fat": 10}',
    '[]',
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
    'Pick 3 Sides',
    'Choose any three sides from our selection',
    'Sides',
    'all_day',
    8.49,
    '{"calories": 450, "protein": 12, "carbs": 68, "fat": 15}',
    '[]',
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
    'Twice Baked Potato',
    'Baked potato filled with cheese, bacon, and sour cream, then baked again',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 380, "protein": 12, "carbs": 42, "fat": 18}',
    '["milk", "egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Grilled Tomato Salad',
    'Grilled tomatoes with fresh herbs and vinaigrette',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 80, "protein": 2, "carbs": 10, "fat": 4}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Roasted Broccoli',
    'Fresh broccoli florets, roasted with garlic and olive oil',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 60, "protein": 4, "carbs": 8, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Garlic Mashed Potatoes',
    'Creamy mashed potatoes with roasted garlic',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 240, "protein": 6, "carbs": 38, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- DESSERTS
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
    'Flourless Chocolate Cake',
    'Rich, decadent flourless chocolate cake',
    'Desserts',
    'all_day',
    4.99,
    '{"calories": 420, "protein": 8, "carbs": 48, "fat": 22}',
    '["egg", "milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Raspberry White Chocolate Cheesecake',
    'Creamy cheesecake with raspberry swirl and white chocolate',
    'Desserts',
    'all_day',
    5.99,
    '{"calories": 480, "protein": 10, "carbs": 42, "fat": 32}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Tiramisu',
    'Classic Italian tiramisu with coffee and mascarpone',
    'Desserts',
    'all_day',
    5.99,
    '{"calories": 380, "protein": 8, "carbs": 38, "fat": 22}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- BEVERAGES
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
    'Minute Maid Apple Juice',
    'Refreshing apple juice, 16oz',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 220, "protein": 0, "carbs": 56, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Minute Maid Orange Juice',
    'Fresh orange juice, 16oz',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 240, "protein": 2, "carbs": 58, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Vitamin Water Acai Blueberry Pomegranate',
    'Vitamin-enhanced water with acai, blueberry, and pomegranate flavors',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 50, "protein": 0, "carbs": 13, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Body Armor',
    'Sports drink with electrolytes and vitamins',
    'Beverages',
    'all_day',
    4.19,
    '{"calories": 140, "protein": 0, "carbs": 36, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Fair Life Chocolate Milk',
    'Ultra-filtered chocolate milk, 14oz',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 200, "protein": 14, "carbs": 24, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Fair Life Strawberry Milk',
    'Ultra-filtered strawberry milk, 14oz',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 200, "protein": 14, "carbs": 24, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Dasani Water 20 oz',
    'Purified bottled water, 20oz',
    'Beverages',
    'all_day',
    1.69,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Smartwater 20oz',
    'Vapor-distilled water with electrolytes, 20oz',
    'Beverages',
    'all_day',
    2.09,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'JB''s Roasts & Chops'
LIMIT 1;

-- SPECIALS
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
    'Daily Devil Deals $5',
    'Daily special deal, rotating selection',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 400, "protein": 20, "carbs": 45, "fat": 15}',
    '[]',
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

-- Additional It's Thyme Menu Items
-- Your Thyme Bowls
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
    'Jacks Bowl',
    'Signature bowl creation by Jack',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 450, "protein": 20, "carbs": 55, "fat": 18}',
    '["gluten"]',
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
    'Emilys Bowl',
    'Signature bowl creation by Emily',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 450, "protein": 20, "carbs": 55, "fat": 18}',
    '["gluten"]',
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
    'Karinas Bowl',
    'Signature bowl creation by Karina',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 450, "protein": 20, "carbs": 55, "fat": 18}',
    '["gluten"]',
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
    'Charbels Bowl Beirut',
    'Mediterranean-inspired bowl with Lebanese flavors',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 480, "protein": 22, "carbs": 52, "fat": 20}',
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
    'Thai Thyme',
    'Thai-inspired bowl with aromatic spices and fresh vegetables',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 460, "protein": 18, "carbs": 58, "fat": 16}',
    '["gluten", "soy", "peanuts"]',
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
    'Mediterranean Thyme',
    'Mediterranean-style bowl with fresh vegetables, grains, and herbs',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 440, "protein": 16, "carbs": 50, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
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
    'Autumn Harvest Salad',
    'Seasonal salad with autumn vegetables, grains, and fall flavors',
    'Salads',
    'all_day',
    11.89,
    '{"calories": 380, "protein": 14, "carbs": 45, "fat": 16}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
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
    'Carolina BBQ Thyme',
    'Carolina-style BBQ bowl with pulled protein and classic sides',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 520, "protein": 28, "carbs": 55, "fat": 20}',
    '["gluten", "soy"]',
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
    'Build Your Own Bowl',
    'Customize your bowl with your choice of base, protein, vegetables, and toppings',
    'Bowls',
    'all_day',
    11.89,
    '{"calories": 450, "protein": 20, "carbs": 55, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

-- Hand Crafted Beverages
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
    'Raspberry Hibiscus Tea',
    'Refreshing herbal tea blend with raspberry and hibiscus',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
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
    'Strawberry Watermelon Lemonade',
    'Fresh lemonade with strawberry and watermelon flavors',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 120, "protein": 0, "carbs": 30, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
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
    'Our Signature Lavender Lemonade',
    'House-made lavender-infused lemonade',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 110, "protein": 0, "carbs": 28, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

-- Dinner Thyme
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
    'Taco Thyme',
    'Fresh tacos with your choice of protein and toppings',
    'Entrees',
    'dinner',
    11.30,
    '{"calories": 420, "protein": 24, "carbs": 38, "fat": 18}',
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
    'Crispy Chickpea Falafel Wrap',
    'Crispy falafel made from chickpeas wrapped with fresh vegetables and tahini',
    'Wraps',
    'dinner',
    11.30,
    '{"calories": 480, "protein": 16, "carbs": 52, "fat": 20}',
    '["gluten", "soy"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
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
    'Spaghetti Squash Primavera',
    'Spaghetti squash with fresh spring vegetables in a light sauce',
    'Entrees',
    'dinner',
    11.30,
    '{"calories": 280, "protein": 8, "carbs": 35, "fat": 12}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
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
    'Hot Honey Chicken Tenders',
    'Crispy chicken tenders drizzled with hot honey sauce',
    'Entrees',
    'dinner',
    11.30,
    '{"calories": 520, "protein": 32, "carbs": 38, "fat": 24}',
    '["gluten", "milk", "egg"]',
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
    'Grilled Chicken Nuggets',
    'Tender grilled chicken nuggets, perfect for dipping',
    'Entrees',
    'dinner',
    11.30,
    '{"calories": 320, "protein": 36, "carbs": 4, "fat": 14}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

-- Acai Thyme Bowl
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
    'Acai Thyme',
    'Refreshing acai bowl with fresh fruits, granola, and toppings',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 380, "protein": 8, "carbs": 68, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

-- Dole Whip
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
    'Dole Whip',
    'Classic pineapple soft-serve frozen dessert',
    'Desserts',
    'all_day',
    4.99,
    '{"calories": 80, "protein": 0, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free', 'dairy_free']::dietarytag[]
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
    'Classic Mango Dole Whip',
    'Mango-flavored Dole Whip soft-serve frozen dessert',
    'Desserts',
    'all_day',
    4.99,
    '{"calories": 85, "protein": 0, "carbs": 22, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free', 'dairy_free']::dietarytag[]
FROM vendors WHERE name = 'It''s Thyme'
LIMIT 1;

-- =============================================
-- BEYU BLUE COFFEE MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- FOOD
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Asiago Turkey', 'Savory turkey sandwich with melted asiago cheese on artisan bread', 'Entrees', 'all_day', 6.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Egg and Cheese Croissant', 'Fluffy eggs and melted cheese on a buttery croissant', 'Entrees', 'breakfast', 6.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Egg White Turkey Bacon English Muffin', 'Healthy egg whites with turkey bacon on a toasted English muffin', 'Entrees', 'breakfast', 6.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Oatmeal', 'Warm, hearty oatmeal with optional toppings', 'Entrees', 'breakfast', 4.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Hummus with Pretzels', 'Creamy hummus served with crunchy pretzel crisps', 'Snacks', 'all_day', 3.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Mixed Fruit', 'Fresh seasonal mixed fruit cup', 'Snacks', 'all_day', 4.29, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Strawberry Yogurt with Granola', 'Creamy strawberry yogurt topped with crunchy granola', 'Snacks', 'breakfast', 4.29, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Turkey and Smoked Gouda Wrap Bites', 'Bite-sized turkey and smoked gouda cheese wraps', 'Snacks', 'all_day', 6.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Whole Fruit', 'Fresh whole fruit - apple, banana, or orange', 'Snacks', 'all_day', 1.00, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Chicken Caesar Wrap', 'Grilled chicken with romaine lettuce, parmesan, and Caesar dressing in a flour tortilla', 'Entrees', 'lunch', 6.99, ARRAY[]::dietarytag[]),
-- SNACKS
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Loaf Cakes', 'Freshly baked sweet loaf cake slices in assorted flavors', 'Pastries', 'all_day', 3.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Chewy Granola Bar', 'Soft and chewy granola bar for a quick snack', 'Snacks', 'all_day', 0.99, ARRAY['vegetarian']::dietarytag[]),
-- BOTTLED BEVERAGES
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Tropicana Juice', 'Refreshing Tropicana orange juice', 'Beverages', 'all_day', 3.50, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Golden Peak Sweet Tea', 'Chilled Golden Peak sweet iced tea', 'Beverages', 'all_day', 3.59, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Smart Water 20oz', 'Premium vapor-distilled Smart Water', 'Beverages', 'all_day', 1.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Bottled Soda', 'Assorted bottled sodas', 'Beverages', 'all_day', 2.75, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Golden Peak Unsweet Tea', 'Chilled Golden Peak unsweetened iced tea', 'Beverages', 'all_day', 3.59, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Vitamin Water', 'Nutrient-enhanced Vitamin Water', 'Beverages', 'all_day', 3.09, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Smart Water 1 Liter', 'Large premium vapor-distilled Smart Water', 'Beverages', 'all_day', 3.79, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Natalies Juice', 'Premium fresh-squeezed Natalies juice', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- DRIP COFFEE
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Au Lait', 'Classic café au lait - coffee with steamed milk', 'Beverages', 'all_day', 3.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Mexican Coffee', 'Rich coffee with cinnamon and chocolate notes', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Coffee', 'Freshly brewed drip coffee', 'Beverages', 'all_day', 3.09, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Cold Brew', 'Smooth, slow-steeped cold brew coffee', 'Beverages', 'all_day', 4.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- ESPRESSO CLASSICS
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Cappuccino', 'Classic espresso with steamed milk and foam', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Mocha', 'Espresso with chocolate and steamed milk', 'Beverages', 'all_day', 4.89, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Red Eye', 'Drip coffee with a shot of espresso for an extra kick', 'Beverages', 'all_day', 3.89, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Americano', 'Espresso diluted with hot water for a smooth finish', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Espresso Double Shot', 'Two shots of rich, bold espresso', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Latte', 'Smooth espresso with steamed milk', 'Beverages', 'all_day', 4.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Flat White', 'Velvety espresso with microfoam milk', 'Beverages', 'all_day', 4.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Cortado', 'Equal parts espresso and warm milk', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian']::dietarytag[]),
-- SPECIALTY COFFEES
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Dirty Chai', 'Spiced chai latte with a shot of espresso', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Caramello', 'Espresso with caramel and steamed milk', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Oprah Mocha', 'Signature mocha with chai spices inspired by Oprah', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Mexican Latte', 'Latte with cinnamon, chocolate, and a hint of spice', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'La Vanilla', 'Smooth vanilla-infused latte', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Turtle Mocha', 'Mocha with caramel and pecan flavors', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
-- TEA & NON COFFEE
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Chai Latte', 'Spiced chai tea with steamed milk', 'Beverages', 'all_day', 4.69, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Hot Chocolate', 'Rich and creamy hot chocolate', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Matcha Latte', 'Japanese green tea matcha with steamed milk', 'Beverages', 'all_day', 4.69, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Smoothie', 'Blended fruit smoothie made fresh', 'Beverages', 'all_day', 4.89, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Herbal Tea', 'Caffeine-free herbal tea selection', 'Beverages', 'all_day', 3.10, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Steamer', 'Steamed milk with your choice of flavor', 'Beverages', 'all_day', 4.40, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'London Fog', 'Earl Grey tea with vanilla and steamed milk', 'Beverages', 'all_day', 3.60, ARRAY['vegetarian']::dietarytag[]),
-- PASTRIES
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Bagel Plain', 'Fresh plain bagel, perfect for toasting', 'Pastries', 'breakfast', 3.49, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Breakfast Loaf', 'Hearty breakfast loaf with savory flavors', 'Pastries', 'breakfast', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Beyu Blue Coffee'), 'Danish', 'Flaky pastry with sweet fruit or cream cheese filling', 'Pastries', 'breakfast', 3.99, ARRAY['vegetarian']::dietarytag[]);

-- =============================================
-- BELLA UNION MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- COFFEE
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cafe au Lait', 'Classic coffee with steamed milk', 'Beverages', 'all_day', 3.29, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Coffee of the Day', 'Freshly brewed house coffee', 'Beverages', 'all_day', 2.69, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cold Brew Coffee', 'Smooth, slow-steeped cold brew', 'Beverages', 'all_day', 4.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Flavored Latte', 'Espresso with steamed milk and your choice of flavor', 'Beverages', 'all_day', 5.75, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Red Eye', 'Drip coffee with a shot of espresso', 'Beverages', 'all_day', 3.09, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- ESPRESSO
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Carles Macchiato', 'Espresso marked with a dollop of foamed milk', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cafe Latte', 'Smooth espresso with steamed milk', 'Beverages', 'all_day', 4.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cafe Americano', 'Espresso diluted with hot water', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cafe Mocha', 'Espresso with chocolate and steamed milk', 'Beverages', 'all_day', 4.89, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cappuccino', 'Classic espresso with steamed milk and foam', 'Beverages', 'all_day', 4.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'White Chocolate Mocha', 'Espresso with white chocolate and steamed milk', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Espresso', 'Single shot of rich espresso', 'Beverages', 'all_day', 2.79, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Flavored Latte', 'Chilled espresso with milk and your choice of flavor', 'Beverages', 'all_day', 5.25, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Flat White', 'Velvety espresso with microfoam milk', 'Beverages', 'all_day', 4.95, ARRAY['vegetarian']::dietarytag[]),
-- CLASSICS
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Cider', 'Warm spiced apple cider', 'Beverages', 'all_day', 4.29, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Hot Chocolate', 'Rich and creamy hot chocolate', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'White Hot Chocolate', 'Creamy white chocolate hot cocoa', 'Beverages', 'all_day', 4.19, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Steamer', 'Steamed milk with your choice of flavor', 'Beverages', 'all_day', 3.39, ARRAY['vegetarian']::dietarytag[]),
-- TEA
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Chai Latte', 'Spiced chai tea with steamed milk', 'Beverages', 'all_day', 4.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Hot Tea', 'Selection of premium hot teas', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Matcha', 'Japanese green tea matcha with steamed milk', 'Beverages', 'all_day', 4.79, ARRAY['vegetarian']::dietarytag[]),
-- ICED
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Americano', 'Chilled espresso with cold water over ice', 'Beverages', 'all_day', 4.09, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Cider', 'Refreshing chilled apple cider', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Coffee Of The Day', 'Chilled house coffee over ice', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Cafe Latte', 'Chilled espresso with cold milk over ice', 'Beverages', 'all_day', 5.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Chai Latte', 'Chilled spiced chai with cold milk', 'Beverages', 'all_day', 5.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Cafe Mocha', 'Chilled espresso with chocolate and cold milk', 'Beverages', 'all_day', 5.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Matcha', 'Chilled Japanese green tea matcha', 'Beverages', 'all_day', 5.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced Carles Macchiato', 'Chilled espresso marked with foamed milk over ice', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Iced White Chocolate Mocha', 'Chilled espresso with white chocolate and cold milk', 'Beverages', 'all_day', 5.89, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Frappe', 'Blended coffee frozen drink', 'Beverages', 'all_day', 5.69, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Chai Frappe', 'Blended spiced chai frozen drink', 'Beverages', 'all_day', 5.69, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Creme Frappe', 'Blended cream-based frozen drink', 'Beverages', 'all_day', 5.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Italian Soda', 'Sparkling water with flavored syrup', 'Beverages', 'all_day', 3.89, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'French Soda', 'Sparkling water with flavored syrup and cream', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bella Union'), 'Smoothies', 'Blended fruit smoothie made fresh', 'Beverages', 'all_day', 5.69, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- =============================================
-- THE FLAT DRUM MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Wings
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), '6 Bone-In Wings', 'Six crispy bone-in wings tossed in your choice of sauce', 'Entrees', 'lunch', 8.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), '12 Bone-In Wings', 'Twelve crispy bone-in wings tossed in your choice of sauce', 'Entrees', 'lunch', 15.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), '20 Bone-In Wings', 'Twenty crispy bone-in wings tossed in your choice of sauce', 'Entrees', 'lunch', 24.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), '10 Boneless Wings', 'Ten crispy boneless wings tossed in your choice of sauce', 'Entrees', 'lunch', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), '20 Boneless Wings', 'Twenty crispy boneless wings tossed in your choice of sauce', 'Entrees', 'lunch', 18.99, ARRAY[]::dietarytag[]),
-- Sandwiches
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'FD''s Chicken Sandwich', 'Three battered and fried chicken tenders smothered in The Flat Drum''s Special Sauce on a toasted brioche bun', 'Entrees', 'lunch', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'FD''s Chicken Sandwich Combo', 'FD''s Chicken Sandwich served with seasoned waffle fries', 'Entrees', 'lunch', 13.99, ARRAY[]::dietarytag[]),
-- Sides
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'Country Mac n Cheese', 'Creamy homestyle macaroni and cheese', 'Sides', 'lunch', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'Sweet Potato Waffle Fries', 'Crispy sweet potato waffle fries', 'Sides', 'lunch', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'Seasoned Waffle Fries', 'Crispy seasoned waffle fries', 'Sides', 'lunch', 3.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- Drinks
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'Coke', 'Coca-Cola soft drink', 'Beverages', 'all_day', 2.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'The Flat Drum'), 'Bottled Water', 'Refreshing bottled water', 'Beverages', 'all_day', 1.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- =============================================
-- YALLA MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Pita Sandwiches
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Falafel Pita', 'Crispy falafel balls in fresh pita with hummus, Israeli salad, tahini, and schug', 'Entrees', 'lunch', 10.99, ARRAY['vegetarian', 'vegan', 'halal']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Chicken Shawarma Pita', 'Tender marinated chicken shawarma in fresh pita with hummus, Israeli salad, tahini, and pickles', 'Entrees', 'lunch', 12.99, ARRAY['halal', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Chicken Schnitzel Pita', 'Crispy breaded chicken schnitzel in fresh pita with hummus and Israeli salad', 'Entrees', 'lunch', 12.99, ARRAY['halal']::dietarytag[]),
-- Bowls
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Hummus Bowl', 'Creamy house-made hummus served with warm pita, Israeli salad, and your choice of toppings', 'Entrees', 'lunch', 9.99, ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Falafel Bowl', 'Crispy falafel over rice with Israeli salad, hummus, tahini, and pickles', 'Entrees', 'lunch', 11.99, ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Shawarma Bowl', 'Chicken shawarma over rice with Israeli salad, hummus, tahini, and pickles', 'Entrees', 'lunch', 13.99, ARRAY['halal', 'gluten_free']::dietarytag[]),
-- Sides
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Extra Pita', 'Fresh house-baked pita bread', 'Sides', 'lunch', 1.50, ARRAY['vegetarian', 'vegan', 'halal']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Israeli Salad', 'Fresh diced cucumber, tomato, and onion with lemon and olive oil', 'Sides', 'lunch', 3.99, ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Cabbage Salad', 'Crunchy cabbage slaw with herbs', 'Sides', 'lunch', 3.99, ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]),
-- Drinks
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Limonana', 'Refreshing Lebanese-style mint lemonade', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Yalla'), 'Bottled Water', 'Refreshing bottled water', 'Beverages', 'all_day', 1.99, ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]);

-- =============================================
-- SISTER LIU'S KITCHEN MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Chinese Burgers (Rou Jia Mo)
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Pork Burger (Rou Jia Mo)', 'Traditional Chinese burger with savory braised pork in a crispy flatbread bun', 'Entrees', 'lunch', 8.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Spicy Pork Burger', 'Chinese burger with spicy braised pork in a crispy flatbread bun', 'Entrees', 'lunch', 9.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Beef Burger', 'Chinese burger with savory braised beef in a crispy flatbread bun', 'Entrees', 'lunch', 9.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Spicy Beef Burger', 'Chinese burger with spicy braised beef in a crispy flatbread bun', 'Entrees', 'lunch', 10.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Vegan Burger', 'Chinese burger with seasoned vegetables in a crispy flatbread bun', 'Entrees', 'lunch', 8.49, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Spicy Vegan Burger', 'Chinese burger with spicy seasoned vegetables in a crispy flatbread bun', 'Entrees', 'lunch', 8.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
-- Dumplings
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Pork Cabbage Dumplings', 'Handmade dumplings filled with pork and cabbage (8 pieces)', 'Entrees', 'lunch', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Pork Chive Dumplings', 'Handmade dumplings filled with pork and chive (8 pieces)', 'Entrees', 'lunch', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Beef Cilantro Dumplings', 'Handmade dumplings filled with beef and cilantro (8 pieces)', 'Entrees', 'lunch', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Shrimp Pork Chive Dumplings', 'Handmade dumplings filled with shrimp, pork, and chive (8 pieces)', 'Entrees', 'lunch', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Chicken Mushroom Dumplings', 'Handmade dumplings filled with chicken and mushroom (8 pieces)', 'Entrees', 'lunch', 11.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Rainbow Vegetable Dumplings', 'Handmade dumplings filled with five vegetables (8 pieces)', 'Entrees', 'lunch', 10.49, ARRAY['vegetarian', 'vegan']::dietarytag[]),
-- Noodles & Soups
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Rice Noodle with Pork', 'Silky rice noodles in savory broth with braised pork', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Spicy Beef Mushroom Rice Noodle', 'Rice noodles with spicy beef and mushroom sauce', 'Entrees', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Spicy Sour Wonton Soup', '10 shrimp, pork, and vegetable wontons in spicy sour soup', 'Entrees', 'lunch', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Egg Drop Wonton Soup', 'Silky egg drops in savory wonton soup', 'Entrees', 'lunch', 10.99, ARRAY[]::dietarytag[]),
-- Specials
((SELECT vendor_id FROM vendors WHERE name = 'Sister Liu''s Kitchen'), 'Braised Pork Steam Buns', 'Soft, fluffy buns filled with tender braised pork and pickled cabbage (3 pieces)', 'Entrees', 'lunch', 9.99, ARRAY[]::dietarytag[]);

-- =============================================
-- GUSSY'S MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Pitas
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Gyro Pita', 'Lamb and beef mix on Mediterranean pita with tomato, red onion, romaine, and homemade tzatziki', 'Entrees', 'lunch', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Gyro Pita Greek Style', 'Gyro meat on pita with Greek fries inside, tomato, onion, and tzatziki', 'Entrees', 'lunch', 13.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Chicken Pita', 'Grilled chicken breast on Mediterranean pita with tomato, onion, romaine, and tzatziki', 'Entrees', 'lunch', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Falafel Pita', 'Crispy falafel on Mediterranean pita with hummus, tomato, onion, and tahini', 'Entrees', 'lunch', 10.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Greek Veggie Wrap', 'Mixed vegetables with feta, olives, and Greek dressing in a wrap', 'Entrees', 'lunch', 9.99, ARRAY['vegetarian']::dietarytag[]),
-- Platters
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Zeus Platter', 'Mixed platter with gyro, chicken, falafel, small Greek salad, pita, Greek fries, and choice of hummus or tzatziki', 'Entrees', 'lunch', 18.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Gyro Platter', 'Gyro meat served with Greek salad, pita, Greek fries, and tzatziki', 'Entrees', 'lunch', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Chicken Platter', 'Grilled chicken served with Greek salad, pita, Greek fries, and tzatziki', 'Entrees', 'lunch', 14.99, ARRAY[]::dietarytag[]),
-- Sides
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Greek Fries', 'Crispy fries topped with feta and Greek seasoning', 'Sides', 'lunch', 5.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Greek Salad', 'Fresh salad with tomatoes, cucumbers, olives, feta, and Greek dressing', 'Sides', 'lunch', 6.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Hummus with Pita', 'House-made hummus served with warm pita bread', 'Sides', 'lunch', 5.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Gussy''s'), 'Tzatziki', 'Cool cucumber yogurt sauce', 'Sides', 'lunch', 2.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]);

-- =============================================
-- BULKOGI MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Rice Plates
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Beef Rice Plate', 'Marinated beef bulgogi with cabbage, carrots, green onions, sesame seeds, and rice', 'Entrees', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Spicy Beef Rice Plate', 'Spicy marinated beef with cabbage, carrots, green onions, sesame seeds, and rice', 'Entrees', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Chicken Rice Plate', 'Marinated chicken with cabbage, carrots, green onions, sesame seeds, and rice', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Spicy Chicken Rice Plate', 'Spicy marinated chicken with cabbage, carrots, green onions, sesame seeds, and rice', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Spicy Pork Rice Plate', 'Spicy marinated pork with cabbage, carrots, green onions, sesame seeds, and rice', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Tofu Rice Plate', 'Marinated tofu with cabbage, carrots, green onions, sesame seeds, and rice', 'Entrees', 'lunch', 10.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- Burrito Bowls
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Burrito Bowl', 'Choice of protein with Asian slaw, corn, black beans, fried rice, cheese, salsa roja, and sesame seeds', 'Entrees', 'lunch', 13.99, ARRAY[]::dietarytag[]),
-- Tacos
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Korean BBQ Tacos (3)', 'Three corn tortillas with Korean BBQ protein, Asian slaw, cilantro, salsa roja, and sesame seeds', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
-- Specials
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Bibimbap', 'Rice bowl with sesame oil, arugula, zucchini, carrots, pickled radish, bean sprouts, egg, and gochujang', 'Entrees', 'lunch', 12.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Quesadilla', 'Flour tortilla with four-blend cheese, cilantro, and choice of protein', 'Entrees', 'lunch', 10.99, ARRAY['vegetarian']::dietarytag[]),
-- Sides
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Goon Mandoo', 'Korean pan-fried dumplings with pork, beef, and vegetables (6 pieces)', 'Sides', 'lunch', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Fresh Kimchi', 'Spicy pickled napa cabbage', 'Sides', 'lunch', 3.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Pan-Fried Kimchi', 'Spicy pan-fried kimchi', 'Sides', 'lunch', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'Fried Rice', 'Stir-fried rice with soy sauce', 'Sides', 'lunch', 3.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi'), 'White Rice', 'Steamed white rice', 'Sides', 'lunch', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- =============================================
-- LATIN EFFECT MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Appetizers
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Asada Fries', 'French fries topped with carne asada, guacamole, pico de gallo, sour cream, and cheese', 'Appetizers', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Tequeños', 'Venezuelan cheese-filled breadsticks, deep-fried golden crisp, with garlic dipping sauce', 'Appetizers', 'lunch', 8.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Fried Pork Belly', 'Crispy fried pork belly served with guacamole', 'Appetizers', 'lunch', 10.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Latin Wings (6)', 'Six homemade dry rub wings with chimichurri sauce', 'Appetizers', 'lunch', 9.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Latin Wings (12)', 'Twelve homemade dry rub wings with chimichurri sauce', 'Appetizers', 'lunch', 17.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Loaded Nachos', 'Nachos with choice of protein, nacho cheese, pico de gallo, black beans, jalapeños, guacamole, and sour cream', 'Appetizers', 'lunch', 13.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Fried Sweet Plantains', 'Sweet plantains topped with ground beef, Honduran sour cream, and cheese', 'Appetizers', 'lunch', 8.99, ARRAY['gluten_free']::dietarytag[]),
-- Entrees
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Chicken Arepa', 'Venezuelan corn cake filled with chicken, sweet plantains, avocado, pico de gallo, and mozzarella', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Steak Arepa', 'Venezuelan corn cake filled with carne asada, sweet plantains, avocado, pico de gallo, and mozzarella', 'Entrees', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Pork Arepa', 'Venezuelan corn cake filled with pork, sweet plantains, avocado, pico de gallo, and mozzarella', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Baleada', 'Honduran flour tortilla with refried beans, scrambled eggs, Honduran sour cream, and cheese', 'Entrees', 'breakfast', 9.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Yuca con Chicharrón', 'Fried pork bites and fried yuca topped with pickled onions, jalapeños, slaw, and cheese', 'Entrees', 'lunch', 13.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Catrachitas', 'Open-faced fried corn tortillas with choice of protein, refried beans, avocado, cheese, and sour cream', 'Entrees', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
-- Traditional Plates
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Traditional Steak Plate', 'Grilled steak with refried beans, fried plantain, cheese, baked potato, pico de gallo, and chimichurri', 'Entrees', 'lunch', 16.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Traditional Pork Chop Plate', 'Grilled pork chop with refried beans, fried plantain, cheese, baked potato, pico de gallo, and chimichurri', 'Entrees', 'lunch', 15.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Chicken Kabobs', 'Grilled chicken skewers with rice, beans, tortillas, baked potato, pico de gallo, and chimichurri', 'Entrees', 'lunch', 14.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Latin Effect'), 'Steak Kabobs', 'Grilled steak skewers with rice, beans, tortillas, baked potato, pico de gallo, and chimichurri', 'Entrees', 'lunch', 16.99, ARRAY['gluten_free']::dietarytag[]);

-- =============================================
-- BON FRITAY MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Rice Bowls
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Rice and Fried Pork (Griot)', 'Traditional Haitian fried pork over rice and beans with Kreyol sauce and plantains', 'Entrees', 'lunch', 13.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Rice and Fried Chicken', 'Haitian fried chicken over rice and beans with Kreyol sauce and plantains', 'Entrees', 'lunch', 12.99, ARRAY['gluten_free']::dietarytag[]),
-- Fritay Bowls
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Griot Fritay Bowl', 'Fried pork served with three fried sides of your choice', 'Entrees', 'lunch', 14.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Fried Chicken Fritay Bowl', 'Fried chicken served with three fried sides of your choice', 'Entrees', 'lunch', 13.99, ARRAY['gluten_free']::dietarytag[]),
-- Handhelds
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Kreyol Chicken Sandwich', 'Shredded chicken in Kreyol sauce with seasoned mayo on a brioche bun, served with fries', 'Entrees', 'lunch', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Kreyol Pork Sandwich', 'Juicy stewed pork on a brioche bun with optional Pikliz, served with fries', 'Entrees', 'lunch', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Chicken Plantain Cups', 'Fried plantain cups filled with seasoned chicken', 'Entrees', 'lunch', 10.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Pork Plantain Cups', 'Fried plantain cups filled with savory pork', 'Entrees', 'lunch', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Fried Beef Hot Dog (Sosis)', 'Haitian-style fried beef hot dog with your choice of Pikliz, Seasoned Mayo, or Kreyol BBQ', 'Entrees', 'lunch', 6.99, ARRAY[]::dietarytag[]),
-- Extras
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Pikliz', 'Spicy Haitian pickled vegetable slaw (4 oz)', 'Sides', 'lunch', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Kreyol Sauce', 'Traditional Haitian Kreyol sauce (2 oz)', 'Sides', 'lunch', 1.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- Drinks
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Cola Couronne', 'Traditional Haitian tropical soda', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bon Fritay'), 'Haitian Limeade (Ji Sitwon)', 'Freshly made traditional Haitian limeade', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- =============================================
-- MAGNIFICENT CONCESSIONS MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Desserts
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Funnel Cake', 'Pillowy dough fried to crispy golden perfection topped with powdered sugar', 'Desserts', 'all_day', 8.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Funnel Cake Fries', 'Small strips of funnel cake fried and topped with powdered sugar', 'Desserts', 'all_day', 6.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Deep Fried Cheesecake', 'NY-style cheesecake battered, deep-fried, glazed, and dusted with powdered sugar', 'Desserts', 'all_day', 7.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Deep Fried Oreos', 'Classic Oreos battered and fried golden brown, dusted with powdered sugar', 'Desserts', 'all_day', 6.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Deep Fried S''mores', 'Hand-rolled s''mores deep-fried, drizzled with chocolate, and topped with powdered sugar', 'Desserts', 'all_day', 7.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Candy Apples', 'Fresh apples coated with special candy recipe', 'Desserts', 'all_day', 6.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Apple Pie Fries', 'Apple slices fried golden brown, tossed in cinnamon sugar with dipping sauce', 'Desserts', 'all_day', 7.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Peach Pie Fries', 'Sliced peaches deep-fried and coated in sugary blend with dipping sauce', 'Desserts', 'all_day', 7.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Fried Pies', 'Mini pies hand-assembled and fried with various fruit fillings', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Donut Fries', 'Golden crispy fries topped with powdered sugar', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Chocolate Dipped Banana', 'Frozen banana dipped in chocolate with choice of toppings', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Cotton Candy', 'Fluffy spun sugar clouds of sweetness', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Gourmet Popcorn', 'Freshly popped popcorn with your choice of flavoring', 'Snacks', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Italian Ice', 'Authentic Italian ice with many flavor options', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Dream Ice', 'Italian ice mixed with vanilla ice cream', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Acai Bowl', 'Fresh acai topped with strawberries, bananas, blueberries, granola, and honey', 'Desserts', 'all_day', 9.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Pick-me-up Pickles', 'Dill pickle spears hand-breaded and fried with ranch dipping sauce', 'Snacks', 'all_day', 6.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Kool-Aid Pickles', 'Dill pickle spears marinated in Kool-Aid for 3-4 weeks', 'Snacks', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- Drinks
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Fresh Lemonade', 'Hand-squeezed lemonade sweetened just right', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Pineapple Sweet Tea', 'Freshly brewed tea infused with pineapple', 'Beverages', 'all_day', 4.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Orangeade', 'Freshly squeezed oranges lightly sweetened', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Lemonade Float', 'Fresh-squeezed lemonade with Italian ice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Hot Chocolate', 'Rich, creamy gourmet hot cocoa with whipped cream', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Magnificent Concessions'), 'Apple Cider', 'Hot fresh apple cider with whipped cream', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- =============================================
-- OFF-CAMPUS VENDORS MENU ITEMS
-- =============================================

-- ELMO'S DINER
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'French Toast', 'Three slices of sunflower bread dipped in cinnamon batter, grilled, and dusted with powdered sugar', 'Entrees', 'breakfast', 10.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), '3 Eggs All the Way', 'Three eggs any style with choice of breakfast side, breakfast meat, and bread', 'Entrees', 'breakfast', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Biscuits & Gravy', 'Two eggs any style with made-from-scratch biscuit topped with sausage gravy, side, and meat', 'Entrees', 'breakfast', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Salmon Cake & Eggs', 'Two eggs with salmon cake topped with scallions and tomatoes, dill sauce, grits, and biscuit', 'Entrees', 'breakfast', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Baked French Toast', 'French toast stuffed with cream cheese and apples, topped with cinnamon apples and whipped cream', 'Entrees', 'breakfast', 13.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Huevos Rancheros', 'Flour tortilla with red sauce, black beans, cheese, scrambled eggs, tomatoes, and scallions', 'Entrees', 'breakfast', 11.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Eggs & Pancakes', 'Two eggs any style with three plain pancakes and choice of breakfast meat', 'Entrees', 'breakfast', 11.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Eggs & Waffle', 'Two eggs any style with plain waffle and choice of breakfast meat', 'Entrees', 'breakfast', 11.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Back to Basics', 'Two eggs any style with choice of breakfast side and bread', 'Entrees', 'breakfast', 8.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Quiche of the Day', 'House-made quiche served with breakfast side and bread', 'Entrees', 'breakfast', 10.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Classic Burger', 'Half-pound beef burger with lettuce, tomato, onion, and pickles', 'Entrees', 'lunch', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Elmo''s Diner'), 'Grilled Cheese', 'Classic grilled cheese on sourdough bread', 'Entrees', 'lunch', 8.99, ARRAY['vegetarian']::dietarytag[]);

-- BANH'S CUISINE
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Pho Bo (Beef Pho)', 'Traditional Vietnamese beef noodle soup with rice noodles, herbs, and your choice of beef', 'Entrees', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Pho Ga (Chicken Pho)', 'Vietnamese chicken noodle soup with rice noodles and fresh herbs', 'Entrees', 'all_day', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Crispy Tofu with Black Bean Sauce', 'Crispy fried tofu in savory black bean sauce with vegetables', 'Entrees', 'all_day', 11.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Banh Mi Sandwich', 'Vietnamese baguette with choice of protein, pickled vegetables, cilantro, and jalapeños', 'Entrees', 'all_day', 9.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Vermicelli Bowl', 'Rice vermicelli with grilled meat, fresh vegetables, herbs, and fish sauce', 'Entrees', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'General Tso''s Chicken', 'Crispy chicken in sweet and spicy General Tso''s sauce with steamed rice', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Pad Thai', 'Stir-fried rice noodles with shrimp, tofu, eggs, peanuts, and tamarind sauce', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Spring Rolls (4)', 'Fresh rice paper rolls with shrimp, pork, vermicelli, and vegetables with peanut sauce', 'Appetizers', 'all_day', 7.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Egg Rolls (3)', 'Crispy fried egg rolls with pork and vegetables', 'Appetizers', 'all_day', 6.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Banh''s Cuisine'), 'Vietnamese Iced Coffee', 'Strong Vietnamese coffee with sweetened condensed milk over ice', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]);

-- KIICHI RAMEN
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Shoyu Pork Ramen', 'Soy-based broth with chashu pork, soft-boiled egg, bamboo shoots, nori, and scallions', 'Entrees', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Spicy Dan Dan Ramen', 'Spicy sesame-based broth with ground pork, bok choy, and chili oil', 'Entrees', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Miso Ramen', 'Rich miso broth with chashu pork, corn, butter, bean sprouts, and soft-boiled egg', 'Entrees', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Tonkotsu Ramen', 'Creamy pork bone broth with chashu, soft-boiled egg, wood ear mushrooms, and scallions', 'Entrees', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Veggie Ramen', 'Vegetable broth with tofu, seasonal vegetables, corn, and mushrooms', 'Entrees', 'all_day', 14.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Chicken Karaage', 'Japanese-style fried chicken with spicy mayo', 'Appetizers', 'all_day', 9.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Gyoza (6)', 'Pan-fried pork dumplings with dipping sauce', 'Appetizers', 'all_day', 8.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Edamame', 'Steamed soybeans with sea salt', 'Appetizers', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Kiichi Ramen'), 'Chashu Rice Bowl', 'Braised pork belly over rice with soft-boiled egg and pickled vegetables', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]);

-- MONUTS
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Classic Glazed Donut', 'Light and fluffy yeast donut with vanilla glaze', 'Pastries', 'breakfast', 3.50, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Chocolate Glazed Donut', 'Yeast donut with rich chocolate glaze', 'Pastries', 'breakfast', 3.75, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Maple Bacon Donut', 'Yeast donut with maple glaze and crispy bacon', 'Pastries', 'breakfast', 4.50, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Seasonal Donut', 'Rotating seasonal flavor creation', 'Pastries', 'breakfast', 4.25, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Breakfast Bagel Sandwich', 'Bagel with egg, cheese, and choice of bacon or sausage', 'Entrees', 'breakfast', 8.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Veggie Breakfast Sandwich', 'Bagel with egg, cheese, avocado, and tomato', 'Entrees', 'breakfast', 8.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'House Coffee', 'Freshly brewed local roast coffee', 'Beverages', 'all_day', 3.25, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Latte', 'Espresso with steamed milk', 'Beverages', 'all_day', 4.75, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Monuts'), 'Muffin', 'Freshly baked muffin - flavor varies daily', 'Pastries', 'breakfast', 3.99, ARRAY['vegetarian']::dietarytag[]);

-- PANERA BREAD
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Broccoli Cheddar Soup', 'Creamy broccoli and cheddar cheese soup in a bread bowl', 'Entrees', 'all_day', 8.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Bacon Turkey Bravo', 'Smoked turkey, bacon, smoked Gouda, lettuce, tomato, and signature sauce on tomato basil bread', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Fuji Apple Salad', 'Chicken, mixed greens, Gorgonzola, apple chips, pecans, and apple vinaigrette', 'Salads', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Mediterranean Veggie Sandwich', 'Peppadew peppers, feta, cucumbers, lettuce, tomatoes, onion, hummus on tomato basil bread', 'Entrees', 'all_day', 10.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Mac & Cheese', 'Creamy shell pasta with a blend of cheeses', 'Entrees', 'all_day', 9.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'You Pick Two', 'Choose any two: half sandwich, half salad, cup of soup, or mac & cheese', 'Entrees', 'all_day', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Chocolate Chip Cookie', 'Freshly baked chocolate chip cookie', 'Pastries', 'all_day', 2.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Panera Bread - 9th Street'), 'Iced Coffee', 'Cold brewed iced coffee', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- TOAST
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Caprese Panini', 'Fresh mozzarella, tomatoes, basil, and balsamic glaze on ciabatta', 'Entrees', 'lunch', 10.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Italian Sub Panini', 'Ham, salami, capicola, provolone, lettuce, tomato, and Italian dressing', 'Entrees', 'lunch', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Turkey Pesto Panini', 'Roasted turkey, pesto, mozzarella, and roasted red peppers on ciabatta', 'Entrees', 'lunch', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Chicken Parm Panini', 'Breaded chicken, marinara, and melted provolone on ciabatta', 'Entrees', 'lunch', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Tramezzini', 'Traditional Italian tea sandwich on soft white bread - rotating fillings', 'Entrees', 'lunch', 8.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Soup of the Day', 'House-made soup served with bread', 'Sides', 'lunch', 6.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Toast'), 'Italian Soda', 'Sparkling water with flavored syrup', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- ZWELI'S
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Peri Peri Chicken', 'Grilled chicken marinated in signature peri peri sauce, served with two sides', 'Entrees', 'all_day', 16.99, ARRAY['gluten_free', 'halal']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Lamb Curry', 'Slow-cooked lamb in aromatic African curry sauce with rice', 'Entrees', 'all_day', 18.99, ARRAY['gluten_free', 'halal']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Beef Stew', 'Traditional Zimbabwean beef stew with sadza (cornmeal) and vegetables', 'Entrees', 'all_day', 17.99, ARRAY['gluten_free', 'halal']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Vegetable Curry', 'Mixed vegetables in aromatic curry sauce with rice', 'Entrees', 'all_day', 14.99, ARRAY['vegetarian', 'vegan', 'gluten_free', 'halal']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Samosas (3)', 'Crispy pastries filled with spiced vegetables or meat', 'Appetizers', 'all_day', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Sadza', 'Traditional Zimbabwean cornmeal porridge', 'Sides', 'all_day', 4.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Zweli''s'), 'Collard Greens', 'Southern-style collard greens', 'Sides', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- Additional Zweli's Menu Items
-- Pastries
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
    'Two Cookies',
    'Two freshly baked cookies',
    'Pastries',
    'all_day',
    2.99,
    '{"calories": 320, "protein": 4, "carbs": 44, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Single Cookie',
    'One freshly baked cookie',
    'Pastries',
    'all_day',
    2.99,
    '{"calories": 160, "protein": 2, "carbs": 22, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Yellow Cake Slice',
    'Slice of moist yellow cake',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 4, "carbs": 48, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Pound Cake',
    'Classic dense pound cake',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 380, "protein": 5, "carbs": 52, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Candy Cake',
    'Sweet cake with candy toppings',
    'Pastries',
    'all_day',
    1.49,
    '{"calories": 200, "protein": 3, "carbs": 32, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Magwinas',
    'Traditional Zimbabwean pastry',
    'Pastries',
    'all_day',
    1.49,
    '{"calories": 180, "protein": 3, "carbs": 28, "fat": 7}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Apple pie slice',
    'Slice of classic apple pie',
    'Pastries',
    'all_day',
    2.99,
    '{"calories": 280, "protein": 3, "carbs": 42, "fat": 12}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Brownie',
    'Rich, fudgy chocolate brownie',
    'Pastries',
    'all_day',
    3.49,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Muffin',
    'Freshly baked muffin',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 200, "protein": 4, "carbs": 30, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
LIMIT 1;

-- Grab and Go Snacks
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
    'Ms Vicki Chips',
    'Ms. Vickie''s brand potato chips',
    'Snacks',
    'all_day',
    1.69,
    '{"calories": 150, "protein": 2, "carbs": 15, "fat": 10}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Whole fruit',
    'Fresh whole fruit selection',
    'Snacks',
    'all_day',
    NULL,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
LIMIT 1;

-- Specials
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
    'Grilled Chicken Wrap',
    'Grilled chicken wrapped in a tortilla with vegetables',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 420, "protein": 28, "carbs": 38, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
LIMIT 1;

-- Lunch Combo
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
    'Vegetable lunch combo',
    'Vegetable-based lunch combo with sides',
    'Combos',
    'lunch',
    NULL,
    '{"calories": 450, "protein": 12, "carbs": 60, "fat": 18}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Lunch panini combo',
    'Panini sandwich lunch combo with sides',
    'Combos',
    'lunch',
    NULL,
    '{"calories": 580, "protein": 24, "carbs": 55, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Lunch Entree Combo',
    'Lunch entree combo with sides',
    'Combos',
    'lunch',
    NULL,
    '{"calories": 620, "protein": 32, "carbs": 58, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Grilled Cheese combo',
    'Grilled cheese sandwich combo with sides',
    'Combos',
    'lunch',
    NULL,
    '{"calories": 520, "protein": 20, "carbs": 48, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
LIMIT 1;

-- Salads
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
    'Daily Deal - Salad Bar',
    'Daily special salad bar selection',
    'Salads',
    'lunch',
    5.00,
    '{"calories": 200, "protein": 6, "carbs": 20, "fat": 10}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
LIMIT 1;

-- Beverages Online
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
    'Bottled water',
    'Bottled water',
    'Beverages',
    'all_day',
    1.29,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Canned Soda',
    'Assorted canned carbonated soft drinks',
    'Beverages',
    'all_day',
    1.29,
    '{"calories": 150, "protein": 0, "carbs": 39, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Coffee',
    'Freshly brewed coffee',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Juices',
    'Assorted fruit juices',
    'Beverages',
    'all_day',
    2.49,
    '{"calories": 150, "protein": 2, "carbs": 36, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Bottled Tea',
    'Bottled iced tea',
    'Beverages',
    'all_day',
    2.49,
    '{"calories": 90, "protein": 0, "carbs": 24, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Starbucks Double Shot Espresso',
    'Starbucks double shot espresso drink',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 130, "protein": 6, "carbs": 20, "fat": 3}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
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
    'Starbucks Frappuccino',
    'Starbucks frappuccino coffee drink',
    'Beverages',
    'all_day',
    2.89,
    '{"calories": 200, "protein": 4, "carbs": 38, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Zweli''s'
LIMIT 1;

-- CHIPOTLE
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Burrito', 'Large flour tortilla with choice of protein, rice, beans, salsa, and toppings', 'Entrees', 'all_day', 11.50, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Burrito Bowl', 'All burrito ingredients served in a bowl without the tortilla', 'Entrees', 'all_day', 11.50, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Tacos (3)', 'Three soft or crispy tacos with choice of protein and toppings', 'Entrees', 'all_day', 11.50, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Salad', 'Romaine lettuce with choice of protein, beans, salsa, and toppings', 'Salads', 'all_day', 11.50, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Quesadilla', 'Large flour tortilla with cheese and choice of protein', 'Entrees', 'all_day', 12.50, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Chips & Guacamole', 'Fresh tortilla chips with house-made guacamole', 'Sides', 'all_day', 5.95, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Chips & Queso', 'Fresh tortilla chips with warm queso dip', 'Sides', 'all_day', 5.45, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chipotle - Erwin Road'), 'Mexican Coca-Cola', 'Coca-Cola made with cane sugar', 'Beverages', 'all_day', 3.25, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- CHICK-FIL-A
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Chick-fil-A Chicken Sandwich', 'Breaded chicken breast on a toasted buttered bun with pickles', 'Entrees', 'all_day', 5.79, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Spicy Chicken Sandwich', 'Spicy breaded chicken breast on a toasted buttered bun with pickles', 'Entrees', 'all_day', 6.19, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Chicken Nuggets (8 ct)', 'Bite-sized pieces of boneless chicken breast', 'Entrees', 'all_day', 5.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Chicken Nuggets (12 ct)', 'Bite-sized pieces of boneless chicken breast', 'Entrees', 'all_day', 7.65, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Grilled Chicken Sandwich', 'Grilled chicken breast on a multigrain bun with lettuce and tomato', 'Entrees', 'all_day', 6.89, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Cobb Salad', 'Grilled chicken, bacon, cheese, eggs, tomatoes, and corn on mixed greens', 'Salads', 'all_day', 10.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Waffle Fries', 'Waffle-cut potatoes fried until golden', 'Sides', 'all_day', 2.89, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Chicken Biscuit', 'Breaded chicken breast on a buttery biscuit', 'Entrees', 'breakfast', 4.29, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Milkshake', 'Hand-spun milkshake in chocolate, vanilla, strawberry, or cookies & cream', 'Beverages', 'all_day', 4.85, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Chick-fil-A - Hillsborough Road'), 'Fresh Squeezed Lemonade', 'Fresh lemonade made daily', 'Beverages', 'all_day', 3.15, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- COOKOUT
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Big Double Burger Tray', 'Two quarter-pound beef patties with two sides and a drink', 'Entrees', 'all_day', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Cookout Style Burger', 'Burger with chili, slaw, mustard, and onion', 'Entrees', 'all_day', 3.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'BBQ Sandwich Tray', 'Chopped BBQ pork sandwich with two sides and a drink', 'Entrees', 'all_day', 7.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Chicken Strip Tray', 'Crispy chicken strips with two sides and a drink', 'Entrees', 'all_day', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Hot Dog Tray', 'All-beef hot dog with two sides and a drink', 'Entrees', 'all_day', 6.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Quesadilla Tray', 'Grilled quesadilla with two sides and a drink', 'Entrees', 'all_day', 7.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Corn Dog', 'Classic corn dog', 'Sides', 'all_day', 1.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Hushpuppies', 'Golden fried hushpuppies', 'Sides', 'all_day', 1.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Cajun Fries', 'Crispy fries with Cajun seasoning', 'Sides', 'all_day', 1.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Milkshake', 'Hand-spun milkshake with over 40 flavor options', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cookout'), 'Cheerwine Float', 'Cheerwine soda with vanilla ice cream', 'Beverages', 'all_day', 3.49, ARRAY['vegetarian', 'gluten_free']::dietarytag[]);

-- =============================================
-- MERCHANTS ON POINTS VENDORS MENU ITEMS
-- =============================================

-- DEL RANCHO MEXICAN GRILL
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Breakfast
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Huevos Rancheros', 'Two over-easy eggs topped with ranchero sauce, served with beans and fresh fried potatoes', 'Entrees', 'breakfast', 10.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Huevos A La Mexicana', 'Scrambled eggs mixed with onions, tomatoes, and jalapeño, served with beans and fried potatoes', 'Entrees', 'breakfast', 10.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Huevos Con Chorizo', 'Scrambled eggs mixed with Mexican sausage, served with fresh fried potatoes and beans', 'Entrees', 'breakfast', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Chilaquiles Verdes', 'Pieces of tortillas in green sauce, served with beans - add eggs, chicken, or steak', 'Entrees', 'breakfast', 10.99, ARRAY['vegetarian']::dietarytag[]),
-- Appetizers
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Grilled Shrimp Nachos', 'Grilled shrimp served over crispy nachos with cheese and toppings', 'Appetizers', 'all_day', 14.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Beans & Cheese Nachos', 'Crispy tortilla chips topped with refried beans and melted cheese', 'Appetizers', 'all_day', 8.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Stuffed Jalapeños', 'Four cheese-stuffed jalapeños on a salad bed with guacamole, sour cream, and chile con queso', 'Appetizers', 'all_day', 9.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Rancho Combo Plate', 'Bean and cheese nachos, spinach quesadilla, chicken flautas, and stuffed jalapeños', 'Appetizers', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Guacamole & Chips', 'Fresh-made guacamole served with crispy tortilla chips', 'Appetizers', 'all_day', 8.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
-- Soups
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Tortilla Soup', 'Traditional Mexican tortilla soup with chicken and toppings', 'Soups', 'all_day', 7.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Caldo De Res', 'Hearty beef and vegetable soup', 'Soups', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Pozole Verde', 'Traditional Mexican pork and hominy soup in green sauce', 'Soups', 'all_day', 11.99, ARRAY['gluten_free']::dietarytag[]),
-- Salads
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Fajita Salad', 'Choice of beef or chicken on a tortilla shell with lettuce, tomatoes, cheese, guacamole, and sour cream', 'Salads', 'all_day', 13.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Taco Salad', 'Ground beef in a tortilla shell with lettuce, tomatoes, cheese, guacamole, and sour cream', 'Salads', 'all_day', 12.99, ARRAY[]::dietarytag[]),
-- Entrees
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Beef Burrito', 'Large flour tortilla filled with seasoned beef, rice, beans, and cheese', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Chicken Burrito', 'Large flour tortilla filled with grilled chicken, rice, beans, and cheese', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Carnitas Plate', 'Slow-cooked pork carnitas served with rice, beans, and tortillas', 'Entrees', 'all_day', 14.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Chicken Fajitas', 'Sizzling grilled chicken with peppers and onions, served with rice, beans, and tortillas', 'Entrees', 'all_day', 15.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Steak Fajitas', 'Sizzling grilled steak with peppers and onions, served with rice, beans, and tortillas', 'Entrees', 'all_day', 17.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Enchiladas Suizas', 'Three chicken enchiladas topped with creamy green sauce and cheese', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Chile Relleno', 'Poblano pepper stuffed with cheese, battered and fried, topped with ranchero sauce', 'Entrees', 'all_day', 12.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Tacos Al Pastor', 'Three tacos with marinated pork, pineapple, onions, and cilantro', 'Entrees', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Del Rancho Mexican Grill'), 'Fish Tacos', 'Three tacos with grilled or fried fish, cabbage slaw, and chipotle sauce', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]);

-- DEVIL'S PIZZERIA
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Pizzas
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Cheese Pizza (Large)', 'Classic cheese pizza with mozzarella and marinara sauce', 'Pizza', 'all_day', 13.75, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Pepperoni Pizza (Large)', 'Classic pepperoni pizza with mozzarella and marinara', 'Pizza', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Margherita Pizza', 'Fresh mozzarella, tomatoes, basil, and olive oil', 'Pizza', 'all_day', 16.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Meat Lovers Pizza', 'Pepperoni, sausage, bacon, ham, and ground beef', 'Pizza', 'all_day', 19.25, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'BBQ Chicken Pizza', 'Grilled chicken, BBQ sauce, red onions, and cilantro', 'Pizza', 'all_day', 17.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Veggie Lovers Pizza', 'Mushrooms, peppers, onions, olives, and tomatoes', 'Pizza', 'all_day', 17.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Supreme Pizza', 'Pepperoni, sausage, mushrooms, peppers, and onions', 'Pizza', 'all_day', 18.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'White Pizza', 'Ricotta, mozzarella, garlic, and olive oil - no red sauce', 'Pizza', 'all_day', 16.99, ARRAY['vegetarian']::dietarytag[]),
-- Calzones
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Cheese Calzone', 'Folded pizza dough stuffed with ricotta, mozzarella, and Romano cheeses', 'Entrees', 'all_day', 10.50, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Pepperoni Calzone', 'Calzone stuffed with pepperoni and three cheeses', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Spinach Calzone', 'Calzone stuffed with spinach, ricotta, and mozzarella', 'Entrees', 'all_day', 11.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Meatball Calzone', 'Calzone stuffed with meatballs, marinara, and mozzarella', 'Entrees', 'all_day', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Philly Steak Calzone', 'Calzone stuffed with steak, peppers, onions, and cheese', 'Entrees', 'all_day', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Philly Chicken Calzone', 'Calzone stuffed with chicken, peppers, onions, and cheese', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]),
-- Sides & Drinks
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Garlic Knots', 'Fresh baked dough knots brushed with garlic butter', 'Sides', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Mozzarella Sticks', 'Breaded mozzarella sticks with marinara sauce', 'Sides', 'all_day', 7.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), 'Buffalo Wings (10)', 'Crispy wings tossed in buffalo sauce', 'Sides', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Devil''s Pizzeria'), '2-Liter Soda', 'Choice of Coke, Sprite, or Fanta', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- ENZO'S PIZZA CO.
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Specialty Pizzas
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'The Classic Pizza', 'Red sauce, cheese, pepperoni, sausage, mushrooms, onions, and green peppers', 'Pizza', 'all_day', 18.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'The ATM Pizza', 'Red sauce, cheese, pepperoni, ham, sausage, and bacon', 'Pizza', 'all_day', 19.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'The Heater Pizza', 'Ranch base, cheese, chicken, bacon, onions, hot buffalo sauce, cheddar, and jalapeños', 'Pizza', 'all_day', 19.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Cheese Pizza (Large)', 'Classic cheese pizza with house-made sauce and mozzarella', 'Pizza', 'all_day', 14.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Pepperoni Pizza (Large)', 'Classic pepperoni with house-made sauce and mozzarella', 'Pizza', 'all_day', 16.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Build Your Own Pizza', 'Choose from over 30 toppings to create your perfect pizza', 'Pizza', 'all_day', 15.99, ARRAY['vegetarian']::dietarytag[]),
-- Hot Subs
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Italian Sub', 'Genoa salami, lean ham, capicola, provolone, romaine, tomatoes, onions, banana peppers, and Italian dressing', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Meatball Sub', 'House-made meatballs slow-cooked in marinara, topped with melted provolone', 'Entrees', 'all_day', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Chicken Parm Sub', 'Breaded chicken breast with marinara and melted provolone', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Philly Cheesesteak Sub', 'Sliced steak with peppers, onions, and melted provolone', 'Entrees', 'all_day', 12.99, ARRAY[]::dietarytag[]),
-- Salads
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'House Salad', 'Romaine, tomatoes, onions, carrots, pecorino romano, croutons, and Italian dressing', 'Salads', 'all_day', 7.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Caesar Salad', 'Romaine, bacon, pecorino romano, croutons, and Caesar dressing', 'Salads', 'all_day', 8.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Greek Salad', 'Romaine, feta, olives, tomatoes, cucumbers, pepperoncini, and Greek dressing', 'Salads', 'all_day', 9.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
-- Desserts
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Cinna-Zo''s', 'Dough pieces coated in butter, tossed in cinnamon and sugar, served with icing', 'Desserts', 'all_day', 6.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Enzo''s Pizza Co.'), 'Cannoli', 'Crispy pastry shell filled with sweet ricotta cream', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]);

-- MEDITERRA GRILL
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Salads
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Greek Salad', 'Romaine, red onions, tomatoes, cucumbers, peppers, Kalamata olives, feta, and pepperoncini', 'Salads', 'all_day', 9.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Tabouli Salad', 'Fresh parsley, cracked wheat, tomatoes, onions, and lemon juice', 'Salads', 'all_day', 7.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Fattoush Salad', 'Romaine, tomatoes, cucumbers, radishes, and crispy pita with sumac dressing', 'Salads', 'all_day', 8.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
-- Rice Platters
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Lamb Kabob Platter', 'Marinated lamb kabob served with roasted tomatoes, red onions, rice, and pita', 'Entrees', 'all_day', 16.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Chicken Kabob Platter', 'Chicken breast marinated in lemon yogurt sauce with roasted vegetables, rice, and pita', 'Entrees', 'all_day', 14.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Beef Kabob Platter', 'Marinated beef kabob with roasted vegetables, rice, and pita', 'Entrees', 'all_day', 16.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Falafel Platter', 'Crispy falafel patties served with hummus, tahini, rice, and pita', 'Entrees', 'all_day', 12.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Gyro Platter', 'Lamb and beef gyro meat served with rice, Greek salad, and tzatziki', 'Entrees', 'all_day', 14.99, ARRAY[]::dietarytag[]),
-- Wraps
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Lamb & Beef Gyro Wrap', 'Gyro meat with romaine, tomatoes, onions, and tzatziki in warm pita', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Chicken Shawarma Wrap', 'Grilled chicken with parsley, pickles, potato strips, and garlic dressing', 'Entrees', 'all_day', 11.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Falafel Wrap', 'Crispy falafel with hummus, tahini, lettuce, and tomatoes in warm pita', 'Entrees', 'all_day', 10.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
-- Sides
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Hummus', 'Creamy chickpea dip with tahini, lemon, and garlic, served with pita', 'Sides', 'all_day', 6.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Baba Ganoush', 'Smoky roasted eggplant dip with tahini and garlic, served with pita', 'Sides', 'all_day', 7.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Falafel (4 pieces)', 'Crispy chickpea and herb patties', 'Sides', 'all_day', 5.99, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Grape Leaves', 'Stuffed grape leaves with rice and herbs', 'Sides', 'all_day', 6.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Mediterra Grill'), 'Tzatziki', 'Cool cucumber yogurt sauce', 'Sides', 'all_day', 3.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]);

-- SAKE BOMB
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Appetizers
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Imperial Rolls', 'Crispy spring rolls filled with ground pork, shrimp, onions, and taro', 'Appetizers', 'all_day', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Edamame', 'Salted steamed soybeans in the pod', 'Appetizers', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Korean BBQ Ribs', 'Grilled short ribs glazed with Korean BBQ sauce', 'Appetizers', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Gyoza', 'Pan-fried pork dumplings with dipping sauce', 'Appetizers', 'all_day', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Shrimp Tempura', 'Lightly battered and fried shrimp with tempura sauce', 'Appetizers', 'all_day', 9.99, ARRAY[]::dietarytag[]),
-- Sushi Rolls
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'California Roll', 'Crab, avocado, and cucumber with sesame seeds', 'Sushi', 'all_day', 8.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Spicy Tuna Roll', 'Fresh tuna with spicy mayo and cucumber', 'Sushi', 'all_day', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Salmon Avocado Roll', 'Fresh salmon and creamy avocado', 'Sushi', 'all_day', 10.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Dragon Roll', 'Shrimp tempura topped with eel, avocado, and eel sauce', 'Sushi', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Volcano Roll', 'Spicy crab and shrimp tempura topped with baked seafood', 'Sushi', 'all_day', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Black Widow Roll', 'Spicy tuna inside, topped with seared tuna and spicy mayo', 'Sushi', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Rainbow Roll', 'California roll topped with assorted fresh fish', 'Sushi', 'all_day', 16.99, ARRAY[]::dietarytag[]),
-- Sushi Combos
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Sushi Deluxe Combo', 'Assorted nigiri and sashimi platter with chef''s selection', 'Sushi', 'all_day', 24.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Sashimi Platter', 'Fresh assorted sashimi - tuna, salmon, yellowtail', 'Sushi', 'all_day', 22.99, ARRAY['gluten_free']::dietarytag[]),
-- Hibachi
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Hibachi Chicken', 'Grilled chicken with vegetables, fried rice, and dipping sauces', 'Entrees', 'all_day', 16.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Hibachi Steak', 'Grilled steak with vegetables, fried rice, and dipping sauces', 'Entrees', 'all_day', 19.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Hibachi Shrimp', 'Grilled shrimp with vegetables, fried rice, and dipping sauces', 'Entrees', 'all_day', 18.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Hibachi Combo', 'Combination of chicken and steak with vegetables and fried rice', 'Entrees', 'all_day', 22.99, ARRAY['gluten_free']::dietarytag[]),
-- Classic Entrees
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'General Tso''s Chicken', 'Crispy chicken in sweet and spicy General Tso''s sauce', 'Entrees', 'all_day', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Mongolian Beef', 'Tender beef with scallions in savory Mongolian sauce', 'Entrees', 'all_day', 15.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Thai Cashew Chicken', 'Stir-fried chicken with cashews, peppers, and Thai sauce', 'Entrees', 'all_day', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sake Bomb'), 'Pad Thai', 'Rice noodles with shrimp, egg, peanuts, and tamarind sauce', 'Entrees', 'all_day', 14.99, ARRAY[]::dietarytag[]);

-- SUSHI LOVE
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- Regular Rolls
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Salmon Avocado Roll', 'Fresh salmon and avocado', 'Sushi', 'all_day', 10.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Yellowtail Roll', 'Fresh yellowtail with scallions', 'Sushi', 'all_day', 9.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Tuna Roll', 'Fresh tuna with cucumber', 'Sushi', 'all_day', 8.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'California Roll', 'Crab, avocado, and cucumber', 'Sushi', 'all_day', 8.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Spicy Tuna Roll', 'Spicy tuna with cucumber and spicy mayo', 'Sushi', 'all_day', 9.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Shrimp Tempura Roll', 'Crispy shrimp tempura with avocado', 'Sushi', 'all_day', 10.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Vegetable Roll', 'Cucumber, avocado, and asparagus', 'Sushi', 'all_day', 7.00, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Eel Avocado Roll', 'Freshwater eel with avocado and eel sauce', 'Sushi', 'all_day', 11.00, ARRAY[]::dietarytag[]),
-- Specialty Rolls
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Blue Devil Roll', 'Spicy tuna, crab, topped with tuna, avocado, and special sauce', 'Sushi', 'all_day', 15.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Dragon Roll', 'Shrimp tempura topped with eel and avocado', 'Sushi', 'all_day', 16.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Rainbow Roll', 'California roll topped with assorted fresh fish', 'Sushi', 'all_day', 16.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Caterpillar Roll', 'Eel inside topped with avocado and eel sauce', 'Sushi', 'all_day', 15.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Crunchy Roll', 'Spicy crab inside topped with tempura crunch and spicy mayo', 'Sushi', 'all_day', 13.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Dynamite Roll', 'Shrimp tempura, spicy tuna, topped with spicy crab', 'Sushi', 'all_day', 13.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Fire Roll', 'Spicy tuna, jalapeño, topped with seared tuna and hot sauce', 'Sushi', 'all_day', 16.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Hurricane Roll', 'Shrimp tempura, cream cheese, topped with spicy crab and eel sauce', 'Sushi', 'all_day', 15.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Hawaiian Roll', 'Salmon, mango, topped with fresh salmon and mango salsa', 'Sushi', 'all_day', 16.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Green Wave Roll', 'Soft shell crab, avocado, topped with seaweed salad', 'Sushi', 'all_day', 17.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Honey Love Roll', 'Shrimp tempura, cream cheese, topped with salmon and honey wasabi', 'Sushi', 'all_day', 16.00, ARRAY[]::dietarytag[]),
-- Appetizers
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Edamame', 'Steamed soybeans with sea salt', 'Appetizers', 'all_day', 5.00, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Miso Soup', 'Traditional Japanese miso soup with tofu and seaweed', 'Appetizers', 'all_day', 3.00, ARRAY['vegetarian', 'vegan']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Seaweed Salad', 'Marinated seaweed with sesame seeds', 'Appetizers', 'all_day', 6.00, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Gyoza (6)', 'Pan-fried pork dumplings', 'Appetizers', 'all_day', 7.00, ARRAY[]::dietarytag[]),
-- Entrees
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Chicken Teriyaki', 'Grilled chicken with teriyaki sauce, served with rice and salad', 'Entrees', 'all_day', 14.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Salmon Teriyaki', 'Grilled salmon with teriyaki sauce, served with rice and salad', 'Entrees', 'all_day', 16.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Sushi Love'), 'Beef Teriyaki', 'Grilled beef with teriyaki sauce, served with rice and salad', 'Entrees', 'all_day', 17.00, ARRAY[]::dietarytag[]);

-- BULKOGI @ THE CAN OPENER (already has Bulkogi items, adding specific Can Opener items)
INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Beef Bulgogi Rice Bowl', 'Marinated beef bulgogi over rice with vegetables and sesame seeds', 'Entrees', 'all_day', 13.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Spicy Pork Rice Bowl', 'Spicy marinated pork over rice with vegetables', 'Entrees', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Chicken Rice Bowl', 'Marinated chicken over rice with vegetables and sesame seeds', 'Entrees', 'all_day', 12.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Tofu Rice Bowl', 'Marinated tofu over rice with vegetables', 'Entrees', 'all_day', 11.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Bibimbap', 'Rice bowl with vegetables, egg, and gochujang sauce', 'Entrees', 'all_day', 13.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Korean BBQ Tacos (3)', 'Corn tortillas with Korean BBQ meat, slaw, and salsa', 'Entrees', 'all_day', 11.99, ARRAY['gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Japchae', 'Korean glass noodles stir-fried with vegetables and beef', 'Entrees', 'all_day', 14.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Kimchi Fried Rice', 'Fried rice with kimchi, vegetables, and choice of protein', 'Entrees', 'all_day', 12.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Korean Fried Chicken', 'Crispy fried chicken with sweet and spicy Korean sauce', 'Entrees', 'all_day', 13.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Mandu (Dumplings)', 'Korean pan-fried dumplings (6 pieces)', 'Appetizers', 'all_day', 7.99, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Kimchi', 'Traditional fermented napa cabbage', 'Sides', 'all_day', 3.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Bulkogi @ The Can Opener'), 'Steamed Rice', 'Plain steamed white rice', 'Sides', 'all_day', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]);

-- =============================================
-- CAFE MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- ESPRESSO BAR - CLASSIC HOT DRINKS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Hot Chocolate', 'Rich hot chocolate made with steamed milk and cocoa', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Hot Tea', 'Assorted hot teas served with lemon', 'Beverages', 'all_day', 2.79, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Caramel Leche', 'Espresso drink with steamed milk and caramel syrup', 'Beverages', 'all_day', 5.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Cafe Latte', 'Espresso with steamed milk and light foam', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Mocha Latte', 'Espresso with chocolate, steamed milk, and whipped cream', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Organic Matcha Latte', 'Organic matcha green tea with steamed milk', 'Beverages', 'all_day', 5.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Organic Earl Grey Latte', 'Earl Grey tea with steamed milk and vanilla', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),

-- ESPRESSO BAR - SIGNATURE DRINKS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Peppermint Mocha Latte', 'Espresso with chocolate, peppermint, and steamed milk', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Hot Honey Latte', 'Espresso with steamed milk, honey, and a hint of spice', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Frappe', 'Blended coffee drink topped with whipped cream', 'Beverages', 'all_day', 6.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Iced Coffee', 'Chilled brewed coffee served over ice', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Cortado', 'Equal parts espresso and steamed milk', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Large Milk', 'Cold glass of milk', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Americano', 'Espresso diluted with hot water', 'Beverages', 'all_day', 3.89, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Cappuccino', 'Espresso with steamed milk and thick foam', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'House Brewed Coffee', 'Freshly brewed drip coffee', 'Beverages', 'all_day', 3.19, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Organic Masala Chai', 'Spiced black tea with steamed milk and chai spices', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Vietnamese Coffee', 'Strong coffee with sweetened condensed milk over ice', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),

-- SMOOTHIES & FRESH JUICES
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Apple Juice', 'Fresh pressed apple juice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Carrot Juice', 'Fresh pressed carrot juice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Healthy Boost', 'Fruit and vegetable juice blend for an energy boost', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Green Monster', 'Green smoothie with leafy greens and fruit', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Orange Juice', 'Fresh squeezed orange juice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Mango Smoothie', 'Blended mango smoothie', 'Beverages', 'all_day', 6.59, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Strawberry Smoothie', 'Blended strawberry smoothie', 'Beverages', 'all_day', 6.59, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),

-- SPECIALS & NOURISH MEALS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), '$5 Meal Deal', 'Daily rotating special entree with side or drink', 'Entrees', 'all_day', 5.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Grilled Ratatouille', 'Roasted vegetables in tomato sauce served with grains', 'Entrees', 'all_day', 9.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Chicken Pesto', 'Grilled chicken in basil pesto sauce with vegetables or pasta', 'Entrees', 'all_day', 9.99, ARRAY[]::dietarytag[]),

-- CREPES
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Croque Monsieur Crepe', 'Savory crepe with ham, cheese, and creamy sauce', 'Entrees', 'all_day', 8.69, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Chocolat Crepe', 'Sweet crepe filled with chocolate', 'Desserts', 'all_day', 7.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Cinnamon Sugar Crepe', 'Classic crepe with cinnamon sugar topping', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),

-- HOT SANDWICHES & BREAKFAST
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Greek Scrambler', 'Egg scramble with Mediterranean-inspired ingredients', 'Entrees', 'breakfast', 6.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Egg n Cheese Croissant', 'Fluffy eggs and cheese on a buttery croissant', 'Entrees', 'breakfast', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Toscano Sandwich', 'Hearty sandwich with meat, cheese, and greens on artisan bread', 'Entrees', 'all_day', 10.59, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Egg Bites', 'Baked egg bites with cheese and vegetables', 'Entrees', 'breakfast', 6.49, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Egg & Cheese Bagel', 'Egg and cheese breakfast sandwich on a bagel', 'Entrees', 'breakfast', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Bacon Egg and Cheese Croissant', 'Croissant with bacon, egg, and cheese', 'Entrees', 'breakfast', 6.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Chicken Parmesan Sandwich', 'Breaded chicken with marinara and cheese on a toasted roll', 'Entrees', 'all_day', 10.09, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Crispy Chicken & Pimento Cheese', 'Crispy chicken topped with pimento cheese on a bun', 'Entrees', 'all_day', 10.59, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'French Beef Sandwich', 'Hot sandwich with sliced beef and melted cheese', 'Entrees', 'all_day', 10.59, ARRAY[]::dietarytag[]),

-- PASTRIES & DESSERTS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Sweet Bread', 'Slice of sweet breakfast bread', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Chocolate Covered Strawberry (Each)', 'Single chocolate-dipped strawberry', 'Desserts', 'all_day', 3.79, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'GFF Blueberry Scone', 'Gluten-friendly blueberry scone', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Slice of Cake', 'Slice of daily featured cake', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Dessert Bar', 'House-made dessert bar', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Cookie', 'Fresh baked cookie', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Cupcake', 'Frosted cupcake', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Muffin', 'Fresh baked muffin', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Chocolate Chip Scone', 'Buttery scone with chocolate chips', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Chocolate Covered Figs', 'Figs dipped in rich chocolate', 'Desserts', 'all_day', 7.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Pumpkin Sweet Bread', 'Slice of pumpkin sweet bread', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),

-- GELATO BAR
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Gelato or Sorbetto 1 Scoop', 'One scoop of gelato or sorbetto', 'Desserts', 'all_day', 5.09, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Gelato or Sorbetto 2 Scoops', 'Two scoops of gelato or sorbetto', 'Desserts', 'all_day', 6.89, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe'), 'Gelato or Sorbetto 3 Scoops', 'Three scoops of gelato or sorbetto', 'Desserts', 'all_day', 8.89, ARRAY['vegetarian', 'gluten_free']::dietarytag[]);

-- =============================================
-- CAFE 300 MENU ITEMS
-- =============================================

INSERT INTO menu_items (vendor_id, name, description, category, meal_type, price, dietary_tags) VALUES
-- ESPRESSO BAR - CLASSIC HOT DRINKS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Hot Chocolate', 'Rich hot chocolate made with steamed milk and cocoa', 'Beverages', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Hot Tea', 'Assorted hot teas served with lemon', 'Beverages', 'all_day', 2.79, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Caramel Leche', 'Espresso drink with steamed milk and caramel syrup', 'Beverages', 'all_day', 5.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Cafe Latte', 'Espresso with steamed milk and light foam', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Mocha Latte', 'Espresso with chocolate, steamed milk, and whipped cream', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Organic Matcha Latte', 'Organic matcha green tea with steamed milk', 'Beverages', 'all_day', 5.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Organic Earl Grey Latte', 'Earl Grey tea with steamed milk and vanilla', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),

-- ESPRESSO BAR - SIGNATURE DRINKS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Peppermint Mocha Latte', 'Espresso with chocolate, peppermint, and steamed milk', 'Beverages', 'all_day', 5.09, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Hot Honey Latte', 'Espresso with steamed milk, honey, and a hint of spice', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Frappe', 'Blended coffee drink topped with whipped cream', 'Beverages', 'all_day', 6.59, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Iced Coffee', 'Chilled brewed coffee served over ice', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Cortado', 'Equal parts espresso and steamed milk', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Large Milk', 'Cold glass of milk', 'Beverages', 'all_day', 2.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Americano', 'Espresso diluted with hot water', 'Beverages', 'all_day', 3.89, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Cappuccino', 'Espresso with steamed milk and thick foam', 'Beverages', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'House Brewed Coffee', 'Freshly brewed drip coffee', 'Beverages', 'all_day', 3.19, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Organic Masala Chai', 'Spiced black tea with steamed milk and chai spices', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Vietnamese Coffee', 'Strong coffee with sweetened condensed milk over ice', 'Beverages', 'all_day', 5.39, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),

-- SMOOTHIES & FRESH JUICES
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Apple Juice', 'Fresh pressed apple juice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Carrot Juice', 'Fresh pressed carrot juice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Healthy Boost', 'Fruit and vegetable juice blend for an energy boost', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Green Monster', 'Green smoothie with leafy greens and fruit', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Orange Juice', 'Fresh squeezed orange juice', 'Beverages', 'all_day', 5.99, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Mango Smoothie', 'Blended mango smoothie', 'Beverages', 'all_day', 6.59, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Strawberry Smoothie', 'Blended strawberry smoothie', 'Beverages', 'all_day', 6.59, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),

-- SPECIALS & NOURISH MEALS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), '$5 Meal Deal', 'Daily rotating special entree with side or drink', 'Entrees', 'all_day', 5.00, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Grilled Ratatouille', 'Roasted vegetables in tomato sauce served with grains', 'Entrees', 'all_day', 9.49, ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Chicken Pesto', 'Grilled chicken in basil pesto sauce with vegetables or pasta', 'Entrees', 'all_day', 9.99, ARRAY[]::dietarytag[]),

-- CREPES
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Croque Monsieur Crepe', 'Savory crepe with ham, cheese, and creamy sauce', 'Entrees', 'all_day', 8.69, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Chocolat Crepe', 'Sweet crepe filled with chocolate', 'Desserts', 'all_day', 7.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Cinnamon Sugar Crepe', 'Classic crepe with cinnamon sugar topping', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),

-- HOT SANDWICHES & BREAKFAST
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Greek Scrambler', 'Egg scramble with Mediterranean-inspired ingredients', 'Entrees', 'breakfast', 6.49, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Egg n Cheese Croissant', 'Fluffy eggs and cheese on a buttery croissant', 'Entrees', 'breakfast', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Toscano Sandwich', 'Hearty sandwich with meat, cheese, and greens on artisan bread', 'Entrees', 'all_day', 10.59, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Egg Bites', 'Baked egg bites with cheese and vegetables', 'Entrees', 'breakfast', 6.49, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Egg & Cheese Bagel', 'Egg and cheese breakfast sandwich on a bagel', 'Entrees', 'breakfast', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Bacon Egg and Cheese Croissant', 'Croissant with bacon, egg, and cheese', 'Entrees', 'breakfast', 6.49, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Chicken Parmesan Sandwich', 'Breaded chicken with marinara and cheese on a toasted roll', 'Entrees', 'all_day', 10.09, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Crispy Chicken & Pimento Cheese', 'Crispy chicken topped with pimento cheese on a bun', 'Entrees', 'all_day', 10.59, ARRAY[]::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'French Beef Sandwich', 'Hot sandwich with sliced beef and melted cheese', 'Entrees', 'all_day', 10.59, ARRAY[]::dietarytag[]),

-- PASTRIES & DESSERTS
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Sweet Bread', 'Slice of sweet breakfast bread', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Chocolate Covered Strawberry (Each)', 'Single chocolate-dipped strawberry', 'Desserts', 'all_day', 3.79, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'GFF Blueberry Scone', 'Gluten-friendly blueberry scone', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Slice of Cake', 'Slice of daily featured cake', 'Desserts', 'all_day', 5.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Dessert Bar', 'House-made dessert bar', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Cookie', 'Fresh baked cookie', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Cupcake', 'Frosted cupcake', 'Desserts', 'all_day', 4.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Muffin', 'Fresh baked muffin', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Chocolate Chip Scone', 'Buttery scone with chocolate chips', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Chocolate Covered Figs', 'Figs dipped in rich chocolate', 'Desserts', 'all_day', 7.99, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Pumpkin Sweet Bread', 'Slice of pumpkin sweet bread', 'Desserts', 'all_day', 3.99, ARRAY['vegetarian']::dietarytag[]),

-- GELATO BAR
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Gelato or Sorbetto 1 Scoop', 'One scoop of gelato or sorbetto', 'Desserts', 'all_day', 5.09, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Gelato or Sorbetto 2 Scoops', 'Two scoops of gelato or sorbetto', 'Desserts', 'all_day', 6.89, ARRAY['vegetarian', 'gluten_free']::dietarytag[]),
((SELECT vendor_id FROM vendors WHERE name = 'Cafe 300'), 'Gelato or Sorbetto 3 Scoops', 'Three scoops of gelato or sorbetto', 'Desserts', 'all_day', 8.89, ARRAY['vegetarian', 'gluten_free']::dietarytag[]);

-- Sazon Menu Items
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
    '$5 Meal Deal',
    'Daily promotional meal deal including main item, side, and drink',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Sazon'
LIMIT 1;

-- BUILD YOUR OWN
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
    'Quesadilla',
    'Build your own quesadilla with choice of protein, cheese, and vegetables',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 580, "protein": 32, "carbs": 48, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    '2 Tacos',
    'Build your own two tacos with choice of protein, toppings, and salsa',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 480, "protein": 28, "carbs": 52, "fat": 18}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Arepa Bowl',
    'Build your own arepa bowl with choice of protein, rice, beans, and toppings',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 520, "protein": 24, "carbs": 68, "fat": 16}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Burrito',
    'Build your own burrito with choice of protein, rice, beans, cheese, and toppings',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 680, "protein": 32, "carbs": 78, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Sazon'
LIMIT 1;

-- EXTRAS & DRINKS
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
    'Chips & Queso',
    'Tortilla chips served with melted queso dip',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 420, "protein": 12, "carbs": 42, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Chips & Guacamole',
    'Tortilla chips served with fresh guacamole',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 380, "protein": 6, "carbs": 42, "fat": 20}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Chips & Salsa',
    'Tortilla chips served with fresh salsa',
    'Sides',
    'all_day',
    2.49,
    '{"calories": 280, "protein": 4, "carbs": 38, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Chocolate Chip Cookie',
    'Fresh baked chocolate chip cookie',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 280, "protein": 4, "carbs": 38, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Iced Brownie',
    'Chocolate brownie served iced',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Churro Donut',
    'Fresh churro donut with cinnamon sugar',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Smart Water 20oz',
    'Vapor-distilled water with electrolytes, 20oz',
    'Beverages',
    'all_day',
    2.09,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    '1L Smart Water',
    'Vapor-distilled water with electrolytes, 1 liter',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
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
    'Sports Water',
    'Electrolyte-enhanced sports water',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 10, "protein": 0, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Sazon'
LIMIT 1;

-- Ginger + Soy Menu Items
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
    '$5 Meal Deal',
    'Daily promotional meal deal including main item, side, and drink',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 500, "protein": 20, "carbs": 60, "fat": 18}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- EVERYDAY PLATE
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
    'Tteokbokki',
    'Korean rice cakes in spicy gochujang sauce',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 420, "protein": 8, "carbs": 78, "fat": 8}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Pad Thai',
    'Classic Thai stir-fried rice noodles with tamarind sauce, vegetables, and choice of protein',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 580, "protein": 24, "carbs": 88, "fat": 14}',
    '["gluten", "egg", "fish"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Tokyo (Teriyaki Chicken)',
    'Teriyaki glazed chicken with vegetables and rice',
    'Entrees',
    'all_day',
    11.39,
    '{"calories": 520, "protein": 38, "carbs": 58, "fat": 12}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Shanghai (Ginger Chicken)',
    'Ginger-glazed chicken with vegetables and rice',
    'Entrees',
    'all_day',
    11.29,
    '{"calories": 480, "protein": 36, "carbs": 52, "fat": 14}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Hong Kong (Spicy Pork)',
    'Spicy marinated pork with vegetables and rice',
    'Entrees',
    'all_day',
    11.39,
    '{"calories": 540, "protein": 32, "carbs": 58, "fat": 18}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'California (Teriyaki Tofu)',
    'Teriyaki-glazed tofu with vegetables and rice',
    'Entrees',
    'all_day',
    10.89,
    '{"calories": 420, "protein": 20, "carbs": 58, "fat": 12}',
    '["soy", "gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Seoul (Korean BBQ Beef)',
    'Korean BBQ marinated beef with vegetables and rice',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 560, "protein": 38, "carbs": 58, "fat": 18}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- MAKE OWN BOWL
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
    'Make Your Own Bowl',
    'Build your own bowl with choice of base, protein, vegetables, and sauce',
    'Entrees',
    'all_day',
    11.89,
    '{"calories": 500, "protein": 24, "carbs": 68, "fat": 14}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- POKE
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
    'Salmon Poke Bowl',
    'Fresh salmon poke bowl with rice, vegetables, and sauce',
    'Entrees',
    'all_day',
    13.59,
    '{"calories": 520, "protein": 32, "carbs": 58, "fat": 16}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Tuna Poke',
    'Fresh tuna poke bowl with rice, vegetables, and sauce',
    'Entrees',
    'all_day',
    13.59,
    '{"calories": 480, "protein": 38, "carbs": 58, "fat": 12}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Spicy Tuna Poke',
    'Spicy tuna poke bowl with rice, vegetables, and spicy sauce',
    'Entrees',
    'all_day',
    13.59,
    '{"calories": 500, "protein": 36, "carbs": 58, "fat": 14}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- RAMEN
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
    'Spicy Miso Ramen',
    'Spicy miso-based ramen with noodles, vegetables, and choice of protein',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 580, "protein": 28, "carbs": 78, "fat": 18}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Tonkotsu Ramen',
    'Rich pork bone broth ramen with noodles, vegetables, and toppings',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 620, "protein": 32, "carbs": 78, "fat": 22}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- SMALL BITES
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
    'Beef Dumplings',
    'Steamed or pan-fried beef dumplings',
    'Appetizers',
    'all_day',
    5.79,
    '{"calories": 280, "protein": 14, "carbs": 32, "fat": 10}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Chicken Dumplings',
    'Steamed or pan-fried chicken dumplings',
    'Appetizers',
    'all_day',
    5.79,
    '{"calories": 260, "protein": 12, "carbs": 32, "fat": 8}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Vegetable Dumplings',
    'Steamed or pan-fried vegetable dumplings',
    'Appetizers',
    'all_day',
    5.79,
    '{"calories": 240, "protein": 8, "carbs": 38, "fat": 8}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Vegetable Spring Rolls (2pcs)',
    'Two crispy vegetable spring rolls',
    'Appetizers',
    'all_day',
    2.49,
    '{"calories": 180, "protein": 4, "carbs": 28, "fat": 6}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- DRINKS
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
    'ITO EN Tea',
    'Japanese green tea',
    'Beverages',
    'all_day',
    3.49,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Aqua Panna Water',
    'Italian still water, 500ml',
    'Beverages',
    'all_day',
    2.59,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'San Pellegrino Sparkling Water',
    'Italian sparkling mineral water',
    'Beverages',
    'all_day',
    2.19,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Izze',
    'Sparkling fruit juice beverage',
    'Beverages',
    'all_day',
    2.19,
    '{"calories": 120, "protein": 0, "carbs": 28, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
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
    'Tractor',
    'Organic sparkling beverage',
    'Beverages',
    'all_day',
    3.89,
    '{"calories": 100, "protein": 0, "carbs": 24, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Ginger + Soy'
LIMIT 1;

-- The Devil's Krafthouse Menu Items
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
    'Queso Burger',
    'Beef burger topped with queso cheese and special sauce',
    'Burgers',
    'all_day',
    11.99,
    '{"calories": 720, "protein": 38, "carbs": 48, "fat": 38}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Dilly Burger',
    'Beef burger with dill pickles and special sauce',
    'Burgers',
    'all_day',
    11.99,
    '{"calories": 680, "protein": 36, "carbs": 48, "fat": 32}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Impossible Burger',
    'Plant-based burger patty with all the fixings',
    'Burgers',
    'all_day',
    13.99,
    '{"calories": 580, "protein": 24, "carbs": 48, "fat": 28}',
    '["gluten", "soy"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Turkey Burger',
    'Ground turkey burger with lettuce, tomato, and special sauce',
    'Burgers',
    'all_day',
    10.99,
    '{"calories": 520, "protein": 32, "carbs": 42, "fat": 22}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Brecky Burger',
    'Breakfast burger with egg, bacon, and cheese',
    'Burgers',
    'all_day',
    11.99,
    '{"calories": 780, "protein": 42, "carbs": 48, "fat": 42}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Mushroom and Swiss Burger',
    'Beef burger topped with sautéed mushrooms and Swiss cheese',
    'Burgers',
    'all_day',
    14.99,
    '{"calories": 680, "protein": 38, "carbs": 48, "fat": 36}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'BBQ Bacon Burger',
    'Beef burger with bacon, BBQ sauce, and cheddar cheese',
    'Burgers',
    'all_day',
    14.99,
    '{"calories": 820, "protein": 42, "carbs": 48, "fat": 44}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Devils Krafthouse Burger',
    'Classic house burger with lettuce, tomato, onion, and special sauce',
    'Burgers',
    'all_day',
    11.99,
    '{"calories": 680, "protein": 38, "carbs": 48, "fat": 32}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Build Your Own Burger',
    'Customize your burger with choice of toppings and sauces',
    'Burgers',
    'all_day',
    11.99,
    '{"calories": 640, "protein": 36, "carbs": 48, "fat": 30}',
    '["gluten", "egg", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Brie and Bacon Jam Burger',
    'Beef burger with brie cheese and bacon jam',
    'Burgers',
    'all_day',
    13.99,
    '{"calories": 720, "protein": 40, "carbs": 48, "fat": 38}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- HANDHELDS
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
    'Flank Steak French Dip',
    'Sliced flank steak on a French roll with au jus for dipping',
    'Handhelds',
    'all_day',
    14.99,
    '{"calories": 580, "protein": 42, "carbs": 38, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Turkey and Havarti',
    'Sliced turkey with Havarti cheese on bread',
    'Handhelds',
    'all_day',
    10.99,
    '{"calories": 480, "protein": 32, "carbs": 38, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Flame Grilled Chicken Sandwich',
    'Grilled chicken breast with lettuce, tomato, and special sauce',
    'Handhelds',
    'all_day',
    10.99,
    '{"calories": 520, "protein": 38, "carbs": 42, "fat": 18}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Buffalo chicken tender sandwich',
    'Buffalo chicken tenders on a bun with ranch dressing',
    'Handhelds',
    'all_day',
    10.99,
    '{"calories": 580, "protein": 32, "carbs": 48, "fat": 26}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Grilled Mahi Mahi Fish Wrap',
    'Grilled mahi mahi in a wrap with vegetables and sauce',
    'Handhelds',
    'all_day',
    14.49,
    '{"calories": 480, "protein": 38, "carbs": 42, "fat": 18}',
    '["fish", "gluten"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    '$5 Meal Deal Grilled Cheese',
    'Grilled cheese sandwich with sides and drink',
    'Handhelds',
    'all_day',
    5.00,
    '{"calories": 480, "protein": 18, "carbs": 48, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'DKH Quesadilla',
    'House quesadilla with cheese and choice of fillings',
    'Handhelds',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 24, "carbs": 48, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'BBQ Chicken Sandwich',
    'BBQ chicken on a bun with coleslaw',
    'Handhelds',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 32, "carbs": 48, "fat": 20}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Ginger Salmon Wrap',
    'Ginger-glazed salmon in a wrap with vegetables',
    'Handhelds',
    'all_day',
    12.99,
    '{"calories": 500, "protein": 36, "carbs": 42, "fat": 20}',
    '["fish", "gluten", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Steak Wrap',
    'Sliced steak in a wrap with vegetables and sauce',
    'Handhelds',
    'all_day',
    12.49,
    '{"calories": 540, "protein": 38, "carbs": 42, "fat": 24}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    '$5 Meal Deal Chicken Wrap',
    'Chicken wrap with sides and drink',
    'Handhelds',
    'all_day',
    5.00,
    '{"calories": 480, "protein": 28, "carbs": 48, "fat": 18}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- SMALL PLATES
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
    'Onion Rings',
    'Crispy battered onion rings',
    'Appetizers',
    'all_day',
    6.99,
    '{"calories": 420, "protein": 6, "carbs": 48, "fat": 22}',
    '["gluten", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Pretzels w beer cheese and mustard',
    'Soft pretzels served with beer cheese and mustard',
    'Appetizers',
    'all_day',
    5.99,
    '{"calories": 480, "protein": 14, "carbs": 58, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Fried Cheese Curds',
    'Battered and fried cheese curds',
    'Appetizers',
    'all_day',
    7.99,
    '{"calories": 520, "protein": 20, "carbs": 38, "fat": 32}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Fish & Fries',
    'Fried fish fillets with French fries',
    'Appetizers',
    'all_day',
    12.99,
    '{"calories": 680, "protein": 32, "carbs": 68, "fat": 28}',
    '["fish", "gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Kruggets and Fries',
    'Chicken nuggets with French fries',
    'Appetizers',
    'all_day',
    7.49,
    '{"calories": 520, "protein": 24, "carbs": 48, "fat": 24}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Nachos',
    'Tortilla chips topped with cheese, jalapeños, and toppings',
    'Appetizers',
    'all_day',
    7.99,
    '{"calories": 580, "protein": 18, "carbs": 58, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Mac and Cheese Bites',
    'Breaded mac and cheese bites, fried until golden',
    'Appetizers',
    'all_day',
    7.49,
    '{"calories": 480, "protein": 16, "carbs": 42, "fat": 26}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Chicken Wings',
    'Crispy chicken wings with choice of sauce',
    'Appetizers',
    'all_day',
    9.49,
    '{"calories": 480, "protein": 32, "carbs": 8, "fat": 32}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Crispy Vegan Tenders',
    'Plant-based crispy tenders',
    'Appetizers',
    'all_day',
    11.99,
    '{"calories": 420, "protein": 18, "carbs": 48, "fat": 18}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Chicken Tenders',
    'Breaded and fried chicken tenders',
    'Appetizers',
    'all_day',
    9.99,
    '{"calories": 480, "protein": 28, "carbs": 38, "fat": 24}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Fried Pickle Fries',
    'Battered and fried pickle spears',
    'Appetizers',
    'all_day',
    6.49,
    '{"calories": 320, "protein": 4, "carbs": 38, "fat": 16}',
    '["gluten", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Sweet Potato Fries',
    'Crispy sweet potato fries',
    'Appetizers',
    'all_day',
    7.99,
    '{"calories": 380, "protein": 4, "carbs": 58, "fat": 16}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- SALADS
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
    'Fried chicken salad',
    'Mixed greens topped with fried chicken, vegetables, and dressing',
    'Salads',
    'all_day',
    12.49,
    '{"calories": 580, "protein": 32, "carbs": 38, "fat": 32}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Ginger grilled salmon salad',
    'Mixed greens with ginger-glazed grilled salmon and vegetables',
    'Salads',
    'all_day',
    14.99,
    '{"calories": 520, "protein": 38, "carbs": 28, "fat": 28}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Caribbean Fish Salad',
    'Mixed greens with Caribbean-spiced fish and tropical vegetables',
    'Salads',
    'all_day',
    14.49,
    '{"calories": 500, "protein": 36, "carbs": 32, "fat": 24}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Buffalo bacon ranch bowl',
    'Mixed greens with buffalo chicken, bacon, and ranch dressing',
    'Salads',
    'all_day',
    11.99,
    '{"calories": 620, "protein": 32, "carbs": 28, "fat": 38}',
    '["milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Southwest Chicken Cobb Salad',
    'Mixed greens with grilled chicken, black beans, corn, and Southwest dressing',
    'Salads',
    'all_day',
    12.99,
    '{"calories": 580, "protein": 38, "carbs": 42, "fat": 28}',
    '["egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Mixed Arugula Salad',
    'Fresh arugula with vegetables and vinaigrette',
    'Salads',
    'all_day',
    7.99,
    '{"calories": 180, "protein": 4, "carbs": 12, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Grilled Chicken & Goat Cheese Salad',
    'Mixed greens with grilled chicken, goat cheese, and vinaigrette',
    'Salads',
    'all_day',
    12.49,
    '{"calories": 480, "protein": 36, "carbs": 18, "fat": 28}',
    '["milk"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- SIDES
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
    'Side fresh fruit',
    'Fresh seasonal fruit',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 100, "protein": 1, "carbs": 24, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Fresh Cut Fries',
    'Hand-cut French fries',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 14}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Queso',
    'Melted cheese dip',
    'Sides',
    'all_day',
    1.99,
    '{"calories": 180, "protein": 10, "carbs": 8, "fat": 12}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Housemade Chips',
    'House-made potato chips',
    'Sides',
    'all_day',
    5.99,
    '{"calories": 380, "protein": 4, "carbs": 38, "fat": 22}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Side salad',
    'Mixed greens with vegetables and dressing',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 120, "protein": 2, "carbs": 8, "fat": 10}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- DESSERTS
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
    'Sundaes',
    'Ice cream sundae with toppings',
    'Desserts',
    'all_day',
    4.99,
    '{"calories": 420, "protein": 8, "carbs": 58, "fat": 18}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Milkshake',
    'Creamy milkshake in your choice of flavor',
    'Desserts',
    'all_day',
    5.99,
    '{"calories": 480, "protein": 12, "carbs": 68, "fat": 20}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Ice Cream Sandwich',
    'Ice cream between two cookies',
    'Desserts',
    'all_day',
    6.99,
    '{"calories": 420, "protein": 8, "carbs": 58, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Gluten free brownie',
    'Rich chocolate brownie, gluten-free',
    'Desserts',
    'all_day',
    3.50,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["egg", "milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Salted Caramel Cookie',
    'Fresh baked cookie with salted caramel',
    'Desserts',
    'all_day',
    2.59,
    '{"calories": 280, "protein": 4, "carbs": 38, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- NON ALCOHOLIC BEVERAGES
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
    'Liquid Death sparkling water',
    'Sparkling water in a can',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Boylans Organic Sodas',
    'Organic craft soda',
    'Beverages',
    'all_day',
    2.89,
    '{"calories": 140, "protein": 0, "carbs": 36, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Jarritos',
    'Mexican fruit-flavored soda',
    'Beverages',
    'all_day',
    2.19,
    '{"calories": 150, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Liquid Death Mango Chainsaw',
    'Mango-flavored sparkling water',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Natalies Juices',
    'Fresh pressed juice',
    'Beverages',
    'all_day',
    4.39,
    '{"calories": 120, "protein": 2, "carbs": 28, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'San Pelligrino Sparkling Water',
    'Italian sparkling mineral water',
    'Beverages',
    'all_day',
    2.00,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Mexican Sprite',
    'Mexican-style Sprite soda',
    'Beverages',
    'all_day',
    2.89,
    '{"calories": 140, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Mexican Coke',
    'Mexican-style Coca-Cola',
    'Beverages',
    'all_day',
    2.89,
    '{"calories": 150, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
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
    'Liquid Death still water',
    'Still water in a can',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- GAME DAY SPECIALS
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
    'Wings and Fries',
    'Chicken wings with French fries',
    'Specials',
    'all_day',
    6.99,
    '{"calories": 580, "protein": 32, "carbs": 48, "fat": 28}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'The Devil''s Krafthouse'
LIMIT 1;

-- McDonald's Menu Items
-- Burgers
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
    'Hamburger',
    'Classic hamburger with a beef patty, pickles, onions, ketchup, and mustard on a sesame seed bun',
    'Burgers',
    'all_day',
    1.99,
    '{"calories": 250, "protein": 12, "carbs": 31, "fat": 9}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Double Hamburger',
    'Two beef patties with pickles, onions, ketchup, and mustard on a sesame seed bun',
    'Burgers',
    'all_day',
    3.19,
    '{"calories": 450, "protein": 24, "carbs": 31, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'McDouble',
    'Two beef patties with pickles, onions, ketchup, mustard, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    3.39,
    '{"calories": 390, "protein": 22, "carbs": 33, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Daily Double',
    'Two beef patties with lettuce, tomato, mayonnaise, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    3.79,
    '{"calories": 440, "protein": 24, "carbs": 35, "fat": 22}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Bacon McDouble',
    'Two beef patties with bacon, pickles, onions, ketchup, mustard, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    4.19,
    '{"calories": 480, "protein": 26, "carbs": 33, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Cheeseburger',
    'Classic cheeseburger with a beef patty, pickles, onions, ketchup, mustard, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    2.39,
    '{"calories": 300, "protein": 15, "carbs": 33, "fat": 13}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Double Cheeseburger',
    'Two beef patties with pickles, onions, ketchup, mustard, and two slices of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    3.69,
    '{"calories": 440, "protein": 25, "carbs": 33, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Triple Cheeseburger',
    'Three beef patties with pickles, onions, ketchup, mustard, and three slices of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    4.79,
    '{"calories": 580, "protein": 35, "carbs": 33, "fat": 31}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Quarter Hamburger',
    'Quarter pound beef patty with pickles, onions, ketchup, and mustard on a sesame seed bun',
    'Burgers',
    'all_day',
    5.49,
    '{"calories": 420, "protein": 25, "carbs": 42, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Quarter Pounder With Cheese',
    'Quarter pound beef patty with pickles, onions, ketchup, mustard, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    6.29,
    '{"calories": 520, "protein": 26, "carbs": 42, "fat": 26}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Bacon Quarter Pounder with Cheese',
    'Quarter pound beef patty with bacon, pickles, onions, ketchup, mustard, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    7.39,
    '{"calories": 580, "protein": 29, "carbs": 42, "fat": 30}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Double Quarter Pounder With Cheese',
    'Two quarter pound beef patties with pickles, onions, ketchup, mustard, and two slices of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    7.19,
    '{"calories": 740, "protein": 48, "carbs": 42, "fat": 42}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Double Bacon Quarter Pounder with Cheese',
    'Two quarter pound beef patties with bacon, pickles, onions, ketchup, mustard, and two slices of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    8.29,
    '{"calories": 800, "protein": 51, "carbs": 42, "fat": 48}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Quarter Pounder With Cheese Deluxe',
    'Quarter pound beef patty with lettuce, tomato, mayonnaise, pickles, onions, and a slice of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    6.39,
    '{"calories": 550, "protein": 27, "carbs": 45, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Double QPC Deluxe',
    'Two quarter pound beef patties with lettuce, tomato, mayonnaise, pickles, onions, and two slices of cheese on a sesame seed bun',
    'Burgers',
    'all_day',
    8.19,
    '{"calories": 770, "protein": 49, "carbs": 45, "fat": 44}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Big Mac',
    'Two beef patties with special sauce, lettuce, cheese, pickles, and onions on a sesame seed bun',
    'Burgers',
    'all_day',
    5.99,
    '{"calories": 550, "protein": 25, "carbs": 45, "fat": 33}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Chicken Items
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
    'Spicy McCrispy',
    'Spicy crispy chicken breast fillet on a buttered potato roll',
    'Chicken',
    'all_day',
    4.39,
    '{"calories": 470, "protein": 24, "carbs": 46, "fat": 20}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Deluxe Spicy McCrispy',
    'Spicy crispy chicken breast fillet with lettuce, tomato, and mayonnaise on a buttered potato roll',
    'Chicken',
    'all_day',
    5.39,
    '{"calories": 530, "protein": 25, "carbs": 48, "fat": 24}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '4 pc. McNuggets',
    'Four pieces of crispy chicken nuggets',
    'Chicken',
    'all_day',
    2.89,
    '{"calories": 180, "protein": 9, "carbs": 11, "fat": 11}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '6 pc. McNuggets',
    'Six pieces of crispy chicken nuggets',
    'Chicken',
    'all_day',
    4.29,
    '{"calories": 270, "protein": 14, "carbs": 17, "fat": 17}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '10 pc. McNuggets',
    'Ten pieces of crispy chicken nuggets',
    'Chicken',
    'all_day',
    6.19,
    '{"calories": 450, "protein": 23, "carbs": 28, "fat": 28}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '20 pc. McNuggets',
    'Twenty pieces of crispy chicken nuggets',
    'Chicken',
    'all_day',
    9.99,
    '{"calories": 900, "protein": 46, "carbs": 56, "fat": 56}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'McChicken',
    'Crispy chicken patty with shredded lettuce and mayonnaise on a regular bun',
    'Chicken',
    'all_day',
    2.89,
    '{"calories": 400, "protein": 14, "carbs": 39, "fat": 22}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Spicy McChicken',
    'Spicy crispy chicken patty with shredded lettuce and mayonnaise on a regular bun',
    'Chicken',
    'all_day',
    2.89,
    '{"calories": 410, "protein": 14, "carbs": 39, "fat": 23}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Hot N Spicy McChicken',
    'Spicy crispy chicken patty with shredded lettuce and spicy mayonnaise on a regular bun',
    'Chicken',
    'all_day',
    3.29,
    '{"calories": 420, "protein": 15, "carbs": 39, "fat": 24}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '3 Piece McCrispy Strips',
    'Three pieces of crispy chicken strips',
    'Chicken',
    'all_day',
    4.99,
    '{"calories": 320, "protein": 18, "carbs": 22, "fat": 17}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '4 Piece McCrispy Strips',
    'Four pieces of crispy chicken strips',
    'Chicken',
    'all_day',
    5.99,
    '{"calories": 430, "protein": 24, "carbs": 29, "fat": 23}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'McCrispy',
    'Crispy chicken breast fillet on a buttered potato roll',
    'Chicken',
    'all_day',
    4.29,
    '{"calories": 470, "protein": 24, "carbs": 46, "fat": 20}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Deluxe McCrispy',
    'Crispy chicken breast fillet with lettuce, tomato, and mayonnaise on a buttered potato roll',
    'Chicken',
    'all_day',
    5.39,
    '{"calories": 530, "protein": 25, "carbs": 48, "fat": 24}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Buffalo Ranch McCrispy',
    'Crispy chicken breast fillet with buffalo ranch sauce on a buttered potato roll',
    'Chicken',
    'all_day',
    6.49,
    '{"calories": 550, "protein": 25, "carbs": 48, "fat": 26}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Deluxe Buffalo Ranch McCrispy',
    'Crispy chicken breast fillet with lettuce, tomato, buffalo ranch sauce on a buttered potato roll',
    'Chicken',
    'all_day',
    6.99,
    '{"calories": 580, "protein": 26, "carbs": 50, "fat": 28}',
    '["gluten", "milk", "soy", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Fish Items
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
    'Filet O Fish',
    'Wild-caught Alaskan Pollock filet with tartar sauce and cheese on a steamed bun',
    'Fish',
    'all_day',
    5.39,
    '{"calories": 390, "protein": 15, "carbs": 38, "fat": 19}',
    '["gluten", "milk", "fish", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Double Filet-O-Fish',
    'Two wild-caught Alaskan Pollock filets with tartar sauce and cheese on a steamed bun',
    'Fish',
    'all_day',
    6.29,
    '{"calories": 520, "protein": 24, "carbs": 38, "fat": 28}',
    '["gluten", "milk", "fish", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Fries
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
    'Small Fry',
    'Small order of crispy golden fries',
    'Sides',
    'all_day',
    2.99,
    '{"calories": 220, "protein": 3, "carbs": 29, "fat": 10}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Medium Fry',
    'Medium order of crispy golden fries',
    'Sides',
    'all_day',
    3.49,
    '{"calories": 320, "protein": 4, "carbs": 43, "fat": 15}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Large Fry',
    'Large order of crispy golden fries',
    'Sides',
    'all_day',
    4.19,
    '{"calories": 490, "protein": 6, "carbs": 66, "fat": 23}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Grinch McShaker Fry Medium',
    'Medium fries with special Grinch seasoning',
    'Sides',
    'all_day',
    4.19,
    '{"calories": 320, "protein": 4, "carbs": 43, "fat": 15}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Grinch McShaker Fry large',
    'Large fries with special Grinch seasoning',
    'Sides',
    'all_day',
    4.69,
    '{"calories": 490, "protein": 6, "carbs": 66, "fat": 23}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Snack Wraps
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
    'Ranch Snack Wrap',
    'Crispy chicken with ranch sauce, lettuce, and shredded cheese wrapped in a flour tortilla',
    'Handhelds',
    'all_day',
    2.99,
    '{"calories": 330, "protein": 14, "carbs": 30, "fat": 17}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Spicy Snack Wrap',
    'Spicy crispy chicken with spicy sauce, lettuce, and shredded cheese wrapped in a flour tortilla',
    'Handhelds',
    'all_day',
    2.99,
    '{"calories": 340, "protein": 14, "carbs": 30, "fat": 18}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Buffalo Ranch Snack Wrap',
    'Crispy chicken with buffalo ranch sauce, lettuce, and shredded cheese wrapped in a flour tortilla',
    'Handhelds',
    'all_day',
    2.99,
    '{"calories": 350, "protein": 15, "carbs": 30, "fat": 19}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Signature Crafted Items
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
    'McRib',
    'Boneless pork patty shaped like ribs with tangy barbecue sauce, pickles, and onions on a hoagie-style bun',
    'Specials',
    'all_day',
    6.19,
    '{"calories": 480, "protein": 22, "carbs": 44, "fat": 22}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Sweets & Treats
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
    '1 Cookie',
    'One warm chocolate chip cookie',
    'Desserts',
    'all_day',
    0.89,
    '{"calories": 160, "protein": 2, "carbs": 22, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '2 Cookies',
    'Two warm chocolate chip cookies',
    'Desserts',
    'all_day',
    1.59,
    '{"calories": 320, "protein": 4, "carbs": 44, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '3 Cookies',
    'Three warm chocolate chip cookies',
    'Desserts',
    'all_day',
    2.29,
    '{"calories": 480, "protein": 6, "carbs": 66, "fat": 24}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '13 Cookies',
    'Thirteen warm chocolate chip cookies',
    'Desserts',
    'all_day',
    5.19,
    '{"calories": 2080, "protein": 26, "carbs": 286, "fat": 104}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Apple Pie',
    'Baked apple pie with a flaky crust',
    'Desserts',
    'all_day',
    1.99,
    '{"calories": 240, "protein": 2, "carbs": 33, "fat": 11}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '2 Apple Pies',
    'Two baked apple pies with flaky crusts',
    'Desserts',
    'all_day',
    3.09,
    '{"calories": 480, "protein": 4, "carbs": 66, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Strawberry & Creme Pie',
    'Baked strawberry and creme pie with a flaky crust',
    'Desserts',
    'all_day',
    2.09,
    '{"calories": 280, "protein": 3, "carbs": 35, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    '2 Strawberry and Creme pies',
    'Two baked strawberry and creme pies with flaky crusts',
    'Desserts',
    'all_day',
    3.19,
    '{"calories": 560, "protein": 6, "carbs": 70, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Chocolate Shake',
    'Rich and creamy chocolate milkshake',
    'Desserts',
    'all_day',
    NULL,
    '{"calories": 520, "protein": 11, "carbs": 67, "fat": 23}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Strawberry Shake',
    'Rich and creamy strawberry milkshake',
    'Desserts',
    'all_day',
    NULL,
    '{"calories": 510, "protein": 11, "carbs": 66, "fat": 22}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Vanilla Shake',
    'Rich and creamy vanilla milkshake',
    'Desserts',
    'all_day',
    NULL,
    '{"calories": 500, "protein": 11, "carbs": 65, "fat": 22}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'McDonaldland Shake',
    'Special themed vanilla milkshake',
    'Desserts',
    'all_day',
    NULL,
    '{"calories": 500, "protein": 11, "carbs": 65, "fat": 22}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Caramel Sundae',
    'Vanilla soft serve with warm caramel sauce',
    'Desserts',
    'all_day',
    2.99,
    '{"calories": 330, "protein": 6, "carbs": 47, "fat": 13}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Hot Fudge Sundae',
    'Vanilla soft serve with warm hot fudge sauce',
    'Desserts',
    'all_day',
    2.99,
    '{"calories": 340, "protein": 6, "carbs": 48, "fat": 14}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Plain Sundae',
    'Vanilla soft serve',
    'Desserts',
    'all_day',
    2.29,
    '{"calories": 250, "protein": 5, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'M&M McFlurry',
    'Vanilla soft serve mixed with M&M candies',
    'Desserts',
    'all_day',
    2.69,
    '{"calories": 510, "protein": 8, "carbs": 67, "fat": 22}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Oreo Mcflurry',
    'Vanilla soft serve mixed with Oreo cookie pieces',
    'Desserts',
    'all_day',
    2.69,
    '{"calories": 510, "protein": 8, "carbs": 68, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Hershey SMores McFlurry',
    'Vanilla soft serve mixed with Hershey chocolate, marshmallow, and graham cracker pieces',
    'Desserts',
    'all_day',
    4.19,
    '{"calories": 550, "protein": 9, "carbs": 72, "fat": 24}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Cone',
    'Vanilla soft serve in a crispy cone',
    'Desserts',
    'all_day',
    2.09,
    '{"calories": 200, "protein": 4, "carbs": 33, "fat": 5}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- McCafe Coffees
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
    'Premium Roast Coffee',
    'Freshly brewed premium roast coffee',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced coffee',
    'Iced coffee served over ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Caramel Coffee',
    'Iced coffee with caramel flavoring',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 80, "protein": 0, "carbs": 20, "fat": 0}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced French Vanilla Coffee',
    'Iced coffee with French vanilla flavoring',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 80, "protein": 0, "carbs": 20, "fat": 0}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Sugar Free French Vanilla Coffee',
    'Iced coffee with sugar-free French vanilla flavoring',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Americano',
    'Espresso shots with hot water',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Latte',
    'Espresso with steamed milk',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 190, "protein": 10, "carbs": 18, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Latte',
    'Espresso with cold milk over ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 140, "protein": 8, "carbs": 13, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Caramel Latte',
    'Espresso with steamed milk and caramel syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 250, "protein": 10, "carbs": 35, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Caramel Latte',
    'Espresso with cold milk, caramel syrup, and ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 8, "carbs": 30, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'French Vanilla Latte',
    'Espresso with steamed milk and French vanilla syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 250, "protein": 10, "carbs": 35, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced French Vanilla Latte',
    'Espresso with cold milk, French vanilla syrup, and ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 8, "carbs": 30, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Sugar Free French Vanilla Latte',
    'Espresso with steamed milk and sugar-free French vanilla syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 190, "protein": 10, "carbs": 18, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Sugar Free French Vanilla Latte',
    'Espresso with cold milk, sugar-free French vanilla syrup, and ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 140, "protein": 8, "carbs": 13, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Cappuccino',
    'Espresso with steamed milk and foam',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 120, "protein": 6, "carbs": 10, "fat": 4}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Caramel Cappuccino',
    'Espresso with steamed milk, foam, and caramel syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 180, "protein": 6, "carbs": 27, "fat": 4}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'French Vanilla Cappuccino',
    'Espresso with steamed milk, foam, and French vanilla syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 180, "protein": 6, "carbs": 27, "fat": 4}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Sugar Free French Vanilla Cappuccino',
    'Espresso with steamed milk, foam, and sugar-free French vanilla syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 120, "protein": 6, "carbs": 10, "fat": 4}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Mocha',
    'Espresso with steamed milk and chocolate syrup',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 290, "protein": 10, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Mocha',
    'Espresso with cold milk, chocolate syrup, and ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 240, "protein": 8, "carbs": 30, "fat": 8}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Caramel Macchiato',
    'Espresso with steamed milk, vanilla syrup, and caramel drizzle',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 250, "protein": 10, "carbs": 35, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Caramel Macchiato',
    'Espresso with cold milk, vanilla syrup, caramel drizzle, and ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 8, "carbs": 30, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Peppermint Mocha Latte',
    'Espresso with steamed milk, peppermint syrup, and chocolate',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 300, "protein": 10, "carbs": 38, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Peppermint Mocha Latte',
    'Espresso with cold milk, peppermint syrup, chocolate, and ice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 250, "protein": 8, "carbs": 33, "fat": 8}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Iced Peppermint Mocha Coffee',
    'Iced coffee with peppermint syrup and chocolate',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 150, "protein": 0, "carbs": 35, "fat": 0}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Caramel Frappe',
    'Blended coffee drink with caramel syrup, milk, and ice, topped with whipped cream and caramel drizzle',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 380, "protein": 5, "carbs": 54, "fat": 15}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Mocha Frappe',
    'Blended coffee drink with chocolate syrup, milk, and ice, topped with whipped cream',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 400, "protein": 5, "carbs": 56, "fat": 16}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Premium Hot Chocolate',
    'Rich and creamy hot chocolate',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 250, "protein": 8, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Hot Tea',
    'Hot tea served with hot water',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Smoothies
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
    'Strawberry Banana Smoothie',
    'Blended smoothie with strawberries, bananas, and low-fat yogurt',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 210, "protein": 3, "carbs": 48, "fat": 1}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Mango Pineapple Smoothie',
    'Blended smoothie with mango, pineapple, and low-fat yogurt',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 210, "protein": 3, "carbs": 48, "fat": 1}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Frozen Drinks
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
    'Wild Cherry Frozen',
    'Frozen cherry-flavored slushy drink',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 0, "carbs": 52, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Blue Raspberry Frozen',
    'Frozen blue raspberry-flavored slushy drink',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 0, "carbs": 52, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Coca-Cola Frozen',
    'Frozen Coca-Cola slushy drink',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 0, "carbs": 52, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Other Drinks
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
    'Fountain Drink',
    'Soft drink from the fountain',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 150, "protein": 0, "carbs": 39, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Sweet Iced Tea',
    'Sweetened iced tea',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 90, "protein": 0, "carbs": 24, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Unsweet Iced Tea',
    'Unsweetened iced tea',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Lemonade',
    'Fresh lemonade',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 150, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Apple Juice',
    '100% apple juice',
    'Beverages',
    'all_day',
    1.59,
    '{"calories": 100, "protein": 0, "carbs": 25, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Orange Juice',
    '100% orange juice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 110, "protein": 2, "carbs": 26, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
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
    'Dasani',
    'Bottled water',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'McDonald''s'
LIMIT 1;

-- Pitchfork's Menu Items
-- Sides
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
    'Side Turkey Bacon (2 pcs)',
    'Two pieces of lean, flavorful turkey bacon',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 80, "protein": 10, "carbs": 0, "fat": 5}',
    '["soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Turkey Sausage (2 pcs)',
    'Two savory turkey sausage links or patties',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 120, "protein": 12, "carbs": 2, "fat": 8}',
    '["soy", "gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Veggie Patty',
    'A plant-based patty, suitable as a side dish',
    'Sides',
    'all_day',
    4.29,
    '{"calories": 150, "protein": 10, "carbs": 15, "fat": 7}',
    '["gluten", "soy"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Yogurt Parfait',
    'Creamy yogurt layered with granola and fresh fruit',
    'Sides',
    'all_day',
    5.99,
    '{"calories": 280, "protein": 12, "carbs": 40, "fat": 10}',
    '["milk", "gluten", "tree_nuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Mixed Veggies',
    'A medley of fresh, seasonal vegetables, steamed or roasted',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 50, "protein": 2, "carbs": 10, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Egg',
    'A single egg, prepared to preference',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 70, "protein": 6, "carbs": 0, "fat": 5}',
    '["egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Fried Chicken',
    'A crispy piece of classic fried chicken',
    'Sides',
    'all_day',
    3.59,
    '{"calories": 300, "protein": 25, "carbs": 15, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Sausage (2 pcs)',
    'Two pieces of savory sausage, ideal as a breakfast or all-day side',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 200, "protein": 12, "carbs": 2, "fat": 15}',
    '["pork", "gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Shrimp',
    'A portion of succulent shrimp, perfect to accompany any meal',
    'Sides',
    'all_day',
    3.79,
    '{"calories": 85, "protein": 18, "carbs": 0, "fat": 1}',
    '["shellfish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Sour Cream',
    'A small serving of creamy sour cream, great for topping',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 60, "protein": 1, "carbs": 1, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Spinach',
    'Fresh or lightly cooked spinach, a healthy green side',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 10, "protein": 1, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Steak',
    'A tender cut of steak, served as a flavorful side',
    'Sides',
    'all_day',
    5.39,
    '{"calories": 300, "protein": 25, "carbs": 0, "fat": 20}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Tofu',
    'A healthy portion of tofu, seasoned lightly for a versatile side',
    'Sides',
    'all_day',
    2.59,
    '{"calories": 100, "protein": 10, "carbs": 3, "fat": 6}',
    '["soy"]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Tomato',
    'Freshly sliced tomato, a simple and refreshing side',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Meatball',
    'A savory meatball, perfect as an additional side',
    'Sides',
    'all_day',
    2.59,
    '{"calories": 150, "protein": 12, "carbs": 5, "fat": 10}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Mushroom',
    'Fresh mushrooms, sautéed or grilled',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 15, "protein": 2, "carbs": 3, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Pickles',
    'Crisp pickled cucumbers',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Pico',
    'Freshly diced tomatoes, onions, cilantro, and jalapeños',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 20, "protein": 1, "carbs": 5, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Raw Onion',
    'Fresh sliced raw onion',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 10, "protein": 0, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Salsa',
    'Fresh tomato salsa with onions and cilantro',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 15, "protein": 0, "carbs": 4, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Lettuce',
    'Fresh crisp lettuce',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Mixed Fruit',
    'A refreshing assortment of fresh seasonal fruits',
    'Sides',
    'all_day',
    2.99,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Apple Half',
    'One half of a crisp, fresh apple',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 50, "protein": 0, "carbs": 14, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Double Cheese',
    'Two slices of American or cheddar cheese, perfect for adding to any dish',
    'Sides',
    'all_day',
    1.19,
    '{"calories": 180, "protein": 10, "carbs": 2, "fat": 15}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Avocado Half',
    'One half of a ripe avocado, creamy and rich',
    'Sides',
    'all_day',
    1.09,
    '{"calories": 160, "protein": 2, "carbs": 9, "fat": 15}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Bacon (3 pcs)',
    'Three crispy strips of smoked bacon',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 150, "protein": 10, "carbs": 0, "fat": 12}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Beef Patty',
    'A grilled beef patty, perfect as an extra protein or to build your own meal',
    'Sides',
    'all_day',
    3.59,
    '{"calories": 250, "protein": 20, "carbs": 0, "fat": 18}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Broccoli',
    'Steamed or roasted fresh broccoli florets',
    'Sides',
    'all_day',
    1.99,
    '{"calories": 50, "protein": 4, "carbs": 10, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Chicken 4 oz',
    'A 4 oz serving of seasoned grilled or roasted chicken, perfect as a protein side',
    'Sides',
    'all_day',
    2.29,
    '{"calories": 150, "protein": 25, "carbs": 0, "fat": 5}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Chicken 8 oz',
    'An 8 oz serving of seasoned grilled or roasted chicken, a larger portion for a hearty side',
    'Sides',
    'all_day',
    4.49,
    '{"calories": 300, "protein": 50, "carbs": 0, "fat": 10}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Chorizo',
    'A savory and spicy side portion of chorizo sausage',
    'Sides',
    'all_day',
    2.59,
    '{"calories": 200, "protein": 10, "carbs": 2, "fat": 15}',
    '["pork"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Taco',
    'A single, classic taco, served as a versatile side dish',
    'Sides',
    'all_day',
    4.49,
    '{"calories": 250, "protein": 12, "carbs": 20, "fat": 10}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Grilled Onion',
    'Sweet and tender grilled onions, a flavorful accompaniment to any meal',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 30, "protein": 1, "carbs": 7, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Ham',
    'A portion of savory cooked ham, ideal as a side',
    'Sides',
    'all_day',
    3.19,
    '{"calories": 100, "protein": 15, "carbs": 1, "fat": 4}',
    '["pork"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Jalapeno',
    'A small serving of fresh or pickled jalapeno slices for a spicy kick',
    'Sides',
    'all_day',
    0.99,
    '{"calories": 10, "protein": 0, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Pulled Pork',
    'A savory portion of slow-cooked pulled pork, ideal as a side',
    'Sides',
    'all_day',
    3.99,
    '{"calories": 300, "protein": 25, "carbs": 5, "fat": 20}',
    '["soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'GF Pancake',
    'A single gluten-free pancake',
    'Sides',
    'all_day',
    1.99,
    '{"calories": 150, "protein": 3, "carbs": 25, "fat": 5}',
    '["egg", "milk"]',
    ARRAY['gluten_free', 'vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Pancake Single',
    'A single classic pancake',
    'Sides',
    'all_day',
    1.59,
    '{"calories": 180, "protein": 4, "carbs": 30, "fat": 6}',
    '["wheat", "egg", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Whole Fruit',
    'A fresh, seasonal whole fruit serving',
    'Sides',
    'all_day',
    1.29,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side Salad',
    'A fresh green side salad',
    'Sides',
    'all_day',
    2.99,
    '{"calories": 100, "protein": 2, "carbs": 15, "fat": 5}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Add Cheese',
    'An additional serving of cheese to customize your meal',
    'Sides',
    'all_day',
    0.59,
    '{"calories": 100, "protein": 7, "carbs": 1, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Lime Half',
    'Half a fresh lime wedge, perfect for adding zest',
    'Sides',
    'all_day',
    1.29,
    '{"calories": 10, "protein": 0, "carbs": 3, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side 4oz Salmon',
    'A 4 oz portion of grilled or baked salmon',
    'Sides',
    'all_day',
    4.99,
    '{"calories": 200, "protein": 28, "carbs": 0, "fat": 9}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Side of Toast',
    'A slice of toasted bread',
    'Sides',
    'all_day',
    1.99,
    '{"calories": 80, "protein": 3, "carbs": 15, "fat": 1}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Smoked Salmon',
    'Delicately smoked salmon, rich and flavorful',
    'Sides',
    'all_day',
    5.99,
    '{"calories": 250, "protein": 35, "carbs": 0, "fat": 11}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Fries',
    'Crispy golden french fries',
    'Sides',
    'all_day',
    2.99,
    '{"calories": 350, "protein": 4, "carbs": 40, "fat": 20}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Tots',
    'Crispy tater tots',
    'Sides',
    'all_day',
    2.99,
    '{"calories": 320, "protein": 3, "carbs": 35, "fat": 18}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Corned Beef',
    'Tender, flavorful corned beef',
    'Sides',
    'all_day',
    3.79,
    '{"calories": 280, "protein": 22, "carbs": 2, "fat": 20}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Fruit',
    'Fresh seasonal fruit',
    'Sides',
    'all_day',
    2.99,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
LIMIT 1;

-- Cold Beverages
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
    'Boylan Ginger Ale 12 oz',
    'A crisp and refreshing ginger ale in a 12 oz bottle',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 140, "protein": 0, "carbs": 36, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Boylan Orange Soda 12 oz',
    'A sweet and tangy orange-flavored soda in a 12 oz bottle',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 160, "protein": 0, "carbs": 42, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Boylan Plain Seltzer 12 oz',
    'Unsweetened, carbonated plain seltzer water in a 12 oz bottle',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Boylan Root Beer 12 oz',
    'Classic root beer with a rich, sweet flavor in a 12 oz bottle',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 160, "protein": 0, "carbs": 40, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'PIT-Boylan Soda Black Cherry 12 oz',
    'Sweet and fruity black cherry-flavored soda in a 12 oz bottle',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 160, "protein": 0, "carbs": 42, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Diet Coke 12 oz Can',
    'Zero-calorie diet cola in a 12 oz can',
    'Beverages',
    'all_day',
    1.19,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Ocean Blue Calypso Lemonade 16 oz',
    'Sweet and tangy lemonade with a refreshing ocean blue flavor in a 16 oz bottle',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 180, "protein": 0, "carbs": 47, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Sprite 12 oz can',
    'Refreshing lemon-lime flavored soda served in a 12 oz can',
    'Beverages',
    'all_day',
    1.19,
    '{"calories": 140, "protein": 0, "carbs": 38, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Gold Peak Sweet Tea 18.5 oz',
    'Sweetened iced tea from Gold Peak, available in an 18.5 oz bottle',
    'Beverages',
    'all_day',
    3.79,
    '{"calories": 180, "protein": 0, "carbs": 46, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Gold Peak Unsweetened Tea 18.5 oz',
    'Unsweetened iced tea from Gold Peak, available in an 18.5 oz bottle',
    'Beverages',
    'all_day',
    3.79,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Calypso Paradise Punch 16 oz',
    'Tropical fruit punch flavored drink from Calypso, served in a 16 oz bottle',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 200, "protein": 0, "carbs": 50, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Fairlife 2% plain milk',
    'Fairlife 2% reduced fat ultra-filtered plain milk',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 130, "protein": 13, "carbs": 13, "fat": 4.5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Fairlife 2% strawberry milk',
    'Fairlife 2% reduced fat ultra-filtered strawberry flavored milk',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 180, "protein": 13, "carbs": 26, "fat": 4.5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Orange Juice 12 oz',
    'Refreshing 12 ounce serving of classic orange juice',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 165, "protein": 2, "carbs": 40, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Calypso Lemonade',
    'A refreshing bottle of Calypso brand lemonade',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 200, "protein": 0, "carbs": 50, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Dasani Water 20 oz',
    '20 ounce bottle of Dasani purified water',
    'Beverages',
    'all_day',
    1.69,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Coca Cola 12 oz Can',
    'Classic Coca-Cola in a 12 ounce can',
    'Beverages',
    'all_day',
    1.19,
    '{"calories": 140, "protein": 0, "carbs": 39, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Boylan Creme Soda 12 oz',
    'Boylan Bottling Co. Creme Soda in a 12 ounce bottle',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 160, "protein": 0, "carbs": 42, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
LIMIT 1;

-- Sandwiches
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
    'Black Angus Burger',
    'A classic burger made with Black Angus beef, served on a bun',
    'Sandwiches',
    'all_day',
    12.69,
    '{"calories": 650, "protein": 35, "carbs": 40, "fat": 40}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Mortys Rueben on Rye Bread',
    'A classic Reuben sandwich featuring corned beef, Swiss cheese, sauerkraut, and Russian dressing on rye bread',
    'Sandwiches',
    'all_day',
    14.39,
    '{"calories": 700, "protein": 40, "carbs": 50, "fat": 40}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Grilled Chicken Sandwich',
    'A lean and flavorful grilled chicken breast served on a bun with fresh toppings',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 450, "protein": 30, "carbs": 35, "fat": 20}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Pulled Pork BBQ Sandwich',
    'Slow-cooked pulled pork smothered in tangy BBQ sauce, served on a bun',
    'Sandwiches',
    'all_day',
    10.69,
    '{"calories": 600, "protein": 30, "carbs": 50, "fat": 30}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Veggie Single',
    'A vegetarian-friendly sandwich or burger, likely featuring a single veggie patty or loaded with fresh vegetables',
    'Sandwiches',
    'all_day',
    12.29,
    '{"calories": 400, "protein": 15, "carbs": 50, "fat": 15}',
    '["gluten", "soy"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Fried Chicken Sandwich',
    'Crispy fried chicken fillet served in a bun with fresh condiments',
    'Sandwiches',
    'all_day',
    11.99,
    '{"calories": 700, "protein": 35, "carbs": 50, "fat": 40}',
    '["gluten", "milk", "egg", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Bahn Mi',
    'A Vietnamese-inspired sandwich filled with savory meats, pickled vegetables, and fresh herbs on a baguette',
    'Sandwiches',
    'all_day',
    10.99,
    '{"calories": 550, "protein": 25, "carbs": 60, "fat": 25}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Grilled Cheese Sandwich',
    'A classic comfort food, featuring melted cheese between two slices of toasted bread',
    'Sandwiches',
    'all_day',
    7.99,
    '{"calories": 400, "protein": 15, "carbs": 30, "fat": 25}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
LIMIT 1;

-- Grub
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
    'Grilled Quesadilla',
    'Classic grilled quesadilla with melted cheese',
    'Entrees',
    'all_day',
    8.99,
    '{"calories": 450, "protein": 20, "carbs": 40, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Chicken Tenders',
    'Crispy fried chicken tenders',
    'Entrees',
    'all_day',
    9.99,
    '{"calories": 420, "protein": 24, "carbs": 28, "fat": 22}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Wings Your Way',
    'Customizable chicken wings with choice of sauce',
    'Entrees',
    'all_day',
    11.49,
    '{"calories": 480, "protein": 32, "carbs": 8, "fat": 32}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Falafel Sandwich on Pita',
    'Mediterranean-style falafel served in a warm pita bread',
    'Entrees',
    'all_day',
    11.49,
    '{"calories": 480, "protein": 16, "carbs": 52, "fat": 20}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Vegetable Samosas',
    'Crispy pastry filled with spiced vegetables',
    'Entrees',
    'all_day',
    11.69,
    '{"calories": 320, "protein": 8, "carbs": 38, "fat": 16}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Mac and Cheese Bites',
    'Deep-fried bites of creamy macaroni and cheese',
    'Entrees',
    'all_day',
    12.79,
    '{"calories": 380, "protein": 18, "carbs": 32, "fat": 20}',
    '["milk", "gluten", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
LIMIT 1;

-- Salads
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
    'E Tu Caesar Salad',
    'A classic Caesar salad, likely with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing',
    'Salads',
    'all_day',
    8.49,
    '{"calories": 350, "protein": 15, "carbs": 25, "fat": 20}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'California Club Salad',
    'A salad inspired by the California club sandwich, likely containing greens, turkey, bacon, avocado, tomato, and possibly cheese',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 450, "protein": 25, "carbs": 20, "fat": 30}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Kale Salad',
    'A healthy salad featuring kale as the primary green, often with a light vinaigrette, nuts, and possibly dried fruit or cheese',
    'Salads',
    'all_day',
    9.99,
    '{"calories": 300, "protein": 10, "carbs": 30, "fat": 15}',
    '["tree_nuts"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Arugula Salad',
    'A fresh salad primarily composed of arugula, typically served with a light dressing, often involving lemon or balsamic, and possibly cheese like Parmesan',
    'Salads',
    'all_day',
    10.19,
    '{"calories": 280, "protein": 8, "carbs": 20, "fat": 18}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
LIMIT 1;

-- Entrees
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
    'Veggie Lasagna',
    'A layered pasta dish baked with various vegetables, ricotta cheese, marinara sauce, and mozzarella cheese',
    'Entrees',
    'all_day',
    11.59,
    '{"calories": 600, "protein": 25, "carbs": 60, "fat": 30}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Spaghetti No Meatballs',
    'Spaghetti pasta served with a marinara or tomato-based sauce, explicitly without meatballs',
    'Entrees',
    'all_day',
    6.99,
    '{"calories": 450, "protein": 12, "carbs": 70, "fat": 10}',
    '["gluten"]',
    ARRAY['vegan', 'vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Spaghetti and Meatballs',
    'A classic pasta dish featuring spaghetti, marinara sauce, and savory beef or pork meatballs',
    'Entrees',
    'all_day',
    10.99,
    '{"calories": 700, "protein": 30, "carbs": 80, "fat": 30}',
    '["gluten", "egg", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Chicken Parmesan',
    'Breaded chicken cutlet topped with marinara sauce and melted mozzarella or parmesan cheese, often served with pasta',
    'Entrees',
    'all_day',
    11.99,
    '{"calories": 850, "protein": 45, "carbs": 60, "fat": 50}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Flank Steak Frites',
    'Grilled flank steak served with crispy French fries',
    'Entrees',
    'all_day',
    14.99,
    '{"calories": 750, "protein": 50, "carbs": 40, "fat": 40}',
    '[]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Salmon Hot Pot',
    'A comforting and savory hot pot dish featuring salmon, vegetables, and a flavorful broth',
    'Entrees',
    'all_day',
    15.99,
    '{"calories": 600, "protein": 40, "carbs": 30, "fat": 35}',
    '["fish", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
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
    'Veggie Hot Pot',
    'A hearty and flavorful hot pot dish packed with various fresh vegetables and a savory plant-based broth',
    'Entrees',
    'all_day',
    10.99,
    '{"calories": 450, "protein": 15, "carbs": 60, "fat": 15}',
    '["soy"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Pitchfork''s'
LIMIT 1;

-- Saladelia at Perkins Library Menu Items
-- Pastries & Desserts
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
    'Granola Parfait',
    'Layered parfait with granola, yogurt, and fresh fruit',
    'Desserts',
    'all_day',
    5.99,
    '{"calories": 320, "protein": 12, "carbs": 45, "fat": 10}',
    '["milk", "gluten", "tree_nuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Farm Fresh Eggs',
    'Fresh farm eggs prepared to order',
    'Breakfast',
    'breakfast',
    2.99,
    '{"calories": 140, "protein": 12, "carbs": 1, "fat": 10}',
    '["egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Cookie',
    'Freshly baked cookie',
    'Desserts',
    'all_day',
    NULL,
    '{"calories": 160, "protein": 2, "carbs": 22, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Danish',
    'Flaky pastry with sweet filling',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 280, "protein": 4, "carbs": 35, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Scones',
    'Traditional British scone, perfect with tea or coffee',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 250, "protein": 5, "carbs": 38, "fat": 10}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Egg and Cheese Croissant',
    'Flaky croissant filled with scrambled eggs and melted cheese',
    'Pastries',
    'breakfast',
    5.99,
    '{"calories": 420, "protein": 18, "carbs": 32, "fat": 24}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Muffin',
    'Freshly baked muffin in various flavors',
    'Pastries',
    'all_day',
    2.00,
    '{"calories": 200, "protein": 4, "carbs": 30, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Croissant',
    'Buttery, flaky French croissant',
    'Pastries',
    'all_day',
    3.79,
    '{"calories": 280, "protein": 5, "carbs": 28, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Brownie',
    'Rich, fudgy chocolate brownie',
    'Desserts',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Chocolate Croissant',
    'Buttery croissant filled with rich chocolate',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 350, "protein": 6, "carbs": 35, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'PER - Crumb Cake',
    'Classic crumb cake with sweet streusel topping',
    'Desserts',
    'all_day',
    3.99,
    '{"calories": 380, "protein": 5, "carbs": 48, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Sweet Bread',
    'Soft, sweet bread perfect for breakfast or snack',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 240, "protein": 6, "carbs": 40, "fat": 6}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
LIMIT 1;

-- Sandwiches & Wraps
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
    'Hummus Veggie Wrap',
    'Fresh vegetables and creamy hummus wrapped in a tortilla',
    'Sandwiches',
    'all_day',
    6.09,
    '{"calories": 380, "protein": 12, "carbs": 45, "fat": 16}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Chicken Shawarma',
    'Spiced chicken shawarma with vegetables and sauce',
    'Sandwiches',
    'all_day',
    9.09,
    '{"calories": 520, "protein": 32, "carbs": 42, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Chicken Pesto',
    'Grilled chicken with pesto sauce and fresh vegetables',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 480, "protein": 30, "carbs": 38, "fat": 24}',
    '["gluten", "milk", "tree_nuts"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Buffalo Chicken',
    'Spicy buffalo chicken wrap or sandwich',
    'Sandwiches',
    'all_day',
    8.09,
    '{"calories": 500, "protein": 28, "carbs": 40, "fat": 26}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Falafel',
    'Crispy falafel with vegetables and tahini sauce',
    'Sandwiches',
    'all_day',
    6.99,
    '{"calories": 420, "protein": 14, "carbs": 48, "fat": 18}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Southwest Turkey Wrap',
    'Sliced turkey with southwest vegetables and sauce in a wrap',
    'Sandwiches',
    'all_day',
    8.79,
    '{"calories": 450, "protein": 28, "carbs": 38, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Chicken Salad Brioche',
    'Classic chicken salad served on a buttery brioche bun',
    'Sandwiches',
    'all_day',
    8.49,
    '{"calories": 480, "protein": 26, "carbs": 35, "fat": 24}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
LIMIT 1;

-- Salads Snack Boxes & More
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
    'Pesto Penne',
    'Penne pasta with pesto sauce',
    'Entrees',
    'all_day',
    5.29,
    '{"calories": 420, "protein": 14, "carbs": 52, "fat": 16}',
    '["gluten", "milk", "tree_nuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Greek Salad',
    'Fresh mixed greens with tomatoes, cucumbers, olives, feta cheese, and Greek dressing',
    'Salads',
    'all_day',
    9.49,
    '{"calories": 320, "protein": 12, "carbs": 18, "fat": 24}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Apple or Banana',
    'Fresh apple or banana',
    'Sides',
    'all_day',
    1.49,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Chicken Fruit & Cheese Snack Box',
    'Portable snack box with chicken, fresh fruit, and cheese',
    'Snack Boxes',
    'all_day',
    6.19,
    '{"calories": 380, "protein": 24, "carbs": 28, "fat": 18}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Chicken Salad Snack Box',
    'Portable snack box with chicken salad and accompaniments',
    'Snack Boxes',
    'all_day',
    10.69,
    '{"calories": 450, "protein": 28, "carbs": 22, "fat": 26}',
    '["milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Mediterranean Snack Box',
    'Portable snack box with Mediterranean-inspired items',
    'Snack Boxes',
    'all_day',
    9.49,
    '{"calories": 420, "protein": 16, "carbs": 35, "fat": 22}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Feta Cilantro Bowtie',
    'Bowtie pasta with feta cheese and cilantro',
    'Entrees',
    'all_day',
    5.29,
    '{"calories": 380, "protein": 14, "carbs": 48, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Fruit Cup',
    'Fresh seasonal fruit cup',
    'Sides',
    'all_day',
    4.99,
    '{"calories": 100, "protein": 1, "carbs": 25, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Garbanzo Greek',
    'Greek-style garbanzo beans with vegetables and herbs',
    'Salads',
    'all_day',
    5.29,
    '{"calories": 280, "protein": 12, "carbs": 35, "fat": 10}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Organic Oatmeal',
    'Warm, hearty organic oatmeal',
    'Breakfast',
    'breakfast',
    4.79,
    '{"calories": 200, "protein": 6, "carbs": 38, "fat": 4}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
LIMIT 1;

-- Specials
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
    '$5 Meal Deal',
    'Special meal deal offer',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 400, "protein": 20, "carbs": 40, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
LIMIT 1;

-- Espresso Bar
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
    'Peppermint Mocha Latte',
    'Espresso with steamed milk, peppermint syrup, and chocolate',
    'Beverages',
    'all_day',
    5.09,
    '{"calories": 300, "protein": 10, "carbs": 38, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Hot Honey Latte',
    'Espresso with steamed milk and hot honey syrup',
    'Beverages',
    'all_day',
    4.79,
    '{"calories": 250, "protein": 10, "carbs": 32, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Pumpkin Spice Latte',
    'Espresso with steamed milk and pumpkin spice syrup',
    'Beverages',
    'all_day',
    5.09,
    '{"calories": 280, "protein": 10, "carbs": 35, "fat": 8}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'London Fog',
    'Earl Grey tea with steamed milk and vanilla syrup',
    'Beverages',
    'all_day',
    5.84,
    '{"calories": 180, "protein": 8, "carbs": 22, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Espresso',
    'Strong, concentrated coffee shot',
    'Beverages',
    'all_day',
    2.99,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Organic Matcha Latte',
    'Organic matcha green tea with steamed milk',
    'Beverages',
    'all_day',
    6.14,
    '{"calories": 200, "protein": 8, "carbs": 25, "fat": 6}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Organic Earl Grey Latte',
    'Organic Earl Grey tea with steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 150, "protein": 8, "carbs": 18, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Frappe',
    'Blended coffee drink with ice and milk',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 350, "protein": 8, "carbs": 45, "fat": 14}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Organic Masala Chai',
    'Organic spiced chai tea with steamed milk',
    'Beverages',
    'all_day',
    4.79,
    '{"calories": 180, "protein": 8, "carbs": 24, "fat": 6}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Hot Chocolate',
    'Rich and creamy hot chocolate',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 250, "protein": 8, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Hot Tea',
    'Hot tea selection',
    'Beverages',
    'all_day',
    2.79,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'House Brewed Coffee',
    'Freshly brewed house coffee',
    'Beverages',
    'all_day',
    2.99,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Americano',
    'Espresso shots with hot water',
    'Beverages',
    'all_day',
    3.49,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Cappuccino',
    'Espresso with steamed milk and foam',
    'Beverages',
    'all_day',
    4.49,
    '{"calories": 120, "protein": 6, "carbs": 10, "fat": 4}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Caramel Leche',
    'Espresso with steamed milk and caramel sauce',
    'Beverages',
    'all_day',
    5.09,
    '{"calories": 280, "protein": 10, "carbs": 35, "fat": 8}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Vietnamese Coffee',
    'Strong coffee with sweetened condensed milk',
    'Beverages',
    'all_day',
    4.89,
    '{"calories": 200, "protein": 6, "carbs": 28, "fat": 8}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Cafe Latte',
    'Espresso with steamed milk',
    'Beverages',
    'all_day',
    4.49,
    '{"calories": 190, "protein": 10, "carbs": 18, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
LIMIT 1;

-- Smoothies
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
    'Strawberry Fields',
    'Strawberry smoothie with fresh fruit',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 220, "protein": 4, "carbs": 52, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
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
    'Mango Madness',
    'Mango smoothie with tropical flavors',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 240, "protein": 4, "carbs": 56, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Perkins Library'
LIMIT 1;

-- Saladelia at Sanford Menu Items
-- Pastries & Desserts
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
    'Hazelnut Chocolate Candies',
    'Rich chocolate candies with hazelnut filling',
    'Desserts',
    'all_day',
    3.99,
    '{"calories": 180, "protein": 3, "carbs": 22, "fat": 10}',
    '["tree_nuts", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'GF Scone',
    'Gluten-free scone with buttery texture',
    'Pastries',
    'all_day',
    4.99,
    '{"calories": 220, "protein": 4, "carbs": 28, "fat": 11}',
    '["milk", "egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Scone',
    'Traditional buttery scone',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 240, "protein": 5, "carbs": 32, "fat": 12}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Cookie',
    'Freshly baked cookie',
    'Desserts',
    'all_day',
    2.49,
    '{"calories": 160, "protein": 2, "carbs": 22, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chocolate Croissant',
    'Flaky croissant filled with rich chocolate',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 6, "carbs": 35, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Muffins',
    'Freshly baked muffins',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 280, "protein": 5, "carbs": 38, "fat": 12}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chocolate Covered Figs',
    'Dried figs covered in dark chocolate',
    'Desserts',
    'all_day',
    7.99,
    '{"calories": 200, "protein": 3, "carbs": 35, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Breads',
    'Assorted fresh breads',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 180, "protein": 6, "carbs": 32, "fat": 3}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Dessert Bar',
    'Assorted dessert bar selection',
    'Desserts',
    'all_day',
    3.99,
    '{"calories": 250, "protein": 4, "carbs": 35, "fat": 12}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Croissant',
    'Buttery, flaky French croissant',
    'Pastries',
    'all_day',
    3.79,
    '{"calories": 280, "protein": 5, "carbs": 30, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Brownie',
    'Rich chocolate brownie',
    'Desserts',
    'all_day',
    3.99,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Bottled Beverages
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
    'Kombucha',
    'Fermented probiotic tea beverage',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 60, "protein": 0, "carbs": 14, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Orangina San Pelligrino',
    'Sparkling orange beverage',
    'Beverages',
    'all_day',
    3.30,
    '{"calories": 120, "protein": 0, "carbs": 30, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'RECESS SPRK WTR',
    'Recess sparkling water',
    'Beverages',
    'all_day',
    5.99,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Ollie Pop',
    'Sparkling probiotic drink',
    'Beverages',
    'all_day',
    4.19,
    '{"calories": 35, "protein": 0, "carbs": 8, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Bottled Soda',
    'Assorted bottled sodas',
    'Beverages',
    'all_day',
    2.19,
    '{"calories": 140, "protein": 0, "carbs": 39, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'PERRIER',
    'Natural sparkling mineral water',
    'Beverages',
    'all_day',
    2.19,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Wild One',
    'Wild One sparkling beverage',
    'Beverages',
    'all_day',
    3.69,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Boxed Water',
    'Eco-friendly boxed water',
    'Beverages',
    'all_day',
    3.10,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Spindrift Sparkling Water',
    'Real fruit sparkling water',
    'Beverages',
    'all_day',
    2.79,
    '{"calories": 10, "protein": 0, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Spindrift Sparkling Water Large',
    'Large real fruit sparkling water',
    'Beverages',
    'all_day',
    3.30,
    '{"calories": 15, "protein": 0, "carbs": 3, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Sandwiches & Wraps
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
    'Hummus Veggie Wrap',
    'Fresh vegetables wrapped in a tortilla with hummus',
    'Sandwiches',
    'all_day',
    6.09,
    '{"calories": 380, "protein": 12, "carbs": 45, "fat": 16}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Falafel Pita',
    'Crispy falafel in warm pita with tahini sauce',
    'Sandwiches',
    'all_day',
    6.99,
    '{"calories": 420, "protein": 14, "carbs": 52, "fat": 18}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chicken Salad Croissant',
    'Creamy chicken salad on buttery croissant',
    'Sandwiches',
    'all_day',
    8.49,
    '{"calories": 520, "protein": 28, "carbs": 38, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Southwest Turkey Wrap',
    'Roasted turkey with southwest vegetables in a wrap',
    'Sandwiches',
    'all_day',
    8.79,
    '{"calories": 480, "protein": 32, "carbs": 42, "fat": 20}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Quesadilla',
    'Grilled tortilla with cheese and vegetables',
    'Sandwiches',
    'all_day',
    6.99,
    '{"calories": 420, "protein": 18, "carbs": 38, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Egg and Cheese Croissant',
    'Scrambled eggs and cheese on a buttery croissant',
    'Sandwiches',
    'breakfast',
    5.99,
    '{"calories": 380, "protein": 16, "carbs": 32, "fat": 22}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Southwest Chicken Wrap',
    'Grilled chicken with southwest vegetables in a wrap',
    'Sandwiches',
    'all_day',
    8.79,
    '{"calories": 520, "protein": 35, "carbs": 45, "fat": 22}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chicken Arugula',
    'Grilled chicken with fresh arugula and vegetables',
    'Sandwiches',
    'all_day',
    9.89,
    '{"calories": 480, "protein": 38, "carbs": 35, "fat": 20}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chicken Shawarma',
    'Spiced chicken shawarma with tahini and vegetables',
    'Sandwiches',
    'all_day',
    9.09,
    '{"calories": 520, "protein": 35, "carbs": 42, "fat": 24}',
    '["gluten", "sesame"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Salads and Snack Boxes
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
    'Mediterranean Snack Box',
    'Mediterranean-inspired snack box with hummus, vegetables, and pita',
    'Salads',
    'all_day',
    9.49,
    '{"calories": 380, "protein": 12, "carbs": 42, "fat": 18}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Yogurt',
    'Fresh yogurt',
    'Salads',
    'all_day',
    2.99,
    '{"calories": 120, "protein": 10, "carbs": 12, "fat": 4}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Garbanzo Greek',
    'Greek-style garbanzo bean salad',
    'Salads',
    'all_day',
    5.29,
    '{"calories": 280, "protein": 12, "carbs": 38, "fat": 10}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Hummus and Pita Crisp',
    'Creamy hummus served with crispy pita chips',
    'Salads',
    'all_day',
    4.49,
    '{"calories": 320, "protein": 10, "carbs": 38, "fat": 14}',
    '["gluten", "sesame"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Granola Parfait',
    'Layered parfait with granola, yogurt, and fresh fruit',
    'Salads',
    'all_day',
    5.99,
    '{"calories": 320, "protein": 12, "carbs": 45, "fat": 10}',
    '["milk", "gluten", "tree_nuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Farm Fresh Eggs',
    'Fresh farm eggs prepared to order',
    'Salads',
    'breakfast',
    2.99,
    '{"calories": 140, "protein": 12, "carbs": 1, "fat": 10}',
    '["egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Fresh Fruit',
    'Assorted fresh seasonal fruit',
    'Salads',
    'all_day',
    4.99,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Greek Salad',
    'Traditional Greek salad with feta, olives, and vegetables',
    'Salads',
    'all_day',
    9.49,
    '{"calories": 320, "protein": 14, "carbs": 22, "fat": 22}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Pita Crisps',
    'Crispy pita chips',
    'Salads',
    'all_day',
    4.49,
    '{"calories": 180, "protein": 5, "carbs": 28, "fat": 6}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Feta Cilantro Bowtie',
    'Bowtie pasta salad with feta and cilantro',
    'Salads',
    'all_day',
    5.29,
    '{"calories": 380, "protein": 12, "carbs": 48, "fat": 16}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chicken Salad Snack Box',
    'Chicken salad with vegetables and crackers',
    'Salads',
    'all_day',
    10.69,
    '{"calories": 420, "protein": 28, "carbs": 32, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Grilled Rosemary Salmon Salad',
    'Grilled salmon with rosemary over mixed greens',
    'Salads',
    'all_day',
    11.99,
    '{"calories": 420, "protein": 35, "carbs": 18, "fat": 24}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Hot Sandwiches
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
    'Breakfast Croissant',
    'Breakfast sandwich on buttery croissant',
    'Sandwiches',
    'breakfast',
    6.49,
    '{"calories": 420, "protein": 18, "carbs": 35, "fat": 24}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chicken Pesto',
    'Grilled chicken with pesto on artisan bread',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 38, "carbs": 38, "fat": 24}',
    '["gluten", "milk", "tree_nuts"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Grilled Ratatouille',
    'Grilled vegetables with herbs on focaccia',
    'Sandwiches',
    'all_day',
    9.49,
    '{"calories": 380, "protein": 10, "carbs": 42, "fat": 18}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'French Beef',
    'Roasted beef with caramelized onions on French roll',
    'Sandwiches',
    'all_day',
    10.59,
    '{"calories": 580, "protein": 42, "carbs": 38, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Toscano Sandwich',
    'Italian-style sandwich with cured meats and cheese',
    'Sandwiches',
    'all_day',
    10.59,
    '{"calories": 520, "protein": 28, "carbs": 35, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Greek Scrambler',
    'Scrambled eggs with feta and vegetables',
    'Sandwiches',
    'breakfast',
    6.49,
    '{"calories": 380, "protein": 22, "carbs": 28, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chicken Parmesan',
    'Breaded chicken with marinara and mozzarella',
    'Sandwiches',
    'all_day',
    10.09,
    '{"calories": 620, "protein": 42, "carbs": 45, "fat": 32}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Crispy Chicken Panini',
    'Crispy chicken with vegetables on pressed panini',
    'Sandwiches',
    'all_day',
    10.59,
    '{"calories": 580, "protein": 38, "carbs": 42, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Bowls
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
    'Vegan Buddha Bowl',
    'Grain bowl with vegetables, legumes, and tahini dressing',
    'Bowls',
    'all_day',
    9.89,
    '{"calories": 420, "protein": 16, "carbs": 58, "fat": 14}',
    '["sesame"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Southwest Chicken Bowl',
    'Grilled chicken with southwest vegetables and grains',
    'Bowls',
    'all_day',
    10.69,
    '{"calories": 520, "protein": 38, "carbs": 52, "fat": 18}',
    '[]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Salmon Bowl',
    'Grilled salmon over grains with vegetables',
    'Bowls',
    'all_day',
    12.99,
    '{"calories": 580, "protein": 42, "carbs": 48, "fat": 28}',
    '["fish"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Espresso Bar
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
    'London Fog',
    'Earl Grey tea latte with vanilla and steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 180, "protein": 8, "carbs": 22, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Caramel Leche',
    'Espresso with caramel and steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 220, "protein": 8, "carbs": 28, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Cafe Au Lait',
    'Equal parts coffee and steamed milk',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 120, "protein": 6, "carbs": 10, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Vietnamese Coffee',
    'Strong coffee with sweetened condensed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 180, "protein": 4, "carbs": 28, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Iced Coffee',
    'Chilled coffee served over ice',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Hot Cup',
    'Reusable hot cup',
    'Beverages',
    'all_day',
    0.59,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Hot Tea',
    'Selection of hot teas',
    'Beverages',
    'all_day',
    2.79,
    '{"calories": 2, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Latte',
    'Espresso with steamed milk',
    'Beverages',
    'all_day',
    4.49,
    '{"calories": 180, "protein": 10, "carbs": 12, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Chai Latte',
    'Spiced chai tea with steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 200, "protein": 8, "carbs": 28, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Earl Grey Latte',
    'Earl Grey tea with steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 180, "protein": 8, "carbs": 22, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Matcha Latte',
    'Japanese matcha green tea with steamed milk',
    'Beverages',
    'all_day',
    5.49,
    '{"calories": 160, "protein": 8, "carbs": 18, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Mocha Latte',
    'Espresso with chocolate and steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 240, "protein": 8, "carbs": 32, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Americano',
    'Espresso with hot water',
    'Beverages',
    'all_day',
    3.49,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Cappuccino',
    'Espresso with equal parts steamed milk and foam',
    'Beverages',
    'all_day',
    4.49,
    '{"calories": 120, "protein": 6, "carbs": 8, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Hot Cocoa',
    'Rich hot chocolate with steamed milk',
    'Beverages',
    'all_day',
    3.99,
    '{"calories": 200, "protein": 8, "carbs": 28, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Peppermint Mocha Latte',
    'Espresso with peppermint, chocolate, and steamed milk',
    'Beverages',
    'all_day',
    5.49,
    '{"calories": 260, "protein": 8, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Hot Honey Latte',
    'Espresso with honey and steamed milk',
    'Beverages',
    'all_day',
    5.39,
    '{"calories": 220, "protein": 8, "carbs": 32, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Pumpkin Chai Latte',
    'Spiced chai with pumpkin and steamed milk',
    'Beverages',
    'all_day',
    5.49,
    '{"calories": 240, "protein": 8, "carbs": 38, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Pumpkin Spice Latte',
    'Espresso with pumpkin spice and steamed milk',
    'Beverages',
    'all_day',
    5.49,
    '{"calories": 260, "protein": 8, "carbs": 40, "fat": 10}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'House Brewed Coffee',
    'Freshly brewed house coffee',
    'Beverages',
    'all_day',
    2.99,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Frappes, Smoothies & Juices
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
    'Smoothie',
    'Blended fruit smoothie',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 240, "protein": 4, "carbs": 56, "fat": 2}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
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
    'Frappe',
    'Blended coffee frappe',
    'Beverages',
    'all_day',
    6.59,
    '{"calories": 280, "protein": 6, "carbs": 48, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Specials
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
    '5$ Meal Deal',
    'Special meal deal',
    'Specials',
    'all_day',
    5.00,
    '{"calories": 400, "protein": 20, "carbs": 45, "fat": 16}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Saladelia at Sanford'
LIMIT 1;

-- Red Mango Menu Items
-- Sandwiches/Wraps
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
    'Caprese',
    'Fresh mozzarella, tomatoes, and basil with balsamic glaze',
    'Sandwiches',
    'all_day',
    7.99,
    '{"calories": 380, "protein": 18, "carbs": 28, "fat": 22}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Club Remix',
    'Classic club sandwich with a twist',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 520, "protein": 32, "carbs": 35, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Buffalo Ranch',
    'Spicy buffalo chicken with ranch dressing',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 500, "protein": 28, "carbs": 38, "fat": 26}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Toasts
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
    'Philly Special',
    'Philly-style sandwich with steak, cheese, and peppers',
    'Sandwiches',
    'all_day',
    10.49,
    '{"calories": 680, "protein": 38, "carbs": 48, "fat": 36}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Grilled Cheese & Bacon',
    'Classic grilled cheese with crispy bacon',
    'Sandwiches',
    'all_day',
    6.49,
    '{"calories": 520, "protein": 22, "carbs": 38, "fat": 30}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Fresh Berry Grilled PB&J',
    'Grilled peanut butter and jelly with fresh berries',
    'Sandwiches',
    'all_day',
    5.99,
    '{"calories": 420, "protein": 12, "carbs": 48, "fat": 20}',
    '["gluten", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Grilled Banana PB&J',
    'Grilled peanut butter and jelly with fresh banana',
    'Sandwiches',
    'all_day',
    5.99,
    '{"calories": 440, "protein": 12, "carbs": 50, "fat": 20}',
    '["gluten", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Little Italy',
    'Italian-inspired sandwich with cured meats and cheese',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 580, "protein": 28, "carbs": 42, "fat": 32}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Flatbreads
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
    'New Day Tomacado',
    'Flatbread with tomato and avocado',
    'Flatbreads',
    'all_day',
    7.49,
    '{"calories": 420, "protein": 14, "carbs": 48, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Straight Up',
    'Classic flatbread with simple, fresh ingredients',
    'Flatbreads',
    'all_day',
    7.99,
    '{"calories": 400, "protein": 16, "carbs": 46, "fat": 16}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Pizzaroni',
    'Flatbread with pepperoni and cheese, pizza-style',
    'Flatbreads',
    'all_day',
    8.99,
    '{"calories": 480, "protein": 22, "carbs": 48, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Grilled Folds
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
    'Turkey Apple Melt',
    'Grilled fold with turkey, apple, and melted cheese',
    'Sandwiches',
    'all_day',
    7.49,
    '{"calories": 450, "protein": 28, "carbs": 35, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Breakfast Folds
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
    'Cali',
    'California-style breakfast fold with fresh ingredients',
    'Breakfast',
    'breakfast',
    7.29,
    '{"calories": 420, "protein": 20, "carbs": 38, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Rise & Shine',
    'Breakfast fold to start your day right',
    'Breakfast',
    'breakfast',
    6.19,
    '{"calories": 380, "protein": 18, "carbs": 35, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Camper',
    'Breakfast fold perfect for a camping-style meal',
    'Breakfast',
    'breakfast',
    7.29,
    '{"calories": 400, "protein": 20, "carbs": 36, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Farm Hand',
    'Hearty breakfast fold with farm-fresh ingredients',
    'Breakfast',
    'breakfast',
    6.19,
    '{"calories": 360, "protein": 16, "carbs": 32, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Smoothie Bowls
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
    'Loco For Coco Bowl',
    'Coconut-inspired smoothie bowl with tropical flavors',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 420, "protein": 8, "carbs": 68, "fat": 14}',
    '["tree_nuts"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Berries & Acai Bowl',
    'Acai bowl topped with fresh berries',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 380, "protein": 6, "carbs": 72, "fat": 10}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Choco-Nut Dream Acai Bowl',
    'Chocolate and nut acai bowl for a dreamy treat',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 450, "protein": 10, "carbs": 65, "fat": 18}',
    '["tree_nuts"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'PB Power Acai Bowl',
    'Peanut butter power acai bowl',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 480, "protein": 14, "carbs": 62, "fat": 20}',
    '["peanuts", "gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Pink Bowl',
    'Pink smoothie bowl with fresh fruit',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 400, "protein": 6, "carbs": 70, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Red White & Blue Bowl',
    'Patriotic-themed smoothie bowl with red, white, and blue fruits',
    'Bowls',
    'all_day',
    10.89,
    '{"calories": 410, "protein": 6, "carbs": 72, "fat": 12}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Smoothies
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
    'Citrus Mango Greens Regular',
    'Citrus mango smoothie with greens, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 220, "protein": 4, "carbs": 52, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Citrus Mango Greens Large',
    'Citrus mango smoothie with greens, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 280, "protein": 5, "carbs": 66, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Mango Metabolizer Regular',
    'Mango smoothie designed to boost metabolism, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 240, "protein": 6, "carbs": 54, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Mango Metabolizer Large',
    'Mango smoothie designed to boost metabolism, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 300, "protein": 8, "carbs": 68, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Skinny Strawberry Regular',
    'Low-calorie strawberry smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 180, "protein": 4, "carbs": 42, "fat": 1}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Skinny Strawberry Large',
    'Low-calorie strawberry smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 230, "protein": 5, "carbs": 53, "fat": 1}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Strawberry Banana Regular',
    'Classic strawberry banana smoothie, regular size',
    'Beverages',
    'all_day',
    6.99,
    '{"calories": 210, "protein": 4, "carbs": 48, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Strawberry Banana Large',
    'Classic strawberry banana smoothie, large size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 260, "protein": 5, "carbs": 60, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'PBJ Regular',
    'Peanut butter and jelly smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 320, "protein": 12, "carbs": 48, "fat": 12}',
    '["milk", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'PBJ Large',
    'Peanut butter and jelly smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 400, "protein": 15, "carbs": 60, "fat": 15}',
    '["milk", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Mighty Oat Regular',
    'Oatmeal-based smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 280, "protein": 8, "carbs": 52, "fat": 6}',
    '["milk", "gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Mighty Oat Large',
    'Oatmeal-based smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 350, "protein": 10, "carbs": 65, "fat": 8}',
    '["milk", "gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Honey Badger Regular',
    'Honey-flavored smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 250, "protein": 5, "carbs": 56, "fat": 3}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Honey Badger Large',
    'Honey-flavored smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 310, "protein": 6, "carbs": 70, "fat": 4}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'M-Y-O Smoothie Regular',
    'Make Your Own smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 220, "protein": 4, "carbs": 50, "fat": 2}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'M-Y-O Smoothie Large',
    'Make Your Own smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 280, "protein": 5, "carbs": 63, "fat": 2}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Super PB Cup Regular',
    'Super peanut butter cup smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 380, "protein": 14, "carbs": 50, "fat": 16}',
    '["milk", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Super PB Cup Large',
    'Super peanut butter cup smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 480, "protein": 18, "carbs": 63, "fat": 20}',
    '["milk", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Tropical Mango Regular',
    'Tropical mango smoothie, regular size',
    'Beverages',
    'all_day',
    6.99,
    '{"calories": 230, "protein": 4, "carbs": 54, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Tropical Mango Large',
    'Tropical mango smoothie, large size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 290, "protein": 5, "carbs": 68, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'RED - Lean Green Regular',
    'Red Mango signature lean green smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 200, "protein": 5, "carbs": 46, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'RED - Lean Green Large',
    'Red Mango signature lean green smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 250, "protein": 6, "carbs": 58, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'RED - Simple Green Smoothie Regular',
    'Red Mango simple green smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 190, "protein": 4, "carbs": 44, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'RED - Simple Green Smoothie Large',
    'Red Mango simple green smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 240, "protein": 5, "carbs": 55, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Pina Colada Regular',
    'Tropical pina colada smoothie, regular size',
    'Beverages',
    'all_day',
    6.99,
    '{"calories": 250, "protein": 4, "carbs": 58, "fat": 3}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Pina Colada Large',
    'Tropical pina colada smoothie, large size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 310, "protein": 5, "carbs": 72, "fat": 3}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Banana PB Protein Regular',
    'Banana peanut butter protein smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 340, "protein": 20, "carbs": 48, "fat": 12}',
    '["milk", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Banana PB Protein Large',
    'Banana peanut butter protein smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 430, "protein": 25, "carbs": 60, "fat": 15}',
    '["milk", "peanuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Berry Banana Regular',
    'Berry and banana smoothie, regular size',
    'Beverages',
    'all_day',
    6.99,
    '{"calories": 220, "protein": 4, "carbs": 50, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Berry Banana Large',
    'Berry and banana smoothie, large size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 280, "protein": 5, "carbs": 63, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Berry Power Protein Regular',
    'Berry power protein smoothie, regular size',
    'Beverages',
    'all_day',
    7.99,
    '{"calories": 300, "protein": 18, "carbs": 46, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
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
    'Berry Power Protein Large',
    'Berry power protein smoothie, large size',
    'Beverages',
    'all_day',
    8.99,
    '{"calories": 380, "protein": 23, "carbs": 58, "fat": 10}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Red Mango'
LIMIT 1;

-- Trinity Café Menu Items
-- Grab & Go
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
    '2 Fruit Yogurt Granola Tray',
    'Two servings of fruit, yogurt, and granola in a convenient tray',
    'Grab & Go',
    'all_day',
    9.99,
    '{"calories": 560, "protein": 24, "carbs": 80, "fat": 20}',
    '["milk", "gluten", "tree_nuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Whole Fruit',
    'Fresh whole fruit selection',
    'Grab & Go',
    'all_day',
    1.49,
    '{"calories": 80, "protein": 1, "carbs": 20, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Sabra Hummus',
    'Creamy Sabra brand hummus',
    'Grab & Go',
    'all_day',
    4.99,
    '{"calories": 280, "protein": 8, "carbs": 24, "fat": 18}',
    '["sesame"]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Boiled Eggs',
    'Hard-boiled eggs',
    'Grab & Go',
    'all_day',
    1.99,
    '{"calories": 140, "protein": 12, "carbs": 1, "fat": 10}',
    '["egg"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Brown Rice Sriracha Salmon',
    'Brown rice bowl with sriracha-glazed salmon',
    'Grab & Go',
    'all_day',
    10.99,
    '{"calories": 520, "protein": 36, "carbs": 55, "fat": 18}',
    '["fish", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Tuna Salad 8oz',
    'Fresh tuna salad, 8 ounce portion',
    'Grab & Go',
    'all_day',
    7.49,
    '{"calories": 320, "protein": 28, "carbs": 8, "fat": 18}',
    '["fish", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chicken Salad 8oz',
    'Classic chicken salad, 8 ounce portion',
    'Grab & Go',
    'all_day',
    7.49,
    '{"calories": 380, "protein": 30, "carbs": 6, "fat": 26}',
    '["milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Caesar Salad',
    'Classic Caesar salad with romaine lettuce, croutons, and Caesar dressing',
    'Salads',
    'all_day',
    6.69,
    '{"calories": 280, "protein": 8, "carbs": 18, "fat": 20}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chicken Caesar Salad',
    'Caesar salad topped with grilled chicken',
    'Salads',
    'all_day',
    7.89,
    '{"calories": 420, "protein": 32, "carbs": 18, "fat": 24}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Garden Salad',
    'Fresh mixed greens with vegetables',
    'Salads',
    'all_day',
    6.99,
    '{"calories": 120, "protein": 4, "carbs": 16, "fat": 6}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chicken Salad Snack Pack',
    'Portable snack pack with chicken salad',
    'Grab & Go',
    'all_day',
    7.29,
    '{"calories": 320, "protein": 24, "carbs": 12, "fat": 20}',
    '["milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    '12oz Fruit Cup',
    'Fresh fruit cup, 12 ounce size',
    'Grab & Go',
    'all_day',
    NULL,
    '{"calories": 120, "protein": 2, "carbs": 30, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chobani Yogurt',
    'Chobani Greek yogurt',
    'Grab & Go',
    'all_day',
    2.99,
    '{"calories": 150, "protein": 12, "carbs": 20, "fat": 4}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Yogurt Parfait',
    'Layered yogurt parfait with granola and fruit',
    'Grab & Go',
    'all_day',
    6.49,
    '{"calories": 320, "protein": 14, "carbs": 45, "fat": 10}',
    '["milk", "gluten", "tree_nuts"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Pasta Bakes
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
    'Chicken Basil Pesto Alfredo Pasta Bake',
    'Pasta bake with chicken, basil pesto, and alfredo sauce',
    'Entrees',
    'all_day',
    6.89,
    '{"calories": 580, "protein": 32, "carbs": 52, "fat": 28}',
    '["gluten", "milk", "tree_nuts"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Marinara & Mozzarella Cheese Pasta Bake',
    'Pasta bake with marinara sauce and mozzarella cheese',
    'Entrees',
    'all_day',
    5.49,
    '{"calories": 420, "protein": 18, "carbs": 56, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Macaroni and Cheese Pasta Bake',
    'Classic macaroni and cheese pasta bake',
    'Entrees',
    'all_day',
    6.49,
    '{"calories": 480, "protein": 20, "carbs": 52, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Spinach Mushroom and Alfredo Pasta Bake',
    'Pasta bake with spinach, mushrooms, and alfredo sauce',
    'Entrees',
    'all_day',
    6.89,
    '{"calories": 450, "protein": 16, "carbs": 52, "fat": 20}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Moms Spaghetti with Meat Sauce Pasta Bake',
    'Pasta bake with spaghetti and meat sauce',
    'Entrees',
    'all_day',
    6.49,
    '{"calories": 520, "protein": 24, "carbs": 56, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Sandwiches
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
    'Vegan Tuna Sandwich',
    'Plant-based tuna alternative sandwich',
    'Sandwiches',
    'all_day',
    7.89,
    '{"calories": 320, "protein": 12, "carbs": 42, "fat": 12}',
    '["gluten", "soy"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'BBQ Turkey Sandwich',
    'BBQ turkey sandwich',
    'Sandwiches',
    'all_day',
    5.89,
    '{"calories": 380, "protein": 24, "carbs": 38, "fat": 14}',
    '["gluten", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chicken Salad Croissant',
    'Chicken salad served on a buttery croissant',
    'Sandwiches',
    'all_day',
    7.89,
    '{"calories": 520, "protein": 28, "carbs": 38, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Sun Butter and Jelly',
    'Sunflower seed butter and jelly sandwich',
    'Sandwiches',
    'all_day',
    5.29,
    '{"calories": 420, "protein": 10, "carbs": 48, "fat": 20}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Ham and Provolone Sandwich on White',
    'Ham and provolone cheese on white bread',
    'Sandwiches',
    'all_day',
    5.59,
    '{"calories": 380, "protein": 22, "carbs": 32, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Turkey and Provolone Sandwich on White',
    'Turkey and provolone cheese on white bread',
    'Sandwiches',
    'all_day',
    5.59,
    '{"calories": 360, "protein": 28, "carbs": 32, "fat": 14}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Turkey Bacon Club Panini',
    'Turkey, bacon, and club fixings on a pressed panini',
    'Sandwiches',
    'all_day',
    7.89,
    '{"calories": 520, "protein": 32, "carbs": 38, "fat": 26}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Barbeque Chicken Ciabatta',
    'BBQ chicken on ciabatta bread',
    'Sandwiches',
    'all_day',
    8.59,
    '{"calories": 480, "protein": 30, "carbs": 42, "fat": 20}',
    '["gluten", "milk", "soy"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chicken Salad Cheddar Ciabatta',
    'Chicken salad with cheddar cheese on ciabatta bread',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 540, "protein": 32, "carbs": 40, "fat": 28}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Caprese Panini',
    'Fresh mozzarella, tomatoes, and basil pressed in a panini',
    'Sandwiches',
    'all_day',
    7.89,
    '{"calories": 420, "protein": 20, "carbs": 35, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Tuna Melt on Wheat',
    'Tuna melt sandwich on wheat bread',
    'Sandwiches',
    'all_day',
    7.89,
    '{"calories": 480, "protein": 30, "carbs": 38, "fat": 24}',
    '["gluten", "milk", "fish", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Turkey w Provolone Ciabatta',
    'Turkey with provolone cheese on ciabatta bread',
    'Sandwiches',
    'all_day',
    7.89,
    '{"calories": 440, "protein": 30, "carbs": 38, "fat": 18}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Pastries
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
    'Croissant',
    'Buttery, flaky French croissant',
    'Pastries',
    'all_day',
    NULL,
    '{"calories": 280, "protein": 5, "carbs": 28, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Triple Chocolate Chip Brownie',
    'Rich brownie with triple chocolate chips',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 380, "protein": 5, "carbs": 48, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Cookies',
    'Freshly baked cookies',
    'Pastries',
    'all_day',
    NULL,
    '{"calories": 160, "protein": 2, "carbs": 22, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Scones',
    'Traditional British scone',
    'Pastries',
    'all_day',
    3.39,
    '{"calories": 250, "protein": 5, "carbs": 38, "fat": 10}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Bagel',
    'Fresh bagel',
    'Pastries',
    'all_day',
    1.69,
    '{"calories": 280, "protein": 11, "carbs": 56, "fat": 2}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Muffin',
    'Freshly baked muffin',
    'Pastries',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 4, "carbs": 30, "fat": 8}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Cream Cheese',
    'Cream cheese spread',
    'Pastries',
    'all_day',
    0.69,
    '{"calories": 100, "protein": 2, "carbs": 2, "fat": 10}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Lemon Loaf',
    'Sweet lemon-flavored loaf cake',
    'Pastries',
    'all_day',
    3.39,
    '{"calories": 320, "protein": 4, "carbs": 48, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Biscotti',
    'Italian twice-baked cookie',
    'Pastries',
    'all_day',
    1.39,
    '{"calories": 120, "protein": 3, "carbs": 20, "fat": 4}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Cinnamon Rolls',
    'Sweet cinnamon rolls with icing',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 380, "protein": 6, "carbs": 52, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Cherry Turnover',
    'Flaky pastry filled with cherry',
    'Pastries',
    'all_day',
    3.39,
    '{"calories": 320, "protein": 4, "carbs": 42, "fat": 16}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Rice Krispy Treat',
    'Classic rice krispy treat',
    'Pastries',
    'all_day',
    2.79,
    '{"calories": 200, "protein": 2, "carbs": 38, "fat": 5}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Hot Beverages
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
    'London Fog',
    'Earl Grey tea with steamed milk and vanilla syrup',
    'Beverages',
    'all_day',
    3.29,
    '{"calories": 180, "protein": 8, "carbs": 22, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Dirty Chai',
    'Chai latte with a shot of espresso',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 220, "protein": 8, "carbs": 28, "fat": 6}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Chai Latte',
    'Spiced chai tea with steamed milk',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 200, "protein": 8, "carbs": 26, "fat": 6}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Espresso',
    'Strong, concentrated coffee shot',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Latte',
    'Espresso with steamed milk',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 190, "protein": 10, "carbs": 18, "fat": 7}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Americano',
    'Espresso shots with hot water',
    'Beverages',
    'all_day',
    4.69,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Mocha Latte',
    'Espresso with steamed milk and chocolate',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 290, "protein": 10, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Hot Chocolate',
    'Rich and creamy hot chocolate',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 250, "protein": 8, "carbs": 35, "fat": 10}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Hot Tea',
    'Hot tea selection',
    'Beverages',
    'all_day',
    2.39,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Nitro Cold Brew',
    'Smooth, nitrogen-infused cold brew coffee',
    'Beverages',
    'all_day',
    5.99,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Brewed Coffee',
    'Freshly brewed house coffee',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 5, "protein": 0, "carbs": 1, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Cafe Au Lait',
    'Brewed coffee with steamed milk',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 120, "protein": 6, "carbs": 10, "fat": 4}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Caramelado',
    'Espresso with caramel and steamed milk',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 280, "protein": 10, "carbs": 35, "fat": 8}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Steamer',
    'Steamed milk with flavored syrup',
    'Beverages',
    'all_day',
    3.39,
    '{"calories": 150, "protein": 8, "carbs": 18, "fat": 5}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Red Eye',
    'Brewed coffee with a shot of espresso',
    'Beverages',
    'all_day',
    4.89,
    '{"calories": 10, "protein": 0, "carbs": 2, "fat": 0}',
    '[]',
    ARRAY['vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'White Choc Mocha',
    'Espresso with white chocolate and steamed milk',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 320, "protein": 10, "carbs": 38, "fat": 12}',
    '["milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Cold Beverages
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
    'Gold Peak Sweet Tea',
    'Sweetened iced tea from Gold Peak',
    'Beverages',
    'all_day',
    3.79,
    '{"calories": 180, "protein": 0, "carbs": 46, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Gold Peak Unsweet Tea',
    'Unsweetened iced tea from Gold Peak',
    'Beverages',
    'all_day',
    3.79,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Bottled Soda 16oz',
    'Assorted bottled carbonated soft drinks, 16 ounce',
    'Beverages',
    'all_day',
    1.89,
    '{"calories": 160, "protein": 0, "carbs": 40, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Naked Juice',
    'Bottled fruit and vegetable juice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 140, "protein": 2, "carbs": 34, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Bottled Tropicana Juice',
    'Bottled Tropicana fruit juice',
    'Beverages',
    'all_day',
    NULL,
    '{"calories": 150, "protein": 2, "carbs": 36, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Bottled Soda 20oz',
    'Assorted bottled carbonated soft drinks, 20 ounce',
    'Beverages',
    'all_day',
    2.49,
    '{"calories": 200, "protein": 0, "carbs": 50, "fat": 0}',
    '[]',
    ARRAY['vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Frozen Explosion',
    'Frozen blended fruit drink',
    'Beverages',
    'all_day',
    6.69,
    '{"calories": 280, "protein": 2, "carbs": 68, "fat": 1}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Smoothie Fruit',
    'Fresh fruit smoothie',
    'Beverages',
    'all_day',
    6.89,
    '{"calories": 240, "protein": 4, "carbs": 58, "fat": 2}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    '25oz Bottled Water',
    '25 ounce bottle of water',
    'Beverages',
    'all_day',
    2.29,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegan', 'vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Breakfast
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
    'Egg and Cheese Burrito',
    'Scrambled eggs and cheese wrapped in a tortilla',
    'Breakfast',
    'breakfast',
    4.99,
    '{"calories": 380, "protein": 18, "carbs": 32, "fat": 20}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Quaker Oatmeal',
    'Warm, hearty Quaker oatmeal',
    'Breakfast',
    'breakfast',
    1.99,
    '{"calories": 200, "protein": 6, "carbs": 38, "fat": 4}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
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
    'Burrito',
    'Breakfast burrito with your choice of fillings',
    'Breakfast',
    'breakfast',
    6.99,
    '{"calories": 450, "protein": 22, "carbs": 40, "fat": 22}',
    '["gluten", "milk", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Trinity Café'
LIMIT 1;

-- Freeman Center Cafe Menu Items
-- Bagels
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
    'Build Your Own Bagel Sandwich',
    'Choose your bagel, spread, and toppings',
    'Sandwiches',
    'all_day',
    4.49,
    '{"calories": 320, "protein": 12, "carbs": 45, "fat": 10}',
    '["gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Rise & Shine',
    'Bagel sandwich with eggs and cheese',
    'Sandwiches',
    'breakfast',
    6.99,
    '{"calories": 420, "protein": 20, "carbs": 42, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Classic',
    'Traditional bagel with cream cheese and lox',
    'Sandwiches',
    'all_day',
    5.99,
    '{"calories": 380, "protein": 18, "carbs": 38, "fat": 16}',
    '["gluten", "milk", "fish"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Works',
    'Loaded bagel sandwich with all the fixings',
    'Sandwiches',
    'all_day',
    13.99,
    '{"calories": 680, "protein": 35, "carbs": 55, "fat": 35}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Rabbi Elana',
    'Specialty bagel sandwich named after Rabbi Elana',
    'Sandwiches',
    'all_day',
    6.79,
    '{"calories": 450, "protein": 22, "carbs": 45, "fat": 20}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Tuna',
    'Tuna salad on your choice of bagel',
    'Sandwiches',
    'all_day',
    9.09,
    '{"calories": 480, "protein": 28, "carbs": 42, "fat": 18}',
    '["gluten", "fish"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Coach Scheyer''s Pick',
    'Coach Scheyer''s favorite bagel sandwich',
    'Sandwiches',
    'all_day',
    5.99,
    '{"calories": 420, "protein": 20, "carbs": 40, "fat": 18}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Halfsies',
    'Half portion bagel sandwich',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 350, "protein": 16, "carbs": 35, "fat": 14}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Dairy Day Chef Special',
    'Chef''s special dairy bagel sandwich',
    'Sandwiches',
    'all_day',
    14.99,
    '{"calories": 720, "protein": 38, "carbs": 58, "fat": 38}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'The Rainy Day',
    'Comforting bagel sandwich for a rainy day',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 480, "protein": 22, "carbs": 45, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Hot Entree
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
    'Grilled Cheese Sandwich',
    'Classic grilled cheese on kosher bread',
    'Sandwiches',
    'all_day',
    4.99,
    '{"calories": 420, "protein": 16, "carbs": 35, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Tomato Soup',
    'Creamy tomato soup',
    'Soups',
    'all_day',
    4.99,
    '{"calories": 180, "protein": 4, "carbs": 28, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Freemans Famous Mac & Cheese',
    'Creamy kosher macaroni and cheese',
    'Entrees',
    'all_day',
    9.29,
    '{"calories": 520, "protein": 20, "carbs": 58, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Garden Fresh
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
    'Large Fresh Fruit Cup',
    'Assorted fresh seasonal fruits',
    'Salads',
    'all_day',
    5.49,
    '{"calories": 120, "protein": 2, "carbs": 28, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Israeli Salad',
    'Fresh Israeli-style chopped vegetable salad',
    'Salads',
    'all_day',
    6.09,
    '{"calories": 120, "protein": 3, "carbs": 18, "fat": 4}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Fattoush Salad',
    'Middle Eastern bread salad with vegetables and herbs',
    'Salads',
    'all_day',
    6.49,
    '{"calories": 220, "protein": 6, "carbs": 28, "fat": 10}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Dessert
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
    'Freeman Famous Choc Chip Cookies',
    'Freeman Center''s famous chocolate chip cookies',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 200, "protein": 3, "carbs": 28, "fat": 10}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Chocolate Rugelach',
    'Traditional Jewish pastry with chocolate filling',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 180, "protein": 3, "carbs": 22, "fat": 9}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Babka',
    'Traditional Jewish sweet bread with chocolate swirl',
    'Desserts',
    'all_day',
    3.29,
    '{"calories": 280, "protein": 6, "carbs": 38, "fat": 12}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Jumbo Black & White Cookies',
    'Large black and white cookies',
    'Desserts',
    'all_day',
    6.29,
    '{"calories": 320, "protein": 4, "carbs": 45, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Coffee Classics
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
    'Hot Tea',
    'Selection of kosher hot teas',
    'Beverages',
    'all_day',
    1.89,
    '{"calories": 2, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Cappuccino',
    'Espresso with steamed milk and foam',
    'Beverages',
    'all_day',
    4.09,
    '{"calories": 120, "protein": 6, "carbs": 8, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Espresso',
    'Strong kosher espresso shot',
    'Beverages',
    'all_day',
    1.99,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Cafe Americano',
    'Espresso with hot water',
    'Beverages',
    'all_day',
    2.89,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Cafe Latte',
    'Espresso with steamed milk',
    'Beverages',
    'all_day',
    4.09,
    '{"calories": 180, "protein": 10, "carbs": 12, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Cafe Mocha',
    'Espresso with chocolate and steamed milk',
    'Beverages',
    'all_day',
    4.59,
    '{"calories": 240, "protein": 8, "carbs": 32, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Coffee Specials
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
    'Turtle Latte',
    'Espresso with caramel, chocolate, and steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 280, "protein": 8, "carbs": 38, "fat": 10}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Beverages
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
    'Dr. Browns Root Beer',
    'Kosher Dr. Brown''s root beer',
    'Beverages',
    'all_day',
    1.79,
    '{"calories": 150, "protein": 0, "carbs": 39, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Dr. Browns Black Cherry',
    'Kosher Dr. Brown''s black cherry soda',
    'Beverages',
    'all_day',
    1.79,
    '{"calories": 150, "protein": 0, "carbs": 39, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Dr. Browns Diet Black Cherry',
    'Kosher Dr. Brown''s diet black cherry soda',
    'Beverages',
    'all_day',
    1.79,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Dr. Browns Diet Cream Soda',
    'Kosher Dr. Brown''s diet cream soda',
    'Beverages',
    'all_day',
    1.79,
    '{"calories": 0, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
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
    'Limonana',
    'Traditional Middle Eastern mint lemonade',
    'Beverages',
    'all_day',
    3.19,
    '{"calories": 120, "protein": 0, "carbs": 32, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Freeman Center Cafe'
LIMIT 1;

-- Panera Bread Menu Items
-- Soups
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
    'Broccoli Cheddar Soup',
    'Creamy soup with broccoli and aged cheddar cheese',
    'Soups',
    'all_day',
    6.99,
    '{"calories": 320, "protein": 12, "carbs": 18, "fat": 22}',
    '["milk", "gluten"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Tomato Soup',
    'Classic tomato soup with basil',
    'Soups',
    'all_day',
    5.99,
    '{"calories": 180, "protein": 4, "carbs": 28, "fat": 6}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Chicken Noodle Soup',
    'Classic chicken noodle soup',
    'Soups',
    'all_day',
    6.99,
    '{"calories": 220, "protein": 16, "carbs": 22, "fat": 8}',
    '["gluten", "egg"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'French Onion Soup',
    'Caramelized onions in beef broth with cheese',
    'Soups',
    'all_day',
    6.99,
    '{"calories": 280, "protein": 14, "carbs": 24, "fat": 16}',
    '["milk", "gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
LIMIT 1;

-- Sandwiches
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
    'Turkey Avocado BLT',
    'Sliced turkey, avocado, bacon, lettuce, and tomato on artisan bread',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 580, "protein": 32, "carbs": 42, "fat": 28}',
    '["gluten"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Frontega Chicken',
    'Grilled chicken with chipotle mayo, red onions, and mozzarella',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 520, "protein": 38, "carbs": 38, "fat": 22}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Napa Almond Chicken Salad Sandwich',
    'Chicken salad with almonds, grapes, and celery',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 480, "protein": 28, "carbs": 35, "fat": 24}',
    '["gluten", "tree_nuts", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Mediterranean Veggie',
    'Roasted vegetables, feta, and hummus on focaccia',
    'Sandwiches',
    'all_day',
    8.99,
    '{"calories": 420, "protein": 16, "carbs": 48, "fat": 18}',
    '["gluten", "milk", "sesame"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Smokehouse BBQ Chicken',
    'Pulled chicken with BBQ sauce, cheddar, and red onions',
    'Sandwiches',
    'all_day',
    9.99,
    '{"calories": 580, "protein": 35, "carbs": 45, "fat": 28}',
    '["gluten", "milk"]',
    ARRAY[]::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
LIMIT 1;

-- Salads
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
    'Caesar Salad',
    'Romaine lettuce with Caesar dressing, parmesan, and croutons',
    'Salads',
    'all_day',
    7.99,
    '{"calories": 320, "protein": 12, "carbs": 18, "fat": 24}',
    '["gluten", "milk", "egg", "fish"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Greek Salad',
    'Mixed greens with feta, olives, tomatoes, and Greek dressing',
    'Salads',
    'all_day',
    8.99,
    '{"calories": 380, "protein": 14, "carbs": 22, "fat": 28}',
    '["milk"]',
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Asian Sesame Chicken Salad',
    'Mixed greens with grilled chicken, sesame seeds, and Asian dressing',
    'Salads',
    'all_day',
    10.99,
    '{"calories": 420, "protein": 32, "carbs": 28, "fat": 22}',
    '["sesame", "soy"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Fuji Apple Chicken Salad',
    'Mixed greens with grilled chicken, apples, and Gorgonzola',
    'Salads',
    'all_day',
    10.99,
    '{"calories": 380, "protein": 28, "carbs": 32, "fat": 18}',
    '["milk", "tree_nuts"]',
    ARRAY['gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
LIMIT 1;

-- Pastries & Bakery
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
    'Chocolate Chipper Cookie',
    'Classic chocolate chip cookie',
    'Desserts',
    'all_day',
    2.99,
    '{"calories": 280, "protein": 3, "carbs": 35, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Blueberry Muffin',
    'Fresh blueberry muffin',
    'Pastries',
    'all_day',
    3.49,
    '{"calories": 320, "protein": 5, "carbs": 42, "fat": 14}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Cinnamon Roll',
    'Warm cinnamon roll with icing',
    'Pastries',
    'all_day',
    3.99,
    '{"calories": 420, "protein": 6, "carbs": 58, "fat": 18}',
    '["gluten", "milk", "egg"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Bagel',
    'Fresh baked bagel',
    'Pastries',
    'all_day',
    1.99,
    '{"calories": 280, "protein": 11, "carbs": 55, "fat": 2}',
    '["gluten"]',
    ARRAY['vegetarian', 'vegan']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
LIMIT 1;

-- Beverages
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
    'Coffee',
    'Freshly brewed coffee',
    'Beverages',
    'all_day',
    2.49,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Latte',
    'Espresso with steamed milk',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 180, "protein": 10, "carbs": 12, "fat": 8}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Cappuccino',
    'Espresso with steamed milk and foam',
    'Beverages',
    'all_day',
    4.99,
    '{"calories": 120, "protein": 6, "carbs": 8, "fat": 5}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Iced Coffee',
    'Chilled coffee served over ice',
    'Beverages',
    'all_day',
    3.49,
    '{"calories": 5, "protein": 0, "carbs": 0, "fat": 0}',
    '[]',
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
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
    'Frozen Caramel',
    'Frozen caramel coffee drink',
    'Beverages',
    'all_day',
    5.99,
    '{"calories": 320, "protein": 8, "carbs": 48, "fat": 12}',
    '["milk"]',
    ARRAY['vegetarian']::dietarytag[]
FROM vendors WHERE name = 'Panera Bread'
LIMIT 1;