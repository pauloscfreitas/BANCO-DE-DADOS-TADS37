CREATE TABLE clientes(
    ID_clientes INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(100),
    Endereco VARCHAR(100)
    );

CREATE TABLE pedidos(
    ID_pedido INT AUTO_INCREMENT PRIMARY KEY,
    clienteid INT,
    FOREIGN KEY (clienteid) REFERENCES clientes (ID_clientes),
    datadopedido DATE
    );

CREATE TABLE pizzas(
    ID_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(100),
    preco_pizza DECIMAL(10, 2)
    );
CREATE TABLE ingredientes(
    id_ingrediente int auto_increment primary key,
    nome_ingrediente VARCHAR(100)
);
INSERT INTO ingredientes (nome_ingrediente) values ('Queijo mussarela'),
    ('Pepperoni'),
    ('Champignon'),
    ('Tomate'),
    ('Azeitonas pretas'),
    ('Cebola'),
    ('Pimentão'),
    ('Bacon'),
    ('Presunto'),
    ('Manjericão'),
    ('Frango com Catupiry');

CREATE TABLE pizza_ingrediente(
    pizzaid INT,
    ingredienteid1 INT,
    ingredienteid2 INT,
    FOREIGN KEY (pizzaid) REFERENCES pizzas (ID_pizza),
    FOREIGN KEY (ingredienteid1) REFERENCES ingredientes (id_ingrediente),
    FOREIGN KEY (ingredienteid2) REFERENCES ingredientes (id_ingrediente)
    );

insert into clientes (Nome, Endereco, Telefone) values ('Paulo Silas','Rua Itubera 141','81986799748');
INSERT INTO clientes (Nome, Endereco, Telefone) VALUES ('Ana Silva', 'Rua dos Girassóis, 123', '81991234567');
INSERT INTO clientes (Nome, Endereco, Telefone) VALUES ('João Oliveira', 'Avenida Central, 456', '81995556666');
INSERT INTO clientes (Nome, Endereco, Telefone) VALUES ('Maria Santos', 'Travessa da Paz, 789', '81997894563');
INSERT INTO clientes (Nome, Endereco, Telefone) VALUES ('Carlos Ferreira', 'Rua das Flores, 321', '81993214567');
INSERT INTO clientes (Nome, Endereco, Telefone) VALUES ('Juliana Costa', 'Avenida da Liberdade, 987', '81998877666');


insert into pizzas (nome_pizza,preco_pizza) values ('Pizza Presunto com Cebola',29.90),
('Pizza de Manjericao com Tomate',35.60),
('Pizza de Queijo Mussarela com Bacon',49.90),
('Pizza Margherita', 25.90),
('Pizza Quatro Queijos', 30.90),
('Pizza Frango com Catupiry', 32.90);

insert into pizza_ingrediente (pizzaid,ingredienteid1,ingredienteid2) values (1, 6, 9),(2, 10, 4),(3, 1, 8),(1, 1, 10),(2, 2, 6),(3, 1, 8),(4, 11, 5);

insert into pedidos (clienteid,datadopedido) values (1,'2024-04-21');
insert into pedidos (clienteid,datadopedido) values (2,'2023-04-22');
insert into pedidos (clienteid,datadopedido) values (3,'2023-04-23');
insert into pedidos (clienteid,datadopedido) values (3,'2023-04-24');
insert into pedidos (clienteid,datadopedido) values (3,'2023-04-24');
insert into pedidos (clienteid,datadopedido) values (4,'2023-04-24');
insert into pedidos (clienteid,datadopedido) values (5,'2023-04-25');

select * from pizzas;

select * from pizzas where preco_pizza < 30;

select * from pedidos;

select * from pedidos where datadopedido > '2024-01-01';

select * from pedidos where clienteid = '3';

select * from pizzas where nome_pizza = 'Pizza Presunto com Cebola';

select * from clientes where telefone = '81986799748';

select * from ingredientes where id_ingrediente = 3;

select * from pizzas where preco_pizza > 30;

-- Retornar todos os clientes que fizeram pedidos na data '2023-04-24'

select c.Nome, c.Endereco, c.Telefone from clientes c inner join pedidos p on c.ID_clientes = p.clienteid where p.datadopedido = '2023-04-24';









