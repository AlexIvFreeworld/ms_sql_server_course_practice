CREATE function  dbo.clients_who_have_never_rated_and_feedback()
returns table
AS
return
(
SELECT Clients_data.full_name, COUNT(feedback) AS num_feed, COUNT(Archive_of_client_visits.rate_id) AS num_rate
FROM barbershop.dbo.Archive_of_client_visits
JOIN barbershop.dbo.Clients_data ON Clients_data.id = Archive_of_client_visits.client_id
GROUP BY Clients_data.full_name
HAVING COUNT(feedback) = 0 and COUNT(Archive_of_client_visits.rate_id) = 0
)