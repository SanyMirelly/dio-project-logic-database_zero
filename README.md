# 🎯 Desafio: Construa um Projeto Lógico de Banco de Dados do Zero

Este repositório faz parte de um Desafio de Contrução de um Projeto Lógico de Banco de Dados do Zero da DIO, para o contexto de uma oficina.

## Estrutura do Projeto
O projeto está dividido em quatro scripts SQL principais:

1.  **`Diagrama_oficina.png`**: Diagrama ER da Oficina.
2.  **`proj_oficina.sql`**: Contém todo o código DDL para construir a estrutura do banco de dados.
3.  **`dados_oficina.sql`**: Contém o código DML para preencher o banco de dados com dados de exemplos, possibilitando testes eficazes das consultas e o retorno de dados úteis
4.  **`consulta_dados_oficina.sql`**: Apresenta consultas SQL elaboradas para responder a perguntas de negócio. As consultas utilizam cláusulas como `SELECT`, `WHERE`, `ORDER BY`, `JOIN`, `GROUP BY` e `HAVING` para obter insights estratégicos dos dados.

### Diagrama 
É um fluxograma que ilustra como diferentes entidades e atributos se relacionam dentro de um banco de dados.

![ecommerce](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Diagrama_oficina.png)


## 🔍Consultas dos Dados

As seguintes perguntas podem ser respondidas pelas consultas SQL no arquivo `consulta_dados_oficina.sql`:

### 1. Quantos clientes com pagamentos pendentes temos na carteira este mês?
   
```SQL
select c.Fname as Nome_Cliente, c.Lname as Sobrenome, p.Amount as Valor, p.PaymentMethod as Método_Pagamento, p.PaymentDate as Data_Pagamento from Clients c
		join Payments p on c.idClient = p.idClient
	where p.Paid = FALSE;
```
![Clientes x pagamento](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/1_Consulta.png)

### 2. Quais são os serviços mais realizados?
   
```SQL
select s.ServiceName as Serviços, COUNT(*) as Total_Executado from AppointmentServices aps
		join Services s on aps.idService = s.idService
	group by s.ServiceName
	order by Total_Executado desc;
```
![Serviço x executados](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/2_Consulta.png)

### 3. Quais são o total de agendamento de cada mecânico?
   
```SQL
select m.Name as Mecânicos, COUNT(*) as Total_Agendamentos from Appointments a
		join Mechanics m on a.idMechanic = m.idMechanic
	group by m.Name
	order by Total_Agendamentos desc;
```
![profissinal x agendamento](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/3_Consulta.png)

### 4. Quais são as Peças com Estoque Baixo (menos de 20 unidades) que precisam de um novo pedido urgente?
   
```SQL
select PartName as Peças, Quantity as Quantidade, Location as Localização from PartsStock where Quantity < 20;
```
![Peças x estoque](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/4_Consulta.png)

### 5. Qual é a lista completa dos agendamentos de todos os profissionais?
   
```SQL
select a.AppointmentDate as Data_Agendamento, c.Fname as Nome_Cliente, c.Lname as Sobrenome, v.Plate as Placa, m.Name as Mecânico from Appointments a
		join Clients c ON a.idClient = c.idClient
		join Vehicles v ON a.idVehicle = v.idVehicle
		join Mechanics m ON a.idMechanic = m.idMechanic
	where a.AppointmentDate > NOW()
	order by a.AppointmentDate asc;
```
![Clientes x agendamento](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/5_Consulta.png)

### 6. Qual foi o Faturamento Total por Mês?
   
```SQL
select DATE_FORMAT(PaymentDate, '%Y-%m') as Mês, SUM(Amount) as Receita_Total from Payments
	where Paid = TRUE
	group by Mês
	order by Mês DESC;
```
![pagamento x mês](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/6_Consulta.png)

### 7. Quais são as peças usadas em mais de um tipo de serviço?
   
```SQL
select ps.PartName as Peças, COUNT(*) AS Contagem_Serviço from ServiceParts sp
	join PartsStock ps ON sp.idPart = ps.idPart
	group by ps.idPart
	having COUNT(*) > 1;
```
![Peças x serviço](https://github.com/SanyMirelly/dio-project-logic-database_zero/blob/main/Consultas/7_Consulta.png)

## Considerações
Este modelo oferece uma base sólida para a digitalização e profissionalização da gestão de oficinas. Além de organizar dados, ele possibilita a geração de insights cruciais para aprimorar o atendimento, cortar custos e elevar a eficiência operacional.
