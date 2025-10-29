-- Insert sample vendors based on Duke dining locations
INSERT INTO vendors (
    name, 
    description,
    contact_info,
    location_category,
    address,
    building_name,
    floor_level,
    operating_hours,
    cuisine_type,
    payment_methods,
    dietary_tags
) VALUES 
-- East & Central Campus
(
    'Marketplace',
    'A 3-star Green Restaurant Association certified dining location featuring all-you-care-to-eat breakfast, dinner, and weekend brunch with a-la-carte weekday lunch.',
    '{"phone": "919-660-3981"}',
    'east_central_campus',
    'East Union',
    'East Union',
    'Main Level',
    '{
        "monday": {"breakfast": "6:45am-11:00am", "lunch": "12:00pm-2:00pm", "dinner": "5:00pm-9:00pm"},
        "tuesday": {"breakfast": "6:45am-11:00am", "lunch": "12:00pm-2:00pm", "dinner": "5:00pm-9:00pm"},
        "wednesday": {"breakfast": "6:45am-11:00am", "lunch": "12:00pm-2:00pm", "dinner": "5:00pm-9:00pm"},
        "thursday": {"breakfast": "6:45am-11:00am", "lunch": "12:00pm-2:00pm", "dinner": "5:00pm-9:00pm"},
        "friday": {"breakfast": "6:45am-11:00am", "lunch": "12:00pm-2:00pm", "dinner": "5:00pm-9:00pm"},
        "saturday": {"brunch": "10:00am-2:30pm", "dinner": "5:00pm-9:00pm"},
        "sunday": {"brunch": "10:00am-2:30pm", "dinner": "5:00pm-9:00pm"}
    }',
    'AMERICAN',
    ARRAY['food_points', 'meal_swipe', 'board_plan']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'nut_free', 'local_sourced']::dietarytag[]
),
(
    'The Skillet',
    'Duke''s first Top 9 Allergen-Free Campus Venue featuring fresh ingredients free from the top nine allergens.',
    '{"phone": "919-660-3982"}',
    'west_campus',
    'East Union',
    'East Union',
    'Main Level',
    '{
        "monday": {"breakfast": "7:30am-2:00pm"},
        "tuesday": {"breakfast": "7:30am-2:00pm"},
        "wednesday": {"breakfast": "7:30am-2:00pm"},
        "thursday": {"breakfast": "7:30am-2:00pm"},
        "friday": {"breakfast": "7:30am-2:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'AMERICAN',
    ARRAY['food_points', 'meal_swipe', 'board_plan']::paymentmethod[],
    ARRAY['nut_free', 'gluten_free', 'dairy_free', 'vegetarian', 'vegan']::dietarytag[]
),
(
    'Trinity Café',
    'Nut-free-friendly café serving breakfast, lunch, and dinner with allergen-free options.',
    '{"phone": "919-660-3983"}',
    'east_central_campus',
    'Trinity College',
    'Trinity College',
    'Main Level',
    '{
        "monday": {"breakfast": "8:00am-12:30pm", "dinner": "4:00pm-close"},
        "tuesday": {"breakfast": "8:00am-12:30pm", "dinner": "4:00pm-close"},
        "wednesday": {"breakfast": "8:00am-12:30pm", "dinner": "4:00pm-close"},
        "thursday": {"breakfast": "8:00am-12:30pm", "dinner": "4:00pm-close"},
        "friday": {"breakfast": "8:00am-12:30pm", "dinner": "4:00pm-close"},
        "saturday": null,
        "sunday": null
    }',
    'AMERICAN',
    ARRAY['food_points', 'meal_swipe', 'board_plan']::paymentmethod[],
    ARRAY['nut_free', 'vegetarian', 'vegan']::dietarytag[]
),
(
    'It''s Thyme',
    'Fresh, healthy dining options with daily specials and allergen-free choices.',
    '{"phone": "919-660-3984"}',
    'west_campus',
    'Bryan Center',
    'Bryan Center',
    'Plaza Level',
    '{
        "monday": {"lunch": "11:00am-3:00pm", "dinner": "4:00pm-close"},
        "tuesday": {"lunch": "11:00am-3:00pm", "dinner": "4:00pm-close"},
        "wednesday": {"lunch": "11:00am-3:00pm", "dinner": "4:00pm-close"},
        "thursday": {"lunch": "11:00am-3:00pm", "dinner": "4:00pm-close"},
        "friday": {"lunch": "11:00am-3:00pm", "dinner": "4:00pm-close"},
        "saturday": null,
        "sunday": null
    }',
    'MEDITERRANEAN',
    ARRAY['food_points', 'meal_swipe', 'board_plan']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free', 'organic']::dietarytag[]
),
-- West Campus
(
    'Bella Union',
    'Brewing fresh coffee and offers fresh baked goods, frozen drinks, and novelty snack-foods.',
    '{"phone": "919-660-3985"}',
    'west_campus',
    'McClendon Tower',
    'McClendon Tower',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-10:00pm"},
        "tuesday": {"breakfast": "7:00am-10:00pm"},
        "wednesday": {"breakfast": "7:00am-10:00pm"},
        "thursday": {"breakfast": "7:00am-10:00pm"},
        "friday": {"breakfast": "7:00am-10:00pm"},
        "saturday": {"breakfast": "8:00am-10:00pm"},
        "sunday": {"breakfast": "8:00am-10:00pm"}
    }',
    'AMERICAN',
    ARRAY['food_points', 'duke_card', 'credit_card', 'apple_pay', 'google_pay']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Pitchfork''s',
    'A campus favorite offering diner-style menu in newly renovated space, with breakfast served late in the day.',
    '{"phone": "919-660-3986"}',
    'west_campus',
    'McClendon Tower',
    'McClendon Tower',
    'Level 0',
    '{
        "monday": {"breakfast": "7:00am-10:00pm"},
        "tuesday": {"breakfast": "7:00am-10:00pm"},
        "wednesday": {"breakfast": "7:00am-10:00pm"},
        "thursday": {"breakfast": "7:00am-10:00pm"},
        "friday": {"breakfast": "7:00am-10:00pm"},
        "saturday": {"breakfast": "8:00am-10:00pm"},
        "sunday": {"breakfast": "8:00am-10:00pm"}
    }',
    'AMERICAN',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
-- Merchants-On-Points
(
    'Del Rancho Mexican Grill',
    'Authentic Mexican cuisine available for delivery to campus locations.',
    '{"phone": "919-479-9757"}',
    'merchants_on_points',
    'Off Campus - Delivery Only',
    'Delivery',
    'N/A',
    '{
        "sunday": {"delivery": "11:00am-10:00pm"},
        "monday": {"delivery": "11:00am-10:00pm"},
        "tuesday": {"delivery": "11:00am-10:00pm"},
        "wednesday": {"delivery": "11:00am-10:00pm"},
        "thursday": {"delivery": "11:00am-10:00pm"},
        "friday": {"delivery": "11:00am-11:00pm"},
        "saturday": {"delivery": "11:00am-11:00pm"}
    }',
    'MEXICAN',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
-- Food Trucks
(
    'Bon Fritay',
    'Caribbean-inspired food truck serving authentic Haitian cuisine.',
    '{"phone": "919-000-0001"}',
    'food_trucks',
    'Mobile - Various Campus Locations',
    'Food Truck',
    'N/A',
    '{
        "monday": {"lunch": "11:00am-2:00pm"},
        "tuesday": {"lunch": "11:00am-2:00pm"},
        "wednesday": {"lunch": "11:00am-2:00pm"},
        "thursday": {"lunch": "11:00am-2:00pm"},
        "friday": {"lunch": "11:00am-2:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'LATIN',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Sister Liu''s',
    'Authentic Chinese dumplings and traditional dishes.',
    '{"phone": "919-000-0002"}',
    'food_trucks',
    'Mobile - Various Campus Locations',
    'Food Truck',
    'N/A',
    '{
        "monday": {"lunch": "11:00am-2:00pm"},
        "tuesday": {"lunch": "11:00am-2:00pm"},
        "wednesday": {"lunch": "11:00am-2:00pm"},
        "thursday": {"lunch": "11:00am-2:00pm"},
        "friday": {"lunch": "11:00am-2:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'CHINESE',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
);
