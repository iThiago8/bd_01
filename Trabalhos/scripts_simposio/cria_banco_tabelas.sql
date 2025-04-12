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

