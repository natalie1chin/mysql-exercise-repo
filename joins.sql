use bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS 'Products', categories.Name AS 'Category'
FROM categories
INNER JOIN products
ON categories.CategoryID = products.CategoryID
WHERE categories.Name= '%Computers%';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(e.FirstNAme,' ', e.LastName) AS Employee, SUM(s.Quantity) AS Total
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
HAVING Total = 37
ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'Dept', categories.Name AS 'Categories'
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name ='Appliances' OR categories.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name AS 'Item', sales.Quantity AS 'QTY_SOLD', sales.PricePerUnit * sales.Quantity AS 'Total Sold'
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name LIKE '%Hotel%California%';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name AS 'Item', SUM(sales.Quantity) AS 'QTY_SOLD',SUM(sales.PricePerUnit * sales.Quantity) AS 'Total Sold'
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
GROUP BY sales.ProductID
HAVING products.NAme LIKE '%Hotel%Cal%';

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */