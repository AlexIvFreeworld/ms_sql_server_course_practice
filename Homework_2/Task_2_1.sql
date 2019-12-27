CREATE trigger dont_add_if_disc_already_exists
ON Music_Collection.dbo.Music_disc
INSTEAD OF INSERT
AS
declare @disc_title nvarchar(100), @release_date date, @publish_id int,
@brief_review nvarchar(max), @artist_id int, @style_id int
select  @disc_title = disc_title, @release_date = release_date, @publish_id = publish_id,
@brief_review = brief_review, @artist_id = artist_id, @style_id = style_id
from inserted
if (EXISTS(select Music_disc.disc_title from Music_Collection.dbo.Music_disc 
where Music_disc.disc_title = @disc_title))
print 'This disc is already exists'
else
begin
INSERT INTO Music_Collection.dbo.Music_disc
(disc_title, release_date, publish_id,
brief_review, artist_id, style_id)
VALUES
(@disc_title, @release_date, @publish_id,
@brief_review, @artist_id, @style_id)
end