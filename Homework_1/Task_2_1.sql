CREATE VIEW add_new_styles AS
SELECT *
FROM Music_Collection.dbo.Styles
WITH CHECK OPTION
GO
INSERT INTO add_new_styles
(names_of_styles) 
VALUES ('Style_4')