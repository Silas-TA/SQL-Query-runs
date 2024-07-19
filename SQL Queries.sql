-- 1. Select all columns from the productlines table
-- SELECT * FROM productlines;

-- 2. Select specific columns from the products table
-- SELECT productCode, productName, buyPrice FROM products;

-- 3. Select distinct product vendors from the products table
-- SELECT DISTINCT productVendor FROM products;

-- 4. Count the number of products in the products table
-- SELECT COUNT(*) FROM products;

-- 5. Find the minimum and maximum buy price from the products table
-- SELECT MIN(buyPrice), MAX(buyPrice) FROM products;

-- 6. Calculate the average buy price of products
-- SELECT AVG(buyPrice) FROM products;

-- 7. List all customers in the customers table
-- SELECT * FROM customers;

-- 8. Select customers from a specific country
-- SELECT * FROM customers WHERE country = 'USA';

-- 9. Find the total number of orders
-- SELECT COUNT(*) FROM orders;

-- 10. Select orders with a specific status
-- SELECT * FROM orders WHERE status = 'Shipped';

-- 11. Join customers and orders tables to find customer names and their orders
-- SELECT customers.customerName, orders.orderNumber
-- FROM customers
-- JOIN orders ON customers.customerNumber = orders.customerNumber;

-- 12. Find the top 5 products by quantity in stock
-- SELECT productName, quantityInStock
-- FROM products
-- ORDER BY quantityInStock DESC
-- LIMIT 5;

-- 13. Count the number of employees in each office
-- SELECT officeCode, COUNT(*) AS numberOfEmployees
-- FROM employees
-- GROUP BY officeCode;

-- 14. Calculate the total amount of payments made by each customer
-- SELECT customerNumber, SUM(amount) AS totalPayments
-- FROM payments
-- GROUP BY customerNumber;

-- 15. Find employees who do not report to anyone
-- SELECT * FROM employees WHERE reportsTo IS NULL;

-- 16. Find orders placed in the year 2004
-- SELECT * FROM orders WHERE YEAR(orderDate) = 2004;

-- 17. List all products with their respective product lines
-- SELECT products.productName, productlines.productLine
-- FROM products
-- JOIN productlines ON products.productLine = productlines.productLine;

-- 18. Find the average payment amount per customer
-- SELECT customerNumber, AVG(amount) AS averagePayment
-- FROM payments
-- GROUP BY customerNumber;

-- 19. Find employees and their managers
-- SELECT e1.firstName AS Employee, e2.firstName AS Manager
-- FROM employees e1
-- LEFT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber;

-- 20. Find the total sales for each product
-- SELECT orderdetails.productCode, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales
-- FROM orderdetails
-- GROUP BY orderdetails.productCode;

-- Medium Complexity Queries

-- 21. Find the top 3 customers with the highest total payments
-- SELECT customerNumber, SUM(amount) AS totalPayments
-- FROM payments
-- GROUP BY customerNumber
-- ORDER BY totalPayments DESC
-- LIMIT 3;

-- 22. Find products that have not been ordered
-- SELECT p.productCode, p.productName
-- FROM products p
-- LEFT JOIN orderdetails od ON p.productCode = od.productCode
-- WHERE od.productCode IS NULL;

-- 23. Calculate the monthly sales for the year 2004
-- SELECT YEAR(orderDate) AS year, MONTH(orderDate) AS month, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS monthlySales
-- FROM orders
-- JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
-- WHERE YEAR(orderDate) = 2004
-- GROUP BY YEAR(orderDate), MONTH(orderDate);

-- 24. Find the number of orders per customer
-- SELECT customerNumber, COUNT(*) AS numberOfOrders
-- FROM orders
-- GROUP BY customerNumber;

-- 25. Find the average quantity ordered per product
-- SELECT productCode, AVG(quantityOrdered) AS averageQuantity
-- FROM orderdetails
-- GROUP BY productCode;

-- 26. List the products with their sales greater than the average sales
-- SELECT productCode, SUM(quantityOrdered * priceEach) AS totalSales
-- FROM orderdetails
-- GROUP BY productCode
-- HAVING totalSales > (SELECT AVG(quantityOrdered * priceEach) FROM orderdetails);

-- 27. List the customers who placed more than 5 orders
-- SELECT customerNumber, COUNT(orderNumber) AS numberOfOrders
-- FROM orders
-- GROUP BY customerNumber
-- HAVING COUNT(orderNumber) > 5;

-- 28. Find the total amount of payments received each year
-- SELECT YEAR(paymentDate) AS year, SUM(amount) AS totalPayments
-- FROM payments
-- GROUP BY YEAR(paymentDate);

-- 29. Find the employees who work in the same office as their manager
-- SELECT e1.firstName AS Employee, e2.firstName AS Manager, e1.officeCode
-- FROM employees e1
-- JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
-- WHERE e1.officeCode = e2.officeCode;

-- 30. Find customers who have not made any payments
-- SELECT c.customerNumber, c.customerName
-- FROM customers c
-- LEFT JOIN payments p ON c.customerNumber = p.customerNumber
-- WHERE p.customerNumber IS NULL;

-- 31. Find the total sales by each product line
-- SELECT pl.productLine, SUM(od.quantityOrdered * od.priceEach) AS totalSales
-- FROM productlines pl
-- JOIN products p ON pl.productLine = p.productLine
-- JOIN orderdetails od ON p.productCode = od.productCode
-- GROUP BY pl.productLine;

-- 32. Find the average order value for each customer
-- SELECT o.customerNumber, AVG(od.quantityOrdered * od.priceEach) AS averageOrderValue
-- FROM orders o
-- JOIN orderdetails od ON o.orderNumber = od.orderNumber
-- GROUP BY o.customerNumber;

-- 33. List the offices along with the number of employees in each office
-- SELECT o.officeCode, o.city, COUNT(e.employeeNumber) AS numberOfEmployees
-- FROM offices o
-- LEFT JOIN employees e ON o.officeCode = e.officeCode
-- GROUP BY o.officeCode, o.city;

-- 34. Find the most frequently ordered product
-- SELECT productCode, COUNT(*) AS orderCount
-- FROM orderdetails
-- GROUP BY productCode
-- ORDER BY orderCount DESC
-- LIMIT 1;

-- 35. Calculate the total sales for each year
-- SELECT YEAR(orderDate) AS year, SUM(od.quantityOrdered * od.priceEach) AS totalSales
-- FROM orders o
-- JOIN orderdetails od ON o.orderNumber = od.orderNumber
-- GROUP BY YEAR(orderDate);
