CREATE DATABASE EVENTO;

USE EVENTO;

CREATE TABLE SIMPOSIO(
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NOME` VARCHAR (150),
    `DATA_INICIO` DATE,
	`DATA_FIM` DATE,
	`LOCALIZACAO` VARCHAR(255),
	`DESCRICAO` TEXT
);

CREATE TABLE PESSOA(
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`CPF` VARCHAR (11),
    `NOME` VARCHAR (150),
    `EMAIL` VARCHAR(255),
	`TELEFONE` VARCHAR(20),
	`DATA_NASCIMENTO` DATE
);

CREATE TABLE TEMA(
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NOME` VARCHAR (150)
);

CREATE TABLE MINICURSO(
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NOME` VARCHAR (150),
    `CARGA_HORARIA` INT,
    `ID_TEMA` INT NOT NULL,
    CONSTRAINT FK_ID_TEMA_MINICURSO_TEMA
		FOREIGN KEY (ID_TEMA)
        REFERENCES TEMA (ID)
);



CREATE TABLE ARTIGO(
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NOME` VARCHAR (150),
    `DATA_PUBLICACAO` DATE,
	`RESUMO` TEXT,
    `ID_TEMA` INT NOT NULL,
    CONSTRAINT FK_ID_TEMA_ARTIGO_TEMA
		FOREIGN KEY (ID_TEMA)
        REFERENCES TEMA (ID)
);

CREATE TABLE COMISSAO_CIENTIFICA(
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ID_TEMA` INT NOT NULL,
    `NOME_COMISSAO` VARCHAR(100),
    CONSTRAINT FK_ID_TEMA_COMISSAO_TEMA
		FOREIGN KEY (ID_TEMA)
        REFERENCES TEMA (ID)
);


CREATE TABLE AVALIACAO_ARTIGO_COMISSAO(
	`ID_ARTIGO` INT NOT NULL,
    `ID_COMISSAO` INT NOT NULL,
    `NOTA` DECIMAL(3, 2),
    `PARECER` DECIMAL(3, 2),
	`DATA_AVALIACAO` DATE,
    PRIMARY KEY(ID_ARTIGO, ID_COMISSAO),
    CONSTRAINT FK_ID_ARTIGO_COMISSAO_ARTIGO
		FOREIGN KEY (ID_ARTIGO)
        REFERENCES ARTIGO (ID),
	CONSTRAINT FK_ID_COMISSAO_AVALIACAO_COMISSAO_CIENTIFICA
		FOREIGN KEY (ID_COMISSAO)
        REFERENCES COMISSAO_CIENTIFICA (ID) 
);

CREATE TABLE PESSOA_ARTIGO(
	`ID_PESSOA` INT NOT NULL,
    `ID_ARTIGO` INT NOT NULL,
    PRIMARY KEY(ID_PESSOA, ID_ARTIGO),
    CONSTRAINT FK_ID_PESSOA_ARTIGO_PESSOA
		FOREIGN KEY (ID_PESSOA)
        REFERENCES PESSOA (ID),
	CONSTRAINT FK_ID_ARTIGO_ARTIGO
		FOREIGN KEY (ID_ARTIGO)
        REFERENCES ARTIGO (ID)
);

CREATE TABLE MINICURSO_SIMPOSIO(
	`ID_MINICURSO` INT NOT NULL,
    `ID_SIMPOSIO` INT NOT NULL,
    `DATA_INICIAL` DATE,
    `DATA_FINAL` DATE,
    `QUANTIDADE_VAGAS` INT,
    PRIMARY KEY(ID_MINICURSO, ID_SIMPOSIO),  
    CONSTRAINT FK_ID_MINICURSO_SIMPOSIO_MINICURSO
		FOREIGN KEY (ID_MINICURSO)
        REFERENCES MINICURSO (ID),
	CONSTRAINT FK_ID_SIMPOSIO_MINICURSO_SIMPOSIO
		FOREIGN KEY (ID_SIMPOSIO)
        REFERENCES SIMPOSIO (ID)
);

CREATE TABLE PESSOA_MINICURSO(
	`ID_PESSOA` INT NOT NULL,
    `ID_MINICURSO` INT NOT NULL,
    `ID_SIMPOSIO` INT NOT NULL,
    `E_PROFESSOR` INT(1) NOT NULL DEFAULT 0,
    `DATA_INSCRICAO` TIMESTAMP,
    PRIMARY KEY(ID_PESSOA, ID_MINICURSO, ID_SIMPOSIO),
    CONSTRAINT FK_ID_PESSOA_MINICURSO_PESSOA
		FOREIGN KEY (ID_PESSOA)
        REFERENCES PESSOA (ID),
	CONSTRAINT FK_ID_MINICURSO_MINICURSO
		FOREIGN KEY (ID_MINICURSO)
        REFERENCES MINICURSO (ID),
	CONSTRAINT FK_ID_SIMPOSIO_PESSOA_MINICURSO_SIMPOSIO
		FOREIGN KEY (ID_SIMPOSIO)
        REFERENCES SIMPOSIO (ID)
);

CREATE TABLE PESSOA_SIMPOSIO(
	`ID_PESSOA` INT NOT NULL,
    `ID_SIMPOSIO` INT NOT NULL,
    `FUNCAO` VARCHAR(50),
    PRIMARY KEY(ID_PESSOA, ID_SIMPOSIO),
    CONSTRAINT FK_ID_PESSOA_SIMPOSIO_PESSOA
		FOREIGN KEY (ID_PESSOA)
        REFERENCES PESSOA (ID),
	CONSTRAINT FK_ID_SIMPOSIO_SIMPOSIO
		FOREIGN KEY (ID_SIMPOSIO)
        REFERENCES SIMPOSIO (ID)
);

CREATE TABLE PESSOA_COMISSAO_CIENTIFICA(
	`ID_PESSOA` INT NOT NULL,
    `ID_COMISSAO` INT NOT NULL,
    PRIMARY KEY(ID_PESSOA, ID_COMISSAO),
    CONSTRAINT FK_ID_PESSOA_PESSOA
		FOREIGN KEY (ID_PESSOA)
        REFERENCES PESSOA (ID),
	CONSTRAINT FK_ID_COMISSAO_COMISSAO_CIENTIFICA
		FOREIGN KEY (ID_COMISSAO)
        REFERENCES COMISSAO_CIENTIFICA (ID)
);

-- Semeadura para SIMPOSIO
INSERT INTO SIMPOSIO (NOME, DATA_INICIO, DATA_FIM, LOCALIZACAO, DESCRICAO)
VALUES ('Simpósio de Ciência e Tecnologia', '2025-09-01', '2025-09-03', 'Centro de Convenções', 'Um evento para compartilhar avanços tecnológicos.');

-- Semeadura para PESSOA
-- Semeadura para PESSOA
INSERT INTO PESSOA (CPF, NOME, EMAIL, TELEFONE, DATA_NASCIMENTO)
VALUES 
	('12345678901', 'Thiago Silva', 'thiago@email.com', '48912345678', '1990-05-15'),
	('98765432100', 'Maria Santos', 'maria@email.com', '48987654321', '1985-03-22'),	
	('45678912300', 'João Oliveira', 'joao@email.com', '48945678912', '1992-07-10'),
	('78912345600', 'Ana Costa', 'ana@email.com', '48978912345', '1988-11-05'),
	('32165498700', 'Carlos Lima', 'carlos@email.com', '48932165498', '1995-06-25'),
	('65498732100', 'Beatriz Almeida', 'beatriz@email.com', '48965498732', '1993-02-15'),
	('85296374100', 'Fernanda Silva', 'fernanda@email.com', '48985296374', '1987-09-18'),
	('96374185200', 'Pedro Carvalho', 'pedro@email.com', '48996374185', '1991-04-08'),
	('74185296300', 'Lucas Pereira', 'lucas@email.com', '48974185296', '1990-12-30'),
	('15935748600', 'Juliana Freitas', 'juliana@email.com', '48915935748', '1986-08-02')
;

-- Semeadura para TEMA
INSERT INTO TEMA (NOME)
VALUES 
	('Tecnologia Sustentável'),
	('Inteligência artificial'),
	('Metodologias Ágeis')
;

-- Semeadura para MINICURSO
INSERT INTO MINICURSO (NOME, CARGA_HORARIA, ID_TEMA)
VALUES 
	('Introdução à Tecnologia Sustentável', 16, 1),
	('Introdução à Inteligência Artificial', 20, 2),
	('Introdução à Metodologias Ágeis', 8, 3)
;

-- Semeadura para ARTIGO
INSERT INTO ARTIGO (NOME, DATA_PUBLICACAO, RESUMO, ID_TEMA)
VALUES 
	('Avanços na Sustentabilidade Tecnológica', '2025-06-15', 'Um estudo sobre práticas sustentáveis em tecnologia.', 1),
	('Energia Renovável no Contexto Urbano', '2025-05-20', 'Exploração do uso de energias renováveis nas cidades.', 1),
	('Tecnologias Verdes para Empresas', '2025-04-10', 'Soluções tecnológicas sustentáveis para o ambiente corporativo.', 1),
	('Redução de Resíduos Eletrônicos', '2025-03-25', 'Estudo sobre o reaproveitamento de componentes eletrônicos.', 1),
	('Aplicações de IA na Medicina', '2025-01-30', 'Como a IA está transformando diagnósticos e tratamentos médicos.', 2),
	('Chatbots e Atendimento ao Cliente', '2025-02-15', 'Uso de IA para melhorar a experiência do cliente.', 2),
	('Aprendizado de Máquina e Dados Climáticos', '2025-03-05', 'O impacto da IA na análise de mudanças climáticas.', 2), 
	('Scrum em Grandes Organizações', '2025-04-01', 'Como implementar Scrum em empresas de grande porte.', 3),
	('Kanban para Projetos Pequenos', '2025-02-20', 'Vantagens do Kanban em equipes enxutas.', 3),
	('OKRs e Metodologias Ágeis', '2025-03-18', 'Integração de OKRs em ambientes ágeis.', 3)
;

-- Semeadura para COMISSAO_CIENTIFICA
INSERT INTO COMISSAO_CIENTIFICA (ID_TEMA, NOME_COMISSAO)
VALUES 
	(1, 'Comissão de Sustentabilidade'),
	(2, 'Comissão de Inteligência artifical'),
	(2, 'Comissão de Metologias Ágeis')
;

-- Semeadura para AVALIACAO_ARTIGO_COMISSAO
INSERT INTO AVALIACAO_ARTIGO_COMISSAO (ID_ARTIGO, ID_COMISSAO, NOTA, PARECER, DATA_AVALIACAO)
VALUES 
    (1, 1, 9.5, 8.5, '2025-06-20'),
    (2, 1, 8.8, 8.2, '2025-05-25'),
    (3, 1, 9.0, 8.7, '2025-04-15'),
    (4, 1, 8.5, 8.0, '2025-03-30'),
    (5, 2, 9.3, 8.8, '2025-02-01'),
    (6, 2, 8.7, 8.4, '2025-02-20'),
    (7, 2, 9.1, 8.9, '2025-03-10'),
    (8, 3, 8.9, 8.6, '2025-04-05'),
    (9, 3, 8.6, 8.2, '2025-03-01'),
    (10, 3, 9.0, 8.7, '2025-03-20')
;

-- Semeadura para PESSOA_ARTIGO
INSERT INTO PESSOA_ARTIGO (ID_PESSOA, ID_ARTIGO)
VALUES 
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (10, 5),
    (1, 6), 
    (3, 6),
    (2, 7),
    (4, 7),
    (5, 8),
    (7, 8),
    (6, 9),
    (8, 9),
    (9, 10),
    (10, 10)
;


-- Semeadura para MINICURSO_SIMPOSIO
INSERT INTO MINICURSO_SIMPOSIO (ID_MINICURSO, ID_SIMPOSIO, DATA_INICIAL, DATA_FINAL, QUANTIDADE_VAGAS)
VALUES 
	(1, 1, '2025-09-01', '2025-09-02', 30),
	(2, 1, '2025-09-03', '2025-09-04', 30),
	(3, 1, '2025-09-05', '2025-09-06', 30)
;

-- Semeadura para PESSOA_MINICURSO
INSERT INTO PESSOA_MINICURSO (ID_PESSOA, ID_MINICURSO, ID_SIMPOSIO, E_PROFESSOR, DATA_INSCRICAO)
VALUES 
    (1, 1, 1, 1, CURRENT_TIMESTAMP),
    (2, 1, 1, 0, CURRENT_TIMESTAMP),
    (3, 1, 1, 0, CURRENT_TIMESTAMP),
    (4, 2, 1, 1, CURRENT_TIMESTAMP),
    (5, 2, 1, 0, CURRENT_TIMESTAMP),
    (6, 2, 1, 0, CURRENT_TIMESTAMP),
    (7, 3, 1, 1, CURRENT_TIMESTAMP),
    (8, 3, 1, 0, CURRENT_TIMESTAMP),
    (9, 3, 1, 0, CURRENT_TIMESTAMP)
;


-- Semeadura para PESSOA_SIMPOSIO
INSERT INTO PESSOA_SIMPOSIO (ID_PESSOA, ID_SIMPOSIO, FUNCAO)
VALUES 
    (1, 1, 'Coordenador'),
    (2, 1, 'Assistente de Organização'),
    (3, 1, 'Responsável Técnico'),
    (4, 1, 'Supervisor Logístico'),
    (5, 1, 'Gerente de Comunicação')
;


-- Semeadura para PESSOA_COMISSAO_CIENTIFICA
INSERT INTO PESSOA_COMISSAO_CIENTIFICA (ID_PESSOA, ID_COMISSAO)
VALUES 
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 3),
    (8, 3),
    (9, 3)
;

