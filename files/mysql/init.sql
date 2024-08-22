CREATE SCHEMA food;
USE food;

CREATE TABLE restaurant (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE menu_item (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    image_link VARCHAR(255),
    restaurant_id BIGINT,
    price DECIMAL(10,2)
);


-- Restaurants
INSERT INTO restaurant (name, email)
VALUES
    ('Desi Delight', 'desidelight@example.com'),
    ('Spicy Sensation', 'spicysensation@example.com'),
    ('Tandoori Grill', 'tandoorigrill@example.com'),
    ('Taco Mahal', 'tacomahal@example.com'),
    ('Biryani Bliss', 'biryanibliss@example.com');

-- Menu items for Restaurant 1
INSERT INTO menu_item (name, description, image_link, restaurant_id, price)
VALUES
    ('Paneer Tikka', 'Grilled paneer with spices', 'https://example.com/paneertikka.jpg', 1, 250.00),
    ('Butter Naan', 'Soft and buttery naan', 'https://example.com/butternaan.jpg', 1, 40.00),
    ('Dal Makhani', 'Rich lentil curry', 'https://example.com/dalmakhani.jpg', 1, 180.00),
    ('Chole Bhature', 'Spicy chickpeas with fried bread', 'https://example.com/cholebhature.jpg', 1, 150.00),
    ('Lassi', 'Refreshing yogurt drink', 'https://example.com/lassi.jpg', 1, 60.00);

-- Menu items for Restaurant 2
INSERT INTO menu_item (name, description, image_link, restaurant_id, price)
VALUES
    ('Chicken Biryani', 'Aromatic rice with chicken', 'https://example.com/chickenbiryani.jpg', 2, 220.00),
    ('Mutton Rogan Josh', 'Spicy mutton curry', 'https://example.com/muttonroganjosh.jpg', 2, 320.00),
    ('Tandoori Roti', 'Whole wheat flatbread', 'https://example.com/tandooriroti.jpg', 2, 30.00),
    ('Raita', 'Yogurt with cucumbers', 'https://example.com/raita.jpg', 2, 40.00),
    ('Gulab Jamun', 'Sweet syrupy dessert', 'https://example.com/gulabjamun.jpg', 2, 80.00);

-- Menu items for Restaurant 3
INSERT INTO menu_item (name, description, image_link, restaurant_id, price)
VALUES
    ('Tandoori Chicken', 'Spicy grilled chicken', 'https://example.com/tandoorichicken.jpg', 3, 280.00),
    ('Fish Tikka', 'Grilled fish with spices', 'https://example.com/fishtikka.jpg', 3, 350.00),
    ('Naan', 'Soft Indian flatbread', 'https://example.com/naan.jpg', 3, 40.00),
    ('Palak Paneer', 'Cottage cheese in spinach gravy', 'https://example.com/palakpaneer.jpg', 3, 200.00),
    ('Mango Lassi', 'Mango-flavored yogurt drink', 'https://example.com/mangolassi.jpg', 3, 70.00);

-- Menu items for Restaurant 4
INSERT INTO menu_item (name, description, image_link, restaurant_id, price)
VALUES
    ('Aloo Tikki', 'Spicy potato patties', 'https://example.com/alootikki.jpg', 4, 50.00),
    ('Pav Bhaji', 'Spicy mashed vegetables with bread', 'https://example.com/pavbhaji.jpg', 4, 120.00),
    ('Pani Puri', 'Crispy puris filled with spicy water', 'https://example.com/panipuri.jpg', 4, 40.00),
    ('Dahi Puri', 'Crispy puris with yogurt and chutneys', 'https://example.com/dahipuri.jpg', 4, 50.00),
    ('Masala Chai', 'Spiced tea', 'https://example.com/masalachai.jpg', 4, 20.00);

-- Menu items for Restaurant 5
INSERT INTO menu_item (name, description, image_link, restaurant_id, price)
VALUES
    ('Hyderabadi Biryani', 'Spicy and aromatic rice with meat', 'https://example.com/hyderabadibiryani.jpg', 5, 250.00),
    ('Chicken 65', 'Spicy deep-fried chicken', 'https://example.com/chicken65.jpg', 5, 200.00),
    ('Veg Biryani', 'Aromatic rice with mixed vegetables', 'https://example.com/vegbiryani.jpg', 5, 180.00),
    ('Mirchi Ka Salan', 'Spicy chili curry', 'https://example.com/mirchikasalan.jpg', 5, 150.00),
    ('Falooda', 'Sweet dessert with milk and vermicelli', 'https://example.com/falooda.jpg', 5, 100.00);



select * from food.menu_item;


DELETE FROM menu_item WHERE id = 32;
# DELETE FROM menu_item WHERE id = 27;
# DELETE FROM menu_item WHERE id = 28;
# DELETE FROM menu_item WHERE id = 29;
# DELETE FROM menu_item WHERE id = 30;



# TRUNCATE TABLE menu_item;

# TRUNCATE TABLE restaurant;
