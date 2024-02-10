--Criação do banco de dados 
CREATE DATABASE CaseTelecom

--Definição do banco de dados a ser usado
USE CaseTelecom

--Análise exploratória inicial para familiarização com as colunas disponíveis e identificação de possíveis tratamentos
SELECT TOP 100 
* 
FROM reclamacoes_contexto

--Seleção das colunas fundamentais para a análise e aplicação de filtros no parâmetro WHERE para limpeza dos dados
SELECT 
Linha AS 'ID_Cliente', --Modificação do nome da coluna para algo intuitivo
Solicitações,
Ano,
AnoMês,
UF,
CanalEntrada,
Condição,
TipoAtendimento,
Serviço,
Marca,
Assunto,
Problema
FROM reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
ORDER BY AnoMês ASC

--Análise exploratória considerando a quantidade de clientes por tipo de atendimento
SELECT 
TipoAtendimento,
COUNT(DISTINCT Linha) AS 'Total de clientes'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY TipoAtendimento
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando o total de clientes e reclamações por tipo de atendimento
SELECT 
TipoAtendimento,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY TipoAtendimento
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por marca nos anos selecionados
SELECT
Marca,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Marca
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por canal de comunicação nos anos selecionados
SELECT 
CanalEntrada,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY CanalEntrada
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por ano
SELECT
Ano,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Ano
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por tipo de serviço
SELECT 
Serviço,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Serviço
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por assunto
SELECT 
Assunto,
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Assunto
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por Estado
SELECT
UF,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(UF, 'PA','Pará'),'RO','Rondônia'),'RJ', 'Rio de Janeiro'),'MG', 'Minas Gerais'),'TO','Tocantins')
,'PR', 'Paraná'),'BA', 'Bahia'),'SC', 'Santa Catarina'),'RS','Rio Grande do Sul'),'RN','Rio Grande do Norte'),
'GO', 'Goiás'), 'CE','Ceará'),'SP', 'São Paulo'),'ES','Espírito Santo'),'PB','Paraíba'),'AL','Alagoas'),'MA','Maranhão'),'AM','Amazonas'),'PE', 'Pernambuco'),'SE','Sergipe'),
'MS', 'Mato Grosso do Sul'),'MT','Mato Grosso'),'PI', 'Piauí'),'RR','Roraima'),'DF','Distrito Federal'),'AC','Acre'),
'AP', 'Amapá') AS 'Estado',
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY UF
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por condição
SELECT
Condição,
COUNT(DISTINCT Linha) AS 'Total de clientes'
SUM(SOLICITAÇÕES) AS 'Total de reclamações',
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Condição
ORDER BY COUNT(DISTINCT Linha) DESC

--Análise exploratória considerando a quantidade de reclamações por marca e ano
SELECT
Marca,
Ano, 
COUNT(DISTINCT Linha) AS 'Total de clientes',
SUM(SOLICITAÇÕES) AS 'Total de reclamações'
FROM
reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
GROUP BY Marca, Ano
ORDER BY COUNT(DISTINCT Linha) DESC, Ano

--Criação da view para importação da tabela tratada para o Power BI e melhor visualização dos resultados
CREATE OR ALTER VIEW vwReclamacoes2020_2023 AS
SELECT TOP 4000000 -- o comando ORDER BY em views apenas funciona prsença 
Linha AS 'ID_Cliente',
Solicitações,
Ano,
AnoMês,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(UF, 'PA','Pará'),'RO','Rondônia'),'RJ', 'Rio de Janeiro'),'MG', 'Minas Gerais'),'TO','Tocantins')
,'PR', 'Paraná'),'BA', 'Bahia'),'SC', 'Santa Catarina'),'RS','Rio Grande do Sul'),'RN','Rio Grande do Norte'),
'GO', 'Goiás'), 'CE','Ceará'),'SP', 'São Paulo'),'ES','Espírito Santo'),'PB','Paraíba'),'AL','Alagoas'),'MA','Maranhão'),'AM','Amazonas'),'PE', 'Pernambuco'),'SE','Sergipe'),
'MS', 'Mato Grosso do Sul'),'MT','Mato Grosso'),'PI', 'Piauí'),'RR','Roraima'),'DF','Distrito Federal'),'AC','Acre'),
'AP', 'Amapá') AS 'Estado',
CanalEntrada,
Condição,
TipoAtendimento,
Serviço,
Marca,
Assunto,
Problema
FROM reclamacoes_contexto
WHERE Ano IN ('2020', '2021', '2022', '2023') AND UF != ' ' AND Marca != ' ' AND Serviço != ' ' AND Marca IN ('VIVO', 'TIM', 'CLARO')
ORDER BY AnoMês ASC

--Seleção da view criada no passo anterior antes de importá-la para o Power BI
SELECT * FROM vwReclamacoes2020_2023

