CREATE function dbo.number_of_hard_rock_and_heavy_metal_albums()
returns table
AS
return (
SELECT Styles.names_of_styles, COUNT(Music_disc.id) AS sum_albums
FROM  Music_Collection.dbo.Music_disc
JOIN Music_Collection.dbo.Styles ON Styles.id = Music_disc.style_id
GROUP BY Styles.names_of_styles
HAVING  names_of_styles = 'hard rock' OR names_of_styles = 'heavy metal'
)