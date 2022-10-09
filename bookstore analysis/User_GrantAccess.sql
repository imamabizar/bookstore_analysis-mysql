
-- USER
-- creating user exercise
CREATE USER 'jihan'@'localhost';
CREATE USER 'abizar'@'%';

-- delete user
DROP USER 'abizar'@'%';
DROP USER 'jihan'@'localhost';


-- GRANT ACCESS
-- .% mean that user able to see all the tables from the database in this case is 'book_data',
GRANT SELECT ON book_data.* TO 'jihan'@'localhost';
GRANT SELECT ON book_data.* TO 'abizar'@'%';
GRANT INSERT, UPDATE, DELETE ON book_data.* TO 'abizar'@'%';

SHOW GRANTS FOR 'jihan'@'localhost';
SHOW GRANTS FOR 'abizar'@'%';

-- revoke
REVOKE SELECT ON book_data.* FROM 'jihan'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON book_data.* FROM 'abizar'@'%';


-- give the user password
SET PASSWORD FOR 'jihan'@'localhost' = 'rahasia';
SET PASSWORD FOR 'abizar'@'%' = 'rahasia';
