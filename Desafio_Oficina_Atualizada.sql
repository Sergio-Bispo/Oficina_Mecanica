create schema if not exists Desafio_Oficina_constraints;
use Desafio_Oficina_constraints;

select * from information_schema.table_constraints
	 where constraint_schema = 'Desafio_Oficina_constraints';


create database Desafio_Oficina;
use Desafio_oficina;
desc Clientes;

create table Clientes (
idClientes int auto_increment primary key,
Nome varchar (45),
CPF char (11) not null,
Numero_Os int not null,
Data_Os date  not null,
Veiculo varchar (15) not null,
Ano float not null,
constraint unique_cpf_cliente unique (CPF) 

);

create table Serviços_Mecânicos ( 
idserviço_mecânico int auto_increment primary key,
Razão_Social varchar (255) not null,
CNPJ char (15) not null,
Localização varchar (255) not null,
Contato char (9),
constraint unique_cnpj_serviços_mecanicos unique (Serviços_Mecânicos)
);

create table Veiculos (
idVeiculo int auto_increment primary key,
Modelo char (10) not null,
Ano int not null

);

create table Equipe_Mecânicos (
idEquipe_Mecanico int auto_increment primary key,
Código varchar (20) not null,
Nome varchar (45) not null,
Endereço varchar (255) not null,
constraint fk_equipe_mecânicos_veiculos foreign key (idEquipe_Mecanico) references veiculos (idVeiculo)
);

create table Tabela_Serviço (
idTabela_Serviço int auto_increment primary key,
Valor_Serviço float not null,
Valor_Peça float not null,
Valor_revisão int
);

create table Ordem_Serviço (
idOrdem_Serviço int auto_increment primary key,
Numero_OS int not null,
Data_Emissão date not null,
Valor_Orçamento float not null,
Serviço_Status enum ('Cancelado', 'Confirmado', 'Em processamento', 'Concluido') default 'Em processamento',
Data_Conclusão date not null,
Autorização_Cliente varchar (45) not null
-- constraint fk_Ordem_serviço foreign key (idOrdem_Serviço) references ordem (idMecanico_Especializado)

);

create table Mecânico_Especializado (
idMecanico_Especializado int auto_increment primary key,
Nome varchar (45) not null,
Especialidade varchar (45) not null,
Código int not null,
constraint unique_Codigo_Mecanico_Especializado unique (idMecanico_Especializado)
);

create table Execução_Serviço (
idExecução_Serviço int auto_increment primary key,
Nome varchar (45) not null,
Código int not null,
Inicio date not null,
Conclusão date not null

);

create table Cliente_Solicitação (
idCliente int,
idServiço_Mecânico int,
Cliente_Serviço int,
primary key (idCliente, idServiço_Mecânico),
constraint fk_Cliente_serviço_mecânico foreign key (idCliente) references Clientes (idClientes),
constraint fk_serviço_mecânico_cliente foreign key (idServiço_Mecânico) references serviço (idServiços_Mecânicos)

);


create table Distribuição_OS (
idOrdem_Serviços int,
idEspecialidade int,
primary key (idOrdem_Serviços, idEspecialidade),
constraint fk_ordens_serviços foreign key (idOrdem_serviços) references especializado (idMecânico_Especializado),
constraint fk_Especializado_mecanico foreign key (idEspecialidade) references ordem (idOrdem_Serviço)


);

select * from Desafio_Oficina;

show tables;
show databases; 

  use information_schema;
  desc referential_constraints;
  select * from referential_constraints where constraint_schema = 'Desafio_Oficina';
