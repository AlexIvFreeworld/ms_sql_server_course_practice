CREATE VIEW delete_artist AS
SELECT *
FROM Music_Collection.dbo.Artists
WITH CHECK OPTION
GO
DELETE FROM delete_artist
WHERE id = 5