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
--criando a tabela avaliação
create table avaliacao(
	id_avaliacao bigint primary key,
	comentario_avaliacao text,
	classificacao_avaliacao tinyint, 
	data_avaliacao datetime,
);
create table pedido(
	id_pedido bigint primary key,
	data_hora_pedido datetime,
	status_pedido int,
	valor_total decimal(4,2),
);
create table endereco(
	id_endereco bigint primary key,
	cep char(8),
	estado char(20),
	cidade char(20),
	bairro char(50),
	rua char(20),
	numero smallint,
);

create table carrinho(
	id_carrinho bigint primary key,
	quantidade_carrinho smallint,
	total_carrinho decimal(4,2),
);
create table entrega(
	id_entrega bigint primary key,
	data_hora_entrega datetime,
	status_entrega int,
	taxa_entrega decimal(3,2),
);

create table forma_pagamento(
	id_pagamento bigint primary key,
	tipo_pagamento int,
	descricao_pagamento varchar,
);

create table funcionario(
	id_funcionario bigint primary key,
	nome_funcionario char(50),
	cargo_funcionario nvarchar(100),
	salario_funcionario decimal (6,2),
	data_admissao_funcionario datetime,
);

create table restaurante(
	id_restaurante bigint primary key,
	nome_restaurante char(100),
	endereco_restaurante varchar(100),
	horario_funcionamento time
);

create table produto(
	id_produto bigint primary key,
	nome_produto char(100),
	descricao_produto text,
	preco_produto decimal(4,2),
	disponibilidade_produto int,
);

create table categoria(
	id_categoria bigint primary key,
	nome_categoria char(50),
);

create table promocao(
	id_promocao bigint primary key,
	descricao_promocao text,
	data_inicio datetime,
	data_termino datetime,
	desconto_promocao decimal(3,2) 
);

create table reserva(
	id_pedido bigint,
	id_carrinho bigint,
	primary key(id_pedido, id_carrinho),
	foreign key id_pedido references pedido(id_pedido),
	foreign key id_carrinho references carrinho(id_carrinho),
);

create table atracao(
	id_categoria bigint,
	id_promocao bigint,
	primary key (id_categoria, id_promocao),
	foreign key id_categoria references categoria(id_categoria),
	foreign key id_promocao references promocao(id_promocao),
);

create table localizacao(
	id_usuario bigint,
	id_endereco bigint,
	primary key (id_usuario, id_endereco),
	foreign key id_usuario references usuario(id_usuario),
	foreign key id_endereco references endereco(id_endereco),
);
create table comanda(
	id_pedido bigint,
	id_restaurante bigint,
	primary key(id_pedido, id_restaurante),
	foreign key id_pedido references pedido(id_pedido),
	foreign key id_restaurante references restaurante(id_restaurante),

);