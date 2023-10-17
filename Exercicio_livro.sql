CREATE DATABASE livraria 
GO
USE livraria 

CREATE TABLE livro(
codigo   INT  NOT NULL  IDENTITY(100001,100),
nome VARCHAR(200)   NOT NULL,
lingua  VARCHAR(10)   NOT NULL DEFAULT('PT-BR'),
ano  INT NOT NULL CHECK(ano >= '1990'),
Primary key(codigo),
)
GO 
CREATE TABLE editora(
id INT  NOT NULL IDENTITY(491,16),
nome VARCHAR(70)   NOT NULL UNIQUE,
telefone VARCHAR(10) NOT NULL CHECK(telefone = 10),
logradouro  VARCHAR(200) NOT NULL,
numero INT NOT NULL CHECK (numero> 0),
cep CHAR (08) NOT NULL CHECK (cep = 08),
complemento VARCHAR(255) NOT NULL
Primary key(id)
)
GO 
CREATE TABLE autor(
id  INT NOT NULL  IDENTITY(2351,1),
nome VARCHAR(100) NOT NULL UNIQUE, 
data_nasc  DATE  NOT NULL,
pais_nasc  VARCHAR(50) NOT NULL CHECK((UPPER(pais_nasc) = 'BRASIL' OR (UPPER(pais_nasc) = 'ESTADOS UNIDOS' OR (UPPER(pais_nasc) = 'INGLATERRA')))),
biografia VARCHAR(255) NOT NULL
Primary key(id)                          
)
GO 
CREATE TABLE edicao(
isbn CHAR(13)  NOT NULL CHECK(LEN(isbn) = 13),
preco DECIMAL(4,2)  NOT NULL CHECK (preco> 0),
ano INT NOT NULL  CHECK(ano >= 1993),
num_paginas INT NOT NULL CHECK(num_paginas > 15),
quant_estoque INT NOT NULL
Primary key(isbn)
)
GO
CREATE TABLE livro_autor(
codigo   INT  NOT NULL  IDENTITY(100001,100),
id  INT NOT NULL
FOREIGN KEY(codigo) REFERENCES livro(codigo),
FOREIGN KEY(id) REFERENCES autor(id)
)
GO 

CREATE TABLE editora_edicao_livro(
id INT  NOT NULL,
isbn CHAR(13)  NOT NULL,
codigo   INT  NOT NULL  IDENTITY(100001,100)
FOREIGN KEY(id) REFERENCES editora(id),
FOREIGN KEY(isbn) REFERENCES edicao(isbn),
FOREIGN KEY(codigo) REFERENCES livro(codigo)
					
)

USE master 
DROP DATABASE livraria


EXEC sp_help livro







