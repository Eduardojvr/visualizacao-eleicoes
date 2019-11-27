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
--   => Cria base de dados e tabelas
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 02 Usuarios
--         => 01 índice
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TF_E_dupla2_fimBD;


USE TF_E_dupla2_fimBD;


CREATE TABLE CARGO (
    codCargo TINYINT(2) NOT NULL AUTO_INCREMENT,
    nomeCargo VARCHAR(13) NOT NULL,

    CONSTRAINT CARGO_PK
    PRIMARY KEY (codCargo)
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE PARTIDO (
    codPartido TINYINT(2) NOT NULL AUTO_INCREMENT,
    sigla VARCHAR(7) NOT NULL,
    nomePartido VARCHAR(50) NOT NULL,

    CONSTRAINT PARTIDO_PK
    PRIMARY KEY (codPartido)
) ENGINE=InnoDB auto_increment=1;


CREATE TABLE RACA (
    codRaca TINYINT(1) NOT NULL AUTO_INCREMENT,
    descRaca VARCHAR(14) NOT NULL,

    CONSTRAINT RACA_PK
    PRIMARY KEY (codRaca)
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE CANDIDATO (
    idCandidato MEDIUMINT(7) UNSIGNED NOT NULL AUTO_INCREMENT,
    cpf NUMERIC(11) NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,
    nomeUrna VARCHAR(100) NOT NULL,
    sexo ENUM('M', 'F', 'N/D') NOT NULL,
    dtNasc DATE NOT NULL,
    numeroUrna MEDIUMINT(5) NOT NULL,
    numTitulo BIGINT(10) NOT NULL,
    codCargo TINYINT(2) NOT NULL,
    siglaUf VARCHAR(2) NOT NULL,
    resultado VARCHAR(20) NOT NULL,
    ano SMALLINT(4) NOT NULL,
    unEleitoral VARCHAR(50) NOT NULL,
    codRaca TINYINT(1) NOT NULL,
    codPartido TINYINT(2) NOT NULL,

    CONSTRAINT CANDIDATO_PK
    PRIMARY KEY (idCandidato),

    CONSTRAINT CANDIDATO_CARGO_FK
    FOREIGN KEY (codCargo)
    REFERENCES CARGO (codCargo),

    CONSTRAINT CANDIDATO_RACA_FK
    FOREIGN KEY (codRaca)
    REFERENCES RACA (codRaca),

    CONSTRAINT CANDIDATO_PARTIDO_FK
    FOREIGN KEY (codPartido)
    REFERENCES PARTIDO (codPartido)
) ENGINE=InnoDB AUTO_INCREMENT=1;