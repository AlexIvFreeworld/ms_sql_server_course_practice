CREATE VIEW all_sales_apple AS
SELECT [item name], [selling price], [date of transaction]
FROM Sales.dbo.Sales
WHERE [item name] = 'Apple'
WITH CHECK OPTION