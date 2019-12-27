CREATE trigger disc_into_archive
ON Music_Collection.dbo.Music_disc
FOR DELETE
AS
declare @disc_title nvarchar(100), @release_date date, @publish_id int, 
@brief_review nvarchar(max), @artist_id int, @style_id int
select @disc_title = disc_title, @release_date = release_date, @publish_id = publish_id, 
@brief_review = brief_review, @artist_id = artist_id, @style_id = style_id
from deleted
INSERT INTO Music_Collection.dbo.Archive_discs
(disc_title, release_date, publish_id, 
brief_review, artist_id, style_id)
VALUES
(@disc_title, @release_date, @publish_id, 
@brief_review, @artist_id, @style_id)
