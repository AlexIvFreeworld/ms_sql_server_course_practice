CREATE function dbo.item_by_some_type_and_manufaturer (@type nvarchar(100), @manufacturer nvarchar(100))
returns table
AS
return (SELECT  item_name, [type], manufacturer FROM Sporting_Goods_Store.dbo.Goods
WHERE [type] = @type AND manufacturer = @manufacturer)