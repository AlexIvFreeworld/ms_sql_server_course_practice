CREATE VIEW all_sales AS
SELECT Customers.[full name], Sellers.[full name] AS Seller_name, [item name], [selling price], [date of transaction]
FROM Sales.dbo.Sales
JOIN Sales.dbo.Customers ON Sales.cust_id = Customers.id
JOIN Sales.dbo.Sellers ON Sales.sell_id = Sellers.id
WITH CHECK OPTION