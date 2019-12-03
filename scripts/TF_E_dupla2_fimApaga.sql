-- --------     << TF_E_dupla2_fimBD >>     ------------
--
--                    SCRIPT APAGA (DDL)
--
-- Data Criacao ...........: 22/11/2019
-- Autor(es) ..............: Eduardo Júnio Veloso Rodrigues
--                           Vinícius de Castro Cantuária
--
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF_E_dupla2_fimBD
--
-- Data Ultima Alteracao ..: 01/12/2019
--   => Apaga tabelas sem apagar base, apaga usuários e apaga índices
--   => Adiciona apaga usuários
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 02 Usuarios
--         => 01 Índice
--         => 04 Visões
--         => 13 Consultas
-- -----------------------------------------------------------------


USE TF_E_dupla2_fimBD;

DROP INDEX idxCANDIDATOSPARTIDOS;

DROP VIEW vwCANDIDATOSSEXOS;

DROP VIEW vwCANDIDATOSPARTIDOS;

DROP VIEW vwCANDIDATOSRACAS;

DROP VIEW vwCANDIDATOSREGIOES;

DROP TABLE CANDIDATO;

DROP TABLE CARGO;

DROP TABLE PARTIDO;

DROP TABLE RACA;

DROP USER 'user';

DROP USER 'admin';