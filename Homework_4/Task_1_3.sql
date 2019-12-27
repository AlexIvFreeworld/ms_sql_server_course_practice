CREATE function dbo.average_price_sales_for_every_day ()
returns table
AS
return (SELECT [current_date], AVG(sales_price) AS avg_price FROM [Sporting_Goods_Store].[dbo].[History]
GROUP BY [current_date])

