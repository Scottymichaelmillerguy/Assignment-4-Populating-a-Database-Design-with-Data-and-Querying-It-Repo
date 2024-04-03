CREATE TABLE Grocery_Store (
    store_id INT PRIMARY KEY,
    name VARCHAR2(100),
    store_state CHAR(2),
    store_city VARCHAR2(100)
   
)

CREATE TABLE Item (
    item_id INT PRIMARY KEY,
    item_desc VARCHAR2(100),
    item_creation_date DATE,
    item_expiration_date DATE,
    item_price DECIMAL,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Grocery_Store(store_id)

)

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    manager_id INT,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Grocery_Store(store_id)
    
    
)

