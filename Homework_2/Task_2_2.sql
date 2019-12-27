CREATE trigger dont_delete_discs_of_Beatlse
ON Music_Collection.dbo.Music_disc
FOR DELETE
AS
declare @artist_id int
select @artist_id = artist_id from deleted
if ((select Artists.names from Music_Collection.dbo.Artists where Artists.id = @artist_id) = 'Beatles')
begin
print 'Forbidden deleting discs of Beatles'
rollback transaction
end