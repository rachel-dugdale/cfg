-- CREATE syntax - for databases and tables

CREATE DATABASE dbName;

USE dbName;

CREATE TABLE tableName (
    id INT NOT NULL,
    column_1_text VARCHAR(50) NOT NULL,
    column_2_number FLOAT(2)
);


-- INSERT syntax

INSERT INTO tableName (column_1_text,column_2_number)
VALUES ('some text',22);


-- SELECT syntax

SELECT * FROM tableName;

SELECT t.column_1_text, t.column_2_number FROM tableName t;

SELECT DISTINCT t.column_1_text FROM tableName t;

SELECT t.column_1_text FROM tableName t WHERE t.id < 10;


-- PRIMARY KEYS

CREATE TABLE secondTable (
    id INT PRIMARY KEY,
    column_1_text VARCHAR(50) NOT NULL,
    column_2_number FLOAT(2)
);


-- UPDATE syntax (to change values of an existing entry)

UPDATE tableName
SET
tableName.column_1_text = 'some new text string'
WHERE
tableName.id = 1;


-- DELETE syntax

DELETE FROM tableName
WHERE
tableName.id = 2;


-- Set PRIMARY KEY and FOREIGN KEYs

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    order_details VARCHAR(50),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customerTable(customer_id)
);


-- ALTER (to change table structure)

ALTER TABLE orders
ADD CONSTRAINT
fk_customer_id
FOREIGN KEY
(customer_id)
REFERENCES
customers
(customer_id);


-- DROP

DROP TABLE secondTable;
-- dropping won't work if the table you're trying to drop is referenced as a 
-- foreign key in another table

DROP DATABASE testDatabase;


-- Comparisons and sorting - advanced SELECT / WHERE statements

SELECT p.name, p.surname 
FROM person p
WHERE p.name = ‘Mary’
AND p.age > 25;

SELECT p.name, p.surname 
FROM person p
WHERE p.name = ‘Mary’
OR p.surname = ‘Smith’;

SELECT 
p.surname, p.email_address 
FROM person p
WHERE p.email_address IS NOT NULL;

SELECT c.name, c.surname 
FROM customers c
WHERE c.orders
BETWEEN 1 AND 5;

SELECT c.name, c.surname 
FROM customers c
WHERE c.name
IN (‘Mary’, ‘Julie’, ‘Katie’, ‘Jo’);

SELECT c.name, c.surname 
FROM customers c
WHERE c.name
LIKE 'M%';  -- selects names starting with M

SELECT 
COUNT(DISTINCT c.customer_name)
FROM customers c;

SELECT 
COUNT(c.name),
c.name
FROM customers c
GROUP BY c.name;

SELECT 
p.surname, p.name 
FROM person p
ORDER BY p.surname;






