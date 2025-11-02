-- Criação do Banco de Dados para o Cenário de E-commerce --
-- drop database proj_oficina;
create database proj_oficina;
use proj_oficina;

-- Criar Tabela Cliente --
CREATE TABLE Clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit char(3),
    Lname VARCHAR(30),
    CPF CHAR(11) NOT NULL UNIQUE,
    Phone CHAR(11),
    Email VARCHAR(255),
    Address VARCHAR(255)
);

alter table Clients auto_increment=1;

-- Criar Tabela Veiculo --
CREATE TABLE Vehicles (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    Plate CHAR(7) NOT NULL UNIQUE,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    constraint fk_vehicle_client FOREIGN KEY (idClient) REFERENCES Clients(idClient)
        ON UPDATE CASCADE ON DELETE CASCADE
);

alter table Vehicles auto_increment=1;

-- Criar Tabela Mecânico (Profissional) --
CREATE TABLE Mechanics (
    idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    CPF CHAR(11) UNIQUE,
    Phone CHAR(11),
    Specialty ENUM('Motor', 'Freios', 'Suspensão', 'Elétrica', 'Geral')
);

alter table Mechanics auto_increment=1;

-- Criar Tabela Serviço --
CREATE TABLE Services (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2)
);

alter table Services auto_increment=1;

-- Criar Tabela Agendamento --
CREATE TABLE Appointments (
    idAppointment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    idVehicle INT,
    idMechanic INT,
    AppointmentDate DATETIME,
    Status ENUM('Agendado', 'Em andamento', 'Concluído', 'Cancelado') DEFAULT 'Agendado',
    constraint fk_appointment_client FOREIGN KEY (idClient) REFERENCES Clients(idClient),
    constraint fk_appointment_vehicle FOREIGN KEY (idVehicle) REFERENCES Vehicles(idVehicle),
    constraint fk_appointment_mechanic FOREIGN KEY (idMechanic) REFERENCES Mechanics(idMechanic)
);

alter table Appointments auto_increment=1;

-- Criar Tabela Pagamento --
CREATE TABLE Payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    idAppointment INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'Pix', 'Boleto') NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Paid BOOLEAN DEFAULT FALSE,
    constraint fk_payment_client FOREIGN KEY (idClient) REFERENCES Clients(idClient),
    constraint fk_payment_appointment FOREIGN KEY (idAppointment) REFERENCES Appointments(idAppointment)
        ON UPDATE CASCADE ON DELETE SET NULL
);

alter table Payments auto_increment=1;

-- Criar TAbela Estoque de Peças --
CREATE TABLE PartsStock (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    PartName VARCHAR(100),
    Description TEXT,
    Quantity INT DEFAULT 0,
    Location VARCHAR(100)
);

alter table PartsStock auto_increment=1;

-- tabelas de relacionamentos M:N --

-- Serviço por Agendamento
CREATE TABLE AppointmentServices (
    idAppointment INT,
    idService INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idAppointment, idService),
    constraint fk_appt_service FOREIGN KEY (idAppointment) REFERENCES Appointments(idAppointment),
    constraint fk_service_appt FOREIGN KEY (idService) REFERENCES Services(idService)
);

alter table AppointmentServices auto_increment=1;

-- Peças por Serviço
CREATE TABLE ServiceParts (
    idService INT,
    idPart INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (idService, idPart),
    constraint fk_service_part FOREIGN KEY (idService) REFERENCES Services(idService),
    constraint fk_part_service FOREIGN KEY (idPart) REFERENCES PartsStock(idPart)
);

alter table ServiceParts auto_increment=1;