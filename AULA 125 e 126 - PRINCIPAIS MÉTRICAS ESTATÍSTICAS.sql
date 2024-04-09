/* AULA 125 - MÉDIA */

/* Limitando a projeção de um dataset */

SELECT * FROM funcionarios LIMIT 5;
-- Irá trazer apenas os 5 primeiros 

/* Gasto total em salários pago pela empresa */
SELECT SUM(salario) FROM funcionarios;

/* Qual montante total que cada departamento recebe de salário */
SELECT departamento AS "Departamento", SUM(salario) AS "Total Salário Pago"
FROM funcionarios GROUP BY departamento;

/* Agrupado por departamento, qual o total pago em salário e a média? */
SELECT departamento AS "Departamento", SUM(salario) AS "Total Salário Pago", AVG(salario) AS "Média Salarial"
FROM funcionarios GROUP BY departamento;
-- Aqui ele trás a média num formato cru, e enorme. Precisamos formatar isso.

/* ORDENADO A QUERY ANTERIOR.. */
SELECT departamento AS "Departamento", SUM(salario) AS "Total Salário Pago", AVG(salario) AS "Média Salarial"
FROM funcionarios GROUP BY departamento ORDER BY 3; -- Mesmo que ORDER BY "Média Salarial"
-- Esse 3 representa a terceira coluna que projetei na query, no caso a coluna AVG. Ele irá ordenar de forma crescente 
-- (do menor para o maior) pela média.
--
--
--
--
--
--
--
--
--
--
--
/* AULA 126 - Principais Medidas Estatísticas */

/*MEDIANA*/
-- Precisa colocar os valores da coluna em ordem, pegar o valor do meio o valor do meio é a mediana. 
-- Se a qtd de valores por par e existirem 2 valores no meio, tiramos a média desses dois valores e obtemos a mediana.

/* --- ChatGPT ----- 
 Quando você usa PERCENTILE_DISC() com um argumento de percentil, como 0.5, significa que você está solicitando 
o valor do percentil 50, que é a mediana. A função então ordena os dados em ordem crescente (ou decrescente, 
dependendo da direção especificada), e retorna o valor do percentil 50, que é o valor do meio dos dados ordenados.

Por exemplo, se tivermos o conjunto de dados [1, 2, 3, 4, 5], a mediana é o valor 3. Quando usamos PERCENTILE_DISC(0.5)
o PostgreSQL simplesmente retorna o valor 3, que é o valor na posição do meio dos dados ordenados.*/
--
--
--

/*MEDIANA dos Salários agrupados por cada Departamento*/
SELECT departamento AS "Departamento", PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY salario) AS "Mediana"
FROM funcionarios GROUP BY departamento ORDER BY departamento;

/*MÉDIA*/
SELECT departamento AS "Departamento", SUM(salario) AS "Total Salário Pago", AVG(salario) AS "Média Salarial"
FROM funcionarios GROUP BY departamento;

/*MODA*/
-- A MODA é em regra o número que mais se repete. Um conj de dados pode ter mais de uma moda
SELECT salario AS "Salário", COUNT(salario) AS "Frequência" 
FROM funcionarios GROUP BY salario ORDER BY "Frequência" DESC LIMIT 1;
-- Aqui ele vai trazer o primeiro salário que se repete

/*AMPLITUDE*/
-- É o maior valor menos o menor valor. Quanto maior a amplitude os dados tendem a estar mais distantes entre si. 
-- E quanto menor a amplitude os dados tendem a estar mais próximos, mais centrados e mais concretos.
-- Para saber se a amplitude de determinado conjt de dados é grande ou pequena, boa ou ruim vai depender de outros 
-- dados.

/* --- ChatGPT -----
A avaliação se a amplitude de um conjunto de dados é boa ou ruim depende do contexto específico e dos objetivos da 
análise de dados. Aqui estão alguns pontos a considerar ao avaliar a amplitude de um conjunto de dados:

	1.Tamanho do conjunto de dados: 
		Em geral, um conjunto de dados com uma amplitude maior pode fornecer uma visão mais abrangente 
		da variação dos dados. No entanto, se o conjunto de dados for muito grande, a amplitude pode ser 
		menos significativa, pois pequenas variações podem ser diluídas em um grande número de observações.

	2.Objetivos da análise: 
		A amplitude pode ser boa ou ruim dependendo dos objetivos da análise. Por exemplo, em algumas situações, 
		uma grande amplitude pode indicar uma grande variabilidade nos dados, o que pode ser útil para identificar 
		padrões ou tendências. No entanto, em outras situações, uma grande amplitude pode indicar uma dispersão 
		excessiva dos dados, o que pode dificultar a interpretação e a tomada de decisões.

	3.Contexto do problema: É importante considerar o contexto específico do problema ou da área de estudo ao 
		avaliar a amplitude. Por exemplo, em algumas áreas, como finanças ou medicina, uma grande amplitude pode 
		ser considerada um sinal de instabilidade ou incerteza, enquanto em outras áreas, como geologia ou ecologia, 
		uma grande amplitude pode ser esperada devido à natureza complexa dos fenômenos estudados.

	4.Comparação com outros conjuntos de dados: Para avaliar se a amplitude de um conjunto de dados é boa ou ruim, 
		pode ser útil compará-la com a amplitude de outros conjuntos de dados semelhantes ou com benchmarks 
		estabelecidos. Isso pode ajudar a determinar se a amplitude é típica para o contexto em questão ou se está 
		fora do esperado.

Em resumo, a avaliação da amplitude de um conjunto de dados como boa ou ruim depende de uma variedade de fatores, 
incluindo o tamanho do conjunto de dados, os objetivos da análise, o contexto do problema e a comparação com outros 
conjuntos de dados. É importante considerar esses fatores ao interpretar a amplitude e tirar conclusões sobre os 
dados.*/

SELECT (MAX(salario)-MIN(salario)) AS "Amplitude Salarial" FROM funcionarios;
-- Agrupando por departamentos, rsrs parece que eu gostei mesmo de agrupar as coisas..
SELECT departamento AS "Departamento", (MAX(salario)-MIN(salario)) AS "Amplitude Salarial" 
FROM funcionarios GROUP BY Departamento ORDER BY "Amplitude Salarial";



/*VARIÂNCIA: Quanto os valores variam entre si tomando como base a média.*/
/* --- ChatGPT ----- 
A variância é uma medida de dispersão que indica o quão distantes os valores de um conjunto 
de dados estão da média. Em outras palavras, ela mede a variabilidade ou a dispersão dos dados em torno da média.
A variância é uma medida importante na análise estatística, pois fornece informações sobre a dispersão dos dados. 
No entanto, como a variância é calculada elevando as diferenças ao quadrado, ela tem a propriedade de amplificar 
valores extremos ou discrepantes. Para superar isso, às vezes é preferível usar o desvio padrão, que é a raiz 
quadrada da variância e está na mesma escala que os dados originais.*/

-- Variância Populacional
SELECT VAR_POP(salario) AS variancia_populacional
FROM funcionarios;

-- Variância Amostral
SELECT VAR_SAMP(salario) AS variancia_amostral
FROM funcionarios;

/*OBS: 'VAR_POP()' calcula a variância populacional usando a fórmula mencionada anteriormente, 
considerando todos os valores na população, enquanto 'VAR_SAMP()' calcula a variância amostral, 
que é uma estimativa da variância populacional com base em uma amostra dos dados.*/




/*DESVIO PADRÃO: É a raiz da Variância*/
/* --- ChatGPT -----
O desvio padrão é uma medida de dispersão que indica o quão dispersos ou espalhados estão os valores em um conjunto
de dados em relação à média. Em outras palavras, ele quantifica a variabilidade dos dados.
O desvio padrão é calculado como a raiz quadrada da variância dos dados. A variância, por sua vez, é calculada como
a média dos quadrados das diferenças entre cada valor de dados e a média. */

-- Desvio Padrão Populacional 
SELECT STDDEV_POP(salario) AS desvio_padrao_populacional
FROM funcionarios;

-- Desvio Padrão Amostral
SELECT STDDEV_SAMP(salario) AS desvio_padrao_amostral
FROM funcionarios;

/*OBS: 'STDDEV_POP()' calcula o desvio padrão populacional, que é uma medida da dispersão dos dados em relação 
à média, considerando toda a população. 'STDDEV_SAMP()' calcula o desvio padrão amostral, que é uma estimativa 
do desvio padrão populacional com base em uma amostra dos dados.*/




/*COEFICIENTE DE VARIAÇÃO*/

/* --- ChatGPT -----
O coeficiente de variação (CV) é uma medida estatística de variabilidade relativa que expressa o desvio padrão 
como uma porcentagem da média. É usado para comparar a dispersão de conjuntos de dados com unidades diferentes 
ou escalas diferentes.
O coeficiente de variação é expresso como uma porcentagem e é interpretado da seguinte forma:

	* Se o CV for baixo (geralmente abaixo de 15% a 20%), isso indica que a variabilidade dos dados é baixa em relação 
	à média. Em outras palavras, os valores do conjunto de dados estão relativamente próximos da média.

	* Se o CV for moderado (em torno de 20% a 30%), isso indica uma moderada variabilidade em relação à média.

	* Se o CV for alto (acima de 30% a 40%), isso indica uma alta variabilidade em relação à média. Os valores 
	do conjunto de dados estão mais espalhados em relação à média.

O coeficiente de variação é útil em situações onde você precisa comparar a dispersão de conjuntos de dados com 
médias diferentes ou unidades diferentes. Ele permite comparar a variabilidade relativa dos conjuntos de dados, 
independentemente de suas escalas ou unidades de medida. */

SELECT (STDDEV_POP(salario) / AVG(salario)) * 100 AS coeficiente_variacao FROM funcionarios;

SELECT ROUND(STDDEV_POP(salario),2) AS desvio_padrao_populacional,
	ROUND(VAR_POP(salario),2) AS variancia_populacional,
	ROUND((STDDEV_POP(salario) / AVG(salario)) * 100,2) AS coeficiente_variacao 
FROM funcionarios;
-- Esse ROUND(coluna,2) é pra formatar os número deixando apenas 2 casas decimais após a vírgula
