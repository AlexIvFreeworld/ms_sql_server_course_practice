CREATE function dbo.clients_who_have_not_visited_one_year()
returns @table_clients_who_have_not_visited_one_year table  (Client_name nvarchar(100))
AS
begin
declare @table_visits table (id int, Client_name nvarchar(100), num_visit int)
INSERT INTO @table_visits
SELECT Clients_data.id, Clients_data.full_name, COUNT (Archive_of_client_visits.date_visit) AS num_visit
FROM barbershop.dbo.Archive_of_client_visits
JOIN barbershop.dbo.Clients_data ON Clients_data.id = Archive_of_client_visits.client_id
WHERE Archive_of_client_visits.date_visit BETWEEN '2018-10-23T00:00:00.000' AND '2019-10-24T00:00:00.000'
GROUP BY Clients_data.id, Clients_data.full_name
INSERT INTO @table_clients_who_have_not_visited_one_year
SELECT full_name FROM barbershop.dbo.Clients_data
WHERE Clients_data.id NOT IN (select id from   @table_visits)
return
end