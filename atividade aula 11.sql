use sistema_biblioteca;

-- QUESTÃO 1
--Encontre o número total de livros disponíveis na biblioteca com CNPJ '12345678000123'.select count(*) as total_livrosfrom LIVRO_BIBLIOTECAwhere cnpj='12345678000123';--QUESTÃO 2-- Liste todos os funcionários que são bibliotecários.select FUNCIONARIO.nome
from FUNCIONARIO
join BIBLIOTECARIO on FUNCIONARIO.matricula = BIBLIOTECARIO.matricula;

--QUESTÃO 3
-- Encontre o título e o autor do livro com o número de registro 10.

select * from LIVRO;

select titulo, autor
from LIVRO where numero_registro = 10;


--QUESTÃO 4
--Liste todos os eventos do tipo 'Workshop' que custam mais de R$150,00.

select * from evento 
where tipo = 'workshop' and custo > 150.00;

--QUESTÃO 6
-- Liste os nomes dos atendentes que trabalham na biblioteca.

select nome from atendente;

--QUESTÃO 7
-- Encontre todos os periódicos publicados no ano de 2023.

select * from PERIODICO where ano_publicacao = 2023;

-- QUESTÃO 8
-- Liste todos os livros de sociologia que estão disponíveis em qualquer biblioteca.select LIVRO.titulo
from LIVRO
join SOCIOLOGIA on LIVRO.numero_registro = SOCIOLOGIA.numero_registro;-- QUESTÃO 9 -- Encontre o nome e a matrícula de todos os educadores.select nome, matriculafrom EDUCADOR-- QUESTÃO 10 -- Liste os títulos de todos os periódicos que começam com a letra 'C'select * from PERIODICO where titulo like 'C%';--QUESTÃO 11-- Encontre todos os eventos do tipo 'Palestra' que ocorreram antes de 2022select * from EVENTO where tipo = 'Palestra' and data < '20220101';--QUESTÃO 12--Liste todos os livros de ciência que foram publicados após 2015select LIVRO.titulo, LIVRO.ano_publicacaofrom LIVROjoin CIENCIA on livro.numero_registro = CIENCIA.numero_registro and ano_publicacao > 2015;-- QUESTÃO 13--Encontre os nomes dos técnicos de TI que têm 'Rodrigo' como parte do nomeselect nome from TECNICO_TI where nome like '%Rodrigo%';--QUESTÃO 14-- Liste todos os funcionários que são assistentes.select FUNCIONARIO.nome, FUNCIONARIO.matriculafrom FUNCIONARIOjoin ASSISTENTE on FUNCIONARIO.matricula = ASSISTENTE.matricula;