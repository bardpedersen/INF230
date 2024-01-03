#Group number: G05_Tues_10
#Group members: Peder Ørmen Bukaasen, Mohammed Idris Omar, Bård Tollef Pedersen.

--@block Task 1
SELECT E.EmployeeID,
    E.FirstName,
    COUNT(O.OrderID) AS OrderQuantity
FROM employees E
    JOIN orders O ON O.EmployeeID = E.EmployeeID
GROUP BY E.EmployeeID
ORDER BY OrderQuantity DESC;

--@block Task 2
SELECT DISTINCT C1.*
FROM customers C1,
    customers C2
WHERE C1.PostalCode = C2.PostalCode
    AND C1.CustomerID <> C2.CustomerID
ORDER BY C1.Country;

--@block Task 3
SELECT P.ProductName,
    P.ProductID,
    COUNT(O.OrderID) AS OrderQuantity
FROM products P
    JOIN orderdetails O ON P.ProductID = O.ProductID
GROUP BY P.ProductID
HAVING OrderQuantity > 50
ORDER BY OrderQuantity DESC;

--@block Task 4
SELECT P.ProductID,
    P.ProductName,
    P.UnitsInStock,
    SUM(O.Quantity) AS Units
FROM products P
    JOIN orderdetails O ON P.ProductID = O.ProductID
WHERE P.discontinued = 1
GROUP BY P.ProductID
HAVING Units > 50;

--@block Task 5
SELECT C.ContactName,
    C.Country
FROM customers C
    LEFT JOIN suppliers S ON C.Country = S.Country
WHERE S.SupplierID IS NULL;

--@block Task 6
SELECT C.ContactName,
    COUNT(O.OrderID) AS OrderQuantity
FROM customers C
    JOIN orders O ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) = 1994
GROUP BY C.CustomerID
ORDER BY OrderQuantity DESC;

--@block Task 7
SELECT EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS employee_name,
    CASE
        WHEN EmployeeID % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS 'EmployeeID status'
FROM employees;

--@block Task 8
SELECT EmployeeID,
    FirstName
FROM employees
WHERE EmployeeID = ALL(
        SELECT EmployeeID
        FROM orders
        WHERE Freight > 1000
    );

--@block Task 9
SELECT EmployeeID,
    CONCAT(UPPER(FirstName), ' ', LOWER(LastName)) AS employee_name
FROM employees
WHERE EmployeeID = ANY(
        SELECT EmployeeID
        FROM orders
        WHERE Freight > 800
    );

--@block Task 10
SELECT C.ContactName,
    AVG(OD.Quantity) AS AvgPurchaseQuantity
FROM customers C
    JOIN orders O ON C.CustomerID = O.CustomerID
    JOIN orderdetails OD ON O.OrderID = OD.OrderID
    JOIN products P ON OD.ProductID = P.ProductID
    JOIN categories CA ON P.CategoryID = CA.CategoryID
WHERE CA.CategoryName = 'Beverages'
GROUP BY C.CustomerID
ORDER BY AvgPurchaseQuantity;

--@block Creating the table
CREATE TABLE employee_work_hours (
    employee_id INT NOT NULL,
    login_hours INT NOT NULL,
    working_date date,
    PRIMARY KEY (employee_id)
);

--@block Testing the table
SELECT *
from employee_work_hours;

--@block Task 11
INSERT INTO employee_work_hours(employee_id, login_hours, working_date)
VALUES (1, 4, '2022-02-14'),
    (2, 8, '2022-02-15'),
    (3, 2, '2022-02-10'),
    (4, 7, '2022-02-10'),
    (8, 5, '2022-02-13'),
    (9, 4, '2022-02-14');

--@block Task 12
SELECT E.FirstName,
    EW.login_hours
FROM employees E
    JOIN employee_work_hours EW ON E.EmployeeID = EW.employee_id
WHERE EW.login_hours > 2
    AND (
        E.TitleOfCourtesy IN ('Mrs.', 'Ms.')
        OR E.Notes = 'she'
    );

--@block Task 13
DELETE FROM employee_work_hours
WHERE employee_id IN (
        SELECT EmployeeID
        FROM employees
        WHERE BirthDate BETWEEN '1950-01-01' AND '1960-05-27'
    );

--@block Deleting the table
DROP TABLE employee_work_hours;

--@block Task 14
SELECT orders.CustomerID, -- Select the information we want to show
    customers.ContactName,
    COUNT(orderdetails.OrderID) AS total_orders -- Count the number of orders and name the column total_orders
FROM customers -- Select the table we want to get information from
    INNER JOIN orders ON customers.CustomerID = orders.CustomerID -- Join the tables, to get the information from multiple tables
    INNER JOIN orderdetails ON orders.OrderID = orderdetails.OrderID -- Inner join means that we only get the information that is in both tables
GROUP BY orders.CustomerID -- Group the information by the customerID
ORDER BY total_orders DESC; -- Sort the information by the total_orders column in descending order

--@block Task 15
SELECT ROUND(POW(EXP(SUM(LOG(UnitPrice))), 1 / COUNT(*)), 2) AS GM1_UnitPrice,
    ROUND(EXP(SUM(LOG(UnitPrice)) / COUNT(*)), 2) AS GM2_UnitPrice
FROM products;