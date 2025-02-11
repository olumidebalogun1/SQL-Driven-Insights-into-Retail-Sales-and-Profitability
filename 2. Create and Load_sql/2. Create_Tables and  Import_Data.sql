--- TABLE CREATION AND DATA IMPORT 

/*
Creating the following tables and 
importing CSV file data into the database:
   - customers
   - location
   - products
   - orders.
   */

-- 1.  CUSTOMERS TABLE:
CREATE TABLE customers (
    customer_id VARCHAR(15),
    customer_name VARCHAR(100),
    PRIMARY KEY (customer_id)
);

SELECT * 
FROM customers;       --- To view entered data

-- 2. LOCATION TABLE:
CREATE TABLE location (
    postal_code INT,
	city VARCHAR(100),
	state VARCHAR(100),
	region VARCHAR(50),
	country VARCHAR(50)
);

SELECT * 
FROM location;         --- To view entered data

-- 3.  PRODUCTS TABLE:
CREATE TABLE products (
    product_id VARCHAR(50),
	category VARCHAR(50),
	sub_category VARCHAR(50),
	product_name TEXT
); 

SELECT * 
FROM products;        --- To view entered data

-- 4.  ORDERS TABLE:
CREATE TABLE orders (
    order_id VARCHAR(20),
	order_date	DATE,
	ship_date DATE,
	ship_mode VARCHAR(50),
	customer_id	VARCHAR(50),
	segment	VARCHAR(50),
	postal_code INT,
	product_id VARCHAR(50),
	sales NUMERIC(10,2),
	quantity INT,
	discount NUMERIC(3,2),
	profit NUMERIC(10,2),
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
); 

SELECT * 
FROM orders
LIMIT 20;       --- To view entered data


--- 1. CREATING NEW TABLES FROM AN EXISTING TABLES USING STAGING:

-- staging_customers
CREATE TABLE staging_customers AS
SELECT *
FROM customers;

SELECT *
FROM staging_customers;     --- Running the staging table

-- staging_location
CREATE TABLE staging_location AS
SELECT *
FROM location;

SELECT *
FROM staging_location;     --- Running the staging table

-- staging_productions
CREATE TABLE staging_products AS
SELECT *
FROM products;

SELECT *
FROM staging_products;     --- Running the staging table

-- staging_orders
CREATE TABLE staging_orders AS
SELECT *
FROM orders;

SELECT *
FROM staging_orders;     --- Running the staging table

--- Adding Indexes to Speed Up Query Filtering 
CREATE INDEX idx_id_name ON staging_customers(customer_id, customer_name);
CREATE INDEX idx_postal_state ON staging_location(postal_code, state);
CREATE INDEX idx_productions ON staging_products(product_id, product_name);
CREATE INDEX idx_orders ON staging_orders(customer_id, order_date,postal_code);
