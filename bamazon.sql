DROP DATABASE IF EXISTS bamazon_DB;

-- Create a MySQL Database called `bamazon`
CREATE DATABASE bamazon_DB;
USE bamazon_DB;

-- Create a Table inside of the database called `products` with following columns:
CREATE TABLE products (
-- item_id (unique id for each product)
	item_id INTEGER NOT NULL AUTO_INCREMENT,
-- product_name (Name of product)
	product_name VARCHAR(255) NOT NULL,
-- department_name
	department_name VARCHAR(255) NOT NULL,
-- price (cost to customer)
	price DECIMAL(10,2) NOT NULL,
-- stock_quantity (how much of the product is available in stores)
	stock_quantity INTEGER NOT NULL,
	PRIMARY KEY (item_id)
);

-- Populate this database with around 10 different products. (i.e. Insert "mock" data rows into this database and table). --
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES  
		('Apple', 'Fruit', 0.35, 200),
		('Baby Wipes', 'Children', 2.50, 400),
		('Band Aid', 'Pharmacy', 3.00, 250),
		('Banana', 'Fruit', 0.25, 100),
		('Conditioner', 'Cosmetics', 6.00, 300),
        ("Curtains", "Home", 39.99, 30),
		('Dumb bell', 'Sports', 9.99, 100),
		('Ibuprophen', 'Pharmacy', 4.95, 389),
        ("iPhone X Case", "Electronics", 14.99, 100),
	    ('Jacket', 'Clothing', 27.99, 30),
		('Milk', 'Grocery', 2.50, 60),
		('Orange Juice', 'Grocery', 5.45, 40),
		('Paper Towels', 'Grocery', 6.25, 100),
        ('Shampoo', 'Cosmetics', 5.50, 300),
		('Shorts', 'Clothing', 17.99, 90),
        ("Tent", "Outdoor", 80.00, 40),
		('Toiler Paper', 'Grocery', 10.99, 275),
		('Yoga Mat', 'Sports', 9.75, 25);