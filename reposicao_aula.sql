# Criando Banco 
CREATE DATABASE reposicao_aula CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE reposicao_aula;

# Criando tabelas
CREATE TABLE IF NOT EXISTS clientes(
	id_cliente BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(14),
    senha VARCHAR(255) NOT NULL,
    # Campos para LOG
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP
    
);

CREATE TABLE IF NOT EXISTS produtos (
	id_produto BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    valor INT UNSIGNED NOT NULL,
    estoque INT UNSIGNED NOT NULL,
	# Campos para LOG
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE vendas;
CREATE TABLE IF NOT EXISTS vendas (
	id_venda BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cliente_id BIGINT UNSIGNED NOT NULL,
    pagamento ENUM('Debito', 'Credito', 'Pix', 'Boleto') NOT NULL,
	# Campos para LOG
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    # Adicionando FK
    FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente)
);
DESCRIBE vendas;

# Criando a tabela de relação vendas e produtos
CREATE TABLE IF NOT EXISTS vendas_produtos(
	produto_id BIGINT UNSIGNED,
    venda_id BIGINT UNSIGNED,
	# Campos para LOG
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES produtos(id_produto),
    FOREIGN KEY (venda_id) REFERENCES vendas(id_venda)
);

# Adicionando as alterações 
# Mudando o nome da tabela e o nome da PK
ALTER TABLE clientes
	RENAME TO usuarios;
ALTER TABLE usuarios
	CHANGE COLUMN id_cliente id_usuario BIGINT UNSIGNED AUTO_INCREMENT NOT NULL;
DESCRIBE usuarios;
# Modificando a Fk da tabela vendas
ALTER TABLE vendas
	CHANGE COLUMN cliente_id usuario_id BIGINT UNSIGNED NOT NULL;
DESCRIBE vendas;
# Removendo a Fk da tabela e adicionando denovo com o novo nome
SHOW CREATE TABLE vendas;
ALTER TABLE vendas
	DROP FOREIGN KEY vendas_ibfk_1;
ALTER TABLE vendas 
	ADD CONSTRAINT fk_usuarios
    FOREIGN KEY (usuario_id) 
    REFERENCES usuarios(id_usuario);

# Adicionando o campo ativo em cada tabela
ALTER TABLE usuarios
	ADD COLUMN ativo TINYINT AFTER senha;
DESCRIBE usuarios;
# Alterando o tipo da coluna
ALTER TABLE usuarios
	MODIFY COLUMN ativo CHAR(1);
    
ALTER TABLE produtos
	ADD COLUMN ativo TINYINT AFTER estoque;
DESCRIBE produtos;
ALTER TABLE produtos
	MODIFY COLUMN ativo CHAR(1);
    
ALTER TABLE vendas
	ADD COLUMN ativo TINYINT AFTER pagamento;
DESCRIBE vendas;
ALTER TABLE vendas
	MODIFY COLUMN ativo CHAR(1);


	
    




    











