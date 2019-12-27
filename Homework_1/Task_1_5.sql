CREATE VIEW dbo.top_3_most_popular_artist AS
SELECT TOP 3 Artists.names AS  Artist_name, COUNT(Music_disc.id) AS sum_discs
FROM Music_Collection.dbo.Music_disc
JOIN Music_Collection.dbo.Artists ON Artists.id = Music_disc.artist_id
GROUP BY Artists.names
ORDER BY COUNT(Music_disc.id) DESC