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
VALUES  ('Dove Shampoo', 'Cosmetics', 5.75, 500),
		('Dove Conditioner', 'Cosmetics', 6.25, 627),
		('Glad 12 Gal Trash Bags', 'Grocery', 5.99, 300),
		('Brawny Paper Towels', 'Grocery', 4.25, 400),
		('Granny Smith Apples', 'Produce', 0.35, 800),
		('Chiquita Bannana', 'Produce', 0.20, 10000),
		('Tropicana Orange Juice', 'Grocery', 4.45, 267),
		('Horizon Organic Milk', 'Grocery', 4.50, 200),
		('Charmin Toiler Paper', 'Grocery', 12.99, 575),
		('Pampers Baby Wipes', 'Children', 1.50, 423),
		('Yoga Mat', 'Sports', 12.75, 150),
		('5lb Dumb bell', 'Sports', 7.99, 89),
		('Tie Dye Shirt', 'Clothing', 5.55, 120),
		('Nike Shorts', 'Clothing', 17.88, 250),
		('Fancy Feast Wet Cat Food', 'Pet', 12.50, 163),
		('Ibuprophen', 'Pharmacy', 4.95, 389),
		('Band Aid', 'Pharmacy', 3.25, 550);