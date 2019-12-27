CREATE VIEW dbo.all_songs_complete AS
SELECT Songs.song_title, Music_disc.disc_title, Songs.song_duration, Styles.names_of_styles,
Artists.names
FROM Music_Collection.dbo.Songs
JOIN Music_Collection.dbo.Music_disc ON Songs.disc_id = Music_disc.id
JOIN Music_Collection.dbo.Styles ON Songs.style_id = Styles.id
JOIN Music_Collection.dbo.Artists ON Songs.artist_id = Artists.id
