-- --------     << TF_E_dupla2_fimBD >>     ------------
--
--                    SCRIPT CRIACAO (DDL)
--
-- Data Criacao ...........: 22/11/2019
-- Autor(es) ..............: Eduardo Júnio Veloso Rodrigues
--                           Vinícius de Castro Cantuária
--
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF_E_dupla2_fimBD
--
-- Data Ultima Alteracao ..: 22/11/2019
--   => Cria usuários e define permissões
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 02 Usuarios
--         => 01 Índice
--         => 04 Visões
--         => 13 Consultas
-- -----------------------------------------------------------------

USE TF_E_dupla2_fimBD;

CREATE USER 'admin' identified by '@d2019';
GRANT ALL PRIVILEGES on TF_E_dupla2_fimBD.* to admin;

CREATE USER 'user' IDENTIFIED BY 'uso2019';
GRANT SELECT ON TF_E_dupla2_fimBD.* to user;