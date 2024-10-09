-- Criação do Banco de Dados
CREATE DATABASE QBank;

-- Usando o banco de dados QBank
USE QBank;

-- Tabela Conta
CREATE TABLE Conta (
    ID_Conta INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Cliente VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Saldo DECIMAL(10, 2) NOT NULL,
    Data_Criacao DATE NOT NULL
);

-- Tabela Transacao
CREATE TABLE Transacao (
    ID_Transacao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Conta_Origem INT NOT NULL,
    ID_Conta_Destino INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Transacao DATE NOT NULL,
    Tipo_Transacao ENUM('Transferencia', 'Deposito', 'Saque') NOT NULL,
    FOREIGN KEY (ID_Conta_Origem) REFERENCES Conta(ID_Conta),
    FOREIGN KEY (ID_Conta_Destino) REFERENCES Conta(ID_Conta)
);

-- Tabela Emprestimo
CREATE TABLE Emprestimo (
    ID_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Conta INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Solicitacao DATE NOT NULL,
    Juros DECIMAL(5, 2) NOT NULL,
    Prazo INT NOT NULL, -- Prazo em meses
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);

-- Tabela CartaoCredito
CREATE TABLE CartaoCredito (
    ID_Cartao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Conta INT NOT NULL,
    Limite DECIMAL(10, 2) NOT NULL,
    Data_Aprovacao DATE NOT NULL,
    Fatura_Atual DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);

-- Tabela PagamentoServico
CREATE TABLE PagamentoServico (
    ID_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Conta INT NOT NULL,
    Servico VARCHAR(100) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Pagamento DATE NOT NULL,
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);
