create database Online_order;
use Online_order;
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderItems Table (to store products in each order)
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    CONSTRAINT FK_OrderItemOrder FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderItemProduct FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    CONSTRAINT FK_PaymentOrder FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Example data for Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210'),
    (3, 'Alice', 'Johnson', 'alice.johnson@email.com', '555-123-4567'),
    (4, 'Bob', 'Williams', 'bob.williams@email.com', '444-789-0123'),
    (5, 'Emily', 'Davis', 'emily.davis@email.com', '222-333-4444'),
    (6, 'Charlie', 'Brown', 'charlie.brown@email.com', '111-222-3333'),
    (7, 'Sophia', 'Miller', 'sophia.miller@email.com', '666-777-8888'),
    (8, 'David', 'Smith', 'david.smith@email.com', '999-000-1111'),
    (9, 'Eva', 'Anderson', 'eva.anderson@email.com', '777-888-9999'),
    (10, 'George', 'Taylor', 'george.taylor@email.com', '333-444-5555');

-- Example data for Products
INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES
    (1, 'Product A', 19.99, 100),
    (2, 'Product B', 29.99, 50),
    (3, 'Product C', 9.99, 200),
    (4, 'Product D', 14.99, 75),
    (5, 'Product E', 39.99, 30),
    (6, 'Product F', 49.99, 20),
    (7, 'Product G', 8.99, 150),
    (8, 'Product H', 24.99, 100),
    (9, 'Product I', 17.99, 80),
    (10, 'Product J', 12.99, 120);

-- Example data for Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2024-01-19', 49.98),
    (2, 2, '2024-01-20', 59.98),
    (3, 3, '2024-01-21', 79.95),
    (4, 4, '2024-01-22', 34.98),
    (5, 5, '2024-01-23', 99.99);

-- Example data for OrderItems
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Subtotal)
VALUES
    (1, 1, 1, 2, 39.98),
    (2, 1, 2, 1, 10.00),
    (3, 2, 3, 5, 49.95),
    (4, 3, 4, 3, 44.97),
    (5, 3, 5, 1, 39.99),
    (6, 4, 6, 2, 99.98),
    (7, 4, 7, 4, 35.96),
    (8, 5, 8, 1, 24.99),
    (9, 5, 9, 2, 35.98),
    (10, 5, 10, 3, 38.97);

-- Example data for Payments
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount)
VALUES
    (1, 1, '2024-01-20', 49.98),
    (2, 2, '2024-01-21', 59.98),
    (3, 3, '2024-01-22', 79.95),
    (4, 4, '2024-01-23', 34.98),
    (5, 5, '2024-01-24', 99.99);
