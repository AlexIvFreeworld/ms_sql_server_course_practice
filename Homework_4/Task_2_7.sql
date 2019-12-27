CREATE function artists_with_two_or_more_styles ()
returns table
AS
return (
SELECT Artists.names, COUNT(DISTINCT Music_disc.style_id) AS sum_styles
FROM Music_Collection.dbo.Music_disc
JOIN Music_Collection.dbo.Artists ON Artists.id = Music_disc.artist_id
GROUP BY Artists.names
HAVING COUNT(DISTINCT Music_disc.style_id) > 1 
)
