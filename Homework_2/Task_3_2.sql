CREATE trigger History_sales_deleted_customer
ON Sales.dbo.Customers
FOR DELETE
AS
declare @id int
select @id = id from deleted
INSERT INTO Sales.dbo.History_sales
(cust_id, sell_id, [item name], [selling price], [date of transaction])
SELECT cust_id, sell_id, [item name], [selling price], [date of transaction]
FROM Sales.dbo.Sales
WHERE Sales.cust_id = @id
print 'History sales for deleted customer was added in History_sales'
