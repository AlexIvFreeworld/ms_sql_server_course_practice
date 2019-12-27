CREATE function agerage_duration_to_song_for_some_artist (@artist_name nvarchar(100))
returns table
AS
return (
SELECT Artists.names, AVG(Songs.song_duration) AS average_duration 
FROM Music_Collection.dbo.Songs
JOIN Music_Collection.dbo.Artists ON Artists.id = Songs.artist_id
GROUP BY Artists.names
HAVING  Artists.names = @artist_name
)