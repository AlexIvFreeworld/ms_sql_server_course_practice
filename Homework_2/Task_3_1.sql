CREATE trigger same_name
ON Sales.dbo.Customers
INSTEAD OF INSERT
AS
declare @full_name nvarchar(100), @email nvarchar(100), @phone_namber nvarchar(100)
select @full_name = [full name], @email = email,  @phone_namber =  [phone namber]
from inserted
if (EXISTS(select Customers.[full name] from Sales.dbo.Customers 
where Customers.[full name] = @full_name))
begin
print 'This customer is already exists'
INSERT INTO Sales.dbo.Customers
([full name], email, [phone namber])
VALUES
(@full_name, @email,  @phone_namber)
INSERT INTO Sales.dbo.Same_last_name
([full name], email, [phone namber])
VALUES
(@full_name, @email,  @phone_namber)
end
else
begin
INSERT INTO Sales.dbo.Customers
([full name], email, [phone namber])
VALUES
(@full_name, @email,  @phone_namber)
end