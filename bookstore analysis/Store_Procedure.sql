USE book_data;

DELIMITER $$

CREATE PROCEDURE bookid_1()
BEGIN
	SELECT *
	FROM Order_items
	WHERE product_id = 1;
END $$

DELIMITER ;


call bookid_1