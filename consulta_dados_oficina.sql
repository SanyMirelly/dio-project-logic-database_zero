-- Consulta de Dados -- 

-- 1. Clientes com Pagamentos Pendentes
select c.Fname as Nome_Cliente, c.Lname as Sobrenome, p.Amount as Valor, p.PaymentMethod as Método_Pagamento, p.PaymentDate as Data_Pagamento from Clients c
		join Payments p on c.idClient = p.idClient
	where p.Paid = FALSE;

-- 2. Serviços Mais Realizado
select s.ServiceName as Serviços, COUNT(*) as Total_Executado from AppointmentServices aps
		join Services s on aps.idService = s.idService
	group by s.ServiceName
	order by Total_Executado desc;
    
-- 3. Agendamentos por Mecânico
select m.Name as Mecânicos, COUNT(*) as Total_Agendamentos from Appointments a
		join Mechanics m on a.idMechanic = m.idMechanic
	group by m.Name
	order by Total_Agendamentos desc;
    
-- 4. Peças com Estoque Baixo (menos de 20 unidades)
select PartName as Peças, Quantity as Quantidade, Location as Localização from PartsStock where Quantity < 20;

--  5. Próximos Agendamentos
select a.AppointmentDate as Data_Agendamento, c.Fname as Nome_Cliente, c.Lname as Sobrenome, v.Plate as Placa, m.Name as Mecânico from Appointments a
		join Clients c ON a.idClient = c.idClient
		join Vehicles v ON a.idVehicle = v.idVehicle
		join Mechanics m ON a.idMechanic = m.idMechanic
	where a.AppointmentDate > NOW()
	order by a.AppointmentDate asc;
    
-- 6. Faturamento Total por Mês
select DATE_FORMAT(PaymentDate, '%Y-%m') as Mês, SUM(Amount) as Receita_Total from Payments
	where Paid = TRUE
	group by Mês
	order by Mês DESC;

-- 7. Peças usadas em mais de um tipo de serviço
select ps.PartName as Peças, COUNT(*) AS Contagem_Serviço from ServiceParts sp
	join PartsStock ps ON sp.idPart = ps.idPart
	group by ps.idPart
	having COUNT(*) > 1;







