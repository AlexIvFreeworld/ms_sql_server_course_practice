CREATE function dbo.longest_and_shortest_songs ()
returns table
AS
return (SELECT Songs.song_title, Music_disc.disc_title, Artists.names, Styles.names_of_styles, Songs.song_duration
FROM Music_Collection.dbo.Songs
JOIN Music_Collection.dbo.Music_disc ON Songs.disc_id = Music_disc.id
JOIN Music_Collection.dbo.Artists ON Songs.artist_id = Artists.id
JOIN Music_Collection.dbo.Styles ON Songs.style_id = Styles.id
WHERE Songs.song_duration = (SELECT MAX(Songs.song_duration)
FROM Music_Collection.dbo.Songs)
OR Songs.song_duration = (SELECT MIN(Songs.song_duration)
FROM Music_Collection.dbo.Songs)
)