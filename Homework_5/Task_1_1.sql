CREATE function  dbo.barber_who_works_longest ()
returns table
AS
return
(
SELECT full_name, hire_date FROM barbershop.dbo.Barber_data
WHERE hire_date = (SELECT MIN(hire_date) FROM barbershop.dbo.Barber_data)
)