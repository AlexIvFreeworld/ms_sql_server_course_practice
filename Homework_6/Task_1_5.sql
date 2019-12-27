-- фильтруемый индкекс
CREATE nonclustered index i_History 
ON Sporting_Goods_Store.dbo.History(goods_id)
WHERE [current_date] IS NOT NULL