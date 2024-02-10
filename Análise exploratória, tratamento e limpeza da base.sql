--Cria��o do banco de dados 
CREATE DATABASE CaseTelecom

--Defini��o do banco de dados a ser usado
USE CaseTelecom

--An�lise explorat�ria inicial para familiariza��o com as colunas dispon�veis e identifica��o de poss�veis tratamentos
SELECT TOP 100 
* 
FROM reclamacoes_contexto

--Sele��o das colunas fundamentais para a an�lise e aplica��o de filtros no par�metro WHERE para limpeza dos dados
SELECT 
Linha AS 'ID_Cliente', --Modifica��o do nome da coluna para algo intuitivo
Solicita��es,
Ano,
AnoM�s,
UF,
CanalEntrada,
Condi��o,
TipoAtendimento,
Servi�o,
Marca,
Assunto,
Problema
FROM reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
ORDER BY AnoM�s ASC

--An�lise explorat�ria considerando a quantidade de clientes por tipo de atendimento
SELECT 
TipoAtendimento,
COUNT(DISTINCT Linha) AS 'Total de clientes'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY TipoAtendimento
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando o total de clientes e reclama��es por tipo de atendimento
SELECT 
TipoAtendimento,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY TipoAtendimento
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por marca nos anos selecionados
SELECT
Marca,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Marca
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por canal de comunica��o nos anos selecionados
SELECT 
CanalEntrada,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY CanalEntrada
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por ano
SELECT
Ano,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Ano
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por tipo de servi�o
SELECT 
Servi�o,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Servi�o
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por assunto
SELECT 
Assunto,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Assunto
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por Estado
SELECT
UF,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(UF, 'PA','Par�'),'RO','Rond�nia'),'RJ', 'Rio de Janeiro'),'MG', 'Minas Gerais'),'TO','Tocantins')
,'PR', 'Paran�'),'BA', 'Bahia'),'SC', 'Santa Catarina'),'RS','Rio Grande do Sul'),'RN','Rio Grande do Norte'),
'GO', 'Goi�s'), 'CE','Cear�'),'SP', 'S�o Paulo'),'ES','Esp�rito Santo'),'PB','Para�ba'),'AL','Alagoas'),'MA','Maranh�o'),'AM','Amazonas'),'PE', 'Pernambuco'),'SE','Sergipe'),
'MS', 'Mato Grosso do Sul'),'MT','Mato Grosso'),'PI', 'Piau�'),'RR','Roraima'),'DF','Distrito Federal'),'AC','Acre'),
'AP', 'Amap�') AS 'Estado',
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY UF
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por condi��o
SELECT
Condi��o,
COUNT(DISTINCT Linha) AS 'Total de clientes'
SUM(SOLICITA��ES) AS 'Total de reclama��es',
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Condi��o
ORDER BY COUNT(DISTINCT Linha) DESC

--An�lise explorat�ria considerando a quantidade de reclama��es por marca e ano
SELECT
Marca,
Ano, 
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITA��ES) AS 'Total de reclama��es'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Marca, Ano
ORDER BY COUNT(DISTINCT Linha) DESC, Ano

--Cria��o da view para importa��o da tabela tratada para o Power BI e melhor visualiza��o dos resultados
CREATE OR ALTER VIEW vwReclamacoes2020_2023 AS
SELECT TOP 4000000 -- o comando ORDER BY em views apenas funciona prsen�a 
Linha AS 'ID_Cliente',
Solicita��es,
Ano,
AnoM�s,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(UF, 'PA','Par�'),'RO','Rond�nia'),'RJ', 'Rio de Janeiro'),'MG', 'Minas Gerais'),'TO','Tocantins')
,'PR', 'Paran�'),'BA', 'Bahia'),'SC', 'Santa Catarina'),'RS','Rio Grande do Sul'),'RN','Rio Grande do Norte'),
'GO', 'Goi�s'), 'CE','Cear�'),'SP', 'S�o Paulo'),'ES','Esp�rito Santo'),'PB','Para�ba'),'AL','Alagoas'),'MA','Maranh�o'),'AM','Amazonas'),'PE', 'Pernambuco'),'SE','Sergipe'),
'MS', 'Mato Grosso do Sul'),'MT','Mato Grosso'),'PI', 'Piau�'),'RR','Roraima'),'DF','Distrito Federal'),'AC','Acre'),
'AP', 'Amap�') AS 'Estado',
CanalEntrada,
Condi��o,
TipoAtendimento,
Servi�o,
Marca,
Assunto,
Problema
FROM reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Servi�o != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
ORDER BY AnoM�s ASC

--Sele��o da view criada no passo anterior antes de import�-la para o Power BI
SELECT * FROM vwReclamacoes2020_2023

