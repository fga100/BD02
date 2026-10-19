
USE JogoRPG;
GO

-- =========================================
-- 1. INSERIR USUARIOS
-- =========================================

INSERT INTO USUARIOS (Email, Senha)
VALUES
('joao@email.com', 'hash_senha_joao'),
('maria@email.com', 'hash_senha_maria'),
('pedro@email.com', 'hash_senha_pedro');

-- =========================================
-- 2. INSERIR CLASSES
-- =========================================

INSERT INTO CLASSES (Nome, Descricao)
VALUES
('Guerreiro', 'Especialista em combate corpo a corpo'),
('Mago', 'Especialista em ataques mágicos'),
('Arqueiro', 'Especialista em ataques à distância'),
('Paladino', 'Guerreiro com poderes de cura');

-- =========================================
-- 3. INSERIR HABILIDADES
-- =========================================

INSERT INTO HABILIDADES (Nome)
VALUES
('Golpe Poderoso'),
('Bola de Fogo'),
('Flecha Precisa'),
('Cura Divina'),
('Escudo Mágico'),
('Ataque Rápido');

-- =========================================
-- 4. INSERIR PERSONAGENS
-- =========================================
-- Pressupõe banco novo, com IDs gerados
-- sequencialmente a partir de 1.

INSERT INTO PERSONAGENS
    (NomePersonagem, UsuarioId, ClasseId)
VALUES
('Thor', 1, 1),
('Merlin', 1, 2),
('Legolas', 2, 3),
('Arthur', 2, 4),
('Gandalf', 3, 2);

-- =========================================
-- 5. ASSOCIAR CLASSES E HABILIDADES
-- =========================================

INSERT INTO CLASSES_HABILIDADES
    (ClasseId, HabilidadeId)
VALUES
-- Guerreiro
(1, 1),
(1, 6),

-- Mago
(2, 2),
(2, 5),

-- Arqueiro
(3, 3),
(3, 6),

-- Paladino
(4, 1),
(4, 4),
(4, 5);
GO
