CREATE nonclustered index i_Publishers
ON Music_Collection.dbo.Publishers(names, country)
GO
CREATE nonclustered index i_Songs
ON Music_Collection.dbo.Songs(song_title, song_duration)
GO