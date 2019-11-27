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
-- Data Ultima Alteracao ..: 22/11/2019
--   => Apaga tabelas sem apagar base, apaga usuarios e apaga índices
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 02 Usuarios
--         => 01 índice
-- -----------------------------------------------------------------


use TF_E_dupla2_fimBD;

drop table CANDIDATO;

drop table CARGO;

drop table PARTIDO;

drop table RACA;