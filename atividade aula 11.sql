use sistema_biblioteca;

-- QUEST�O 1
--Encontre o n�mero total de livros dispon�veis na biblioteca com CNPJ '12345678000123'.
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
-- Liste todos os livros de sociologia que est�o dispon�veis em qualquer biblioteca.
from LIVRO
join SOCIOLOGIA on LIVRO.numero_registro = SOCIOLOGIA.numero_registro;