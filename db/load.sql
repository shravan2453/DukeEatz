-- Sample data for reviews table
-- Note: This assumes you have users, vendors, and menu_items tables already populated
-- Adjust the IDs based on your actual data

INSERT INTO reviews (user_id, vendor_id, menu_item_id, rating, review_text, created_at) VALUES
(1, 1, 1, 5, 'The Duke Burger is amazing! Best on campus! The patty is perfectly cooked and the toppings are fresh.', '2025-10-20 12:30:00-04'),
(2, 1, 2, 4, 'Chicken tenders were crispy and juicy. Great portion size too! Would definitely order again.', '2025-10-21 13:15:00-04'),
(3, 2, 3, 3, 'Pizza was okay, crust could be crispier. The sauce was good though.', '2025-10-22 18:30:00-04'),
(1, 2, NULL, 5, 'Love this place! Great atmosphere and quick service. Highly recommend!', '2025-10-23 19:45:00-04'),
(2, 3, 5, 4, 'Fresh salad with great ingredients. A bit pricey but worth it for the quality.', '2025-10-24 11:30:00-04'),
(3, 3, 6, 2, 'Caesar salad was too salty for my taste. The dressing needs improvement.', '2025-10-25 12:15:00-04'),
(1, 1, 1, 5, 'Second time ordering the Duke Burger and it never disappoints! Best burger on campus.', '2025-10-26 14:00:00-04'),
(2, 2, 4, 4, 'Pepperoni pizza is solid. Good cheese to sauce ratio. Will order again.', '2025-10-26 18:20:00-04');
