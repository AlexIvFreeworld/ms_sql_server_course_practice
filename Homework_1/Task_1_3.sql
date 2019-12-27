CREATE VIEW dbo.all_discs_by_artist AS
SELECT Artists.names, Music_disc.disc_title
FROM Music_Collection.dbo.Artists
LEFT JOIN Music_Collection.dbo.Music_disc ON Music_disc.artist_id = Artists.id
WHERE Artists.names = 'Beatles'
