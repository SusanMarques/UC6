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
