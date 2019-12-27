CREATE function dbo.same_disc_title()
returns @table_same_disc_title table (disc_title nvarchar(100), amount int)
AS
begin
insert @table_same_disc_title select disc_title, count(artist_id) FROM Music_Collection.dbo.Music_disc
group by disc_title
having  count(artist_id) > 1
return
end