-- индекс с неключевыми (включенными) столбцами
CREATE nonclustered index i_last_unit ON Sporting_Goods_Store.dbo.last_unit(id)
INCLUDE (item_name, [type], manufacturer)