CREATE nonclustered index i_Artists
ON Music_Collection.dbo.Artists(names)
GO
CREATE nonclustered index i_Music_disc
ON Music_Collection.dbo.Music_disc(disc_title)
GO
