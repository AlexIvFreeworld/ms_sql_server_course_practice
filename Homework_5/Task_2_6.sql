CREATE PROC dbo.to_history_visits
AS
INSERT INTO  barbershop.dbo.History_visits
(visit_id, client_id, barber_id, date_visit, total_cost, feedback, rate_id, service_id)
SELECT id, client_id, barber_id, date_visit, total_cost, feedback, rate_id, service_id
FROM barbershop.dbo.Archive_of_client_visits

