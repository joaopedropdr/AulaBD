USE praticaaula;

SHOW TABLES; 

# --------------------------------
# Criando tabelas 
# Tabela cliente

CREATE TABLE cliente(
	cli_cpf VARCHAR(11) PRIMARY KEY,
	cli_nome VARCHAR(255) NOT NULL,
	cli_rua VARCHAR(255) NOT NULL,
	cli_numero INT NOT NULL,
	cli_bairro VARCHAR(255) NOT NULL,
	cli_telefone VARCHAR(11) NOT NULL
);

# Tabela categoria
CREATE TABLE categoria(
	prod_catcodigo INT PRIMARY KEY AUTO_INCREMENT,
	prod_catnome VARCHAR(255) NOT NULL UNIQUE
);

# Tabela produto

CREATE TABLE produto(
	prod_codigo INT PRIMARY KEY AUTO_INCREMENT,
	prod_nome VARCHAR(255) NOT NULL UNIQUE,
	fk_prod_categoria INT NOT NULL,
	prod_preco DECIMAL(5,2) NOT NULL
);

# Adicionando novo atributo a tabela produto
ALTER TABLE produto ADD prod_OBS VARCHAR(255) NULL;

# Modificando atributos da tabela produto
ALTER TABLE produto MODIFY prod_preco DECIMAL(4,2) NOT NULL;

# Adicionando chave estrangeira (prod_categoria)
ALTER TABLE produto
ADD CONSTRAINT fk_categoria
FOREIGN KEY (fk_prod_categoria)
REFERENCES categoria(prod_catcodigo);

# Criando a tabela pedido

CREATE TABLE pedido(
	ped_numero INT PRIMARY KEY AUTO_INCREMENT,
	ped_data DATE NOT NULL,
	fk_ped_cliente VARCHAR(11) NOT NULL
);

# Adicionando a chave estrangeira na tabela pedido
ALTER TABLE pedido
ADD CONSTRAINT fk_cliente
FOREIGN KEY (fk_ped_cliente)
REFERENCES cliente(cli_cpf);

# Tabela pedido_produto
CREATE TABLE pedido_produto(
	fk_pedido INT NOT NULL,
	fk_produto INT NOT NULL
); 

DROP TABLE pedido_produto;
# Adicionando quantidades na tabela pedido_produto
ALTER TABLE pedido_produto ADD ped_prod_quantidade INT NOT NULL;

# Adicionando a chave estrangeira do pedido na tabela pedido_produto
ALTER TABLE pedido_produto
ADD CONSTRAINT fk_ped
FOREIGN KEY (fk_pedido)
REFERENCES pedido(ped_numero);

# Adicionando a chave estrangeira do produto na tabela pedido_produto
ALTER TABLE pedido_produto
ADD CONSTRAINT fk_prod
FOREIGN KEY (fk_produto)
REFERENCES produto(prod_codigo);

# -----------------------------------------
# Inserindo dados nas tabelas 

# Tabela clientes
INSERT INTO cliente (cli_cpf, cli_nome, cli_rua, cli_numero, cli_bairro, cli_telefone) VALUES
('12345678901', 'Ana Paula Ferreira', 'Rua das Flores', 123, 'Centro', '11987654321'),
('23456789012', 'Bruno Henrique Souza', 'Avenida Brasil', 456, 'Jardim América', '11976543210'),
('34567890123', 'Carla Mendes Lima', 'Rua das Acácias', 78, 'Vila Nova', '11965432109'),
('45678901234', 'Diego Costa Silva', 'Rua do Comércio', 89, 'Centro', '11954321098'),
('56789012345', 'Eduarda Rocha', 'Rua Rio Branco', 321, 'Boa Vista', '11943210987'),
('67890123456', 'Felipe Andrade', 'Rua Amazonas', 55, 'Jardim das Rosas', '11932109876'),
('78901234567', 'Gabriela Martins', 'Rua Pará', 88, 'Bela Vista', '11921098765'),
('89012345678', 'Henrique Lima', 'Rua São Paulo', 90, 'Vila Rica', '11910987654'),
('90123456789', 'Isabela Nunes', 'Rua das Palmeiras', 100, 'Centro', '11899876543'),
('01234567890', 'João Pedro Souza', 'Avenida Central', 200, 'Jardim Europa', '11888765432'),
('11223344556', 'Karen Oliveira', 'Rua do Sol', 45, 'Parque Verde', '11877654321'),
('22334455667', 'Lucas Mendes', 'Rua das Laranjeiras', 67, 'Santa Tereza', '11866543210'),
('33445566778', 'Mariana Costa', 'Rua das Violetas', 89, 'Centro', '11855432109'),
('44556677889', 'Nelson Silva', 'Rua XV de Novembro', 10, 'Bairro Alto', '11844321098'),
('55667788990', 'Otávio Pereira', 'Rua João Pessoa', 34, 'Jardim Alegre', '11833210987'),
('66778899001', 'Patrícia Lima', 'Rua Santos Dumont', 76, 'Centro', '11822109876'),
('77889900112', 'Rafael Gonçalves', 'Rua das Oliveiras', 98, 'Vila Esperança', '11811098765'),
('88990011223', 'Sandra Regina', 'Rua Bela Vista', 120, 'Jardim São Paulo', '11799987654'),
('99001122334', 'Tiago Alves', 'Rua da Independência', 150, 'Centro', '11788876543'),
('10111213141', 'Vanessa Duarte', 'Rua da Paz', 65, 'Nova Esperança', '11777765432');

# Tabela categoria 
INSERT INTO categoria (prod_catnome) VALUES 
('Camisetas'),
('Calças'),
('Vestidos'),
('Saias'),
('Jaquetas'),
('Blusas'),
('Shorts'),
('Macacões'),
('Roupas Íntimas'),
('Moda Praia');

# Tabela produto
INSERT INTO produto (prod_nome, fk_prod_categoria, prod_preco) VALUES 
('Camiseta Básica Branca', 1, 29.90),
('Camiseta Estampada Azul', 1, 39.90),
('Calça Jeans Slim', 7, 89.90),
('Calça Moletom Cinza', 7, 59.90),
('Vestido Floral Curto', 8, 79.90),
('Vestido Longo de Festa', 8, 149.90),
('Saia Jeans', 9, 49.90),
('Saia Longa Estampada', 9, 59.90),
('Jaqueta Jeans', 10, 119.90),
('Jaqueta Corta Vento', 10, 139.90),
('Blusa de Tricô', 11, 69.90),
('Blusa Canelada', 11, 39.90),
('Shorts Jeans', 12, 49.90),
('Shorts de Moletom', 12, 39.90),
('Macacão Jeans Feminino', 13, 129.90),
('Macacão Social Masculino', 13, 159.90),
('Sutiã Renda Preto', 14, 34.90),
('Cueca Boxer Algodão', 14, 19.90),
('Biquíni Cortininha', 15, 54.90),
('Sunga Estampada', 15, 44.90);

# Tabela pedido
INSERT INTO pedido (ped_data, fk_ped_cliente) VALUES 
('2025-05-01', '12345678901'),
('2025-05-02', '23456789012'),
('2025-05-03', '34567890123'),
('2025-05-04', '45678901234'),
('2025-05-05', '56789012345'),
('2025-05-06', '67890123456'),
('2025-05-07', '78901234567'),
('2025-05-08', '89012345678'),
('2025-05-09', '90123456789'),
('2025-05-10', '01234567890'),
('2025-05-11', '11223344556'),
('2025-05-12', '22334455667'),
('2025-05-13', '33445566778'),
('2025-05-14', '44556677889'),
('2025-05-15', '55667788990'),
('2025-05-16', '66778899001'),
('2025-05-17', '77889900112'),
('2025-05-18', '88990011223'),
('2025-05-19', '99001122334'),
('2025-05-20', '10111213141');

# Tabela pedido_produto
INSERT INTO pedido_produto (fk_pedido, fk_produto) VALUES
(1, 44),
(1, 45),
(2, 46),
(2, 47),
(3, 48),
(4, 49),
(5, 50),
(6, 51),
(7, 52),
(8, 53),
(9, 54),
(10, 55),
(11, 56),
(12, 57),
(13, 58),
(14, 59),
(15, 60),
(16, 45),
(17, 60),
(18, 55);


SELECT * FROM categoria ORDER BY prod_catcodigo ASC;

SELECT * FROM pedido_produto;

DESCRIBE pedido_produto;


