CREATE UNIQUE clustered index i_clust_Archive_Employees ON  Sporting_Goods_Store.dbo.Archive_Employees(id, full_name)
GO
CREATE UNIQUE clustered index i_clust_archive_goods ON  Sporting_Goods_Store.dbo.archive_goods(id, item_name)
GO
CREATE UNIQUE clustered index i_clust_History ON  Sporting_Goods_Store.dbo.History(id, goods_id)
GO
CREATE UNIQUE clustered index i_clust_last_unit ON  Sporting_Goods_Store.dbo.last_unit(id, item_name)
GO
CREATE UNIQUE clustered index i_clust_Sales ON  Sporting_Goods_Store.dbo.Sales(id)