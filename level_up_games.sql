CREATE DATABASE IF NOT EXISTS aula23_10 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE aula23_10;

CREATE TABLE IF NOT EXISTS clientes(
	id_cliente BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(30) NOT NULL,
    # Logs
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL
);

CREATE TABLE IF NOT EXISTS jogos(
	id_jogo BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    preco INT NOT NULL,
    genero VARCHAR(255) NOT NULL,
    descricao TEXT,
    plataforma ENUM('Nintendo', 'Xbox', 'Playstation', 'PC'),
    # Logs
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL
);

CREATE TABLE IF NOT EXISTS vendas(
	id_venda BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cliente_id BIGINT UNSIGNED NOT NULL,
    data_venda DATE NOT NULL,
    valor_total INT NOT NULL, 
    # Logs
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS vendas_jogos(
	id_venda_jogo BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	venda_id BIGINT UNSIGNED NOT NULL,
	jogo_id BIGINT UNSIGNED NOT NULL,
    # Logs
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id_venda),
    FOREIGN KEY (jogo_id) REFERENCES jogos(id_jogo)
);

ALTER TABLE jogos 
	MODIFY COLUMN plataforma ENUM('Nintendo', 'Xbox', 'Playstation', 'PC', 'todas');
    
ALTER TABLE jogos 
	DROP COLUMN plataforma;
    
CREATE TABLE IF NOT EXISTS plataformas(
	id_plataforma BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome VARCHAR(255) NOT NULL,
    # Logs
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL
);

CREATE TABLE IF NOT EXISTS jogos_plataformas(
	id_jogo_plataforma BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	jogo_id BIGINT UNSIGNED NOT NULL,
	plataforma_id BIGINT UNSIGNED NOT NULL,
    # Logs
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL,
    FOREIGN KEY (jogo_id) REFERENCES jogos(id_jogo),
    FOREIGN KEY (plataforma_id) REFERENCES plataformas(id_plataforma)
);

DESCRIBE clientes;
DESCRIBE vendas;
DESCRIBE jogos;
DESCRIBE vendas_jogos;
DESCRIBE jogos_plataformas;

-- CRUD com sql
-- C -> Create = Insert -> insere os dados na tabela
INSERT INTO plataformas(nome) VALUES ('XBOX');
INSERT INTO plataformas(nome) VALUES ('Nintendo');
-- Insert com mais valores
INSERT INTO plataformas(nome) VALUES ('Playstation'), ('PC');
-- insert na tabela clientes
INSERT INTO clientes(nome, cpf, email, telefone) VALUES ('João Pedro Pascuci', '430-066-578-73', 'joao@gmail.com', '14998081350');
INSERT INTO clientes(nome, cpf, email, telefone) VALUES ('Lucas Silva', '044-066-555-88', 'lucas@gmail.com', '14998981350');


-- R -> Read = Select -> Vizualiza os dados da tabela
-- Mostra todos os campos e todos os dados e uma tabela
SELECT * FROM plataformas;
SELECT * FROM clientes;
-- Seleciona campos especificos 
SELECT nome, deletado_em FROM plataformas;




    





