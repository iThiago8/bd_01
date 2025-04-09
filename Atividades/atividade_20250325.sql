-- Com base no banco de dados de vetrinária, elabore consultas SQL para responder as seguintes questões:
-- 		1. Qual a quantidade de animais registrados no sistema?
-- 		2. Qual o total de vacinações registradas no sistema?
-- 		3. Quantos animais temos registrados para cada tipo de animal (canino, felino etc)
-- 		4. Qual a categoria de animais que mais recebeu vacinas? 


USE VETERINARIA;

-- 1.
SELECT COUNT(*) FROM VETERINARIA.ANIMAL;


-- 2.
SELECT COUNT(*) FROM VETERINARIA.VACINACAO;

-- 3.
SELECT 
	COUNT(A.ID) QTD,
	TA.DESC_TIPO_ANIMAL TP_ANIMAL
FROM ANIMAL A
INNER JOIN 
	TIPO_ANIMAL TA
		ON A.ID_TIPO_ANIMAL = TA.ID
GROUP BY TA.DESC_TIPO_ANIMAL
ORDER BY TP_ANIMAL
		;

-- 4.
SELECT
	COUNT(V.ID) QTD,
	TA.DESC_TIPO_ANIMAL
FROM VACINACAO V
INNER JOIN 
	ANIMAL A 
		ON V.ID_ANIMAL = A.ID
INNER JOIN
	TIPO_ANIMAL TA
		ON TA.ID = A.ID_TIPO_ANIMAL
GROUP BY TA.DESC_TIPO_ANIMAL;




