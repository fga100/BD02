
-- =========================================
-- CRIAÇÃO DO BANCO DE DADOS
-- SQL SERVER
-- =========================================

IF DB_ID('JogoRPG') IS NULL
BEGIN
    CREATE DATABASE JogoRPG;
END;
GO

USE JogoRPG;
GO

-- =========================================
-- 1. TABELA USUARIOS
-- =========================================

CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Senha NVARCHAR(255) NOT NULL,

    CONSTRAINT PK_USUARIOS
        PRIMARY KEY (UsuarioId),

    CONSTRAINT UQ_USUARIOS_EMAIL
        UNIQUE (Email)
);
GO

-- =========================================
-- 2. TABELA CLASSES
-- =========================================

CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) NOT NULL,
    Nome NVARCHAR(100) NOT NULL,
    Descricao NVARCHAR(MAX) NULL,

    CONSTRAINT PK_CLASSES
        PRIMARY KEY (ClasseId)
);
GO

-- =========================================
-- 3. TABELA HABILIDADES
-- =========================================

CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) NOT NULL,
    Nome NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_HABILIDADES
        PRIMARY KEY (HabilidadeId)
);
GO

-- =========================================
-- 4. TABELA PERSONAGENS
-- =========================================

CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) NOT NULL,
    NomePersonagem NVARCHAR(100) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,

    CONSTRAINT PK_PERSONAGENS
        PRIMARY KEY (PersonagemId),

    CONSTRAINT FK_PERSONAGENS_USUARIOS
        FOREIGN KEY (UsuarioId)
        REFERENCES USUARIOS(UsuarioId)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,

    CONSTRAINT FK_PERSONAGENS_CLASSES
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES(ClasseId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
GO

-- =========================================
-- 5. TABELA CLASSES_HABILIDADES
-- =========================================

CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,

    CONSTRAINT PK_CLASSES_HABILIDADES
        PRIMARY KEY (ClasseId, HabilidadeId),

    CONSTRAINT FK_CH_CLASSES
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES(ClasseId)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,

    CONSTRAINT FK_CH_HABILIDADES
        FOREIGN KEY (HabilidadeId)
        REFERENCES HABILIDADES(HabilidadeId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- =========================================
-- ÍNDICES PARA CHAVES ESTRANGEIRAS
-- =========================================

CREATE INDEX IX_PERSONAGENS_USUARIO
ON PERSONAGENS(UsuarioId);

CREATE INDEX IX_PERSONAGENS_CLASSE
ON PERSONAGENS(ClasseId);

CREATE INDEX IX_CH_HABILIDADE
ON CLASSES_HABILIDADES(HabilidadeId);
GO
