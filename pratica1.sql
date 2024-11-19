CREATE DATABASE pratica1;
USE pratica1;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE Colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Chamados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    descricao TEXT NOT NULL,
    criticidade ENUM('baixa', 'media', 'alta') NOT NULL,
    status ENUM('aberto', 'em andamento', 'resolvido') NOT NULL DEFAULT 'aberto',
    data_abertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    colaborador_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (colaborador_id) REFERENCES Colaboradores(id) ON DELETE SET NULL
);