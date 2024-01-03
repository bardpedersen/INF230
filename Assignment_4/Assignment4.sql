#Group number: G05_Tues_10
#Group members: Peder Ørmen Bukaasen, Mohammed Idris Omar, Bård Tollef Pedersen.

--@block Task 1
SELECT *
FROM Employees
WHERE EmployeeID IN (2, 5, 9);

--@block Task 2
SELECT *
FROM customers C
    JOIN orders O ON C.CustomerID = O.CustomerID

--@block Task 3
SELECT O.OrderID,
    C.ContactName
FROM customers C
    JOIN orders O ON C.CustomerID = O.CustomerID;

--@block Task 4
SELECT C.ContactName,
    C.Address,
    C.City,
    O.OrderDate
FROM customers C
    JOIN orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderDate = '1995-05-01';

--@block Task 5
SELECT P.ProductName,
    S.CompanyName,
    S.Country,
    S.Phone
FROM products P
    JOIN suppliers S ON S.SupplierID = P.SupplierID
ORDER BY S.Country DESC
LIMIT 25;

--@block Task 6
SELECT C.ContactName,
    O.*
FROM customers C
    LEFT JOIN orders O ON C.CustomerID = O.CustomerID
ORDER BY C.ContactName;

--@block Task 7
SELECT P.ProductName,
    P.QuantityPerUnit,
    OD.Quantity
FROM products P
    JOIN orderdetails OD ON P.ProductID = OD.ProductID
WHERE OD.Quantity > 100;

--@block Task 8
SELECT O.EmployeeID,
    O.OrderID,
    C.ContactName,
    C.City
FROM orders O
    JOIN customers C on O.CustomerID = C.CustomerID
WHERE O.EmployeeID BETWEEN 3 AND 6
ORDER BY O.EmployeeID;

--@block Task 9
SELECT O.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS "Employee Name",
    O.OrderID,
    C.ContactName,
    C.City
FROM orders O
    JOIN customers C on O.CustomerID = C.CustomerID
    JOIN employees E on O.EmployeeID = E.EmployeeID
WHERE E.EmployeeID BETWEEN 1 AND 4
ORDER BY O.EmployeeID DESC;

--@block Task 10
SELECT O.OrderID,
    O.OrderDate,
    C.ContactName,
    C.PostalCode,
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS "Employee Name",
    E.Photo
FROM orders O
    JOIN customers C on O.CustomerID = C.CustomerID
    JOIN employees E on O.EmployeeID = E.EmployeeID

--@block Task 11
SELECT sum(OD.Quantity) AS "Total quantity sold"
FROM products P
    JOIN orderdetails OD ON P.ProductID = OD.ProductID
    JOIN categories C on P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Produce'
