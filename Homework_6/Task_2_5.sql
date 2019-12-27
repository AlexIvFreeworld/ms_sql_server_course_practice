CREATE nonclustered index i_filter_Music_disc
ON Music_Collection.dbo.Music_disc(id)
WHERE brief_review IS NOT NULL