
CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE User_number (
    User_ID INT NOT NULL,
    Phone_Number VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Cart (
    Cart_ID INT PRIMARY KEY ,
    Total_Item INT,
    Total_Price DECIMAL(10,2),
    Creation_Date DATE,
    Status VARCHAR(20),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    Stock_Quantity INT
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Status VARCHAR(20),
    Shipping_Address TEXT,
    Total_Amount DECIMAL(10,2),
    User_ID INT,
    Cart_ID INT,
    FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Order_Item (
    Item_Number INT PRIMARY KEY,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Line_total DECIMAL(10,2)
);

CREATE TABLE Contain (
    Order_ID INT,
    Item_Number INT,
    PRIMARY KEY (Order_ID, Item_Number),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Item_Number) REFERENCES Order_Item(Item_Number)
);

CREATE TABLE Includes (
    Item_Number INT,
    Product_ID INT,
    PRIMARY KEY (Item_Number, Product_ID),
    FOREIGN KEY (Item_Number) REFERENCES Order_Item(Item_Number),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Shipment (
    Order_ID INT,
    Product_ID INT,
    User_ID INT,
    PRIMARY KEY (Order_ID, Product_ID, User_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);


INSERT INTO Users VALUES
(202401, 'Manar', 'Alzubaidi', 'manar.z@example.com', 'Al Qunfudhah, District AL khaldya'),
(202402, 'Lamar', 'Alshaikhi', 'lamar.s@example.com', 'Al Qunfudhah, District AL shati'),
(202403, 'Lamar', 'Alkhairi', 'lamar.k@example.com', 'Al Qunfudhah, District AL khaldya'),
(202404, 'Mais', 'Alshaikhi', 'mais.s@example.com', 'Al Qunfudhah, District AL azhar'),
(202405, 'Maram', 'Alharbi', 'maram.h@example.com', 'Riyadh, District Al Yasmin '),
(202406, 'Rama', 'Algumaidi', 'rama.g@example.com', 'Jeddah, District Al Rawdah'),
(202407, 'Mohammed','Alshahri', 'mohammed.s@example.com', 'Khobar, District Al Aqrabiyah'),
(202408, 'Faisal', 'Alshahri', 'faisal.s@example.com', 'Riyadh, District Al Malqa '),
(202409, 'Ahmed', 'Altamimi', 'ahmed.t@example.com', 'Jeddah,District Al Salamah '),
(202410, 'Saif', 'Alosaimi', 'saif.o@example.com', 'Khobar, District Al Ulaya '),
(202411, 'Noura', 'Saud', 'noura.s@example.com', 'Riyadh,District Al Narjis ');


INSERT INTO User_number VALUES
(202401, '0501112223'),
(202402, '0504445556'),
(202403, '0507778889'),
(202404, '0509990001'),
(202405, '0551112233'),
(202406, '0552223344'),
(202407, '0553334455'),
(202408, '0554445566'),
(202409, '0555556677'),
(202410, '0556667788'),
(202411, '0557778899');

UPDATE User_number
SET Phone_Number = '0507788999'
WHERE User_ID = 202403;


INSERT INTO Cart VALUES
(501, 3, 450.50, '2026-05-10', 'Active', 202401),
(502, 1, 120.00, '2026-05-11', 'Pending', 202402),
(503, 5, 980.00, '2026-05-12', 'Completed', 202403),
(504, 2, 315.75, '2026-05-13', 'Active', 202404),
(505, 2, 2150.00, '2026-05-14', 'Active', 202405),
(506, 1, 150.00, '2026-05-14', 'Pending', 202406),
(507, 4, 3200.00, '2026-05-14', 'Completed', 202407),
(508, 3, 900.00, '2026-05-15', 'Active', 202408),
(509, 2, 750.00, '2026-05-15', 'Pending', 202409),
(510, 5, 4100.00, '2026-05-15', 'Completed', 202410),
(511, 1, 2000.00, '2026-05-15', 'Active', 202411);


INSERT INTO Product VALUES
(101, 'Laptop', 2000.00, 'Electronics', 50),
(102, 'Mouse', 150.00, 'Electronics', 100),
(103, 'Gaming Chair', 600.00, 'Furniture', 30),
(104, 'Keyboard', 250.00, 'Electronics', 80),
(105, 'Monitor', 1200.00, 'Electronics', 40),
(106, 'Desk', 850.00, 'Furniture', 20),
(107, 'Headset', 300.00, 'Electronics', 60),
(108, 'Printer', 950.00, 'Electronics', 25),
(109, 'Tablet', 1800.00, 'Electronics', 35),
(110, 'Bookshelf', 400.00, 'Furniture', 15),
(111, 'Smartphone', 3500.00, 'Electronics', 45);


INSERT INTO Orders VALUES
(8001, '2026-05-12', 'Shipped', 'Al Qunfudhah, District AL khaldya', 2000.00, 202401, 501),
(8002, '2026-05-13', 'Processing', 'Al Qunfudhah, District AL shati', 145.00, 202404, 504),
(8003, '2026-05-14', 'Shipped', 'Riyadh, District Al Yasmin ', 2150.00, 202405, 505),
(8004, '2026-05-14', 'Processing', 'Jeddah, District Al Rawdah', 150.00, 202406, 506),
(8005, '2026-05-14', 'Delivered', 'Khobar, District Al Aqrabiyah ', 3200.00, 202407, 507),
(8006, '2026-05-15', 'Shipped', 'Riyadh, District Al Malqa ', 900.00, 202408, 508),
(8007, '2026-05-15', 'Processing', 'Jeddah, District Al Salamah ', 750.00, 202409, 509),
(8008, '2026-05-15', 'Delivered', 'Khobar, District Al Ulaya ', 4100.00, 202410, 510),
(8009, '2026-05-15', 'Shipped', 'Riyadh, District Al Narjis ', 2000.00, 202411, 511);


INSERT INTO Order_Item VALUES
(1, 1, 2000.00, 0.00, 2000.00),
(2, 1, 150.00, 5.00, 145.00),
(3, 1, 2150.00, 0.00, 2150.00),
(4, 1, 150.00, 0.00, 150.00),
(5, 2, 1600.00, 0.00, 3200.00),
(6, 3, 300.00, 0.00, 900.00),
(7, 1, 750.00, 0.00, 750.00),
(8, 2, 2050.00, 0.00, 4100.00),
(9, 1, 2000.00, 0.00, 2000.00);


INSERT INTO Contain VALUES
(8001, 1),
(8002, 2),
(8003, 3),
(8004, 4),
(8005, 5),
(8006, 6),
(8007, 7),
(8008, 8),
(8009, 9);


INSERT INTO Includes VALUES
(1, 101),
(2, 102),
(3, 105),
(4, 102),
(5, 111),
(6, 107),
(7, 106),
(8, 109),
(9, 101);


INSERT INTO Shipment VALUES
(8001, 101, 202401),
(8002, 102, 202404),
(8003, 105, 202405),
(8004, 102, 202406),
(8005, 111, 202407),
(8006, 107, 202408),
(8007, 106, 202409),
(8008, 109, 202410),
(8009, 101, 202411);


SELECT * FROM Users;

SELECT * FROM User_number;

SELECT * FROM Cart;

SELECT * FROM Product;

SELECT * FROM Orders;

SELECT * FROM Order_Item;

SELECT * FROM Contain;

SELECT * FROM Includes;

SELECT * FROM Shipment;

-- رقم العميل و سلته 
SELECT User_ID, Cart_ID
FROM Cart;
  
SELECT Users.Fname,
       SUM(Orders.Total_Amount) AS Total_Orders
FROM Orders, Users
WHERE Orders.User_ID = Users.User_ID
GROUP BY Users.Fname
HAVING SUM(Orders.Total_Amount) > 300;

-- اليوزر ايدي حق صاحب هذا الطلب 
SELECT User_ID
FROM Orders
WHERE Order_ID = 8002;
-- اجيب ايميل العميل 
SELECT Email
FROM Users
WHERE User_ID = (
    SELECT User_ID
    FROM Orders
    WHERE Order_ID = 8002
);
-- مجموع مستريات منار وميس
SELECT Users.Fname,
       SUM(Orders.Total_Amount) AS Total_Orders
FROM Users
INNER JOIN Orders
ON Users.User_ID = Orders.User_ID
WHERE Users.Fname IN ('Manar', 'Mais')
GROUP BY Users.Fname;

-- GROUP BY + ORDER BY  من  التوتل ارتب العميل تنازلي 
SELECT User_ID,
       SUM(Total_Amount) AS Total_Spent
FROM Orders
GROUP BY User_ID
ORDER BY Total_Spent DESC;

-- BETWEEN اجيب الي بين
SELECT Order_ID,
       Total_Amount
FROM Orders
WHERE Total_Amount BETWEEN 1000 AND 3000;

-- MAX اغلى منتج
SELECT Product_Name,
       Price
FROM Product
WHERE Price = (
    SELECT MAX(Price)
    FROM Product
);

-- MIN ارخص
SELECT Product_Name,
       Price
FROM Product
WHERE Price = (
    SELECT MIN(Price)
    FROM Product
);

-- اكثر منتج انطلب
SELECT Product.Product_Name, SUM(Order_Item.Quantity) AS Total_Ordered 
FROM Product 
JOIN Includes ON Product.Product_ID = Includes.Product_ID 
JOIN Order_Item ON Includes.Item_Number = Order_Item.Item_Number 
GROUP BY Product.Product_Name 
ORDER BY Total_Ordered DESC;