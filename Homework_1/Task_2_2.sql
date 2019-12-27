CREATE VIEW add_new_songs AS
SELECT *
FROM Music_Collection.dbo.Songs
WITH CHECK OPTION
GO
INSERT INTO add_new_songs
(
song_title,
disc_id,
artist_id,
style_id,
song_duration
) 
VALUES (
'Song_name_6',
10,
2,
1,
10
)