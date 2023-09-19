#Group number: G05_Tues_10
#Group members: Peder Ørmen Bukaasen, Mohammed Idris Omar, Bård Tollef Pedersen.

# Task 1
SELECT * FROM Categories;

# Task 2
SELECT ProductName, QuantityPerUnit, UnitPrice FROM Products;

# Task 3
SELECT DISTINCT ContactTitle FROM customers;

# Task 4
SELECT DISTINCT Title FROM employees;

# Task 5
SELECT * FROM Orders WHERE OrderDate = '1996-05-17';

# Task 6
SELECT * FROM Orders WHERE OrderDate >= '1996-05-17'; 

# Task 7
SELECT * FROM Products WHERE UnitPrice > '40';

# Task 8
SELECT * FROM Products WHERE UnitPrice BETWEEN 30 AND 40;

# Task 9
SELECT OrderID, ContactName FROM Orders, Customers;

 # Task 10
SELECT Customers.ContactName, Customers.Address, Customers.City, Orders.OrderDate FROM Orders, Customers WHERE Orders.OrderDate = '1995-05-01' AND Customers.CustomerID = Orders.CustomerID;

 # Task 11    
SELECT * FROM Customers WHERE City = 'London' OR City = 'Buenos Aires';

# Task 12 
SELECT * FROM Customers WHERE Country = 'USA' AND NOT City = 'Portland';

# Task 13
SELECT * FROM orderdetails WHERE ProductID IN ( 
SELECT ProductID
FROM products
WHERE ProductName = 'Tofu'
);

# Task 14
SELECT employees.FirstName, employees.LastName FROM orders, employees WHERE orders.OrderID = 10369 AND employees.EmployeeID = orders.EmployeeID; 

# Task 15
SELECT FirstName, LastName FROM Employees WHERE EmployeeID = (
    SELECT EmployeeID
    FROM orders
    WHERE OrderID = 10369
);
