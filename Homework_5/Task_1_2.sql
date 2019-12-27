CREATE function  barber_served_biggest_number_clients_for_date (@date_1 datetime, @date_2 datetime) 
returns @table_barber_served_biggest_number_clients_for_date table (full_name nvarchar(100), number_clients int)
AS
begin
declare @temp_table table (full_name nvarchar(100), number_clients int)
insert into @temp_table
select Barber_data.full_name as barber_name, count(Archive_of_client_visits.id) as num_client_visits
from barbershop.dbo.Archive_of_client_visits
join barbershop.dbo.Barber_data on Barber_data.id = Archive_of_client_visits.barber_id
where date_visit between @date_1 and @date_2
group by Barber_data.full_name
insert into @table_barber_served_biggest_number_clients_for_date
select full_name, number_clients from @temp_table
where number_clients = (select max(number_clients) from @temp_table) 
return
end