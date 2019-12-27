CREATE function check_price_product (@id int, @price money)
returns bit
AS
begin
declare @out bit
if (@price < (select Products.unitprice 
from TSQL2012.Production.Products where Products.productid = @id))
set @out = 1
else
set @out = 0
return @out
end