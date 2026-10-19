
USE JogoRPG;
GO

-- =========================================
-- 1. REMOVER PERSONAGEM
-- =========================================

-- Pode ser excluido diretamente,
-- pois nao possui tabelas dependentes.

DELETE FROM PERSONAGENS
WHERE PersonagemId = 5;

-- =========================================
-- 2. REMOVER ASSOCIACAO DE HABILIDADE
-- =========================================

-- Remove apenas a associacao entre
-- a classe 4 e a habilidade 5.

DELETE FROM CLASSES_HABILIDADES
WHERE ClasseId = 4
  AND HabilidadeId = 5;

-- =========================================
-- 3. REMOVER HABILIDADE
-- =========================================

-- Remove a habilidade.
-- Suas associacoes em CLASSES_HABILIDADES
-- serao excluidas automaticamente por CASCADE.

DELETE FROM HABILIDADES
WHERE HabilidadeId = 6;

-- =========================================
-- 4. REMOVER USUARIO
-- =========================================

-- Primeiro remover os personagens do usuario,
-- pois a FK utiliza ON DELETE NO ACTION.

BEGIN TRANSACTION;

BEGIN TRY

    DELETE FROM PERSONAGENS
    WHERE UsuarioId = 3;

    DELETE FROM USUARIOS
    WHERE UsuarioId = 3;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH;

-- =========================================
-- 5. REMOVER CLASSE
-- =========================================

-- A classe nao pode ser removida enquanto
-- possuir personagens vinculados.
-- As associacoes de habilidades sao removidas
-- automaticamente por ON DELETE CASCADE.

BEGIN TRANSACTION;

BEGIN TRY

    DELETE FROM PERSONAGENS
    WHERE ClasseId = 3;

    DELETE FROM CLASSES
    WHERE ClasseId = 3;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH;
GO
