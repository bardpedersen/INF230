#Group number: G05_Tues_10
#Group members: Peder Ørmen Bukaasen, Mohammed Idris Omar, Bård Tollef Pedersen.

--@block Task 1
SELECT * FROM Categories;
   
--@block Task 2
SELECT ProductName, QuantityPerUnit, UnitPrice FROM Products;

--@block Task 3
SELECT DISTINCT ContactTitle FROM customers;

--@block Task 4
SELECT DISTINCT Title FROM employees;

--@block Task 5
SELECT * FROM Orders WHERE OrderDate = '1996-05-17';

--@block Task 6
SELECT * FROM Orders WHERE OrderDate >= '1996-05-17'; 

--@block Task 7
SELECT * FROM Products WHERE UnitPrice > '40';

--@block Task 8
SELECT * FROM Products WHERE UnitPrice BETWEEN 30 AND 40;

--@block Task 9
SELECT OrderID, ContactName FROM Orders, Customers;

--@block Task 10
SELECT Customers.ContactName, Customers.Address, Customers.City, Orders.OrderDate FROM Orders, Customers WHERE Orders.OrderDate = '1995-05-01' AND Customers.CustomerID = Orders.CustomerID;

--@block Task 11    
SELECT * FROM Customers WHERE City = 'London' OR City = 'Buenos Aires';

--@block Task 12 
SELECT * FROM Customers WHERE Country = 'USA' AND NOT City = 'Portland';

--@block Task 13
SELECT * FROM orderdetails WHERE ProductID IN ( 
	SELECT ProductID
	FROM products
	WHERE ProductName = 'Tofu'
);

--@block Task 14
SELECT employees.FirstName, employees.LastName FROM orders, employees WHERE orders.OrderID = 10369 AND employees.EmployeeID = orders.EmployeeID; 

--@block Task 15
SELECT FirstName, LastName FROM Employees WHERE EmployeeID = (
    SELECT EmployeeID
    FROM orders
    WHERE OrderID = 10369
);
