-- inserção de dados --
use proj_oficina;
show tables;

-- idClient, Fname, Minit, Lname, CPF, Phone, Email, Address
INSERT INTO Clients (Fname, Minit, Lname, CPF, Phone, Email, Address) VALUES
			('João', 'P', 'Silva', '12345678901', '31999999999', 'joao.silva@email.com', 'Rua das Flores, 123'),
			('Maria', 'L', 'Oliveira', '98765432100', '31988888888', 'maria.oliveira@email.com', 'Av. Central, 456'),
			('Pedro', 'G', 'Almeida', '32165498700', '31977712345', 'pedro.almeida@email.com', 'Rua do Sol, 789'),
			('Ana', 'M', 'Martins', '65498732199', '31966654321', 'ana.martins@email.com', 'Av. Brasil, 1010');
		
select * from Clients;

-- idClient, Plate, Brand, Model, Year
INSERT INTO Vehicles (idClient, Plate, Brand, Model, Year) VALUES
			(1, 'ABC1234', 'Fiat', 'Uno', 2010),
			(2, 'XYZ5678', 'Chevrolet', 'Onix', 2018),
            (3, 'DEF4321', 'Volkswagen', 'Gol', 2012),
			(4, 'GHI8765', 'Toyota', 'Corolla', 2020);

select * from vehicles;

-- Name, CPF, Phone, Specialty ('Motor', 'Freios', 'Suspensão', 'Elétrica', 'Geral')
INSERT INTO Mechanics (Name, CPF, Phone, Specialty) VALUES
			('Carlos Mendes', '11122233344', '31977777777', 'Motor'),
			('Fernanda Costa', '55566677788', '31966666666', 'Elétrica'),
			('Roberto Lima', '99988877766', '31955555555', 'Freios'),
			('Juliana Rocha', '44433322211', '31944444444', 'Suspensão');

select * from Mechanics;

-- ServiceName, Description, Price
INSERT INTO Services (ServiceName, Description, Price) VALUES
			('Troca de Óleo', 'Substituição do óleo do motor', 120.00),
			('Revisão Elétrica', 'Verificação completa do sistema elétrico', 250.00),
			('Alinhamento', 'Alinhamento da suspensão e direção', 180.00),
			('Troca de Pastilhas de Freio', 'Substituição das pastilhas dianteiras', 220.00);

select * from Services;
            
-- idClient, idVehicle, idMechanic, AppointmentDate, Status ('Agendado', 'Em andamento', 'Concluído', 'Cancelado')
INSERT INTO Appointments (idClient, idVehicle, idMechanic, AppointmentDate, Status) VALUES
			(1, 1, 1, '2025-11-05 09:00:00', 'Agendado'),
			(2, 2, 2, '2025-11-06 14:00:00', 'Agendado'),
            (3, 3, 3, '2025-11-07 10:30:00', 'Agendado'),
			(4, 4, 4, '2025-11-08 15:00:00', 'Agendado');

select * from Appointments;

-- idClient, idAppointment, PaymentMethod ('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'Pix', 'Boleto'), Amount, Paid
INSERT INTO Payments (idClient, idAppointment, PaymentMethod, Amount, Paid) VALUES
			(1, 1, 'Pix', 120.00, TRUE),
			(2, 2, 'Cartão de Crédito', 250.00, FALSE),
            (3, 3, 'Dinheiro', 180.00, TRUE),
			(4, 4, 'Pix', 220.00, FALSE);

select * from Payments;
            
-- idAppointment, idService, Quantity
INSERT INTO AppointmentServices (idAppointment, idService, Quantity) VALUES
			(1, 1, 1),
			(2, 2, 1),
            (3, 3, 1),
			(4, 4, 1);

-- PartName, Description, Quantity, Location
INSERT INTO PartsStock (PartName, Description, Quantity, Location) VALUES
			('Filtro de Óleo', 'Filtro para motor 1.0', 50, 'Prateleira A'),
			('Fusível 10A', 'Fusível padrão para sistema elétrico', 100, 'Prateleira B'),
            ('Pastilha de Freio', 'Pastilha dianteira para veículos médios', 30, 'Prateleira C'),
			('Kit Alinhamento', 'Ferramentas e componentes para alinhamento', 15, 'Prateleira D');
            
select * from PartsStock;

-- idService, idPart, Quantity
INSERT INTO ServiceParts (idService, idPart, Quantity) VALUES
			(1, 1, 1),
			(2, 2, 2),
            (3, 2, 1),
			(4, 1, 2);













