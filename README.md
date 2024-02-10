# Reclamações de Clientes de Operadoras de Telefonia Móvel 

Projeto criado com o objetivo de gerar insights diagnósticos sobre as motivações envolvidas nas reclamações de clientes de telefonia móvel no Brasil entre os anos de 2020 e 2023. 

A base de dados foi coletada e disponibilizada de forma pública pela Anatel, Agência Nacional de Telecomunicações, em formato .csv. Após o download do arquivo no site do Governo Federal, os seguintes passos foram determinados para a condução do projeto:  

1) Importação da base de dados para o Jupyter Notebook. A escolha dessa ferramenta se deu pelo tamanho do arquivo (5GB) e facilidade da leitura em Python
   <br/>
   
2) Importação da biblioteca pandas para leitura do arquivo .csv
3) Na primeira leitura já se notou que o arquivo original continha caracteres especiais e acentos gráficos, necessitando, portanto, da introdução do parâmetro "encoding="utf-8"" para correta visualização e leitura desses caracteres. O parâmetro sep=";' indica que as colunas são divididas por ponto-e-vírgula

<a href="https://ibb.co/sPnp86f"><img src="https://i.ibb.co/rtYKDcj/Problema6.png" alt="Problema6" border="0"></a>

<a href="https://ibb.co/SvkwvJX"><img src="https://i.ibb.co/Bsh2swV/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

4) Observação que se trata de um arquivo volumoso, com 16 colunas e mais de 20 milhões de linhas. Essa constatação indica a necessidade de um bom tratamento e de uma boa limpeza nos dados para que apenas o material de interesse permanece
   
5) O print das informações da tabela indicam que os tipos de dados estão corretamente inseridos, não necessitando de alteração

<a href="https://ibb.co/vQ7q0y1"><img src="https://i.ibb.co/QC2QyS9/Solu-o-1.png" alt="Solu-o-1" border="0"></a>

6) Ao se procurar por valores nulos, que atrapalham as análises, deparou-se com a coluna de "Cidades" com quasae 50 mil campos nulos. No entanto, como essa é uma coluna que será descartada nessa análise, uma vez que serão considerados apenas os estados brasileiros, não houve a necessidade de corrigi-los. Por outro lado, as colunas de "UF", "Serviço" e "Marca" precisam ser corrigidas

<a href="https://ibb.co/64DZrJq"><img src="https://i.ibb.co/gDt7mFc/Solu-o3.png" alt="Solu-o3" border="0"></a>

7) Por economia de tempo, optou-se por fazer os tratamentos diretamente no SQL Server
8) Criação do banco de dados CaseTelecom
9) Definição do CaseTelecom como banco de dados padrão

<a href="https://ibb.co/Xy4f0xn"><img src="https://i.ibb.co/bH3jw54/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

10) Importação da base para o banco de dados criado
    
    <a href="https://ibb.co/hHstcZM"><img src="https://i.ibb.co/jGh1zW5/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

11) Após a abertura do assistente de importação, as imagens abaixo demonstram os passos tomados:
    - seleção do tipo de arquivo (.csv, no caso), definição do ponto-e-vírgula como parâmetro de separação das linhas
      
<a href="https://imgbb.com/"><img src="https://i.ibb.co/db6qJsx/Solu-o4.png" alt="Solu-o4" border="0"></a>

   - as colunas de "Assunto" e "Problemas" possuem grande quantidade de strings e deixá-las com apenas 50 carateres pode resultar em problemas de truncamento. Portanto, escolheu-se mudar esse valor para 500 e modificar o tipo de objeto para aceitar Unicode devido aos acentos vistos na análise inicial em Python    
    
<a href="https://imgbb.com/"><img src="https://i.ibb.co/z7rYW6m/Soluc-o5.png" alt="Soluc-o5" border="0"></a>

<a href="https://imgbb.com/"><img src="https://i.ibb.co/j3NbG2J/Solu-o6.png" alt="Solu-o6" border="0"></a>

 - escolha do banco de dados a receber a nova base de dados
   
<a href="https://imgbb.com/"><img src="https://i.ibb.co/WkdTB9V/Solu-o7.png" alt="Solu-o7" border="0"></a>

- confirmação e aceites finais
  
<a href="https://imgbb.com/"><img src="https://i.ibb.co/HPsqS0L/Solu-o9.png" alt="Solu-o9" border="0"></a>

<a href="https://imgbb.com/"><img src="https://i.ibb.co/Y8ZpR8k/Solu-o10.png" alt="Solu-o10" border="0"></a>

- importação bem-sucedida
  
<a href="https://imgbb.com/"><img src="https://i.ibb.co/CnRsyPr/Solu-o11.png" alt="Solu-o11" border="0"></a>

    
12) Análise exploratória inicial para familiarização com as colunas disponíveis e identificação de possíveis tratamentos

<a href="https://ibb.co/dK6y61t"><img src="https://i.ibb.co/GPkjkB9/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

13) Seleção das colunas fundamentais para a análise e aplicação de filtros no parâmetro WHERE para limpeza dos dados juntamente com a eliminação dos valores em branco (parâmetro !=)

<a href="https://ibb.co/4s4hdcD"><img src="https://i.ibb.co/cb24LPp/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

14) Análise exploratória aprofundada considerando
-  Quantidade de clientes por tipo de atendimento: todas as interações de clientes com as operadoras nos anos de 2020-2023 foram de reclamação
  
 <a href="https://imgbb.com/"><img src="https://i.ibb.co/L03dDXh/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>
  
-  Quantidade de reclamações por marca nos anos selecionados: a Vivo lidera as reclamações, seguida pela Tim e por último pela Claro

<a href="https://imgbb.com/"><img src="https://i.ibb.co/vwB2Rz7/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

-  Reclamações por canal de comunicação nos anos selecionados: clientes preferem se comunicar por usuário web, seguido por Call Center e por último pelo aplicativo do celular

  <a href="https://imgbb.com/"><img src="https://i.ibb.co/tJHBDLM/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>
  
-  Quantidade de reclamações por ano: 2022 foi o ano com mais reclamações, enquanto 2021 foi o com menos

  <a href="https://imgbb.com/"><img src="https://i.ibb.co/QQrbwMD/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>
  
-  Quantidade de reclamações por tipo de serviço: telefonia móvel pessoal pós-paga lidera o número de reclamações para as três operadoras

  <a href="https://imgbb.com/"><img src="https://i.ibb.co/fv1Psvc/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>
  
-  Quantidade de reclamações por assunto: cobrança indevida é o assunto mais recorrente nas reclamações

  <a href="https://imgbb.com/"><img src="https://i.ibb.co/mTXhFFk/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>
  
-  Quantidade de reclamações por estado: Sudeste lidera as reclamações, com São Paulo a frente, seguido por Minas Gerais e por último Rio de Janeiro. Nessa consulta foi necessária a utilização do parâmetro REPLACE para tratar a coluna de UF, pois como se deseja importar a base para o Power BI, a sigla das UFs costumam dar problema na utilização de mapas devido a um bug da ferramenta. Portanto, necessita-se do nome completo dos estados

<a href="https://imgbb.com/"><img src="https://i.ibb.co/BcqB35H/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

-  Quantidade de reclamações por solicitação: grande maioria das solicitações são novas

<a href="https://imgbb.com/"><img src="https://i.ibb.co/J7Wf8m3/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

-  Quantidade de reclamações por marca e ano: a Vivo lidera em 2020 e 2021 e a Claro, em 2022 e 2023

<a href="https://imgbb.com/"><img src="https://i.ibb.co/0VWphzx/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

-  Criação da view para importação da tabela tratada para o Power BI e melhor visualização dos resultados

<a href="https://ibb.co/NVzPPN9"><img src="https://i.ibb.co/gjCppWS/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

15) Importação da view criada para o Power BI: Obter dados -> SQL Server -> Servidor -> Escolha da tabela -> Transformar dados
16) Visualização da tabela no Power Query para verificação se os tipos das colunas foram corretamente importados
17) Modificação do nome da tabela importada para fReclamações2020_2023
18) Criação de uma tabela no Excel com as imagens das logos das operadoras
19) Importação da tabela com os links das imagens para dentro do Power Query
20) Mescla de consultas para inserir a coluna de link da logo na tabela principal
21) Aplicação no Power BI
22) Criação de uma tabela de Medidas para deixar as métricas organizadas

<a href="https://imgbb.com/"><img src="https://i.ibb.co/GnxbSv9/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

23) Criação da tabela dCalendario por meio do comando abaixo:

<a href="https://imgbb.com/"><img src="https://i.ibb.co/y59Kn16/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

24) Estabelecimento dos relacionamentos entre as tabelas fReclamações2020_2023 e dCalendario (colunas de data e mês/ano)

<a href="https://imgbb.com/"><img src="https://i.ibb.co/5YnVmpv/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

25) Métricas calculadas em linguagem DAX:
   - total de clientes que reclamaram
       
<a href="https://imgbb.com/"><img src="https://i.ibb.co/wCJ5jFY/Sem-t-tulo.png" alt="Sem-t-tulo" border="0"></a>

   - total de reclamações (o mesmo cliente pode reclamar mais de uma vez)

<a href="https://imgbb.com/"><img src="https://i.ibb.co/Njcp19Z/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>
    
 - média de reclamações por cliente
    
<a href="https://ibb.co/0Cyf4Ff"><img src="https://i.ibb.co/tqpbjxb/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

 - percentual de crescimento de reclamações YoY (o parâmetro HASONEVALUE é útil para evitar a aparição da mensagem 'em branco' quando não houver dados do ano anterior) 
    
<a href="https://imgbb.com/"><img src="https://i.ibb.co/qjS5r7T/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a> 

 - percentual de crescimento de clientes reclamantes YoY (novamente, o parâmetro HASONEVALUE é útil para evitar a aparição da mensagem 'em branco' quando não houver dados do ano anterior) 

<a href="https://imgbb.com/"><img src="https://i.ibb.co/tCfTBNw/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

 - ranking dos assuntos mais recorrentes nas reclamações (necessária para a análise de Pareto)

<a href="https://imgbb.com/"><img src="https://i.ibb.co/GnvFPtL/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

- acumulado de reclamações por assunto (necessária para a análise de Pareto)

<a href="https://imgbb.com/"><img src="https://i.ibb.co/F3564f9/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

 - percentual acumulado de reclamações por assunto (necessária para a análise de Pareto)

<a href="https://imgbb.com/"><img src="https://i.ibb.co/WnRhTrS/Sem-t-tulo2.png" alt="Sem-t-tulo2" border="0"></a>

26) Seleção dos visuais mais adequados para cada análise, aplicando técnicas de storytelling
27) Criação da análise de Pareto considerando a quantidade de reclamações e o percentual representativo
28) Determinação da paleta de cores a ser utilizada no dashboard
29) Introdução de ferramentas interativas, como Image Grid (botões com as logos), painel retrátil, botões de navegação, tooltip
30) Publicação do dashboard no Power BI Online e compartilhamento de link para visualização

















