#Group number: G05_Tues_10
#Group members: Peder Ørmen Bukaasen, Mohammed Idris Omar, Bård Tollef Pedersen.

--@block Task 1
SELECT COUNT(*) AS "Total Number of Orders" FROM Orders;

--@block Task 2
SELECT * 
FROM Products
WHERE ProductName LIKE '%ra'
ORDER BY ProductName DESC;

--@block Task 3
SELECT ProductID, ProductName, QuantityPerUnit
FROM Products
WHERE QuantityPerUnit LIKE '%500 g'
ORDER BY ProductID DESC;

--@block Task 4
SELECT ContactName
FROM Customers
WHERE 
ContactName LIKE 'M%' OR 
ContactName LIKE 'N%' OR 
ContactName LIKE 'O%' OR 
ContactName LIKE 'P%' OR 
ContactName LIKE 'Q%' OR 
ContactName LIKE 'R%' OR 
ContactName LIKE 'S%'
AND City != 'México D.F.'
ORDER BY ContactName;

--@block Task 5
SELECT COUNT(*) AS "Number of Customers Without Fax"
FROM Customers
WHERE Fax IS NULL;

--@block Task 6
SELECT AVG(UnitPrice) AS "Average UnitPrice"
FROM Products
WHERE SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Karkki Oy');

--@block Task 7
SELECT SUM(Freight) AS "Total Freight"
FROM Orders
WHERE CustomerID LIKE 'B%S';

--@block Task 8
SELECT COUNT(OrderID) AS "Number of Orders", AVG(Quantity) AS "Average Quantity"
FROM OrderDetails;

--@block Task 9
SELECT COUNT(DISTINCT ProductID) AS "Number of Product Types"
FROM OrderDetails
WHERE (ProductID LIKE '4%' OR ProductID LIKE '%3');

--@block Task 10
SELECT SUM(UnitsInStock) AS "Total Stock"
FROM Products
WHERE (ProductID LIKE '4%' OR ProductID LIKE '%3');

--@block Task 11
SELECT DISTINCT CustomerID
FROM Orders
WHERE ShipVia = 3 AND ShipName LIKE 'R%' AND CustomerID LIKE '%C';

--@block Task 12
SELECT FirstName, LastName
FROM Employees
WHERE HireDate < '1994-01-01' AND Title LIKE '%Representative%' AND PostalCode LIKE '%3';

--@block Task 13
SELECT EmployeeID, CustomerID
FROM Orders
WHERE CustomerID LIKE 'BO%' 
AND (CustomerID LIKE '___t%' OR CustomerID LIKE '___i%')
AND Freight > 50;

--@block Task 14
SELECT E.EmployeeID, E.LastName, O.CustomerID
FROM Employees E JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE O.CustomerID LIKE 'BO%' 
AND O.CustomerID LIKE '___t%'
AND E.LastName LIKE '%LL%';
