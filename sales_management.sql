/* SQL DDL */

CREATE DATABASE sales_management;
USE  sales_management;


CREATE TABLE SalesPerson (
    SalesPersonID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL
);

CREATE TABLE [State] (
    StateID INT IDENTITY(1,1) PRIMARY KEY,
    StateName VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(30) NOT NULL,
    StateId INT NOT NULL,
	FOREIGN KEY (StateId) REFERENCES [State](StateID)
);

CREATE TABLE [Order] (
    OrderNumber INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE NOT NULL,
	SalesPersonID INT NOT NULL,
    CustomerID INT NOT NULL,
	FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE OrderDetail (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderNumber INT NOT NULL,
    Item VARCHAR(40) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderNumber) REFERENCES [Order](OrderNumber)
);



/* SQL DML */

INSERT INTO SalesPerson (FirstName, LastName) VALUES 
('Kamran', 'Aliyev'),
('Aysel', 'Huseynova'),
('Elchin', 'Ibrahimov'),
('Nigar', 'Rustamova'),
('Rashad', 'Mammadov'),
('Sevinj', 'Aliyeva'),
('Farid', 'Ismayilov'),
('Lala', 'Guliyeva'),
('Emin', 'Hasanov'),
('Narmina', 'Tagiyeva'),
('Nijat', 'Rahimov'),
('Jale', 'Sadigova'),
('Vugar', 'Gurbanov'),
('Aygun', 'Mikayilova'),
('Sabina', 'Taghizade'),
('Eldar', 'Orujov'),
('Aida', 'Aliyeva'),
('Javid', 'Abdullayev'),
('Natiq', 'Kazimov'),
('Ilkin', 'Gafarov'),
('Gunel', 'Nasirova'),
('Elvin', 'Valiyev'),
('Ulkar', 'Babayeva'),
('Tural', 'Kerimov'),
('Mehriban', 'Qasimova');


INSERT INTO State (StateName) VALUES
('California'),
('Texas'),
('Florida'),
('New York'),
('Pennsylvania'),
('Illinois'),
('Ohio'),
('Georgia'),
('North Carolina'),
('Michigan'),
('New Jersey'),
('Virginia'),
('Washington'),
('Arizona'),
('Massachusetts'),
('Tennessee'),
('Indiana'),
('Missouri'),
('Maryland'),
('Wisconsin'),
('Colorado'),
('Minnesota'),
('South Carolina'),
('Alabama'),
('Louisiana');

INSERT INTO Customer (CustomerName, StateID) VALUES
('Nigar Abbasova', 13), ('Ramil Valiyev', 12), ('Eldar Jafarov', 7), 
('Aygun Ismayilova', 4), ('Kamran Hajiyev', 5), ('Leyla Mammadova', 6), 
('Javid Huseynov', 3), ('Gunel Sadigova', 9), ('Elvin Mammadov', 9), 
('Narmin Jafarova', 10), ('Tural Qurbanov', 14), ('Aytan Rasulova', 15), 
('Ilkin Nasirov', 1), ('Aysel Karimova', 14), ('Farid Mustafayev', 12), 
('Zaur Taghizade', 16), ('Jale Javadova', 17), ('Arzu Mirzayeva', 17), 
('Fuad Kazimov', 19), ('Ulviya Alizade', 20), ('Toghrul Hajiyev', 22), 
('Gunay Qasimova', 24), ('Rustam Rahimov', 20), ('Sevinj Orujova', 19), 
('Eldaniz Sadigov', 23);

INSERT INTO [Order] (OrderDate, CustomerID, SalesPersonID) VALUES
('2024-02-01', 1, 4), ('2024-02-15', 2, 4), ('2024-02-23', 3, 4), 
('2024-04-21', 4, 15), ('2024-04-12', 5, 12), ('2024-04-17', 6, 12), 
('2024-05-14', 7, 16), ('2024-05-14', 8, 12), ('2024-05-18', 9, 7), 
('2024-07-25', 10, 13), ('2024-07-04', 11, 13), ('2024-07-15', 12, 13), 
('2024-08-20', 13, 19), ('2024-08-17', 14, 19), ('2024-08-19', 15, 19), 
('2024-09-23', 16, 16), ('2024-09-14', 17, 15), ('2024-09-28', 18, 18), 
('2024-09-30', 19, 16), ('2024-10-22', 20, 16), ('2024-10-19', 21, 24), 
('2024-11-06', 22, 13), ('2024-12-13', 23, 22), ('2024-12-23', 24, 6), 
('2024-12-16', 23, 2);


INSERT INTO OrderDetail (OrderNumber, Item, Quantity, Price) VALUES
(1, 'Iphone 15 Pro', 3, 900.00), 
(2, 'Samsung Book3 Edge', 2, 950.00), 
(3, 'Samsung Book3 Edge', 3, 950.00), 
(4, 'AMD Graphics Card', 1, 300.00), 
(5, 'Ipad Pro 2022', 2, 900.00), 
(6, 'Ipad Pro 2021', 1, 750.00), 
(7, 'Kanon Printer', 1, 250.00), 
(8, 'White Desk', 4, 225.00), 
(9, 'Samsung Smartwatch', 1, 570.00), 
(10, 'Apple Airpods', 3, 350.00), 
(11, 'AMD Graphics Card', 2, 500.00), 
(12, 'ASUS Rog Laptop', 4, 1600.00), 
(13, 'Samsung Smartwatch', 2, 450.00), 
(14, 'Apple Vision Pro VR', 1, 3300.00), 
(15, 'Meta VR', 1, 500.00), 
(16, 'Gaming Keyboard', 1, 300.00), 
(17, 'Bluetooth Speaker', 12, 100.00), 
(18, 'PS 5', 1, 700.00), 
(19, 'Nikon Camera', 2, 1400.00), 
(20, 'Redmi Power Bank', 4, 35.00), 
(21, 'Projector', 1, 640.00), 
(22, '256G Flash Drive', 7, 200.00), 
(23, 'Zebra HH Device', 1, 1110.00), 
(24, 'LG Tv', 10, 490.00), 
(25, '512 SSD', 6, 190.00);


/* View Customers and their sales person */
CREATE VIEW CustomerSalesPerson AS
SELECT 
    C.CustomerID,
    C.CustomerName,
    SP.FirstName AS SalesPersonFirstName,
    SP.LastName AS SalesPersonLastName
FROM 
    Customer C
JOIN 
    [Order] O ON C.CustomerID = O.CustomerID
JOIN 
    SalesPerson SP ON O.SalesPersonID = SP.SalesPersonID;


/* View most expensive item purchased by each customer */
CREATE VIEW MostExpensiveItemByCustomer AS
SELECT 
    C.CustomerID,
    C.CustomerName,
    OD.Item,
    OD.Price AS ItemPrice
FROM 
    Customer C
JOIN 
    [Order] O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetail OD ON O.OrderNumber = OD.OrderNumber
WHERE 
    OD.Price = (
        SELECT MAX(OD2.Price)
        FROM OrderDetail OD2
        JOIN [Order] O2 ON OD2.OrderNumber = O2.OrderNumber
        WHERE O2.CustomerID = C.CustomerID
    );


/* View most expensive item sold by each Sales Person */
CREATE VIEW MostExpensiveItemBySalesPerson AS
SELECT 
    SP.SalesPersonID,
    SP.FirstName AS SalesPersonFirstName,
    SP.LastName AS SalesPersonLastName,
    OD.Item,
    OD.Price AS ItemPrice
FROM 
    SalesPerson SP
JOIN 
    [Order] O ON SP.SalesPersonID = O.SalesPersonID
JOIN 
    Customer C ON O.CustomerID = C.CustomerID
JOIN 
    OrderDetail OD ON O.OrderNumber = OD.OrderNumber
WHERE 
    OD.Price = (
        SELECT MAX(OD2.Price)
        FROM OrderDetail OD2
        JOIN [Order] O2 ON OD2.OrderNumber = O2.OrderNumber
        WHERE O2.SalesPersonID = SP.SalesPersonID
    );


/* View total purchase amount of every item for all orders by each customer */
CREATE VIEW TotalPurchaseAmountByCustomer AS
SELECT 
    C.CustomerID,
    C.CustomerName,
    OD.Item,
    SUM(OD.Price * OD.Quantity) AS TotalPurchaseAmount
FROM 
    Customer C
JOIN 
    [Order] O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetail OD ON O.OrderNumber = OD.OrderNumber
GROUP BY 
    C.CustomerID, C.CustomerName, OD.Item;





/* Function - Convert Order Price from USD to Euro*/
CREATE FUNCTION dbo.ConvertUSDToEuro (@Price DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @ExchangeRate DECIMAL(10, 2) = 0.914;
    RETURN @Price * @ExchangeRate;
END;

/* Retrieve orders apply euro rate*/
SELECT 
    Item,
    Price,
    dbo.ConvertUSDToEuro(Price) AS PriceInEuro
FROM 
    OrderDetail;



/* Procedure to Insert a New Sales Person*/
CREATE PROCEDURE dbo.InsertSalesPerson
    @FirstName VARCHAR(30),
    @LastName VARCHAR(30)
AS
BEGIN
    INSERT INTO SalesPerson (FirstName, LastName)
    VALUES (@FirstName, @LastName);
END;



