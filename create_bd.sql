-- criar bd
create database GREENHOUSE;

-- definir bd como padrão/utilizável
use GREENHOUSE;

-- criar tabela / entidade
CREATE TABLE `PLANTS` (
	`plant_name` CHAR(30) NOT NULL,
	`sensor_value` FLOAT DEFAULT NULL,
	`SENSOR_EVENT` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY `pk_plants` (`PLANT_NAME`)
);
