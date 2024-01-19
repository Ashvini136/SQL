-- 1) Display products with a stock quantity below 50.
SELECT ProductID, ProductName, StockQuantity
FROM Products
WHERE StockQuantity < 50;

-- 2) Calculate Total Payments Received
SELECT SUM(Amount) AS TotalPaymentsReceived FROM Payments;


-- 3) Find Customers with Highest Order Amount
SELECT Customers.CustomerID, FirstName, LastName, Email, SUM(TotalAmount) AS TotalPurchaseAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID
ORDER BY TotalPurchaseAmount DESC
LIMIT 3;

-- 4) Display orders that have not been paid
SELECT Orders.OrderID, OrderDate, TotalAmount
FROM Orders
LEFT JOIN Payments ON Orders.OrderID = Payments.OrderID
WHERE Payments.PaymentID IS NULL;


-- 5) Get product details for a  orderid 3

SELECT OrderItems.OrderID, ProductName, Quantity, Subtotal
FROM OrderItems
JOIN Products ON OrderItems.ProductID = Products.ProductID
WHERE OrderItems.OrderID = 3;


-- 6) Display all orders placed by a  customer having id 5

SELECT OrderID, OrderDate, TotalAmount
FROM Orders
WHERE CustomerID = 5;

-- 7) Identify products that are ordered most frequently.


-- 8) orders placed from 15 th jan to 25 th jan 2024

SELECT OrderID, OrderDate, TotalAmount
FROM Orders
WHERE OrderDate BETWEEN '2024-01-15' AND '2024-01-25';

-- 9) Find products that are out of stock.

SELECT ProductID, ProductName
FROM Products
WHERE StockQuantity = 0;

-- 10) Get payments made on a date 22-01-2024

SELECT PaymentID, PaymentDate, Amount
FROM Payments
WHERE PaymentDate = '2024-01-22';













