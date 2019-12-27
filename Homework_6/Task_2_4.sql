CREATE nonclustered index i_Archive_discs
ON Music_Collection.dbo.Archive_discs(id)
INCLUDE (disc_title, release_date, brief_review)