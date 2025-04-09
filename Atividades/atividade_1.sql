-- Com base no exemplo desenvolvido em lab para o banco de dados plants, crie um aestrutua lógica de banco de dados para uma imobiliária armazenar os registros de seus imóveis.
-- Para isto, crie uma tabela imóvel com as seguintes colunas: 
-- id do tipo inteiro, nome do tipo string, descrição do tipo string, número de quartos do tipo inteiro, valor de venda do tipo REAL ou float.
-- insira ao menos 10 registros de dados para esta entidade e aplique ao menos 3 tipos diferentes de consulta para exibição de dados

CREATE DATABASE SILVERSTONE_ESTATES;

USE SILVERSTONE_ESTATES;

CREATE TABLE realty (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	description LONGTEXT,
	number_rooms INT,
	market_value DECIMAL,
	PRIMARY KEY pk_realty (id)
);


INSERT INTO silverstone_estates.realty (name, description, number_rooms, market_value) 
VALUES 
('Edifício Santa Mônica', 'Edifício roxo', 25, 25000.00),
('Residencial Bella Vista', 'Condomínio moderno com vista panorâmica', 12, 15000.00),
('Casa Jardim das Flores', 'Casa ampla com jardim e piscina', 6, 5000.00),
('Prédio Central Tower', 'Prédio comercial de alto padrão', 20, 30000.00),
('Villa Toscana', 'Casa de campo com estilo europeu', 8, 8000.00),
('Edifício Atlântico', 'Apartamento de luxo com vista para o mar', 15, 22000.00),
('Condomínio Solar dos Lagos', 'Condomínio fechado com segurança 24h', 10, 10000.00),
('Residencial Porto Seguro', 'Imóvel com excelente infraestrutura', 18, 18000.00),
('Casa das Palmeiras', 'Casa espaçosa com piscina e churrasqueira', 7, 7000.00),
('Prédio Empresarial Nova Era', 'Prédio corporativo com salas comerciais', 30, 40000.00);


SELECT * FROM silverstone_estates.realty WHERE market_value > 10000

SELECT * FROM silverstone_estates.realty WHERE number_rooms > 15

SELECT * FROM silverstone_estates.realty WHERE name LIKE 'Residencial%'




