-- Com base no exemplo executado em laboratório para o Banco de Dados UNOESC BANK, com relacionamento de cardinalidade 1:N, monte um script de BD para o seguinte problema:
-- Uma empresa veterinária deseja criar um simples banco de dados para armazenar os registros dos tipos de animais que atendem, podendo ser: caninos, felinos, suínos, caprinos, equinos etc, 
-- onde cada tipo animal poderá ter vários animais. Para cada animal, você deve armazenar id, nome, id do tipo de animal, data de nascimento, cor, peso e altura

-- Além disso, o BD deve armazenar um histórico de vacinação, onde um animal pode ter várias vacinações. Para a tabela vacine armazene: id, nome da vacina, data da aplicação e o id animal como FK

-- Capítulo 2 do livro no git - ler sobre normalização de banco de dados, 1°-5° forma

DROP DATABASE VETERINARIA;

CREATE DATABASE VETERINARIA;

USE VETERINARIA;

CREATE TABLE tipo_animal (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	desctipoanimal VARCHAR(150)
);

INSERT INTO  VETERINARIA.tipo_animal (desctipoanimal) 
VALUES 
	('Canino'),
	('Felino'),
	('Suíno'),
	('Caprino'),
	('Equino'),
	('Outros');


CREATE TABLE animal (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	desc_nome_animal VARCHAR(255),
	id_tipo_animal INT NOT NULL,
	data_nascimento DATE,
	desc_cor VARCHAR(100),
	peso FLOAT,
	altura FLOAT,
	CONSTRAINT FK_ID_TIPO_ANIMAL FOREIGN KEY (id_tipo_animal) REFERENCES tipo_animal(id)	
);

CREATE TABLE vacinacao (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	desc_nome_vacina VARCHAR(250),
	data_aplicacao DATE,
	id_animal INT NOT NULL,
	CONSTRAINT FK_ID_ANIMAL FOREIGN KEY (id_animal) REFERENCES animal (id)
);

CREATE INDEX IDX_VACINACAO_DATA_HORA
ON vacinacao (data_aplicacao);

INSERT INTO VETERINARIA.animal (desc_nome_animal, id_tipo_animal, data_nascimento, desc_cor, peso, altura)
VALUES 
	('Fumacinha', 2, '2022-04-20', 'Cinza', 4.05, 0.34),
	('Bethoven', 1, '2012-05-15', 'Branco', 5.32, 0.98),
	('Pé de pano', 5, '2022-05-15', 'Marrom', 75.32, 1.98);


INSERT INTO VETERINARIA.vacinacao (desc_nome_vacina, data_aplicacao, id_animal)
VALUES
	('rubéola', '2025-03-11', 3),
	('FIV/FELV', '2025-03-11', 3);


UPDATE VETERINARIA.animal
SET desc_nome_animal = 'gato'
WHERE id = 1;

UPDATE VETERINARIA.animal
SET desc_nome_animal = 'cachorro'
WHERE id = 2;

UPDATE VETERINARIA.animal
SET desc_nome_animal = 'cavalo'
WHERE id = 3;


DELETE FROM VETERINARIA.vacinacao
WHERE id_animal = 3;








