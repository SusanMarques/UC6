use sistema_biblioteca;

-- view que mostra a media dos valores de custo para evento

create view vw_media_evento
as
select avg(custo) as media_evento from evento
select * from vw_media_evento;



--- procedure que mostre todos os funcionarios

CREATE PROCEDURE spListarFuncionarios
AS
BEGIN
 select * from FUNCIONARIO;
END;

exec spListarFuncionarios;

-- procedure com parâmetro

CREATE PROCEDURE sp_listar_titulo
 @titulo varchar(100)
AS
BEGIN
 select * from LIVRO where titulo like @titulo
END;

exec sp_listar_titulo @titulo = '%python%';

--procedure buscar livro concatenado

CREATE PROCEDURE sp_listar_livro_concatenado
@titulo nvarchar(100)
AS
BEGIN 
select * from LIVRO where titulo like '%'+@titulo+'%'
END;

exec sp_listar_livro_concatenado @titulo = 'python';

-- procedimento para listar os livros de uma biblioteca

CREATE PROCEDURE sp_listar_livros_por_biblioteca_2
@cnpj nvarchar(14)
AS 
BEGIN 
 select * from LIVRO_BIBLIOTECA where cnpj like @cnpj
END;
exec sp_listar_livros_por_biblioteca_2 @cnpj = '01234567000112';









select * from LIVRO_BIBLIOTECA;
select * from LIVRO;