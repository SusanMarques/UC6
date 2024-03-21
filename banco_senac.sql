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

-- criar a tabela funcionário
CREATE TABLE funcionario(
	nome varchar(100),
	telefone char(9),
	endereco text,
	cpf char(11) primary key,
	cargo varchar(50),
	email varchar(255)
);

--criar a tabela Curso
CREATE TABLE curso(
	id_do_curso int primary key,
	data_de_inicio date,
	data_de_termino date,
	professores text,
	coordenador varchar(50),
	nome_do_curso varchar(100),
);
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