CREATE trigger is_customer_in_sellers
ON Sales.dbo.Customers
FOR INSERT
AS
declare @full_name nvarchar(100)
select @full_name = [full name] from inserted
if (EXISTS(select Sellers.[full name] from Sales.dbo.Sellers 
where Sellers.[full name] = @full_name))
begin
print 'This customer is exists in Sellers'
rollback transaction
end