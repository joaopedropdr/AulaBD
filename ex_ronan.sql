# Criando Banco 
CREATE DATABASE exercicio_aula CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE exercicio_aula;

# CRIANDO AS TABELAS 
CREATE TABLE filmes (
	id_filme BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    duracao INT UNSIGNED NOT NULL,
    descricao TEXT NOT NULL,
    ano YEAR NOT NULL,
    classificacao INT NOT NULL,
    # LOGS	
    criado_em DATETIME 
    
    
);
CREATE TABLE series ();
CREATE TABLE desenhos ();






