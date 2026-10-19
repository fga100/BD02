
USE JogoRPG;
GO

-- =========================================
-- 1. ATUALIZAR USUARIO
-- =========================================

UPDATE USUARIOS
SET Email = 'joao.novo@email.com'
WHERE UsuarioId = 1;

-- =========================================
-- 2. ATUALIZAR CLASSE
-- =========================================

UPDATE CLASSES
SET
    Nome = 'Guerreiro Elite',
    Descricao = 'Especialista em combate avançado'
WHERE ClasseId = 1;

-- =========================================
-- 3. ATUALIZAR HABILIDADE
-- =========================================

UPDATE HABILIDADES
SET Nome = 'Golpe Devastador'
WHERE HabilidadeId = 1;

-- =========================================
-- 4. ATUALIZAR PERSONAGEM
-- =========================================

-- Alterar nome do personagem
UPDATE PERSONAGENS
SET NomePersonagem = 'Thor Supremo'
WHERE PersonagemId = 1;

-- Alterar a classe do personagem
-- ClasseId = 4 (Paladino)
UPDATE PERSONAGENS
SET ClasseId = 4
WHERE PersonagemId = 1;

-- Transferir personagem para outro usuario
UPDATE PERSONAGENS
SET UsuarioId = 2
WHERE PersonagemId = 1;

-- =========================================
-- 5. ATUALIZAR ASSOCIACAO DE HABILIDADE
-- =========================================

-- Substituir uma habilidade de uma classe
-- Guerreiro Elite: habilidade 6 por 3
UPDATE CLASSES_HABILIDADES
SET HabilidadeId = 3
WHERE ClasseId = 1
  AND HabilidadeId = 6;
GO
