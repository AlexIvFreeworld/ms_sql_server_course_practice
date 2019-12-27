CREATE VIEW longist_disc AS
SELECT q_1.Disc_title AS Disc_Title, SUM(q_1.song_duration) AS disc_duration
FROM (SELECT Music_disc.disc_title AS Disc_title, Songs.song_title,
Songs.song_duration AS song_duration
FROM Music_Collection.dbo.Songs
JOIN Music_Collection.dbo.Music_disc ON Songs.disc_id = Music_disc.id) q_1
GROUP BY q_1.Disc_title
HAVING SUM(q_1.song_duration) = (SELECT MAX(q_2.disc_duration) AS Max_disc_duration
FROM (SELECT q_1.Disc_title AS Disc_Title, SUM(q_1.song_duration) AS disc_duration
FROM (SELECT Music_disc.disc_title AS Disc_title, Songs.song_title,
Songs.song_duration AS song_duration
FROM Music_Collection.dbo.Songs
JOIN Music_Collection.dbo.Music_disc ON Songs.disc_id = Music_disc.id) q_1
GROUP BY q_1.Disc_title) q_2)