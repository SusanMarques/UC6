--usar o banco
use sistema_biblioteca;

/* Quest�o 1. Retornar todos os livros de sociologia.
*/
select titulo, autor from LIVRO
join SOCIOLOGIA on 
SOCIOLOGIA.numero_registro = LIVRO.numero_registro

/* Quest�o 2. Listar os nomes dos funcion�rios que s�o bibliotec�rios.
*/
select nome from BIBLIOTECARIO;

/* Quest�o 3.  Exibir os t�tulos dos livros publicados antes de 2000.
*/

select titulo, ano_publicacao from LIVRO where ano_publicacao < 2000;

/* Quest�o 4.  Mostrar o n�mero total de livros em cada biblioteca
*/
SELECT cnpj, COUNT(LIVRO_BIBLIOTECA.numero_registro) AS Quantidadedelivros
FROM 
LIVRO_BIBLIOTECA
GROUP BY 
LIVRO_BIBLIOTECA.cnpj

insert into LIVRO_BIBLIOTECA
values 
('01234567000112', 6),
('01234567000112', 7),
('01234567000112', 8),
('12345678000123', 9),
('12345678000123', 10),
('12345678000123', 11),
('12345678914789', 12),
('12345678914789', 13),
('12345678914789', 16)

/* Quest�o 5.  Listar os eventos do tipo 'Workshop' que ocorreram ap�s 2020.
*/

select id_evento, tipo, data from EVENTO 
where tipo = 'workshop' and data > '2020-12-31'

/* Quest�o 6.  Exibir os nomes dos usu�rios que fizeram empr�stimos de livros em janeiro de 2023.
*/

select nome, data_de_emprestimo from USUARIO_TARDE
join EMPRESTIMO_TARDE ON USUARIO_TARDE.id_usuario = EMPRESTIMO_TARDE.id_usuario 
where month(data_de_emprestimo) = 01 and year(data_de_emprestimo) = 2023;


-- criando as tabelas
create table USUARIO_TARDE(
	id_usuario int primary key,
	nome varchar(50),
	email varchar(100),
	telefone char(9)
);

select * from LIVRO
select * from USUARIO_TARDE
select * from EMPRESTIMO_TARDE

create table EMPRESTIMO_TARDE(
	id_usuario int,
	numero_registro int,
	foreign key (id_usuario) references USUARIO_TARDE(id_usuario),
	foreign key (numero_registro) references LIVRO(numero_registro)
);

ALTER TABLE EMPRESTIMO_TARDE ADD data_de_emprestimo date;
ALTER TABLE EMPRESTIMO_TARDE ADD data_de_devolu��o date;

INSERT INTO USUARIO_TARDE(id_usuario, nome, email, telefone)
VALUES
(1, 'MARIA JOAQUINA FERREIRA','mariajoaquina23@gmail.com','849562349'),
(2, 'Teresinha Patr�cia Martins','teresinha.patricia.martins@rauh.net','978465321'),
(3, 'Camila Eliane Sales', 'camila_eliane_sales@systemsadvisers.com', '789456321'),
(4, 'Filipe S�rgio Campos','filipe_sergio_campos@dpi.ig.br', '123546877')

INSERT INTO EMPRESTIMO_TARDE(id_usuario, numero_registro,data_de_emprestimo,data_de_devolu��o)
VALUES
(1,50,'01-11-2023','08-11-2023'),
(2,49,'01-11-2023','08-11-2023'),
(3,48,'01-11-2023','08-11-2023'),
(4,47,'01-12-2024','08-11-2023')


UPDATE EMPRESTIMO_TARDE SET data_de_emprestimo = '11-01-2023' WHERE id_usuario = 1;


/* QUEST�O 7  Retornar os t�tulos dos livros de tecnologia que t�m 'Python' no t�tulo.
*/

select titulo from LIVRO 
join TECNOLOGIA ON LIVRO.numero_registro = TECNOLOGIA.numero_registro WHERE titulo LIKE '%Python%';

select * from LIVRO
select * from TECNOLOGIA

/* QUEST�O 8 Listar os t�tulos dos peri�dicos dispon�veis na biblioteca com CNPJ'12345678000123'.
*/

select cnpj, titulo from PERIODICO
join PERIODICO_BIBLIOTECA ON PERIODICO.numero_registro = PERIODICO_BIBLIOTECA.numero_registro
where cnpj = '12345678000123'

/* QUEST�O 9. Mostrar os nomes dos funcion�rios que n�o s�o t�cnicos de TI
*/

select * from FUNCIONARIO
where matricula NOT like '%T%'

/* QUEST�O 10. .Exibir o t�tulo e o autor dos livros emprestados pelo usu�rio com ID 'U0001'
*/

 select	titulo, autor, id_usuario from LIVRO 
 join EMPRESTIMO_TARDE on LIVRO.numero_registro = EMPRESTIMO_TARDE.numero_registro 
 where id_usuario = 1

/*QUEST�O 11. Listar todas as palestras que custaram mais de R$ 100,00.
*/

select * from EVENTO where tipo = 'Palestra' and custo > 100

/*QUEST�O 12. Retornar os t�tulos dos livros de ci�ncia que foram publicados ap�s 2010.
*/