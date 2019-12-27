CREATE function  most_popular_barber()
returns @table_most_popular_barber table (full_name nvarchar(100), number_clients int)
AS
begin
declare @temp_table table (full_name nvarchar(100), number_clients int)
insert into @temp_table
select Barber_data.full_name, count(Archive_of_client_visits.id)
from barbershop.dbo.Archive_of_client_visits
join barbershop.dbo.Barber_data on Barber_data.id = Archive_of_client_visits.barber_id
group by Barber_data.full_name
insert into @table_most_popular_barber 
select full_name, number_clients from @temp_table
where number_clients = (select max(number_clients) from @temp_table) 
return
end