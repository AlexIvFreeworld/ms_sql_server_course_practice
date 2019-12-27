ALTER PROC ai_check_price_2
@productid int, @unitprice money  
AS
declare @res_func bit
set @res_func = dbo.check_price_product(@productid, @unitprice)
if (@res_func = 1)
print 'This price is low then current unitprice'
else
begin
UPDATE TSQL2012.Production.Products
SET unitprice = @unitprice
WHERE Products.productid = @productid
end