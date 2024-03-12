--criar meu banco de dados ifood
create database ifood;
--usar o banco criado
use ifood;
--criando a tabela usuário
create table usuario(
	id_usuario bigint primary key,
	nome_usuario nvarchar(50),
	endereco_usuario varchar(100),
	email_usuario nvarchar(100),
	telefone_usuario char(11),
	cpf_usuario char(11),
);
--inserindo registros na tabela usuario
insert into usuario(id_usuario, nome_usuario,endereco_usuario,email_usuario,telefone_usuario,cpf_usuario)
values 
('20181044110033','susan karin','rua sao marcos 25','susan@gmail.com','84998557948','12345678912'),
('20181055469833','maria de lourdes','mae luiza 38','maria123@gmail.com','8495556237','89456231458')

--consultar registros da tabela usuario
select * from usuario;

--criando a tabela avaliação
create table avaliacao(
	id_avaliacao bigint primary key,
	comentario_avaliacao text,
	classificacao_avaliacao tinyint, 
	data_avaliacao datetime,
);

--inserindo registros na tabela avaliacao
insert into avaliacao(id_avaliacao,comentario_avaliacao,classificacao_avaliacao,data_avaliacao)
values
(201810,'lanche muito bom',1,'2024-03-12 14:55:00')
(201744, 'lache veio atrasado',1,'2024-03-12 15:01:00')

select * from avaliacao;

create table pedido(
	id_pedido bigint primary key,
	data_hora_pedido datetime,
	status_pedido int,
	valor_total decimal(4,2),
);
--inserindo registros na tabela pedido
insert into pedido(id_pedido,data_hora_pedido,status_pedido,valor_total)
values 
(201598,'2024-03-12 15:53:00',5,29.99)

select * from pedido;

create table endereco(
	id_endereco bigint primary key,
	cep char(8),
	estado char(20),
	cidade char(20),
	bairro char(50),
	rua char(20),
	numero smallint,
);



insert into endereco(id_endereco,cep,estado,cidade,bairro,rua,numero)
values
(555,'38882500','RN','Natal','Mae luiza','são joão','55')

select * from endereco;

create table carrinho(
	id_carrinho bigint primary key,
	quantidade_carrinho smallint,
	total_carrinho decimal(4,2),
);

insert into carrinho(id_carrinho, quantidade_carrinho, total_carrinho)
values
(54698,2,50.99)

select * from carrinho;

create table entrega(
	id_entrega bigint primary key,
	data_hora_entrega datetime,
	status_entrega int,
	taxa_entrega decimal(3,2),
);
insert into entrega(id_entrega,data_hora_entrega,status_entrega,taxa_entrega)
values
(56987,'2024-03-12',3,7.00)

select * from entrega;

create table forma_pagamento(
	id_pagamento bigint primary key,
	tipo_pagamento int,
	descricao_pagamento varchar(100),
);
insert into forma_pagamento(id_pagamento, tipo_pagamento, descricao_pagamento)
values
(55666,1,'pedido teste')

select * from forma_pagamento;

create table funcionario(
	id_funcionario bigint primary key,
	nome_funcionario char(50),
	cargo_funcionario nvarchar(100),
	salario_funcionario decimal (6,2),
	data_admissao_funcionario datetime,
);
insert into funcionario(id_funcionario,nome_funcionario,cargo_funcionario,salario_funcionario,data_admissao_funcionario)
values
(55999,'joana','desenvolvedora',1000.50,GETDATE());

select * from funcionario;

create table restaurante(
	id_restaurante bigint primary key,
	nome_restaurante char(100),
	endereco_restaurante varchar(100),
	horario_de_abertura time,
	horario_de_fechamento time
);
insert into restaurante(id_restaurante,nome_restaurante,endereco_restaurante,horario_de_abertura,horario_de_fechamento)
values
(66999,'top pizza','maranguape 108','12:00:00','17:00:00')

select * from restaurante;

create table produto(
	id_produto bigint primary key,
	nome_produto char(100),
	descricao_produto text,
	preco_produto decimal(4,2),
	disponibilidade_produto int,
);
insert into produto(id_produto,nome_produto,descricao_produto,preco_produto,disponibilidade_produto)
values
(66444,'pizza de quatro queijos','quatro queijos com borda de catupiry',47.99,1)

select * from produto;

create table categoria(
	id_categoria bigint primary key,
	nome_categoria char(50),
);

insert into categoria(id_categoria,nome_categoria)
values
(1,'lanche')
(2,'pizza'),
(3,'doces e bolos'),
(4, 'mercado')

select * from categoria;

create table promocao(
	id_promocao bigint primary key,
	descricao_promocao text,
	data_inicio datetime,
	data_termino datetime,
	desconto_promocao decimal(3,2) 
);
insert into promocao(id_promocao,descricao_promocao,data_inicio,data_termino,desconto_promocao)
values
(555,'cupom de 15% de desconto','2024-03-12 16:00:00','2024-03-12 17:00:00', 1.55)

select * from promocao;

create table reserva(
	id_pedido bigint,
	id_carrinho bigint,
	primary key(id_pedido, id_carrinho),
	foreign key (id_pedido) references pedido(id_pedido),
	foreign key (id_carrinho) references carrinho(id_carrinho)
);

insert into reserva (id_pedido, id_carrinho)
values 
(201598,54698)

select * from reserva;

create table atracao(
	id_categoria bigint,
	id_promocao bigint,
	primary key (id_categoria, id_promocao),
	foreign key (id_categoria) references categoria(id_categoria),
	foreign key (id_promocao) references promocao(id_promocao)
);

insert into atracao(id_categoria, id_promocao)
values 
(1,555)

select * from atracao;

create table localizacao(
	id_usuario bigint,
	id_endereco bigint,
	primary key (id_usuario, id_endereco),
	foreign key (id_usuario) references usuario(id_usuario),
	foreign key (id_endereco) references endereco(id_endereco)
);
insert into localizacao(id_usuario,id_endereco)
values
('20181044110033',555)

select * from localizacao;

create table comanda(
	id_pedido bigint,
	id_restaurante bigint,
	primary key(id_pedido, id_restaurante),
	foreign key (id_pedido) references pedido(id_pedido),
	foreign key (id_restaurante) references restaurante(id_restaurante),
);

insert into comanda(id_pedido, id_restaurante)
values
(201598,66999)

select * from comanda;