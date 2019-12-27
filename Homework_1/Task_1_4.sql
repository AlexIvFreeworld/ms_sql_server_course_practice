CREATE VIEW most_popular_artist AS
SELECT Artists.names AS  Artist_name, COUNT(Music_disc.id) AS sum_discs
FROM Music_Collection.dbo.Music_disc
JOIN Music_Collection.dbo.Artists ON Artists.id = Music_disc.artist_id
GROUP BY Artists.names
HAVING COUNT(Music_disc.id) = (SELECT MAX(q_1.sum_discs) AS max_sum_discs
FROM (SELECT Artists.names AS  Artist_name, COUNT(Music_disc.id) AS sum_discs
FROM Music_Collection.dbo.Music_disc
JOIN Music_Collection.dbo.Artists ON Artists.id = Music_disc.artist_id
GROUP BY Artists.names) q_1)