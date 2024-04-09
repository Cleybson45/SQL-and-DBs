/* AULA 129 - IMPORTANDO ARQUIVOS E VERIFICANDO A MODA */

-- Importando CSV
-- COPY 'nome_tabela' FROM 'caminho_arquivo_CSV'

-- Criando a table q vai receber o arquivo de log do banco em CSV
CREATE TABLE maquinas(
	maquina VARCHAR(20),
	dia INT,
	qtd NUMERIC(10,2));	
	
-- Importanto o arquivo para a table
COPY maquinas FROM 'C:\Users\cleyb\Downloads\LogMaquinas.csv' DELIMITER ',' CSV HEADER;
/* Por aqui deu um erro, mas indo no Object Explorer, clicando 
com o botão direito na tabela, selecionando Import/Export Data.. 
selecionado o caminho do .CSV e verificando se o cabeçalho (header) 
está marcado na guia Options, ele importa e fica certinho. */

-- Verificando se importou..
SELECT * FROM maquinas;
-- Deu certo! 


/* QUAL A MÉDIA DE PRODUÇÃO DE CADA MÁQUINA? */
SELECT maquina, ROUND(AVG(qtd),2) AS "Média" FROM maquinas GROUP BY maquina;


/* A MODA AGRUPADA POR MÁQUINA */
SELECT maquina, qtd, COUNT(*) AS "Moda" FROM maquinas GROUP BY maquina, qtd ORDER BY "Moda" DESC;

/* MODA - MÁQUINA 1 */
SELECT maquina, qtd, COUNT(*) AS "Moda" FROM maquinas 
WHERE maquina='Maquina 01' 
GROUP BY maquina, qtd 
ORDER BY "Moda" DESC LIMIT 1;

-- Conferindo
SELECT * FROM maquinas WHERE maquina = 'Maquina 01';

/* MODA - MÁQUINA 2 */
SELECT maquina, qtd, COUNT(*) AS "Moda" FROM maquinas 
WHERE maquina='Maquina 02' 
GROUP BY maquina, qtd 
ORDER BY "Moda" DESC LIMIT 1;

/* MODA - MÁQUINA 3 */
SELECT maquina, qtd, COUNT(*) AS "Moda" FROM maquinas 
WHERE maquina='Maquina 03' 
GROUP BY maquina, qtd 
ORDER BY "Moda" DESC LIMIT 1;


