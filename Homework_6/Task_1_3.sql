-- композитный (составной) индекс
CREATE index i_archive_goods ON Sporting_Goods_Store.dbo.archive_goods(id, goods_id)
GO
CREATE index i_Customers ON Sporting_Goods_Store.dbo.Customers(email, phone_number)
