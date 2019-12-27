CREATE trigger dbo.Forbid_add_new_junior_barber
ON barbershop.dbo.Barber_data
FOR INSERT
AS
declare @position nvarchar(10)
select @position = position_in_the_barbershop from inserted
if(@position = 'junior' and (select count(*) from barbershop.dbo.Barber_data
where position_in_the_barbershop = 'junior') >= 6)
begin
print 'Forbidden add junior if it amount is already 5'
rollback transaction
end