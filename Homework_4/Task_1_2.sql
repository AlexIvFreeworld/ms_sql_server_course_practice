CREATE function agerage_price_shoes (@type nvarchar(100))
returns int 
AS
begin
declare @avg int
select @avg =(SELECT AVG(sales_price) FROM Sporting_Goods_Store.dbo.Goods
WHERE [type] = @type)
return @avg
end