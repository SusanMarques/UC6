--criar meu banco de dados livraria
create database livraria;

--usar o banco criado
use livraria;

--criando as tabelas

create table cliente(
	cod_cliente int primary key,
	nome char(50),
	email nvarchar(100),
	telefone_1 char(11),
	telefone_2 char(11),
	rua varchar(35),
	bairro varchar(35),
	cidade varchar(35),
	estado varchar(35)
);

create table pessoa_fisica(
	cod_cliente int,
	foreign key (cod_cliente) references cliente(cod_cliente),
	rg char(9),
	cpf char(11)
);

create table pessoa_juridica(
	cod_cliente int,
	foreign key (cod_cliente) references cliente(cod_cliente),
	cnpj char(14),
	ie char(14)
);

create table pedido(
	cod_pedido int primary key,
	cod_cliente int,
	foreign key (cod_cliente) references cliente(cod_cliente),
	data_pedido datetime, 
	valor_pedido decimal(6,2)
);

create table editora(
	cod_editora int primary key,
	telefone_1 char(11),
	telefone_2 char(11),
	nome_contato varchar(50),
	email nvarchar(100)
);

create table livro(
	cod_livro int primary key,
	cod_editora int,
	foreign key (cod_editora) references editora(cod_editora),
	valor decimal(6,2),
	ano_publicacao date,
	categoria varchar(50),
	titulo varchar(50),
	autor varchar(50)
);

create table item_pedido(
	cod_pedido int,
	cod_livro int,
	foreign key (cod_pedido) references pedido(cod_pedido),
	foreign key (cod_livro) references livro(cod_livro),
	qtde_pedido int,
	valor_item decimal(6,2)
);

create table estoque(
	cod_editora int,
	cod_livro int,
	foreign key (cod_editora) references editora(cod_editora),
	foreign key (cod_livro) references livro(cod_livro),
	qtde_estoque int
);

--criando os registros

insert into cliente(cod_cliente,nome,email,telefone_1,telefone_2,rua,bairro,cidade,estado)
values
(1000,'susan jurubeba','susan@gmail.com','84665559879','84966332584','cidade das rosas','Nossa senhora ap','Natal','RN'),
(1001,'susana marques','susana@gmail.com','84667756932','87256398521','sao joao','Nossa senhora ap','mossoro','RN')
(1002, 'albanea', 'albanea@cassia.com','84995556231','8433226512','jardins','flores','Natal','RN'),
(1004, 'claudia','claudia@gmail.com','8463225178','8497885632','gramore','zn','natal','RN'),
(1003, 'danilo','danilo@gmail.co,','8465332154','8495663217','jose da silva','zn', 'natal', 'RN')

select * from cliente;
------------------------------------------------

insert into pedido(cod_pedido,cod_cliente,data_pedido,valor_pedido)
values
(1,1000,'20240313',50.99),
(2,1001,'20240311',17.99);

select * from pedido;
------------------------------------------------

insert into pessoa_fisica(cod_cliente,rg,cpf)
values
(1000,'123456789','12345678911')

select * from pessoa_fisica;

------------------------------------------------

insert into pessoa_juridica(cod_cliente,cnpj,ie)
values
(1001,'12345678911111','78945612311111')

select * from pessoa_juridica;

------------------------------------------------
insert into livro(cod_livro,cod_editora,valor,ano_publicacao,categoria,titulo,autor)
values
(50,100,80.99,'20240312','economia','fique rico','susana da grana'),
(51,101,22.00,'20230111','ficcao','alienigenas do passado','history')

select * from livro;

------------------------------------------------

insert into editora(cod_editora,telefone_1,telefone_2,nome_contato,email)
values
(100,'12345678911','12345678912','Antonia bezerra','antonia.bezerra@gmail.com'),
(101,'45678912315','12345678978','jurema maria','jurema.maria99@gmail.com')

select * from editora;

---------------------------------------------------

insert into item_pedido(cod_pedido,cod_livro,qtde_pedido,valor_item)
values
(1,50,1,50.99),
(2,51,1,17.99)

select * from item_pedido;

-----------------------------------------------------

insert into estoque(cod_editora,cod_livro,qtde_estoque)
values
(100,50,5),
(101,51,20)

select * from estoque;