CREATE trigger dont_add_some_goods
ON Sales.dbo.Sales
FOR INSERT
AS
declare @item_name nvarchar(100)
select @item_name = [item name] from inserted
if (@item_name IN ('apples','pears','plums','cilantro'))
begin
print 'It is forbidden to add this product'
rollback transaction
end