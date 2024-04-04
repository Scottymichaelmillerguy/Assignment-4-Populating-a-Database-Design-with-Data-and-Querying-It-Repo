/* Drop all the tables and start fresh*/

BEGIN

-- this will drop the tables and constraints that refer to the table (CASCADE CONSTRAINTS)
FOR c IN (SELECT table_name FROM user_tables) LOOP
EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
END LOOP;

-- this will drop sequences aka generators for surrogate keys (may or may not be necessary)
FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
END LOOP;

END;
/



--Create all tables
DROP TABLE IF EXISTS Grocery_Store;
CREATE TABLE Grocery_Store (
    store_id INT PRIMARY KEY,
    name VARCHAR2(100),
    store_state CHAR(2),
    store_city VARCHAR2(100)
   
);
DROP TABLE IF EXISTS Item;
CREATE TABLE Item (
    item_id INT PRIMARY KEY,
    item_desc VARCHAR2(100),
    item_creation_date DATE,
    item_expiration_date DATE,
    item_price DECIMAL,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Grocery_Store(store_id) ON DELETE CASCADE ON UPDATE CASCADE

);
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    manager_id INT,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Grocery_Store(store_id) ON DELETE CASCADE ON UPDATE CASCADE
    
    
);
--An ALTER TABLE statement
ALTER TABLE Employee
ADD employee_name VARCHAR2(100) ;


--Insert data into all of the tables
/* INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3,...)
*/

--Oracle does not allow multiple inserts at once
INSERT INTO grocery_store (store_id, name, store_state, store_city)
VALUES
(1001, 'Lunds', 'MN', 'Minneapolis');


INSERT INTO grocery_store (store_id, name, store_state, store_city)
VALUES
(1002, 'Trader Joes', 'MN', 'St. Louis Park');
INSERT INTO grocery_store (store_id, name, store_state, store_city)
VALUES
(1003, 'Kroger', 'OH', 'Columbus');


INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (1, "Apple", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 1.99, 1002);
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (1, "Apple", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 2.29, 1001);
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (1, "Apple", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 2.59, 1003);
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (2, "Pear", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), 2.03, 1002);
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (2, "Pear", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), 2.24, 1001);
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (2, "Pear", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), 2.37, 1003);
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (3, "Orange", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-17', 'YYYY-MM-DD'), 1.00, 1002)
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (3, "Orange", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-17', 'YYYY-MM-DD'), 1.05, 1001)
INSERT INTO item (item_id, item_desc, item_creation_date, item_expiration_date, item_price, store_id)
VAlUES (3, "Orange", TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-17', 'YYYY-MM-DD'), 1.19, 1003)

INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (101, NULL, 1001, 'Manny');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (201, 101, 1001, 'Emmy');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (202, 101, 1001, 'Lenny');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (203, 101, 1001, 'Denny');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (204, 101, 1001, 'Tammy');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (102, NULL, 1002, 'Emanuel');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (221, 102, 1002, 'Benny');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (222, 102, 1002, 'Cindy');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (223, 102, 1002, 'Danny');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (224, 102, 1002, 'Tammy');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (103, NULL, 1003, 'Emmit');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (241, 102, 1003, 'Ben');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (242, 102, 1003, 'Carly');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (243, 102, 1003, 'Daniel');
INSERT INTO Employee (employee_id, manager_id, store_id, employee_name)
VALUES (244, 102, 1003, 'Tammy');

--An UPDATE statement
UPDATE Item 
SET price = 1.29 
WHERE item_id = 1
AND store_id = 1002; 

--A Create VIEW statement a select with a join
DROP VIEW IF EXISTS store_item_vw;
CREATE VIEW store_item_vw AS 
SELECT * FROM grocery_store g
INNER JOIN ON item i 
ON g.store_id = i.store_id;

SELECT * FROM store_item_vw;

--DELETE prevented by CASCADE
DELETE FROM grocery_store WHERE store_id = 1001;