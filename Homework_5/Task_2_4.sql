CREATE function dbo.schedule_specific_day_specific_barber (@day date, @barber_name nvarchar(100))
returns table
AS
return
(
SELECT Availability_by_date_and_time, Barber_data.full_name
FROM barbershop.dbo.Barbers_schedule
JOIN barbershop.dbo.Barber_data ON Barber_data.id = Barbers_schedule.barber_id
WHERE DATEPART(DAY, Availability_by_date_and_time) = DATEPART(DAY, @day) AND Barber_data.full_name = @barber_name
)