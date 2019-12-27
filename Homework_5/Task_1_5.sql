CREATE function dbo.longest_service()
returns table
AS
return
(
SELECT name_service, duration FROM barbershop.dbo.barbers_price
WHERE duration = (SELECT MAX(duration) FROM barbershop.dbo.barbers_price)
)