/* AULA 124 - INTRODUÇÃO A FUNÇÕES DE AGREGAÇÃO*/

/*  POWER BI, trabalha com o que aconteceu. DATA SCIENCE, trabalha com o que pode acontecer.
	Porém, ambos trabalham com AGREGAÇÕES */

/* Clásula COUNT */

select * from funcionarios;
select * from departamentos;
select * from localizacao;

/* Contando as linhas de uma coluna. OBS: Nem sempre todas as colunas teram o msm valor, 
é importante contar as linhas (nº de ocorrências de uma coluna pra sabermos se existem, 
por exemplo, campos vazios. */

select count(*) from funcionarios;
--- Qtd de linhas de uma coluna específica
select count(email) from funcionarios;

select count(*) from departamentos;
select count(departamento) from departamentos;
--- Qtd de registros na coluna 'departamento'

select count(*) from localizacao;

/* AGRUPANDO A QTD DE REGISTROS POR UMA COLUNA ESPECÍFICA */

select count(*) from funcionarios; --Total de funcionários
select sexo, count(*) as Qtd from funcionarios group by sexo; --Agrupando a contagem de registros por sexo



/*DESAFIO: HÁ QUANTOS FUNCIONÁRIOS POR DEPARTAMENTO? QUAL O DEPARTAMENTO COM MAIS FUNCINOÁRIOS TRABALHANDO? */

select * from funcionarios;

select departamento, count(*) as Qtd_funcionarios 
from funcionarios group by departamento order by Qtd_funcionarios desc;

-- Por essa query posso concluir que há uma quantidade exata de 53 funcionários trabalhando no dept Beleza e Roupas

/* Exibindo o maior salário */
select max(salario) as Salario_maximo from funcionarios;

/* Exibindo o menor salário */
select min(salario) as Salario_maximo from funcionarios;

/* Comparando o maior e menor salário */
select max(salario) as "Maior salário", min(salario) as "Menor salário" from funcionarios

/*DESAFIO: QUEM É DONO DO MAIOR SALÁRIO? */
select nome, sexo, salario from funcionarios where salario = (select max(salario) from funcionarios);

/*DESAFIO: MAIOR SALÁRIO AGRUPADO POR SEXO? */
select sexo, max(salario) from funcionarios group by sexo;

/*DESAFIO: QUEM É DONO DO MAIOR SALÁRIO AGRUPADO POR SEXO? */
select (select nome from funcionarios where salario = max(f.salario) and sexo = f.sexo), 
		sexo, 
		max(salario) 
from funcionarios f group by sexo;

/* TRAZENDO O MAIOR E MENOR SALÁRIO DE CADA DEPARTAMENTO */
SELECT departamento AS "Departamento", MAX(salario) AS "Maior Salário", MIN(salario) AS "Menor Salário"
FROM funcionarios GROUP BY departamento;

/* EXIBINDO O MAIOR E MENOR SALÁRIO AGRUPANDO POR GENERO */
SELECT sexo, MIN(salario) AS "Menor Salário", MAX(salario) AS "Maior Salário" 
FROM funcionarios GROUP BY sexo;

