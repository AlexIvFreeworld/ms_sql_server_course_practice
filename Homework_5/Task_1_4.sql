CREATE function  dbo.client_spent_maximum_amount_money  ()
returns @table_client_spent_maximum_amount_money table (full_name nvarchar(100), num_money money)
AS
begin
declare @temp_table table (full_name nvarchar(100), num_money money)
INSERT INTO @temp_table
SELECT Clients_data.full_name, SUM(total_cost) 
FROM barbershop.dbo.Archive_of_client_visits
JOIN barbershop.dbo.Clients_data ON Clients_data.id = Archive_of_client_visits.client_id
GROUP BY Clients_data.full_name
insert into @table_client_spent_maximum_amount_money
select full_name, num_money from @temp_table
where num_money = (select max(num_money) from @temp_table)
return
end