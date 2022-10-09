/*** question 1 
1. what is the total revenueof the bookstore?
2. write a query that determine which customer spent the most money?, and what book did they purchased?
3. what is the most sold book and the least sold book?
4. Which region's customers buy books the most? 
4. 
***/

USE book_data;
-- 1. write a query that determine which customer spent the most money? and what book did they purchased?

WITH best_consumer AS (
	SELECT 
		c.customer_id, c.fist_name, c.last_name,
		SUM(unit_price * quantity) AS 'total_spend'
	FROM Customers c
	JOIN Orders o 
		ON o.customer_id = c.customer_id
	JOIN Order_items oi
		ON oi.order_id = o.order_id
	JOIN book_info bi
		ON bi.book_id = oi.product_id
	GROUP BY 1,2,3
	ORDER BY total_spend DESC
	LIMIT 10
)
SELECT 
	c.customer_id, c.fist_name, c.last_name, oi.product_id, bi.book_name, bi.price_IDR
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Order_items oi ON oi.order_id = o.order_id
JOIN book_info bi ON bi.book_id = oi.product_id
JOIN best_consumer bc ON bc.customer_id = c.customer_id;

-- 2. what is the most sold book and the least sold book?
SELECT 
	oi.product_id, 
    bi.book_name,
    COUNT(*) AS TOTAL
FROM order_items oi
JOIN book_info bi ON oi.product_id = bi.book_id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1;

SELECT 
	oi.product_id, 
    bi.book_name,
    COUNT(*) AS TOTAL
FROM order_items oi
JOIN book_info bi ON oi.product_id = bi.book_id
GROUP BY 1, 2
ORDER BY 3
LIMIT 1;

-- 3. Which region's customers buy books the most?
SELECT 
    province,
    COUNT(province) AS city
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
