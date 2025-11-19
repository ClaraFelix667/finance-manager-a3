
-- Tabela de Usuarios
-- Armazena os dados do usuário
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL COMMENT,
);

--Tabela de contas
CREATE TABLE Contas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) COMMENT 'Ex: Conta Corrente, Poupança, Cartão de Crédito',
    SaldoInicial DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE
);

-- Tabela de transações
-- armazena todas as receitas e despesas
CREATE TABLE Transacoes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    ID_Conta INT NOT NULL,
    Tipo ENUM('RECEITA', 'DESPESA') NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    Data DATE NOT NULL,
    Recorrente BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    FOREIGN KEY (ID_Conta) REFERENCES Contas(ID)
);

CREATE TABLE Orcamentos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    Mes DATE NOT NULL COMMENT,
    Categoria VARCHAR(100) NOT NULL,
    Limite DECIMAL(10, 2) NOT NULL,
    Gasto_Atual DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    UNIQUE(ID_Usuario, Mes, Categoria)
);

CREATE TABLE Relatorios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    Tipo ENUM('MENSAL', 'ANUAL') NOT NULL,
    DataGeracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    Dados JSON NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE
);

CREATE TABLE Integracoes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    ID_Conta INT NOT NULL,
    Banco VARCHAR(100) NOT NULL,
    API_Token VARCHAR(255) NOT NULL COMMENT 'Token de acesso criptografado',
    UltimaSincronizacao DATETIME,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    FOREIGN KEY (ID_Conta) REFERENCES Contas(ID) ON DELETE CASCADE
);

-- Tabela para gerenciar as sessões de conversa
CREATE TABLE Chats (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    Titulo VARCHAR(100) DEFAULT 'Nova Conversa',
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE
);

-- Tabela para as mensagens individuais dentro de um chat
CREATE TABLE Mensagens (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Chat INT NOT NULL,
    Remetente ENUM('USUARIO', 'IA') NOT NULL, -- Quem mandou a mensagem?
    Conteudo TEXT NOT NULL, -- O texto da conversa ou o resumo gerado
    DataEnvio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Chat) REFERENCES Chats(ID) ON DELETE CASCADE
);

