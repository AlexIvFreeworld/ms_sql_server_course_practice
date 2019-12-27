CREATE function dbo.is_customer_45_year ()
returns @is_customer_45_year table (email nvarchar(100), phone_number nvarchar(100), birth_date date)
AS
begin
INSERT  @is_customer_45_year SELECT email, phone_number, birth_date
FROM Sporting_Goods_Store.dbo.Customers
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) = 45
return 
end