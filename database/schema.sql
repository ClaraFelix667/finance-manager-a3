
-- Tabela de Usuarios
-- Armazena os dados principais do usuário
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL COMMENT 'Armazenar como HASH'
) COMMENT='Armazena os usuários do sistema.';

--Tabela de contas
CREATE TABLE Contas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    NomeInstituicao VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) COMMENT 'Ex: Conta Corrente, Poupança, Cartão de Crédito',
    SaldoInicial DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE
) COMMENT='Contas bancárias e cartões de cada usuário.';

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
    Mes DATE NOT NULL COMMENT 'Armazena o primeiro dia do mês (YYYY-MM-01)',
    Categoria VARCHAR(100) NOT NULL,
    Limite DECIMAL(10, 2) NOT NULL,
    Gasto_Atual DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    UNIQUE(ID_Usuario, Mes, Categoria)
) COMMENT='Orçamentos mensais por categoria.';

CREATE TABLE Relatorios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    Tipo ENUM('MENSAL', 'ANUAL') NOT NULL,
    DataGeracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    Dados JSON NOT NULL COMMENT 'Dados (JSON gráficos) conforme requisito',
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE
) COMMENT='Relatórios gerados pelo sistema.';

CREATE TABLE Integracoes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    ID_Conta INT NOT NULL,
    Banco VARCHAR(100) NOT NULL,
    API_Token VARCHAR(255) NOT NULL COMMENT 'Token de acesso criptografado',
    UltimaSincronizacao DATETIME,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    FOREIGN KEY (ID_Conta) REFERENCES Contas(ID) ON DELETE CASCADE
) COMMENT='Armazena dados de integração com APIs de bancos.';