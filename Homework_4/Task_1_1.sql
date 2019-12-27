CREATE function dbo.sum_unique_customers ()
returns int
AS
begin
declare @sum_unique_cust int
select @sum_unique_cust = (SELECT count(DISTINCT email) FROM  
Sporting_Goods_Store.dbo.Customers)
return @sum_unique_cust
end