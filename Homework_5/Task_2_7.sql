CREATE trigger dbo.Forbid_add_clients_to_schedule
ON barbershop.dbo.Barbers_schedule
INSTEAD OF INSERT
AS
declare @date_and_time datetime, @client_id int, @barber_id int
select @date_and_time = Availability_by_date_and_time, @client_id = client_id, @barber_id = barber_id
from inserted
if (EXISTS(select Availability_by_date_and_time 
from barbershop.dbo.Barbers_schedule
where @date_and_time = Availability_by_date_and_time and client_id is not null and barber_id = @barber_id))
print 'This time is busy'
else
begin
INSERT INTO barbershop.dbo.Barbers_schedule
(Availability_by_date_and_time, client_id, barber_id)
VALUES
(@date_and_time, @client_id, @barber_id)
end