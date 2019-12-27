CREATE trigger check_item_for_uniqueness
ON Sporting_Goods_Store.dbo.Goods
INSTEAD OF INSERT
AS
declare @item_name nvarchar(100), @type nvarchar(100), @number_of_items_in_stock int,
@prime_cost money, @manufacturer nvarchar(100), @sales_price money
select @item_name = item_name, @type = [type], @number_of_items_in_stock = number_of_items_in_stock,
@prime_cost = prime_cost, @manufacturer = manufacturer, @sales_price = sales_price
from inserted
if (EXISTS(select Goods.item_name from Sporting_Goods_Store.dbo.Goods
where item_name = @item_name))
begin
print 'This item is already exist'
UPDATE Sporting_Goods_Store.dbo.Goods
SET item_name = @item_name, [type] = @type, 
number_of_items_in_stock = @number_of_items_in_stock,
prime_cost = @prime_cost, manufacturer = @manufacturer,
sales_price = @sales_price
WHERE Goods.item_name = @item_name
end
else
begin
INSERT INTO dbo.Goods
(item_name, [type], number_of_items_in_stock, prime_cost, manufacturer, sales_price)
VALUES (@item_name, @type, @number_of_items_in_stock, @prime_cost, @manufacturer, @sales_price)
end
