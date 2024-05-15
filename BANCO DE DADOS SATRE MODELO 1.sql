# PROJETO SARTRE, MOSTRAR O TEMPO DE ESPERA, LOCALIZAÇÃO, QUANTIDADE DE MEDICOS E PACIENTES DISPONIVEIS EM CADA UPA - !

CREATE TABLE UPAS (
    ID_UPA INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Upa varchar(200),
    Endereco VARCHAR(200),
    Medicos_Quantidade INT,
    Pacientes_Quantidade INT,
    Tempo_Estimado_Espera INT,
    Tempo_Medio_Espera INT
);

CREATE TABLE Especialidades (
    ID_Especialidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Especialidade VARCHAR(200)
);

CREATE TABLE UPAS_Especialidades (
    ID_UP INT,
    ID_Especialidad INT,
    PRIMARY KEY (ID_UP, ID_Especialidad),
    FOREIGN KEY (ID_UP) REFERENCES UPAS(ID_UPA),
    FOREIGN KEY (ID_Especialidad) REFERENCES Especialidades(ID_Especialidade)
);

INSERT INTO Especialidades (Nome_Especialidade) VALUES
('Pediatra'),
('Cardiologia'),
('Cirurgia Geral'),
('Ginecologia e Obstetricia'),
('Clinico Geral'),
('Dentista'),
('Psiquiatra');

INSERT INTO UPAS (Nome_Upa, Endereco, Medicos_Quantidade,  Pacientes_Quantidade, Tempo_Estimado_Espera, Tempo_Medio_Espera)

VALUES 
    
('CAXANGA', 'R. Ribeiro Pessoa, S/N - Iputinga, Recife - PE, 50980-000', 8, 55, 30, 22),

('IMBIRIBEIRA', 'Avenida Mascarenhas de Moraes, 4.223 - Imbiribeira Recife - PE', 9, 55, 25, 30),
    
('IBURA', 'R. Vale do Itajaí, S/n - Ibura, Recife - PE, 51320-180', 4, 60, 38, 30),
    
('BARRA DE JANGADA', 'Rua Cruz Alta, S/N - Barra de Jangada Jaboatão dos Guararapes - PE', 7, 35, 25, 18);

UPDATE UPAS SET Tempo_Estimado_Espera = (Medicos_Quantidade * Tempo_Medio_Espera + Pacientes_Quantidade) / Medicos_Quantidade WHERE Nome_Upa = 'CAXANGA';

UPDATE UPAS SET Tempo_Estimado_Espera = (Medicos_Quantidade * Tempo_Medio_Espera + Pacientes_Quantidade) / Medicos_Quantidade WHERE Nome_Upa = 'IMBIRIBEIRA';

UPDATE UPAS SET Tempo_Estimado_Espera = (Medicos_Quantidade * Tempo_Medio_Espera + Pacientes_Quantidade) / Medicos_Quantidade WHERE Nome_Upa = 'IBURA';

INSERT INTO UPAS_Especialidades (ID_UP, ID_Especialidad) VALUES (1,1),(1,3),(2,1),(3,1),(3,2),(3,3),(1,2),(1,5),(2,5),(2,6);

SELECT UPAS.Nome_Upa, Especialidades.Nome_Especialidade
from UPAS_Especialidades
inner join UPAS ON UPAS.ID_UPA = UPAS_Especialidades.ID_UP
inner join Especialidades ON Especialidades.ID_Especialidade = UPAS_Especialidades.ID_Especialidad
order by UPAS.Nome_Upa;

SELECT * FROM UPAS WHERE Tempo_Estimado_Espera < 30 ;

SELECT * FROM UPAS WHERE Pacientes_Quantidade < 50 ; 

SELECT * FROM UPAS WHERE Nome_Upa = 'CAXANGA' ;

SELECT * FROM UPAS WHERE ID_UPA > 2 ;












































