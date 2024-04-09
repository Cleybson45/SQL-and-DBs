/* AULA 131 - MEDIANA */ 

SELECT MAQUINA,
  PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY QTD) AS "Mediana",
  ROUND(AVG(QTD),2) AS "Média"
FROM MAQUINAS GROUP BY MAQUINA;

/* A linha 4 desse script significa parafraseando:
-- "Projete o percentual do grupo ordenado da coluna quantidade."
-- No caso específico do valor 0.5, isso representa a mediana dos 
-- dados. A mediana é o valor que divide o conjunto de dados em duas
-- partes iguais, onde metade dos valores está abaixo da mediana e a
-- outra metade está acima dela. Por exemplo, se tivermos um conjunto
-- de dados ordenado com 10 valores, o valor do percentil 0.5 
-- indicaria o valor que está exatamente na posição do meio desse 
-- conjunto ordenado. */