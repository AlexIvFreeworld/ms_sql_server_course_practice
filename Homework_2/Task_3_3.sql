CREATE trigger is_seller_in_customers
ON Sales.dbo.Sellers
FOR INSERT
AS
declare @full_name nvarchar(100)
select @full_name = [full name] from inserted
if (EXISTS(select Customers.[full name] from Sales.dbo.Customers 
where Customers.[full name] = @full_name))
begin
print 'This seller is exists in Customers'
rollback transaction
end