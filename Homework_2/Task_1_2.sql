CREATE trigger in_Archive_Employees
ON Sporting_Goods_Store.dbo.Employees
FOR DELETE
AS
declare @full_name nvarchar(100), @hire_date date, @gender nvarchar(10), @salary money
select @full_name = full_name, @hire_date = hire_date, @gender = gender, @salary = salary
from deleted
INSERT INTO Sporting_Goods_Store.dbo.Archive_Employees
(Archive_Employees.full_name, Archive_Employees.hire_date, Archive_Employees.gender,
Archive_Employees.salary)
VALUES
(@full_name, @hire_date, @gender, @salary)
print 'This employee added into archive'