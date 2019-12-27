CREATE VIEW best_customer AS
SELECT Customers.[full name] AS Customer_name, SUM(Sales.[selling price]) AS sum_selling_price
FROM Sales.dbo.Sales
JOIN Sales.dbo.Customers ON Sales.cust_id = Customers.id
GROUP BY Customers.[full name]
HAVING SUM(Sales.[selling price]) = 
(SELECT MAX(q_1.sum_selling_price) AS max_sum_selling_price
FROM (SELECT Customers.[full name] AS Customer_name, SUM(Sales.[selling price]) AS sum_selling_price
FROM Sales.dbo.Sales
JOIN Sales.dbo.Customers ON Sales.cust_id = Customers.id
GROUP BY Customers.[full name]) q_1)
