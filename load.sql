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
    'american',
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
    'american',
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
    'american',
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
    'mediterranean',
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
    'american',
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
    'american',
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
    'mexican',
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
    'latin',
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
    'chinese',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
-- Additional East & Central Campus Locations
(
    'Cafe 300',
    'Convenient café located at 300 Swift offering breakfast, lunch, and dinner options with mobile ordering available.',
    '{"phone": "919-660-3987"}',
    'east_central_campus',
    '300 Swift Avenue',
    '300 Swift',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-9:00pm"},
        "tuesday": {"breakfast": "7:00am-9:00pm"},
        "wednesday": {"breakfast": "7:00am-9:00pm"},
        "thursday": {"breakfast": "7:00am-9:00pm"},
        "friday": {"breakfast": "7:00am-10:00pm"},
        "saturday": {"breakfast": "9:00am-10:00pm"},
        "sunday": {"breakfast": "9:00am-9:00pm"}
    }',
    'american',
    ARRAY['food_points', 'meal_swipe', 'board_plan', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Freeman Center Cafe',
    'Kosher dining facility serving the Duke Jewish community with traditional and contemporary kosher options.',
    '{"phone": "919-660-3988"}',
    'east_central_campus',
    'Freeman Center for Jewish Life',
    'Freeman Center',
    'Main Level',
    '{
        "monday": {"dinner": "4:00pm-7:30pm"},
        "tuesday": {"dinner": "4:00pm-7:30pm"},
        "wednesday": {"dinner": "4:00pm-7:30pm"},
        "thursday": {"dinner": "4:00pm-7:30pm"},
        "friday": null,
        "saturday": null,
        "sunday": null
    }',
    'american',
    ARRAY['food_points', 'meal_swipe', 'board_plan']::paymentmethod[],
    ARRAY['kosher', 'vegetarian']::dietarytag[]
),
(
    'Nasher Cafe',
    'Café located in the Nasher Museum of Art offering light meals, coffee, and pastries in an artistic setting.',
    '{"phone": "919-660-3989"}',
    'east_central_campus',
    'Nasher Museum of Art',
    'Nasher Museum',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-4:00pm"},
        "tuesday": {"lunch": "11:00am-4:00pm"},
        "wednesday": {"lunch": "11:00am-4:00pm"},
        "thursday": {"lunch": "11:00am-4:00pm"},
        "friday": {"lunch": "11:00am-4:00pm"},
        "saturday": {"lunch": "11:00am-4:00pm"},
        "sunday": {"lunch": "11:00am-4:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card', 'cash']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Terrace Cafe',
    'Scenic café located in the Sarah P. Duke Gardens offering snacks, beverages, and light meals.',
    '{"phone": "919-660-3990"}',
    'east_central_campus',
    'Sarah P. Duke Gardens',
    'Duke Gardens',
    'Terrace Level',
    '{
        "monday": {"lunch": "10:00am-4:00pm"},
        "tuesday": {"lunch": "10:00am-4:00pm"},
        "wednesday": {"lunch": "10:00am-4:00pm"},
        "thursday": {"lunch": "10:00am-4:00pm"},
        "friday": {"lunch": "10:00am-4:00pm"},
        "saturday": {"lunch": "10:00am-4:00pm"},
        "sunday": {"lunch": "10:00am-4:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card', 'cash']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
-- Additional West Campus - Brodhead Center Locations
(
    'Ginger + Soy',
    'Asian fusion restaurant featuring fresh ingredients and bold flavors with stir-fry and noodle dishes.',
    '{"phone": "919-660-3991"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'asian',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Gyotaku',
    'Japanese restaurant specializing in fresh sushi, sashimi, and traditional Japanese cuisine.',
    '{"phone": "919-660-3992"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'japanese',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
),
(
    'JB''s Roasts & Chops',
    'Steakhouse-style restaurant offering premium roasts, chops, and grilled meats with classic sides.',
    '{"phone": "919-660-3993"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"dinner": "5:00pm-9:00pm"},
        "tuesday": {"dinner": "5:00pm-9:00pm"},
        "wednesday": {"dinner": "5:00pm-9:00pm"},
        "thursday": {"dinner": "5:00pm-9:00pm"},
        "friday": {"dinner": "5:00pm-9:00pm"},
        "saturday": {"dinner": "5:00pm-9:00pm"},
        "sunday": {"dinner": "5:00pm-9:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY[]::dietarytag[]
),
(
    'Sazon',
    'Latin American restaurant featuring authentic flavors from across Latin America with fresh ingredients.',
    '{"phone": "919-660-3994"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'latin',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Cafe',
    'Casual café offering coffee, pastries, sandwiches, and light meals throughout the day.',
    '{"phone": "919-660-3995"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-9:00pm"},
        "tuesday": {"breakfast": "7:00am-9:00pm"},
        "wednesday": {"breakfast": "7:00am-9:00pm"},
        "thursday": {"breakfast": "7:00am-9:00pm"},
        "friday": {"breakfast": "7:00am-9:00pm"},
        "saturday": {"breakfast": "8:00am-9:00pm"},
        "sunday": {"breakfast": "8:00am-9:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card', 'apple_pay', 'google_pay']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Sprout',
    'Plant-based restaurant focusing on fresh, organic, and sustainable vegetarian and vegan options.',
    '{"phone": "919-660-3996"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'organic', 'local_sourced', 'sustainable']::dietarytag[]
),
(
    'Tandoor',
    'Indian restaurant featuring traditional tandoori cooking, curries, and authentic Indian cuisine.',
    '{"phone": "919-660-3997"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'indian',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free', 'halal']::dietarytag[]
),
(
    'The Chef''s Kitchen',
    'Interactive dining experience featuring chef demonstrations, cooking classes, and rotating themed menus.',
    '{"phone": "919-660-3998"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"dinner": "5:00pm-8:00pm"},
        "tuesday": {"dinner": "5:00pm-8:00pm"},
        "wednesday": {"dinner": "5:00pm-8:00pm"},
        "thursday": {"dinner": "5:00pm-8:00pm"},
        "friday": {"dinner": "5:00pm-8:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'local_sourced']::dietarytag[]
),
(
    'The Commons',
    'All-you-care-to-eat dining hall featuring diverse stations with global cuisines and made-to-order options.',
    '{"phone": "919-660-3999"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-10:00am", "lunch": "11:00am-2:00pm", "dinner": "5:00pm-9:00pm"},
        "tuesday": {"breakfast": "7:00am-10:00am", "lunch": "11:00am-2:00pm", "dinner": "5:00pm-9:00pm"},
        "wednesday": {"breakfast": "7:00am-10:00am", "lunch": "11:00am-2:00pm", "dinner": "5:00pm-9:00pm"},
        "thursday": {"breakfast": "7:00am-10:00am", "lunch": "11:00am-2:00pm", "dinner": "5:00pm-9:00pm"},
        "friday": {"breakfast": "7:00am-10:00am", "lunch": "11:00am-2:00pm", "dinner": "5:00pm-9:00pm"},
        "saturday": {"brunch": "10:00am-2:00pm", "dinner": "5:00pm-9:00pm"},
        "sunday": {"brunch": "10:00am-2:00pm", "dinner": "5:00pm-9:00pm"}
    }',
    'american',
    ARRAY['food_points', 'meal_swipe', 'board_plan']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'nut_free', 'local_sourced']::dietarytag[]
),
(
    'The Devil''s Krafthouse',
    'Craft pub and grill offering burgers, wings, craft beers, and classic American pub fare.',
    '{"phone": "919-660-4000"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-10:00pm"},
        "tuesday": {"lunch": "11:00am-10:00pm"},
        "wednesday": {"lunch": "11:00am-10:00pm"},
        "thursday": {"lunch": "11:00am-10:00pm"},
        "friday": {"lunch": "11:00am-10:00pm"},
        "saturday": {"lunch": "11:00am-10:00pm"},
        "sunday": {"lunch": "11:00am-10:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Farmstead',
    'Farm-to-table restaurant featuring locally sourced ingredients and seasonal menus with Southern influences.',
    '{"phone": "919-660-4001"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'southern',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'local_sourced', 'sustainable', 'organic']::dietarytag[]
),
(
    'Il Forno',
    'Italian restaurant specializing in wood-fired pizzas, pasta, and authentic Italian cuisine.',
    '{"phone": "919-660-4002"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-8:00pm"},
        "tuesday": {"lunch": "11:00am-8:00pm"},
        "wednesday": {"lunch": "11:00am-8:00pm"},
        "thursday": {"lunch": "11:00am-8:00pm"},
        "friday": {"lunch": "11:00am-8:00pm"},
        "saturday": {"lunch": "11:00am-8:00pm"},
        "sunday": {"lunch": "11:00am-8:00pm"}
    }',
    'italian',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Panera Bread',
    'Nationally recognized bakery-café chain offering fresh-baked bread, soups, salads, and sandwiches.',
    '{"phone": "919-660-4003"}',
    'west_campus',
    'Brodhead Center',
    'Brodhead Center',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-9:00pm"},
        "tuesday": {"breakfast": "7:00am-9:00pm"},
        "wednesday": {"breakfast": "7:00am-9:00pm"},
        "thursday": {"breakfast": "7:00am-9:00pm"},
        "friday": {"breakfast": "7:00am-9:00pm"},
        "saturday": {"breakfast": "8:00am-9:00pm"},
        "sunday": {"breakfast": "8:00am-9:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card', 'apple_pay', 'google_pay']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
-- Additional West Campus - Bryan Center Locations
(
    'Beyu Blue Coffee',
    'Local coffee shop offering specialty coffee, pastries, sandwiches, and light meals with a focus on community.',
    '{"phone": "919-660-4004"}',
    'west_campus',
    'Bryan Center',
    'Bryan Center',
    'Plaza Level',
    '{
        "monday": {"breakfast": "7:00am-8:00pm"},
        "tuesday": {"breakfast": "7:00am-8:00pm"},
        "wednesday": {"breakfast": "7:00am-8:00pm"},
        "thursday": {"breakfast": "7:00am-8:00pm"},
        "friday": {"breakfast": "7:00am-8:00pm"},
        "saturday": {"breakfast": "8:00am-8:00pm"},
        "sunday": {"breakfast": "8:00am-8:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card', 'apple_pay', 'google_pay']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'McDonald''s',
    'World-famous fast food chain offering burgers, fries, chicken, and breakfast items with mobile ordering available.',
    '{"phone": "919-660-4005"}',
    'west_campus',
    'Bryan Center',
    'Bryan Center',
    'Plaza Level',
    '{
        "monday": {"breakfast": "6:00am-11:00pm"},
        "tuesday": {"breakfast": "6:00am-11:00pm"},
        "wednesday": {"breakfast": "6:00am-11:00pm"},
        "thursday": {"breakfast": "6:00am-11:00pm"},
        "friday": {"breakfast": "6:00am-11:00pm"},
        "saturday": {"breakfast": "6:00am-11:00pm"},
        "sunday": {"breakfast": "6:00am-11:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card', 'apple_pay', 'google_pay']::paymentmethod[],
    ARRAY[]::dietarytag[]
),
(
    'Gothic Grill',
    'Campus grill offering burgers, sandwiches, fries, and classic American comfort food with late-night hours.',
    '{"phone": "919-660-4006"}',
    'west_campus',
    'Bryan Center',
    'Bryan Center',
    'Plaza Level',
    '{
        "monday": {"lunch": "11:00am-11:00pm"},
        "tuesday": {"lunch": "11:00am-11:00pm"},
        "wednesday": {"lunch": "11:00am-11:00pm"},
        "thursday": {"lunch": "11:00am-12:00am"},
        "friday": {"lunch": "11:00am-12:00am"},
        "saturday": {"lunch": "11:00am-12:00am"},
        "sunday": {"lunch": "11:00am-11:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
-- Additional West Campus - Other Locations
(
    'The Daily Docket',
    'Café located in the Duke Law School offering coffee, pastries, sandwiches, and light meals for law students and faculty.',
    '{"phone": "919-660-4007"}',
    'west_campus',
    'Duke Law School',
    'Law School',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-5:00pm"},
        "tuesday": {"breakfast": "7:00am-5:00pm"},
        "wednesday": {"breakfast": "7:00am-5:00pm"},
        "thursday": {"breakfast": "7:00am-5:00pm"},
        "friday": {"breakfast": "7:00am-5:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Red Mango',
    'Frozen yogurt and smoothie bar offering nonfat yogurt, smoothie bowls, fresh fruit, and healthy snack options.',
    '{"phone": "919-660-4008"}',
    'west_campus',
    'Wilson Recreation Center',
    'Wilson Gym',
    'Main Level',
    '{
        "monday": {"lunch": "10:00am-9:00pm"},
        "tuesday": {"lunch": "10:00am-9:00pm"},
        "wednesday": {"lunch": "10:00am-9:00pm"},
        "thursday": {"lunch": "10:00am-9:00pm"},
        "friday": {"lunch": "10:00am-9:00pm"},
        "saturday": {"lunch": "10:00am-9:00pm"},
        "sunday": {"lunch": "10:00am-9:00pm"}
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Saladelia at Sanford',
    'Salad and deli café located in the Sanford School of Public Policy offering fresh salads, sandwiches, wraps, and coffee.',
    '{"phone": "919-660-4009"}',
    'west_campus',
    'Sanford Institute for Public Policy',
    'Sanford School',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-5:00pm"},
        "tuesday": {"breakfast": "7:00am-5:00pm"},
        "wednesday": {"breakfast": "7:00am-5:00pm"},
        "thursday": {"breakfast": "7:00am-5:00pm"},
        "friday": {"breakfast": "7:00am-5:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'mediterranean',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'organic']::dietarytag[]
),
(
    'Saladelia at Perkins Library',
    'Salad and deli café located in Perkins Library offering fresh salads, sandwiches, wraps, and coffee for study breaks.',
    '{"phone": "919-660-4010"}',
    'west_campus',
    'Perkins Library',
    'Perkins Library',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-10:00pm"},
        "tuesday": {"breakfast": "7:00am-10:00pm"},
        "wednesday": {"breakfast": "7:00am-10:00pm"},
        "thursday": {"breakfast": "7:00am-10:00pm"},
        "friday": {"breakfast": "7:00am-8:00pm"},
        "saturday": {"breakfast": "9:00am-8:00pm"},
        "sunday": {"breakfast": "9:00am-10:00pm"}
    }',
    'mediterranean',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'organic']::dietarytag[]
),
(
    'Twinnie''s',
    'Irish pub-style café located in CIEMAS offering breakfast pastries, made-to-order sandwiches, fresh salads, and coffee.',
    '{"phone": "919-660-4011"}',
    'west_campus',
    'CIEMAS',
    'CIEMAS',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-5:00pm"},
        "tuesday": {"breakfast": "7:00am-5:00pm"},
        "wednesday": {"breakfast": "7:00am-5:00pm"},
        "thursday": {"breakfast": "7:00am-5:00pm"},
        "friday": {"breakfast": "7:00am-5:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Zweli''s',
    'Family-operated café serving authentic Southern African cuisine with piri piri flavors, featuring vegan, vegetarian, and meat options. Voted #1 Restaurant in Durham for Vegans and Vegetarians.',
    '{"phone": "919-660-4012"}',
    'west_campus',
    'Duke Divinity School',
    'Divinity School',
    'Main Level',
    '{
        "monday": {"lunch": "11:00am-3:00pm"},
        "tuesday": {"lunch": "11:00am-3:00pm"},
        "wednesday": {"lunch": "11:00am-3:00pm"},
        "thursday": {"lunch": "11:00am-3:00pm"},
        "friday": {"lunch": "11:00am-3:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'southern',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Bseisu',
    'Coffee shop offering locally-brewed coffee from Cocoa Cinnamon and Little Waves Coffee Roasters, along with bakery items and snacks.',
    '{"phone": "919-660-4013"}',
    'west_campus',
    'Wilkinson Building',
    'Wilkinson Building',
    'Main Level',
    '{
        "monday": {"breakfast": "7:00am-5:00pm"},
        "tuesday": {"breakfast": "7:00am-5:00pm"},
        "wednesday": {"breakfast": "7:00am-5:00pm"},
        "thursday": {"breakfast": "7:00am-5:00pm"},
        "friday": {"breakfast": "7:00am-5:00pm"},
        "saturday": null,
        "sunday": null
    }',
    'american',
    ARRAY['food_points', 'duke_card', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'local_sourced']::dietarytag[]
),
-- Additional Merchants-On-Points Locations
(
    'Bulkogi @ The Can Opener',
    'Korean barbecue restaurant offering authentic Korean dishes including bulgogi, bibimbap, and traditional Korean cuisine for delivery.',
    '{"phone": "919-000-0003"}',
    'merchants_on_points',
    'Off Campus - Delivery Only',
    'Delivery',
    'N/A',
    '{
        "monday": {"delivery": "5:00pm-9:00pm"},
        "tuesday": {"delivery": "5:00pm-9:00pm"},
        "wednesday": {"delivery": "5:00pm-9:00pm"},
        "thursday": {"delivery": "5:00pm-9:00pm"},
        "friday": {"delivery": "5:00pm-9:00pm"},
        "saturday": {"delivery": "5:00pm-9:00pm"},
        "sunday": {"delivery": "5:00pm-9:00pm"}
    }',
    'korean',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
),
(
    'Devil''s Pizzeria',
    'Local pizzeria offering New York-style pizza, calzones, and Italian favorites for delivery to campus.',
    '{"phone": "919-286-3090"}',
    'merchants_on_points',
    'Off Campus - Delivery Only',
    'Delivery',
    'N/A',
    '{
        "monday": {"delivery": "4:30pm-9:30pm"},
        "tuesday": {"delivery": "4:30pm-9:30pm"},
        "wednesday": {"delivery": "4:30pm-9:30pm"},
        "thursday": {"delivery": "4:30pm-9:30pm"},
        "friday": {"delivery": "4:30pm-9:30pm"},
        "saturday": {"delivery": "4:30pm-9:30pm"},
        "sunday": {"delivery": "4:30pm-9:30pm"}
    }',
    'italian',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Enzo''s Pizza Co.',
    'Family-owned pizzeria offering authentic Italian pizza, pasta, and Italian-American favorites for delivery.',
    '{"phone": "919-309-3696"}',
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
    'italian',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Mediterra Grill',
    'Mediterranean restaurant offering fresh Greek and Mediterranean cuisine including gyros, kebabs, and salads for delivery.',
    '{"phone": "919-383-0066"}',
    'merchants_on_points',
    'Off Campus - Delivery Only',
    'Delivery',
    'N/A',
    '{
        "monday": {"delivery": "5:00pm-10:00pm"},
        "tuesday": {"delivery": "5:00pm-10:00pm"},
        "wednesday": {"delivery": "5:00pm-10:00pm"},
        "thursday": {"delivery": "5:00pm-10:00pm"},
        "friday": {"delivery": "5:00pm-10:00pm"},
        "saturday": {"delivery": "5:00pm-10:00pm"},
        "sunday": {"delivery": "5:00pm-10:00pm"}
    }',
    'mediterranean',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free', 'halal']::dietarytag[]
),
(
    'Sake Bomb',
    'Japanese restaurant and sushi bar offering fresh sushi, sashimi, Japanese entrees, and sake for delivery.',
    '{"phone": "919-401-4488"}',
    'merchants_on_points',
    'Off Campus - Delivery Only',
    'Delivery',
    'N/A',
    '{
        "monday": {"delivery": "5:00pm-9:00pm"},
        "tuesday": null,
        "wednesday": {"delivery": "5:00pm-9:00pm"},
        "thursday": {"delivery": "5:00pm-9:00pm"},
        "friday": {"delivery": "5:00pm-10:00pm"},
        "saturday": {"delivery": "5:00pm-10:00pm"},
        "sunday": {"delivery": "5:00pm-9:00pm"}
    }',
    'japanese',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
),
(
    'Sushi Love',
    'Japanese restaurant specializing in fresh sushi, rolls, and Japanese cuisine for delivery to campus.',
    '{"phone": "919-309-2401"}',
    'merchants_on_points',
    'Off Campus - Delivery Only',
    'Delivery',
    'N/A',
    '{
        "sunday": {"delivery": "6:00pm-9:30pm"},
        "monday": {"delivery": "6:00pm-9:30pm"},
        "tuesday": {"delivery": "6:00pm-9:30pm"},
        "wednesday": {"delivery": "6:00pm-9:30pm"},
        "thursday": {"delivery": "6:00pm-10:30pm"},
        "friday": {"delivery": "6:00pm-10:30pm"},
        "saturday": {"delivery": "6:00pm-10:30pm"}
    }',
    'japanese',
    ARRAY['food_points']::paymentmethod[],
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
),
-- Additional Food Trucks
(
    'Bulkogi',
    'Korean barbecue food truck offering authentic Korean dishes including bulgogi, bibimbap, and Korean street food.',
    '{"phone": "919-000-0004"}',
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
    'korean',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'gluten_free']::dietarytag[]
),
(
    'Gussy''s',
    'Food truck offering Greek and Mediterranean street food including gyros, souvlaki, and Greek salads.',
    '{"phone": "919-000-0005"}',
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
    'mediterranean',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'halal']::dietarytag[]
),
(
    'Magnificent Concessions',
    'Food truck specializing in gourmet cupcakes, desserts, and sweet treats for special occasions.',
    '{"phone": "919-000-0006"}',
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
    'american',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'The Flat Drum',
    'Food truck offering creative flatbreads, wraps, and drum-style sandwiches with fresh ingredients.',
    '{"phone": "919-000-0007"}',
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
    'american',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Latin Effect',
    'Food truck offering Latin American street food including tacos, empanadas, and Latin-inspired dishes.',
    '{"phone": "919-000-0008"}',
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
    'latin',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Yalla',
    'Food truck offering Middle Eastern street food including falafel, shawarma, and Mediterranean-inspired dishes.',
    '{"phone": "919-000-0009"}',
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
    'middle_eastern',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'halal', 'gluten_free']::dietarytag[]
),
(
    'Sister Liu''s Kitchen',
    'Authentic Chinese food truck specializing in handmade dumplings, Chinese burgers (Rou Jia Mo), and noodles.',
    '{"phone": "919-000-0010", "website": "https://sisterliuskitchen.com"}',
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
    'chinese',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Bon Fritay',
    'Haitian food truck offering traditional Haitian street food including griot (fried pork), rice bowls, and plantains.',
    '{"phone": "919-000-0011", "website": "https://bonfritaytruck.com"}',
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
    'latin',
    ARRAY['food_points', 'cash', 'credit_card']::paymentmethod[],
    ARRAY['gluten_free']::dietarytag[]
),

-- =============================================
-- OFF-CAMPUS VENDORS (Near Duke University)
-- =============================================

-- 9th Street District
(
    'Elmo''s Diner',
    'Classic American diner popular with Duke students, known for breakfast and homestyle cooking since 1991.',
    '{"phone": "919-416-3823", "website": "https://elmosdiner.com", "address": "776 9th St, Durham, NC 27705"}',
    'off_campus',
    '776 9th St, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": {"breakfast": "7:00am-2:30pm"},
        "tuesday": {"breakfast": "7:00am-2:30pm"},
        "wednesday": {"breakfast": "7:00am-2:30pm"},
        "thursday": {"breakfast": "7:00am-2:30pm"},
        "friday": {"breakfast": "7:00am-2:30pm"},
        "saturday": {"breakfast": "8:00am-2:30pm"},
        "sunday": {"breakfast": "8:00am-2:30pm"}
    }',
    'american',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Banh''s Cuisine',
    'Authentic Vietnamese and Chinese restaurant on 9th Street, a Durham staple since 1990.',
    '{"phone": "919-286-2888", "address": "750 9th St, Durham, NC 27705"}',
    'off_campus',
    '750 9th St, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": {"lunch": "11:00am-9:00pm"},
        "tuesday": {"lunch": "11:00am-9:00pm"},
        "wednesday": {"lunch": "11:00am-9:00pm"},
        "thursday": {"lunch": "11:00am-9:00pm"},
        "friday": {"lunch": "11:00am-9:30pm"},
        "saturday": {"lunch": "11:00am-9:30pm"},
        "sunday": {"lunch": "12:00pm-9:00pm"}
    }',
    'asian',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Kiichi Ramen',
    'Japanese ramen and izakaya bar offering authentic ramen bowls and Japanese small plates.',
    '{"phone": "984-377-3442", "website": "https://kiichiramenonline.com", "address": "730 9th St, Durham, NC 27705"}',
    'off_campus',
    '730 9th St, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": null,
        "tuesday": {"lunch": "11:30am-2:30pm", "dinner": "5:00pm-9:00pm"},
        "wednesday": {"lunch": "11:30am-2:30pm", "dinner": "5:00pm-9:00pm"},
        "thursday": {"lunch": "11:30am-2:30pm", "dinner": "5:00pm-9:00pm"},
        "friday": {"lunch": "11:30am-2:30pm", "dinner": "5:00pm-9:30pm"},
        "saturday": {"lunch": "11:30am-2:30pm", "dinner": "5:00pm-9:30pm"},
        "sunday": {"lunch": "11:30am-2:30pm", "dinner": "5:00pm-9:00pm"}
    }',
    'japanese',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),
(
    'Monuts',
    'Popular cafe known for homemade donuts, breakfast sandwiches, and baked goods.',
    '{"phone": "919-286-2642", "website": "https://monutsdonuts.com", "address": "1002 9th St, Durham, NC 27705"}',
    'off_campus',
    '1002 9th St, Durham, NC 27705',
    'Cafe',
    'N/A',
    '{
        "monday": {"breakfast": "7:00am-2:00pm"},
        "tuesday": {"breakfast": "7:00am-2:00pm"},
        "wednesday": {"breakfast": "7:00am-2:00pm"},
        "thursday": {"breakfast": "7:00am-2:00pm"},
        "friday": {"breakfast": "7:00am-2:00pm"},
        "saturday": {"breakfast": "8:00am-2:00pm"},
        "sunday": {"breakfast": "8:00am-2:00pm"}
    }',
    'american',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Panera Bread - 9th Street',
    'Fast-casual bakery-cafe chain serving soups, salads, sandwiches, and fresh-baked bread.',
    '{"phone": "919-286-5556", "website": "https://panerabread.com", "address": "737 9th St, Durham, NC 27705"}',
    'off_campus',
    '737 9th St, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": {"all_day": "6:30am-9:00pm"},
        "tuesday": {"all_day": "6:30am-9:00pm"},
        "wednesday": {"all_day": "6:30am-9:00pm"},
        "thursday": {"all_day": "6:30am-9:00pm"},
        "friday": {"all_day": "6:30am-9:00pm"},
        "saturday": {"all_day": "7:00am-9:00pm"},
        "sunday": {"all_day": "7:00am-8:00pm"}
    }',
    'american',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan']::dietarytag[]
),

-- Brightleaf Square / Downtown Durham
(
    'Toast',
    'Popular Italian sandwich shop known for paninis, tramezzini, and artisan sandwiches.',
    '{"phone": "919-683-2183", "website": "https://toast-fivepoints.com", "address": "345 W Main St, Durham, NC 27701"}',
    'off_campus',
    '345 W Main St, Durham, NC 27701',
    'Restaurant',
    'N/A',
    '{
        "monday": {"lunch": "11:00am-2:45pm"},
        "tuesday": {"lunch": "11:00am-2:45pm"},
        "wednesday": {"lunch": "11:00am-2:45pm"},
        "thursday": {"lunch": "11:00am-2:45pm"},
        "friday": {"lunch": "11:00am-2:45pm"},
        "saturday": {"lunch": "11:30am-2:45pm"},
        "sunday": null
    }',
    'italian',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian']::dietarytag[]
),
(
    'Zweli''s',
    'Zimbabwean restaurant offering South African cuisine including peri peri chicken and African-inspired dishes.',
    '{"phone": "919-251-9555", "website": "https://zwelis.com", "address": "905 W Main St, Durham, NC 27701"}',
    'off_campus',
    '905 W Main St, Durham, NC 27701',
    'Restaurant',
    'N/A',
    '{
        "monday": null,
        "tuesday": {"lunch": "11:00am-3:00pm", "dinner": "5:00pm-9:00pm"},
        "wednesday": {"lunch": "11:00am-3:00pm", "dinner": "5:00pm-9:00pm"},
        "thursday": {"lunch": "11:00am-3:00pm", "dinner": "5:00pm-9:00pm"},
        "friday": {"lunch": "11:00am-3:00pm", "dinner": "5:00pm-10:00pm"},
        "saturday": {"lunch": "11:00am-3:00pm", "dinner": "5:00pm-10:00pm"},
        "sunday": {"brunch": "11:00am-3:00pm"}
    }',
    'middle_eastern',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'gluten_free', 'halal']::dietarytag[]
),

-- Chain Restaurants Near Duke
(
    'Chipotle - Erwin Road',
    'Fast-casual Mexican restaurant known for customizable burritos, bowls, tacos, and salads.',
    '{"phone": "919-383-7887", "website": "https://chipotle.com", "address": "2608 Erwin Rd, Durham, NC 27705"}',
    'off_campus',
    '2608 Erwin Rd, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": {"all_day": "10:45am-10:00pm"},
        "tuesday": {"all_day": "10:45am-10:00pm"},
        "wednesday": {"all_day": "10:45am-10:00pm"},
        "thursday": {"all_day": "10:45am-10:00pm"},
        "friday": {"all_day": "10:45am-10:00pm"},
        "saturday": {"all_day": "10:45am-10:00pm"},
        "sunday": {"all_day": "10:45am-10:00pm"}
    }',
    'mexican',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY['vegetarian', 'vegan', 'gluten_free']::dietarytag[]
),
(
    'Chick-fil-A - Hillsborough Road',
    'Popular fast food chain specializing in chicken sandwiches and nuggets.',
    '{"phone": "919-383-8420", "website": "https://chick-fil-a.com", "address": "3429 Hillsborough Rd, Durham, NC 27705"}',
    'off_campus',
    '3429 Hillsborough Rd, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": {"all_day": "6:30am-10:00pm"},
        "tuesday": {"all_day": "6:30am-10:00pm"},
        "wednesday": {"all_day": "6:30am-10:00pm"},
        "thursday": {"all_day": "6:30am-10:00pm"},
        "friday": {"all_day": "6:30am-10:00pm"},
        "saturday": {"all_day": "6:30am-10:00pm"},
        "sunday": null
    }',
    'american',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY[]::dietarytag[]
),
(
    'Cookout',
    'Budget-friendly fast food chain popular with Duke students for burgers, BBQ, and milkshakes.',
    '{"phone": "919-286-7297", "address": "2501 Hillsborough Rd, Durham, NC 27705"}',
    'off_campus',
    '2501 Hillsborough Rd, Durham, NC 27705',
    'Restaurant',
    'N/A',
    '{
        "monday": {"all_day": "10:30am-3:00am"},
        "tuesday": {"all_day": "10:30am-3:00am"},
        "wednesday": {"all_day": "10:30am-3:00am"},
        "thursday": {"all_day": "10:30am-3:00am"},
        "friday": {"all_day": "10:30am-4:00am"},
        "saturday": {"all_day": "10:30am-4:00am"},
        "sunday": {"all_day": "10:30am-3:00am"}
    }',
    'american',
    ARRAY['cash', 'credit_card']::paymentmethod[],
    ARRAY[]::dietarytag[]
);
