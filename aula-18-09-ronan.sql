SHOW DATABASES;
-- Criando o banco de dados
CREATE DATABASE pascuci;
CREATE DATABASE IF NOT EXISTS pascuci;
# Deleta o banco de dados
DROP DATABASE ronan;
DROP DATABASE IF EXISTS ronan;

# Criando banco de dados completo
CREATE DATABASE IF NOT EXISTS aula_180925 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- Mostra o script de criação do BD completo
SHOW CREATE DATABASE aula_180925;

# Marca o banco de dados até a conexão terminar.
USE aula_180925;

# Criando tabela que impede erro
CREATE TABLE IF NOT EXISTS usuarios (
	id_usuario BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE,                                             
    email VARCHAR(255) UNIQUE,
    data_nascimento DATE,
    admin BOOLEAN DEFAULT FALSE,
    salario DECIMAL(10, 2),
    cargo ENUM('Vendedor', 'Supervisor', 'Gerente'),
	senha VARCHAR(255) NOT NULL,
    # Campos para LOG / AUDITORIA
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
	alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME NULL
);
# Busca todos os dados de uma tabela
SELECT * FROM usuarios;
# Descreve a tabela mostrando seus dados de criação
DESCRIBE usuarios;
# Mostra todas as tabelas do banco
SHOW TABLES;

# Adicionando a coluna genero
ALTER TABLE usuarios 
	-- ENUM por padrão é NOT NULL e não aceita vazio ""
    --                         0           1            2              3
	ADD COLUMN genero ENUM('Feminino', 'Mascuculino', 'Outros', 'Não declarar'); 
    
ALTER TABLE usuarios DROP COLUMN genero;

ALTER TABLE usuarios 
	ADD COLUMN genero ENUM('Feminino', 'Mascuculino', 'Outros', 'Não declarar')
    AFTER data_nascimento;
    # Não utilizamos SET porque ele é OUTRA TABELA N:M
    # O SET permite null e a seleção de varias opções
# Troca o tipo do campo na tabela 
ALTER TABLE usuarios 
	MODIFY COLUMN genero CHAR(1);
    
# tROCAR O NOME DE UMA COLUNA
ALTER TABLE usuarios
	CHANGE COLUMN nome nome_completo VARCHAR(255) NOT NULL;
    
# Criando a tabela produtos 
CREATE TABLE produtos (
	id_produto BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade DECIMAL(6,3) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    validade DATE NULL,
    # lOGS
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE produtos;

# Criando a tabela categoria
DROP TABLE IF EXISTS categoria;
CREATE TABLE categorias (
	id_categoria BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
	criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE categorias;

DROP TABLE IF EXISTS produtos_categoria;
CREATE TABLE IF NOT EXISTS produtos_categorias( 
	produto_id BIGINT UNSIGNED NOT NULL,
    categoria_id BIGINT UNSIGNED NOT NULL, 
    # logs
	criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    # Criando a chave primaria composta
    PRIMARY KEY (produto_id, categoria_id),
    FOREIGN KEY (produto_id) REFERENCES produtos (id_produto)
    
);
DESCRIBE produtos_categorias;

# Adiciona um relacionamento depois da tabela criada
# Informar o nome do banco no script é uma boa prática, mas pouco usada para comandos simples.
ALTER TABLE aula_180925.produtos_categorias
	# Ao fazer o ALTER TABLE é obrigatório informar o nome do relacionamento
	ADD CONSTRAINT fk_produtos_categorias_categorias
    FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria);
    
# Para deletar um campo de PK precisa primeiro deletar a fk, depois a PK e ai deletar o campo