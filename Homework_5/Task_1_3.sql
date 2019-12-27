CREATE function  dbo.client_visited_maximum_number_times ()
returns @table_client_visited_maximum_number_times table (full_name nvarchar(100), num_visited int)
AS
begin
declare @temp_table table (full_name nvarchar(100), num_visited int)
INSERT INTO @temp_table
SELECT Clients_data.full_name, COUNT(*) AS num_visited 
FROM barbershop.dbo.Archive_of_client_visits
JOIN barbershop.dbo.Clients_data ON Clients_data.id = Archive_of_client_visits.client_id
GROUP BY Clients_data.full_name
insert into @table_client_visited_maximum_number_times
select full_name, num_visited from @temp_table
where num_visited = (select max(num_visited) from @temp_table)
return
end
