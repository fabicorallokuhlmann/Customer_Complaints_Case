# Reclamações de Clientes de Operadoras de Telefonia Móvel 

Projeto criado com a intenção de gerar insights diagnósticos sobre as motivações envolvidas nas reclamações de clientes de telefonia móvel no Brasil entre os anos de 2020 e 2023. 

A base de dados foi coletada e disponibilizada de forma pública pela Anatel, Agência Nacional de Telecomunicações, em formato .csv. Após o download o arquivo no site do Governo Federal, os seguintes passos foram determinados para a condução do projeto:  

1) Importação da base de dados para o Jupyter Notebook. A escolha dessa ferramenta se deu pelo tamanho do arquivo (5GB) e facilidade da leitura em Python
   <br/>
2) Importação da biblioteca pandas para leitura do arquivo .csv
3) Na primeira leitura já se notou que o arquivo original continha caracteres especiais e acentos gráficos, necessitando, portanto, da introdução do parâmetro "encoding="utf-8"" para correta visualização e leitura desses caracteres. O parâmetro sep=";' indica que as colunas são divididas por ponto-e-vírgula
4) Observação que se trata de um arquivo volumoso, com 16 colunas e mais de 20 milhões de linhas. Essa constatação indica a necessidade de um bom tratamento e de uma boa limpeza nos dados para que apenas o material de interesse permanece
5) O print das informações da tabela indicam que os tipos de dados estão corretamente inseridos, não necessitando de alteração
6) Ao se procurar por valores nulos, que atrapalham as análises, deparou-se com a coluna de "Cidades" com quasae 50 mil campos nulos. No entanto, como essa é uma coluna que será descartada nessa análise, uma vez que serão considerados apenas os estados brasileiros, não houve a necessidade de corrigi-los. Por outro lado, as colunas de "UF", "Serviço" e "Marca" precisam ser corrigidas
7)  Por economia de tempo, optou-se por fazer os tratamentos diretamente no SQL Server
8)  Criação do banco de dados CaseTelecom
9)  Definição do CaseTelecom com banco de dados padrão
10) Análise exploratória inicial para familiarização com as colunas disponíveis e identificação de possíveis tratamentos
11) Seleção das colunas fundamentais para a análise e aplicação de filtros no parâmetro WHERE para limpeza dos dados juntamente com a eliminação dos valores em branco (parâmetro !=)
12) Análise exploratória aprofundada considerando
-  Quantidade de clientes por tipo de atendimento = todas as interações de clientes com as operadoras nos anos de 2020-2023 foram de reclamação
-  Quantidade de reclamações por marca nos anos selecionados = a Vivo lidera as reclamações, seguida pela Tim e por último pela Claro
-  Reclamações por canal de comunicação nos anos selecionados = clientes preferem se comunicar por usuário web, seguido por Call Center e por último pelo aplicativo do celular
-  Quantidade de reclamações por ano = 2022 foi o ano com mais reclamações, enquanto 2021 foi o com menos
-  Quantidade de reclamações por tipo de serviço = telefonia móvel pessoa pós-paga lidera o número de reclamações
-  Quantidade de reclamações por assunto = cobrança indevida é o assunto mais recorrente nas reclamações
-  Quantidade de reclamações por estado = Sudeste lidera as reclamações, com São Paulo a frente, seguido por Minas Gerais e por último Rio de Janeiro. Nessa consulta foi necessária a utilização do parâmetro REPLACE para tratar a coluna de UF, pois como se deseja importar a base para o Power BI, a sigla das UFs costumam dar problema na utilização de mapas devido a um bug da ferramenta. Portanto, necessita-se do nome completo dos estados
-  Quantidade de reclamações por solicitação = grande maioria das solicitações são novas
-  Quantidade de reclamações por marca e ano = a Vivo lidera em todos os anos
-  Criação da view para importação da tabela tratada para o Power BI e melhor visualização dos resultados
  
13) Importação da view criada para o Power BI
14) Modificação da tabela importada para fReclamações2020_2023
15) Visualização da tabela no Power Query para verificação se os tipos das colunas foram corretamente importados
16) Criação de uma tabela no Excel com as imagens das logos das operadoras
17) Importação da tabela com os links das imagens para dentro do Power Query
18) Mescla de consultas para inserir a coluna de link da logo na tabela principal
19) Aplicação no Power BI
20) Criação de uma tabela de Medidas para deixar as métricas organizadas
21) Criação da tabela dCalendario por meio do comando abaixo:

    dCalendario = CALENDAR(
    DATE(YEAR(MIN(fReclamacoes2020_2023[AnoMês])),1,1), 
    DATE(YEAR(MAX(fReclamacoes2020_2023[AnoMês])),12,31)
    )

  Esse comando considera as datas máxima e mínima da tabela principal

 21) Métricas calculadas:
     - total de clientes que reclamaram
    
       Total de Clientes = COUNT(fReclamacoes2020_2023[ID_Cliente])

     - total de reclamações (o mesmo cliente pode reclamar mais de uma vez)
    
       Total de Reclamações = SUM(fReclamacoes2020_2023[Solicitações])
       
     - média de reclamações por cliente
    
       Média de reclamações = [Total de Reclamações]/[Total de Clientes]

     - percentual de crescimento de reclamações YoY
    
     % Crescimento Reclamações YoY = 
var vReclamacoes_ano_anterior = CALCULATE(
    [Total de Reclamações],    
    DATEADD(dCalendario[Data],-1,YEAR))
var crescimento = DIVIDE([Total de Reclamações]-vReclamacoes_ano_anterior,vReclamacoes_ano_anterior,"N/A")
return
IF(HASONEVALUE(dCalendario[Ano])&&crescimento<>BLANK(),
crescimento,
"N/A")

   - percentual de crescimento de clientes reclamantes YoY
    % Crescimento Clientes YoY = 
var vClientes_ano_anterior = CALCULATE(
    [Total de Clientes],    
    DATEADD(dCalendario[Data],-1,YEAR))
var crescimento = DIVIDE([Total de Clientes]-vClientes_ano_anterior,vClientes_ano_anterior,"N/A")
return
IF(HASONEVALUE(dCalendario[Ano])&&crescimento<>BLANK(),
crescimento,
"N/A")
   <br/>

   - ranking dos assuntos mais recorrentes nas reclamações
   - 
     Ranking dos Assuntos = IF(    
    HASONEVALUE(fReclamacoes2020_2023[Assunto]),
    RANKX(ALLSELECTED(fReclamacoes2020_2023[Assunto]),
    [Total de Reclamações]))

 - acumulado de reclamações por assunto

 - Reclamações Acumulado Por Assunto = CALCULATE(    
    [Total de Reclamações],   
    TOPN([Ranking dos Assuntos],
    ALLSELECTED(fReclamacoes2020_2023[Assunto]),[Total de Reclamações]))

    
22) Seleção dos visuais mais adequados para cada análise, aplicando técnicas de storytelling
23) Criação da análise de Pareto considerando a quantidade de reclamações e o percentual representativo
25) Determinação da paleta de cores a ser utilizada
26) Introdução de ferramentas interativas, como Image Grid, painel retrátil, botões de navegação, tooltip
27) Publicação do dashboard no Power BI Online
   <br/>
