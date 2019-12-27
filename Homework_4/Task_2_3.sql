CREATE function dbo.find_songs_for_word(@word nvarchar(100))
returns table
AS
return (SELECT Songs.song_title, Music_disc.disc_title, Artists.names, Styles.names_of_styles, Songs.song_duration
FROM Music_Collection.dbo.Songs
JOIN Music_Collection.dbo.Music_disc ON Songs.disc_id = Music_disc.id
JOIN Music_Collection.dbo.Artists ON Songs.artist_id = Artists.id
JOIN Music_Collection.dbo.Styles ON Songs.style_id = Styles.id
WHERE Songs.song_title LIKE '%' + @word + '%'
)