CREATE VIEW add_update_publisher AS
SELECT *
FROM Music_Collection.dbo.Publishers
WITH CHECK OPTION
GO
UPDATE add_update_publisher
SET Country = 'Country_name_4'
WHERE id = 1
