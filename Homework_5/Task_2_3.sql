CREATE function  dbo.top_3_barbers_for_average_estimate()
returns @table_top_3_barbers_for_average_estimate table (barber_name nvarchar(100), average_rate int, num_visits int)
AS
begin
insert into @table_top_3_barbers_for_average_estimate
select top 3 Barber_data.full_name, avg(Archive_of_client_visits.rate_id), count(*) 
from barbershop.dbo.Archive_of_client_visits
join barbershop.dbo.Barber_data on Barber_data.id = Archive_of_client_visits.barber_id
group by Barber_data.full_name
having  count(*) > 30
order by avg(Archive_of_client_visits.rate_id) desc
return
end