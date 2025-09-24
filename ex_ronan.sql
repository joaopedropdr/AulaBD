SHOW DATABASES;
# Criando o banco de dados
CREATE DATABASE ex_ronan;
USE ex_ronan;

# Criando as tabelas
CREATE TABLE veiculos(
		id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
        marca_veiculo VARCHAR(255) NOT NULL,
        modelo_veiculo VARCHAR(255) NOT NULL,
        ano_veiculo  YEAR NOT NULL,
        placa_veiculo VARCHAR(7) NOT NULL UNIQUE,
		cor_veiculo VARCHAR(100) NOT NULL
); 

CREATE TABLE clienets(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(255) NOT NULL,
    cpf_cliente VARCHAR(14) NOT NULL UNIQUE,
    telefone_cliente VARCHAR(11) NOT NULL,
    email_cliente VARCHAR(255) NOT NULL UNIQUE
); 

CREATE TABLE contratos(
	id_contratos INT PRIMARY KEY AUTO_INCREMENT
); 
CREATE TABLE pagamentos(
	id_pagamentos INT PRIMARY KEY AUTO_INCREMENT
); 

SHOW TABLES;

