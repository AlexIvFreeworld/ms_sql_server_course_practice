CREATE trigger dont_add_dark_power_pop
ON Music_Collection.dbo.Music_disc
FOR INSERT
AS
declare @style_id int
select @style_id = style_id from inserted
if ((select Styles.names_of_styles from Music_Collection.dbo.Styles
where Styles.id = @style_id) = 'Dark Power Pop')
begin
print 'Forbidden add disc with style of Dark Power Pop'
rollback transaction
end