/*
DATA CLEANING AND FORMATTING -
The following steps will be performed::
    - Removing Special Characters
	- Standardizing the data
	- Removing Duplicates
	- Handling Null or Missing Values
	- Removing unwanted column(s)
	 */

--- 1 COMPLETE CLEANING & FORMATTING OF CUSTOMERS TABLE
--- 1.1 Checking and Handling Null or Missing Values
SELECT *
FROM staging_customers
WHERE customer_id IS NULL 
   OR customer_id = ' ' 
   OR customer_name IS NULL 
   OR customer_name = ' ';

--- 1.2 Checking and Removing Duplicates  
WITH duplicate_customers AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id, customer_name) AS RN
FROM staging_customers)
SELECT *
FROM duplicate_customers
WHERE RN >1

--- 1.3 Checking and Removing Special Characters 
---  Checking for discrepancies (invalid) in customer_id.
SELECT customer_id FROM staging_orders
WHERE customer_id NOT IN (SELECT customer_id FROM staging_customers) 

UPDATE staging_customers
SET customer_id = TRIM(customer_id);

-- Checking customer_name
SELECT DISTINCT(customer_name)
FROM staging_customers
ORDER BY 1;

SELECT
customer_id, 
REGEXP_REPLACE(customer_name, '[^a-zA-Z  ]', '', 'g') AS cleaned_name
FROM staging_customers

UPDATE staging_customers
SET customer_name = TRIM(REGEXP_REPLACE(customer_name, '[^a-zA-Z  ]', '', 'g'))


--- 2 COMPLETE CLEANING & FORMATTING OF LOCATION TABLE
--- 2.1 Checking and Handling Null or Missing Values
SELECT *
FROM staging_location
WHERE postal_code IS NULL 
   OR TRIM(CAST(postal_code AS TEXT)) = ' ' 
   OR city IS NULL 
   OR city = ' '
   OR state IS NULL
   OR state = ' ' 
   OR region IS NULL 
   OR region = ' '
   OR country IS NULL
   OR country = ' ';
   
--- 2.2 Checking and Removing Duplicates
WITH duplicate_location AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY postal_code, city, state, region, country) AS RN
FROM staging_location)
SELECT *
FROM duplicate_location
WHERE RN >1

--- 2.3 Checking and Removing Special Characters   
--- Checking for discrepancies (invalid) in postal_code.
SELECT postal_code FROM staging_orders
WHERE postal_code NOT IN (SELECT postal_code FROM staging_location) 

-- Checking city
SELECT DISTINCT(city)
FROM staging_location
ORDER BY 1;

SELECT
postal_code, 
REGEXP_REPLACE(city, '[^a-zA-Z  ]', '', 'g') AS cleaned_city
FROM staging_location;

UPDATE staging_location
SET city = TRIM(REGEXP_REPLACE(city, '[^a-zA-Z  ]', '', 'g'));

-- Checking state
SELECT DISTINCT(state)
FROM staging_location
ORDER BY 1;

SELECT DISTINCT(state),
REGEXP_REPLACE(state, '[^a-zA-Z  ]', '', 'g') AS cleaned_state
FROM staging_location
ORDER BY 1;

UPDATE staging_location
SET state = TRIM(REGEXP_REPLACE(state, '[^a-zA-Z  ]', '', 'g'));

-- Checking region
SELECT DISTINCT(region)
FROM staging_location
ORDER BY 1;

-- Checking country
SELECT DISTINCT(country)
FROM staging_location
ORDER BY 1;


--- 3 COMPLETE CLEANING & FORMATTING OF PRODUCTS TABLE
--- 3.1 Checking and Handling Null or Missing Values
SELECT *
FROM staging_products
WHERE product_id IS NULL 
   OR product_id = ' '
   OR category IS NULL
   OR category = ' ' 
   OR sub_category IS NULL 
   OR sub_category = ' '
   OR product_name IS NULL
   OR product_name = ' ';

--- 3.2 Checking and Removing Duplicates
WITH duplicate_products AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_id, category, sub_category, product_name) AS RN
FROM staging_products)
SELECT *
FROM duplicate_products
WHERE RN >1
   
--- 3.3 Checking and Removing Special Characters 
--- Checking for discrepancies (invalid) in product_id.
SELECT product_id FROM staging_orders
WHERE product_id NOT IN (SELECT product_id FROM staging_products); 

-- Checking category
SELECT DISTINCT(category)
FROM staging_products
ORDER BY 1;

SELECT
product_id, 
REGEXP_REPLACE(category, '[^a-zA-Z  ]', '', 'g') AS cleaned_category
FROM staging_products;

UPDATE staging_products
SET category = TRIM(REGEXP_REPLACE(category, '[^a-zA-Z  ]', '', 'g'));

-- Checking sub_category
SELECT DISTINCT(sub_category)
FROM staging_products
ORDER BY 1;

SELECT DISTINCT(sub_category),
REGEXP_REPLACE(sub_category, '[^a-zA-Z  ]', '', 'g') AS cleaned_sub_category
FROM staging_products
ORDER BY 1;

UPDATE staging_products
SET sub_category = TRIM(REGEXP_REPLACE(sub_category, '[^a-zA-Z  ]', '', 'g'));

UPDATE staging_products
SET sub_category = 'Art'
WHERE sub_category ILIKE '%Art';


--- 4 COMPLETE CLEANING & FORMATTING OF ORDERS TABLE
--- 4.1 Removing Unwanted Columns
ALTER TABLE staging_orders
DROP COLUMN ship_date,
DROP COLUMN ship_mode;

--- 4.2 Checking and Handling Null or Missing Values
SELECT *
FROM staging_orders
WHERE order_id IS NULL 
   OR order_id = ' '
   OR order_date IS NULL
   OR TRIM(CAST(order_date AS TEXT)) = ' ' 
   OR customer_id IS NULL 
   OR customer_id = ' '
   OR segment IS NULL
   OR segment = ' '
   OR postal_code IS NULL 
   OR TRIM(CAST(postal_code AS TEXT)) = ' ' 
   OR product_id IS NULL 
   OR product_id = ' '
   OR sales IS NULL
   OR TRIM(CAST(sales AS TEXT)) = ' ' 
   OR quantity IS NULL 
   OR TRIM(CAST(quantity AS TEXT)) = ' '
   OR discount IS NULL
   OR TRIM(CAST(discount AS TEXT)) = ' '
   OR profit IS NULL
   OR TRIM(CAST(profit AS TEXT)) = ' ';

UPDATE staging_orders
SET discount = 0
WHERE discount IS Null;

--- 4.3 Checking and Removing Duplicates
WITH duplicate_orders AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id, order_date, customer_id, segment, 
              postal_code, product_id) AS RN
FROM staging_orders)
SELECT *
FROM duplicate_orders
WHERE RN >1

--- Creating a New Table from staging_orders Without Duplicates
CREATE TABLE staging_orders_2 AS
WITH duplicate_orders AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY order_id, order_date, customer_id, segment, 
              postal_code, product_id) AS RN
FROM staging_orders)
SELECT *
FROM duplicate_orders
WHERE RN  = 1

--- 4.4 Checking and Removing Special Characters 
--  Checking for discrepancies (invalid) in customer_id.
SELECT customer_id FROM staging_orders_2
WHERE customer_id NOT IN (SELECT customer_id FROM staging_customers) 

--- Checking for discrepancies (invalid) in postal_code.
SELECT postal_code FROM staging_orders_2
WHERE postal_code NOT IN (SELECT postal_code FROM staging_location) 

--- Checking for discrepancies (invalid) in product_id.
SELECT product_id FROM staging_orders_2
WHERE product_id NOT IN (SELECT product_id FROM staging_productions); 

-- Checking segment
SELECT DISTINCT(segment)
FROM staging_orders_2
ORDER BY 1;

SELECT
order_id, 
REGEXP_REPLACE(segment, '[^a-zA-Z  ]', '', 'g') AS cleaned_segment
FROM staging_orders_2;

UPDATE staging_orders_2
SET segment = TRIM(REGEXP_REPLACE(segment, '[^a-zA-Z  ]', '', 'g'));

SELECT *
FROM staging_orders_2
