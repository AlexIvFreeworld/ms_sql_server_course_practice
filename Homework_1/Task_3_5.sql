CREATE VIEW best_seller AS
SELECT Sellers.[full name] AS Seller_name, SUM(Sales.[selling price]) AS sum_selling_price
FROM Sales.dbo.Sales
JOIN Sales.dbo.Sellers ON Sales.sell_id = Sellers.id
GROUP BY Sellers.[full name]
HAVING SUM(Sales.[selling price]) = 
(SELECT MAX(q_1.sum_selling_price) AS max_selling
FROM (SELECT Sellers.[full name] AS Seller_name, SUM(Sales.[selling price]) AS sum_selling_price
FROM Sales.dbo.Sales
JOIN Sales.dbo.Sellers ON Sales.sell_id = Sellers.id
GROUP BY Sellers.[full name])q_1)