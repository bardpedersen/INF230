#Group number: G05_Tues_10
#Group members: Peder Ørmen Bukaasen, Mohammed Idris Omar, Bård Tollef Pedersen.

--@block Task 1
SELECT CustomerID,
    City,
    Address
FROM customers
ORDER BY CustomerID DESC;

--@block Task 2
SELECT *
FROM Products
WHERE UnitPrice <= 10
ORDER BY UnitPrice;

--@block Task 3
SELECT *
FROM Products
WHERE UnitPrice < 40
ORDER BY UnitPrice DESC
LIMIT 5;

--@block Task 4
SELECT *
FROM Products
WHERE UnitPrice < 10
    AND QuantityPerUnit <> '12 - 12 oz cans'
ORDER BY ProductName DESC;

--@block Task 5
SELECT ProductName,
    SupplierID,
    UnitPrice
FROM Products
ORDER BY SupplierID DESC,
    UnitPrice;

--@block Task 6
SELECT MIN(Quantity) AS MinimumOrderedQuantity,
    MAX(Quantity) AS MaximumOrderedQuantity
FROM orderdetails;

--@block for task 7-14
CREATE TABLE departments (
    DepartmentID int NOT NULL,
    ManagerID int NOT NULL,
    DepartmentName varchar(25),
    PRIMARY KEY (DepartmentID)
);

--@block
SELECT *
from departments;

--@block Task 7
INSERT INTO departments (DepartmentID, ManagerID, DepartmentName)
VALUES (10, 11, 'Administration'),
    (20, 12, 'Shipping'),
    (30, 13, 'Purchasing'),
    (40, 14, 'Sales');

--@block Task 8
INSERT INTO departments
VALUES (50, 15, 'IT support'),
    (60, 20, 'Legal and Compliance'),
    (70, 14, 'Marketing'),
    (80, 14, 'Finance');

--@block Task 9
UPDATE departments
SET ManagerID = 40
WHERE DepartmentName = 'Marketing';

--@block Task 10
UPDATE departments
SET DepartmentName = NULL
WHERE ManagerID = 14;

--@block Task 11
SELECT DepartmentName
FROM departments
WHERE DepartmentName IS NOT NULL;

--@block Task 12
SELECT *
FROM departments
WHERE DepartmentName IS NULL;

--@block Task 13
DELETE FROM departments
WHERE ManagerID = 14;

--@block Task 14
DELETE FROM departments;