-- 1. Maak de database (schema) genaamd ShopDB aan
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- 2. Maak de tabel Products aan
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(100),
    Price INT NOT NULL,
    WarehouseAmount INT NOT NULL
);

-- 3. Maak de tabel Customers aan
CREATE TABLE Customers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(100)
);

-- 4. Maak de tabel Orders aan (gerelateerd aan Customers)
CREATE TABLE Orders (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Date DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE SET NULL
);

-- 5. Maak de tabel OrderItems aan (gerelateerd aan Orders en Products)
CREATE TABLE OrderItems (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(ID) ON DELETE SET NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE SET NULL
);
