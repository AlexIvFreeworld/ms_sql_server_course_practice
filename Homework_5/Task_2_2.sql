CREATE function  dbo.top_3_barbers()
returns table
AS
return
(
SELECT TOP 3 Barber_data.full_name, SUM(total_cost) AS sum_money 
FROM barbershop.dbo.Archive_of_client_visits
JOIN barbershop.dbo.Barber_data ON Barber_data.id = Archive_of_client_visits.barber_id
GROUP BY Barber_data.full_name
ORDER BY SUM(total_cost) DESC
)