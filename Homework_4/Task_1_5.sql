CREATE function dbo.first_item_sold ()
returns @last_item_sold_table table (item_name nvarchar(100), price money, [sold_date] date) 
AS
begin
declare @max_id int
select @max_id = (SELECT MIN(History.id) FROM Sporting_Goods_Store.dbo.History)
INSERT  @last_item_sold_table SELECT Goods.item_name, History.sales_price, History.[current_date]
FROM Sporting_Goods_Store.dbo.History
JOIN Sporting_Goods_Store.dbo.Goods ON History.goods_id = Goods.id
WHERE History.id = @max_id
return
end