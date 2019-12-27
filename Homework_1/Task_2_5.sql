CREATE VIEW update_artist_Muse AS
SELECT *
FROM Music_Collection.dbo.Artists
WHERE names = 'Muse'
WITH CHECK OPTION
GO
UPDATE update_artist_Muse
SET country = 'Country_1'
