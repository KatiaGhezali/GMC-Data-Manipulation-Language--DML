
-- Previous Code to Create Tables
CREATE TABLE Product (
    Product_id VARCHAR2(20) PRIMARY KEY,
    Product_name VARCHAR2(20) NOT NULL,
    Price NUMBER CHECK (Price > 0)
);

CREATE TABLE Customer (
    Customer_id VARCHAR2(20) PRIMARY KEY,
    Customer_Name VARCHAR2(20) NOT NULL,
    Customer_Tel NUMBER
);

CREATE TABLE Orders (
    Customer_id VARCHAR2(20),
    Product_id VARCHAR2(20),
    Quantity NUMBER,
    Total_amount NUMBER,
    PRIMARY KEY (Customer_id, Product_id),
    FOREIGN KEY (Customer_id)
        REFERENCES Customer(Customer_id),
    FOREIGN KEY (Product_id)
        REFERENCES Product(Product_id)
);

ALTER TABLE Product
ADD Category VARCHAR2(20);

ALTER TABLE Orders
ADD OrderDate DATE DEFAULT SYSDATE;

-- New Insertion Code

-- Insert products
INSERT INTO Product (Product_id, Product_name, Category, Price)
VALUES ('P01', 'Samasung Galaxy S20', 'Smartphone', 3299);

INSERT INTO Product (Product_id, Product_name, Category, Price)
VALUES ('P02', 'ASUS Notebook', 'PC', 4599);


-- Insert customers
INSERT INTO Customer (Customer_id, Customer_Name, Customer_Tel)
VALUES ('C01', 'ALI', 71321009);

INSERT INTO Customer (Customer_id, Customer_Name, Customer_Tel)
VALUES ('C02', 'ASMA', 77345823);


-- Insert orders
INSERT INTO Orders (Customer_id, Product_id, OrderDate, Quantity, Total_amount)
VALUES ('C01', 'P02', NULL, 2, 9198);

INSERT INTO Orders (Customer_id, Product_id, OrderDate, Quantity, Total_amount)
VALUES ('C02', 'P01', TO_DATE('28/05/2020', 'DD/MM/YYYY'), 1, 3299);

-- tests
-- Display all products
SELECT * FROM Product;

-- Display all customers
SELECT * FROM Customer;

-- Display all orders
SELECT * FROM Orders;