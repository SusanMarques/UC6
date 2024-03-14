use sistema_biblioteca;

-- QUEST�O 1
--Encontre o n�mero total de livros dispon�veis na biblioteca com CNPJ '12345678000123'.select count(*) as total_livrosfrom LIVRO_BIBLIOTECAwhere cnpj='12345678000123';--QUEST�O 2-- Liste todos os funcion�rios que s�o bibliotec�rios.select FUNCIONARIO.nome
from FUNCIONARIO
join BIBLIOTECARIO on FUNCIONARIO.matricula = BIBLIOTECARIO.matricula;

--QUEST�O 3
-- Encontre o t�tulo e o autor do livro com o n�mero de registro 10.

select * from LIVRO;

select titulo, autor
from LIVRO where numero_registro = 10;


--QUEST�O 4
--Liste todos os eventos do tipo 'Workshop' que custam mais de R$150,00.

select * from evento 
where tipo = 'workshop' and custo > 150.00;

--QUEST�O 6
-- Liste os nomes dos atendentes que trabalham na biblioteca.

select nome from atendente;

--QUEST�O 7
-- Encontre todos os peri�dicos publicados no ano de 2023.

select * from PERIODICO where ano_publicacao = 2023;

-- QUEST�O 8
-- Liste todos os livros de sociologia que est�o dispon�veis em qualquer biblioteca.select LIVRO.titulo
from LIVRO
join SOCIOLOGIA on LIVRO.numero_registro = SOCIOLOGIA.numero_registro;-- QUEST�O 9 -- Encontre o nome e a matr�cula de todos os educadores.select nome, matriculafrom EDUCADOR-- QUEST�O 10 -- Liste os t�tulos de todos os peri�dicos que come�am com a letra 'C'select * from PERIODICO where titulo like 'C%';--QUEST�O 11-- Encontre todos os eventos do tipo 'Palestra' que ocorreram antes de 2022select * from EVENTO where tipo = 'Palestra' and data < '20220101';--QUEST�O 12--Liste todos os livros de ci�ncia que foram publicados ap�s 2015select LIVRO.titulo, LIVRO.ano_publicacaofrom LIVROjoin CIENCIA on livro.numero_registro = CIENCIA.numero_registro and ano_publicacao > 2015;-- QUEST�O 13--Encontre os nomes dos t�cnicos de TI que t�m 'Rodrigo' como parte do nomeselect nome from TECNICO_TI where nome like '%Rodrigo%';--QUEST�O 14-- Liste todos os funcion�rios que s�o assistentes.select FUNCIONARIO.nome, FUNCIONARIO.matriculafrom FUNCIONARIOjoin ASSISTENTE on FUNCIONARIO.matricula = ASSISTENTE.matricula;