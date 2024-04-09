/* AULA 130 - AMPLITUDE DE UM DATASET */

SELECT qtd, COUNT(*) AS "Moda"
FROM maquinas
GROUP BY qtd
ORDER BY "Moda" DESC;

SELECT maquina, 
	MAX(qtd) AS "Qtd Máxima", 
	MIN(qtd) AS "Qtd Mínima", 
	MAX(qtd)-MIN(qtd) AS "Amplitude"
FROM maquinas 
GROUP BY maquina
ORDER BY 1 ASC;

-- Incluindo a Média da qtd produzida por máquina
SELECT maquina, 
	MAX(qtd) AS "Qtd Máxima", 
	MIN(qtd) AS "Qtd Mínima", 
	MAX(qtd)-MIN(qtd) AS "Amplitude",
	ROUND(AVG(qtd),2) AS "Média"
FROM maquinas 
GROUP BY maquina
ORDER BY 1 ASC;

/* DESVIO PADRÃO e VARIÂNCIA */

SELECT MAQUINA AS "Máquina", 
	   ROUND(AVG(qtd),2) AS "Média", 
	   ROUND(STDDEV_POP(qtd),2) AS "Desv. Padrão",
	   ROUND(VAR_POP(qtd),2) AS "Variância"
FROM MAQUINAS GROUP BY MAQUINA ORDER BY 1 ASC;

/* Em suma, o desvio padrão é a "distância" do valor 
-- em relação a média. Ele nos ajuda a compreender o 
-- grau de dispersão ou variabilidade dos valores.
-- OBS: A variância e o desvio padrão se assemelhão,
-- são métricas que nos fornece insights sobre a 
-- variabilidade e dispersão dos dados. */










