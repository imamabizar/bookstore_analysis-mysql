-- first time using View statement
-- we create view for customer who located in 'Jepara'

CREATE VIEW customer_jepara AS
SELECT customer_id, fist_name, last_name, city
FROM Customers
WHERE city = 'Jepara';

SELECT *
FROM customer_jepara;


CREATE VIEW Customer_Order AS
SELECT 
	c.customer_id, fist_name, last_name, order_id
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id;

-- CREATE OR REPLACE VIEW
-- insert value into a View, but it also added to original table
INSERT INTO customer_jepara (customer_id, fist_name, last_name, city)
	VALUES (136, 'azar', 'sumbang', 'Jepara');
    
-- deleting a row from a View, but it also deleted from the original table
DELETE FROM customer_jepara
WHERE customer_id = 136;

-- WITH CHECK OPTION
CREATE VIEW customer_jakarta AS 
SELECT customer_id, fist_name, last_name, city
FROM Customers
WHERE city = 'Jakarta'
WITH CHECK OPTION;

INSERT INTO customer_jakarta (customer_id, fist_name, last_name, city)
	VALUES (136, 'benjamin', 'makar', 'Jakarta');

DELETE FROM customer_jakarta
WHERE customer_id = 136;


