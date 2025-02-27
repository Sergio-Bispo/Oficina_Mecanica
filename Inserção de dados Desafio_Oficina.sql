use Desafio_Oficina;
show tables;

-- idClients, Nome, CPF, Numero_Os, Data_Os, Veiculo, Ano

insert into Clientes ( Nome, CPF, Numero_Os, Data_Os, Veiculo, Ano) 
            values  ('Manoel de Souza', '12345678911', '01', '1990-11-01', 'Corsa', '2015'),
                    ('Joana Figueira', '98765432178', '05', '2000-08-15', 'Fusca', '2018'),
                    ('Ricardo Pereira', '23456789012', '20', '2018-07-10', 'Honda', '2017'),
                    ( 'Florentino Palesma', '34512567891', '17', '2020-01-05','Picape', '2019'),
                    ('João Pedro Almeida', '65784592167', '10', '2021-12-15', 'Sedan', '2016'),
                    ('Samuel Azevedo', '97531257837', '15', '2022-09-08', 'Jipe', '2020');
                    
-- idServiço_mecanico, Razão_Social, CNPJ, Localização, Contato

insert into Serviços_Mecânicos (Razão_Social, CNPJ, Localização, Contato)
                       values ('SB Informática', '987895643214567', 'Rio de Janeiro', '987634524'),
                              ('DEB Informações', '189125346978634', 'Bahia', '988662428'),
                              ('Pavilhão das Louças', '658970004532786', 'Belo Horizonte', '986664533'),
                              ('Atacadão das Confecções', '781927837456719', 'São Paulo', '889012346'),
                              ('Feira da Moda', '348900888654234', 'Novalandia', '970078766'); 
                              
-- idVeiculo, Modelo, Ano

insert into Veiculos (Modelo, Ano) values
                     ('Corsa', '2010'),
                     ('Sedan', '2014'),
                     ('Honda', '2020'),
                     ('Celta', '2012'),
                     ('Jipe', '2022');
                     
-- idEquipe_Mecanico, Código, Nome, Endereço

insert into Equipe_Mecânicos (Código, Nome, Endereço) values
                             ('12345678901234567890', 'Severino dos Santos', 'Rua das Palmeiras, 10'),
                             ('00000986765341244456', 'Paulo Sérgio da Silva', 'Rua das Flores, 120'),
                             ('55566688811132457658', 'Luciene Melo', 'Avenida Tiradentes, 98-Mares'),
                             ('98124356861350259763', 'Juraci de Almeida', 'Condomínio das Águas,1007'),
                             ('44454667889054231895', 'Luís Amorim dos Anjos', 'Estrada das Barreiras,700');
                             
-- idTabela_Serviço, Valor_Serviço, Valor_Peça, Valor_Revisão

insert into Tabela_Serviço (valor_Serviço, Valor_Peça, Valor_Revisão) values 
                                  ('150000', '30000', null),
                                  ('32000', '180000', null),
                                  ('15000', '10000',null),
                                  ('100000', '150000',null),
                                  ('8000','10000',null);    
                                  
-- idOrdem_Serviço, Numero_OS, Data_Emissão, Valor_Orçamento, Serviço_Status, Data_Conclusão, Autorização_Cliente

insert into Ordem_Serviço (idOrdem_Serviço, Numero_OS, data_Emissão, Valor_Orçamento, Serviço_Status, Data_Conclusão, Autorização_Cliente)
                   values (  10, '2525', '1990-01-24', '180000', 'Confirmado', '1990-02-18','Autorizada'),
                          (  12, '2526', '1998-08-30', '140000', 'Em Processamento', '1998-03-15', 'Autorizada')
                   ;
                   
-- idMecanico_Especializado, Nome, Especialidade, Código

insert into Mecânico_Especializado (Nome, Especialidade, Código) 
                           values  ('João Pereira', 'Manutenção de Motor', '10'), 
                                   ('Mário Jorge Silva', 'Eletricista de Auto','25'),
                                   ('Salatiel de Jesus', 'Retifica de Motor', '39');  
                                   
-- idExecução_Serviço, Nome, Código, Inicio, Conclusão

insert into Execução_Serviço (Nome, Código, Inicio, Conclusão)
                      values ('Manoel dos Anjos', '23', '2022-12-01', '2023-01-30'),
                             ('Elisio Sacramento', '70', '2023-11-09', '2023-12-01'),
                             ('Carlos Santana', '75', '2024-01-15', '2024-01-28');
				
-- idClient, idServiço_Mecânico, Cliente_Serviço, 

insert into Cliente_Solicitação (idCliente, idServiço, Cliente_Serviço) 
                          values (1, 5, 6),                                               
                                 (2, 5, 7),
                                 (3, 5, 8); 
                                 
-- idOrdemServiços, idEspecialidade

insert into Distribuição_OS (idOrdemServiços, idEspecialidade) 
					values  (5, 8);
                    
                    
                      
					
 use Desafio_Oficina;
show tables;    
-- Recupeando nomes completos dos clientes
select concat(Nome,' ', CPF,' ',Numero_Os,' ', Data_Os,' ', Veiculo,' ', Ano ) as complete_name from Clientes;
 --  STATEMENT                
-- Queries Case statement, Recuperando dados Razão Social e Localização de Serviços Mecânicos
 select Nome, Veiculo, Ano from clientes;
 select Razão_Social, Localização from Serviços_Mecânicos;
 
 -- funções e cláusulas de agrupamento
 
 -- Pesquisar quantidade de clientes e veiculos
 select * from clientes;
select count(*) from clientes;

-- Recuperar Código, Nome, Endereço da Equipe de Mecânico e Tabela de serviço       
select e.idEquipe_Mecanico, Código, Nome, Endereço, count(*) as Number_of_Tabela_Serviço from Equipe_Mecânicos e
                               inner join Tabela_Serviço t ON e.idEquipe_Mecanico = t.idTabela_Serviço
                               group by idEquipe_Mecanico;
                          
-- ORDER BAY
select CNPJ, contato, Razão_Social from Serviços_Mecânicos order by (Razão_Social); 

-- AGRUPAMENTO
select count(*) from Clientes;

-- GROUP BAY E HAVING
select Razão_Social, count(*)
 from Serviços_Mecânicos
 where CNPJ > 2
 group by Razão_Social
 having count(*) >=0;
 

                        
                              
                    