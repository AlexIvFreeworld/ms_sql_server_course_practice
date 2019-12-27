CREATE function  free_time_slots_specific_barber (@barber_name nvarchar(100), @day date)
returns table
AS
return
(
SELECT Barber_data.full_name, Barbers_schedule.Availability_by_date_and_time 
FROM barbershop.dbo.Barbers_schedule
JOIN barbershop.dbo.Barber_data ON Barber_data.id = Barbers_schedule.barber_id
WHERE Barbers_schedule.client_id IS NULL AND Barber_data.full_name = @barber_name
AND DATEPART(DAY, Availability_by_date_and_time) = DATEPART(DAY, @day)
)