CREATE clustered index clust_Archive_discs
ON Music_Collection.dbo.Archive_discs(id)
GO
CREATE clustered index clust_Songs
ON Music_Collection.dbo.Songs(id)
GO