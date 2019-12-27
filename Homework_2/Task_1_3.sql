CREATE trigger no_more_six_employees
ON Sporting_Goods_Store.dbo.Employees
INSTEAD OF INSERT
AS
declare @full_name nvarchar(100), @hire_date date, @gender nvarchar(10), @salary money
select @full_name = full_name, @hire_date = hire_date, @gender = gender, @salary = salary
from inserted
if ((select count(Employees.id) from Sporting_Goods_Store.dbo.Employees) >= 6 )
print 'Amount of employees is already more or equal then six'
else
begin
INSERT INTO Sporting_Goods_Store.dbo.Archive_Employees
(Archive_Employees.full_name, Archive_Employees.hire_date, Archive_Employees.gender,
Archive_Employees.salary)
VALUES
(@full_name, @hire_date, @gender, @salary)
end