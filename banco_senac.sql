-- Criar o banco
CREATE DATABASE senac_bd;
-- Usar banco
USE senac_bd;
-- criar a tabela Senac
CREATE TABLE Senac(
	id_unidade int primary key,
	nome_da_unidade varchar(255), --permite nomes de unidades mais extensas
	cnpj varchar(14),
	url_site_senac varchar(255),
	email varchar(255),
	endereco text,
	telefone char(9)
);
select * from Senac;

-- criar a tabela funcionário
CREATE TABLE funcionario(
	nome varchar(100),
	telefone char(9),
	endereco text,
	cpf char(11) primary key,
	cargo varchar(50),
	email varchar(255)
);
ALTER TABLE funcionario ADD salario decimal(8,2);
ALTER TABLE funcionario ADD data_de_admissao date;


select * from funcionario;

--criar a tabela Curso
CREATE TABLE curso(
	id_do_curso int primary key,
	data_de_inicio date,
	data_de_termino date,
	professores text,
	coordenador varchar(50),
	nome_do_curso varchar(100),
);
ALTER TABLE curso ADD categoria varchar(50);
ALTER TABLE curso ADD carga_horaria decimal(7,2);
ALTER TABLE curso ADD preco decimal(8,2);
ALTER TABLE curso ADD qnt_vagas int;

select * from curso;

--criar a tabela aluno 
CREATE TABLE aluno(
	matricula int primary key,
	nome varchar(50),
	endereco text,
	telefone char(9),
	cpf char(11),
	email varchar(255),
	genero char(1),
	data_de_nascimento date
);

-- criar a tabela endereco
CREATE TABLE endereco(
	id_endereco int primary key
);
-- criar a tabela uc
CREATE TABLE uc(
	nome_da_uc varchar(50)
);

-- criando as especializações

-- especialização de funcionários
CREATE TABLE professor(
	cpf char(11) foreign key references funcionario(cpf),
);


CREATE TABLE pedagogo(
	cpf char(11) foreign key references funcionario(cpf),
);
CREATE TABLE asg(
	cpf char(11) foreign key references funcionario(cpf),
);
CREATE TABLE porteiro(
	cpf char(11) foreign key references funcionario(cpf),
);
CREATE TABLE recepcionistas(
	cpf char(11) foreign key references funcionario(cpf),
);
-- especialização da entidade aluno

CREATE TABLE pagante(
	 matricula int foreign key references aluno(matricula),
);

CREATE TABLE psg(
	 matricula int foreign key references aluno(matricula),
);
CREATE TABLE aprendiz(
	 matricula int foreign key references aluno(matricula),
);


-- criando as associações
create table localizacao_aluno(
	id_endereco int,
	matricula int,
	foreign key (id_endereco) references endereco(id_endereco),
	foreign key (matricula) references aluno(matricula)
);

create table localizacao_funcionario(
	id_endereco int,
	cpf char(11),
	foreign key (id_endereco) references endereco(id_endereco),
	foreign key (cpf) references funcionario(cpf)
);

create table matricula(
	id_do_curso int,
	matricula int,
	foreign key (id_do_curso) references curso(id_do_curso),
	foreign key (matricula) references aluno(matricula)
);

create table contrato(
	id_unidade int,
	cpf char(11),
	foreign key (id_unidade) references Senac(id_unidade),
	foreign key (cpf) references funcionario(cpf)
);

create table disponibilidade(
	id_do_curso int,
	id_unidade int,
	foreign key (id_do_curso) references curso(id_do_curso),
	foreign key (id_unidade) references Senac(id_unidade)
);

select * from disponibilidade;

-- criar registros

insert into Senac(id_unidade,nome_da_unidade,cnpj,url_site_senac,email,endereco,telefone)
VALUES
(1,'SENAC ZONA NORTE','12345678912345','senaczn.com.br','senaczn@gmail.com','Tv. Macaé, 2875 - Potengi, Natal','845231649'),
(2,'SENAC CENTRO','78945612352698','senaccentro.com.br','senaccentro@gmail.com',' R. São Tomé, 444 - Cidade Alta','84963251')

select * from Senac;

insert into curso(id_do_curso,data_de_inicio,data_de_termino,professores,coordenador,nome_do_curso)
VALUES
(100,'10-01-2024','10-12-2024','valtemir,','maria','Operador de computadores'),
(101,'01-01-2024','10-12-2025','pedro,','maria','design'),
(102,'11-05-2024','10-12-2024','joao,','maria','corel draw'),
(103,'10-12-2024','10-12-2025','ana,','marcos','photoshop')

select * from curso;


UPDATE curso SET categoria = 'TI' WHERE id_do_curso = 100;
UPDATE curso SET categoria = 'DESIGN' WHERE id_do_curso = 101;
UPDATE curso SET categoria = 'DESIGN' WHERE id_do_curso = 102;
UPDATE curso SET categoria = 'DESIGN' WHERE id_do_curso = 103;

UPDATE curso SET carga_horaria = 20 WHERE id_do_curso = 100;
UPDATE curso SET carga_horaria = 40 WHERE id_do_curso = 101;
UPDATE curso SET carga_horaria = 30 WHERE id_do_curso = 102;
UPDATE curso SET carga_horaria = 20 WHERE id_do_curso = 103;

UPDATE curso SET preco = 130.00 WHERE id_do_curso = 100;
UPDATE curso SET preco = 200 WHERE id_do_curso = 101;
UPDATE curso SET preco = 350 WHERE id_do_curso = 102;
UPDATE curso SET preco = 100 WHERE id_do_curso = 103;

UPDATE curso SET qnt_vagas = 100 WHERE id_do_curso = 100;
UPDATE curso SET qnt_vagas = 50.99 WHERE id_do_curso = 101;
UPDATE curso SET qnt_vagas = 25 WHERE id_do_curso = 102;
UPDATE curso SET qnt_vagas = 10.99 WHERE id_do_curso = 103;

insert into funcionario(nome,telefone,endereco,cpf,cargo,email,salario,data_de_admissao)
VALUES 
('valtemir','863550768','Vale Quem Tem,Teresina','70651489635','professor','valtemir@spires.com.br',10.000,'01-01-2023'),
('maria','465982134','Rua Dona Maria Amélia','45678912345','coordenador','maria@gmail.com.br',20.000,'01-01-2022'),
('marcos','852963741','Travessa Principal','78963214789','coordenador','marcos@spires.com.br',30.000,'01-12-2023'),
('pedro','859674123','Rua Guaiana','85963214569','professor','pedro@spires.com.br',10.000,'01-01-2020'),
('joao','986532148','Rua Estados Unidos','12345678521','professor','joao@spires.com.br',10.000,'01-01-2021'),
('ana','896532147','Rua Conceição Alvarenga','78945612354','professor','ana@spires.com.br',5.000,'01-01-2024')

select * from funcionario;

insert into aluno(matricula,nome,endereco,telefone,cpf,email,genero,data_de_nascimento)
VALUES
('1010','Luna Brenda Stefany Cardoso','Quadra I1','849653251','72904315888','luna_cardoso@zepto.com.br','F','13-02-1958'),
('1011','Valentina Letícia Raquel Moraes','Avenida Vinte e Cinco de Julho','123456632','65336124024','valentinaleticiamoraes@temp.com.br','F','10-01-1987'),
('1012','Thiago André Teixeira','Rua Seis de Maio','156325698','57178867485','thiago.andre.teixeira@infolink.com.br','M','06-01-1978'),
('1013','Lorenzo Antonio Emanuel Gonçalves','Rua Newton Braga','968325741','94125434840','94125434840','M','13-01-1947')


select * from aluno;

insert into matricula(id_do_curso,matricula)
VALUES
(100,'1010'),
(101,'1011'),
(102,'1012'),
(103,'1013')

select * from matricula;

insert into professor(cpf)
VALUES
('70651489635'),
('85963214569'),
('12345678521'),
('78945612354')

select * from professor;
