-- --------     << TF_E_dupla2_fimBD >>     ------------
--
--                    SCRIPT CONSULTAS (DML)
--
-- Data Criacao ...........: 22/11/2019
-- Autor(es) ..............: Eduardo Júnio Veloso Rodrigues
--                           Vinícius de Castro Cantuária
--
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF_E_dupla2_fimBD
--
-- Data Ultima Alteracao ..: 02/12/2019
--   => Cria consultas
--   => Corrige consultas e cria visões
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 02 Usuarios
--         => 01 Índice
--         => 04 Visões
--         => 13 Consultas
-- -----------------------------------------------------------------


USE TF_E_dupla2_fimBD;


-- Pesquisa as candidaturas com base no sexo dos candidatos
SELECT sexo as Sexo,
       COUNT(sexo) as Candidaturas
FROM CANDIDATO
GROUP BY 1
ORDER BY 2 DESC;


-- Pesquisa os candidatos eleitos com base no sexo dos candidatos
SELECT sexo as Sexo,
       COUNT(sexo) as Eleitos
FROM CANDIDATO
WHERE resultado LIKE 'ELEITO%'
GROUP BY 1
ORDER BY 2 DESC;


-- Pesquisa os candidatos não eleitos com base no sexo dos candidatos
SELECT sexo,
       COUNT(sexo) as 'Nao Eleitos'
FROM CANDIDATO
WHERE resultado NOT LIKE 'ELEITO%'
GROUP BY 1
ORDER BY 2 DESC;


-- Cria uma visão com as candidaturas, os candidatos eleitos e os candidatos não eleitos com base no sexo dos candidatos
CREATE VIEW vwCANDIDATOSSEXOS AS
SELECT c.sexo          AS Sexo,
       cc.candidaturas AS Candidaturas,
       ce.eleitos      AS Eleitos,
       cne.naoEleitos  AS 'Nao Eleitos'
FROM CANDIDATO c
INNER JOIN (SELECT sexo,
                   COUNT(sexo) as candidaturas
            FROM CANDIDATO
            GROUP BY 1) AS cc ON c.sexo = cc.sexo
INNER JOIN (SELECT sexo,
                   COUNT(sexo) as eleitos
            FROM CANDIDATO
            WHERE resultado LIKE 'ELEITO%'
            GROUP BY 1) AS ce ON c.sexo = ce.sexo
INNER JOIN (SELECT sexo,
                   COUNT(sexo) as naoEleitos
            FROM CANDIDATO
            WHERE resultado NOT LIKE 'ELEITO%'
            GROUP BY 1) AS cne ON c.sexo = cne.sexo
GROUP BY 1
ORDER BY 2 DESC,
         3 DESC,
         4 DESC;

-- Pesquisa as candidaturas, os candidatos eleitos e os candidatos não eleitos com base no sexo dos candidatos
SELECT *
FROM vwCANDIDATOSSEXOS;


-- Pesquisa as candidaturas com base nas raças dos candidatos
SELECT r.descRaca           AS Raca,
       COUNT(c.idCandidato) AS Candidaturas
FROM CANDIDATO c
INNER JOIN RACA r ON r.codRaca = c.codRaca
GROUP BY r.descRaca
ORDER BY 2 DESC;


-- Pesquisa os candidatos eleitos com base nas raças dos candidatos
SELECT r.descRaca           AS Raca,
       COUNT(c.idCandidato) AS Eleitos
FROM CANDIDATO c
INNER JOIN RACA r ON r.codRaca = c.codRaca
WHERE c.resultado LIKE 'ELEITO%'
GROUP BY r.descRaca
ORDER BY 2 DESC;


-- Pesquisa os candidatos não eleitos com base nas raças dos candidatos
SELECT r.descRaca           AS Raca,
       COUNT(c.idCandidato) AS 'Nao Eleitos'
FROM CANDIDATO c
INNER JOIN RACA r ON r.codRaca = c.codRaca
WHERE c.resultado NOT LIKE 'ELEITO%'
GROUP BY r.descRaca
ORDER BY 2 DESC;


-- Cria uma visão com as candidaturas, os candidatos eleitos e os candidatos não eleitos com base nas raças dos candidatos
CREATE VIEW vwCANDIDATOSRACAS AS
SELECT r.descRaca     AS Raca,
       c.candidaturas AS Candidaturas,
       e.eleitos      AS Eleitos,
       ne.naoEleitos  AS 'Nao Eleitos'
FROM RACA r
INNER JOIN (SELECT r.codRaca,
                   COUNT(c.idCandidato) AS candidaturas
            FROM RACA r
            INNER JOIN CANDIDATO c on r.codRaca = c.codRaca
            GROUP BY 1) AS c ON r.codRaca = c.codRaca
INNER JOIN (SELECT r.codRaca,
                   COUNT(c.idCandidato) AS eleitos
            FROM RACA r
            INNER JOIN CANDIDATO c on r.codRaca = c.codRaca
            WHERE c.resultado LIKE 'ELEITO%'
            GROUP BY 1) AS e ON r.codRaca = e.codRaca
INNER JOIN (SELECT r.codRaca,
                   COUNT(c.idCandidato) AS naoEleitos
            FROM RACA r
            INNER JOIN CANDIDATO c on r.codRaca = c.codRaca
            WHERE c.resultado NOT LIKE 'ELEITO%'
            GROUP BY 1) AS ne ON r.codRaca = ne.codRaca
ORDER BY 2 DESC,
         3 DESC,
         4 DESC;

-- Pesquisa as candidaturas, os candidatos eleitos e os candidatos não eleitos com base nas raças dos candidatos
SELECT *
FROM vwCANDIDATOSRACAS;


-- Pesquisa as candidaturas com base nas regiões dos candidatos
SELECT c.siglaUf        AS Regiao,
       COUNT(c.siglaUf) AS Candidaturas
FROM CANDIDATO c
GROUP BY c.siglaUf
ORDER BY 2 DESC;


-- Pesquisa os candidatos eleitos com base nas regiões dos candidatos
SELECT c.siglaUf        AS Regiao,
       COUNT(c.siglaUf) AS Eleitos
FROM CANDIDATO c
WHERE c.resultado LIKE 'ELEITO%'
GROUP BY c.siglaUf
ORDER BY 2 DESC;


-- Pesquisa os candidatos não eleitos com base nas regiões dos candidatos
SELECT c.siglaUf        AS Regiao,
       COUNT(c.siglaUf) AS 'Nao Eleitos'
FROM CANDIDATO c
WHERE c.resultado NOT LIKE 'ELEITO%'
GROUP BY c.siglaUf
ORDER BY 2 DESC;


-- Cria uma visão com as candidaturas, os candidatos eleitos e os candidatos não eleitos com base nas regiões dos candidatos
CREATE VIEW vwCANDIDATOSREGIOES AS
SELECT c.siglaUf            AS Regiao,
       COUNT(c.idCandidato) AS Candidaturas,
       e.eleitos            AS Eleitos,
       ne.naoEleitos        AS 'Nao Eleitos'
FROM CANDIDATO c
INNER JOIN (SELECT c.siglaUf,
                   COUNT(c.idCandidato) AS eleitos
            FROM CANDIDATO c
            WHERE c.resultado LIKE 'ELEITO%'
            GROUP BY 1) AS e ON c.siglaUf = e.siglaUf
INNER JOIN (SELECT c.siglaUf,
                   COUNT(c.idCandidato) AS naoEleitos
            FROM CANDIDATO c
            WHERE c.resultado NOT LIKE 'ELEITO%'
            GROUP BY 1) AS ne ON c.siglaUf = ne.siglaUf
GROUP BY 1
ORDER BY 2 DESC,
         3 DESC,
         4 DESC;

-- Pesquisa as candidaturas, os candidatos eleitos e os candidatos não eleitos com base nas regiões dos candidatos
SELECT *
FROM vwCANDIDATOSREGIOES;


-- Partidos com maior quantidade de eleitos por região
SELECT *
FROM (SELECT p.codPartido     AS Numero,
             p.sigla          AS Sigla,
             p.nomePartido    AS Nome,
             c.siglaUf        AS Regiao,
             COUNT(c.siglaUf) AS Eleitos
      FROM CANDIDATO c
      INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
      WHERE c.resultado LIKE 'ELEITO%'
      GROUP BY c.siglaUf, c.codPartido) AS m
ORDER BY 5 DESC;


-- Pesquisa as candidaturas com base nos partidos dos candidatos
SELECT p.codPartido        AS Numero,
       p.sigla             AS Sigla,
       p.nomePartido       AS Nome,
       COUNT(c.codPartido) AS Candidaturas
FROM CANDIDATO c
INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
GROUP BY c.codPartido
ORDER BY 4 DESC;


-- Pesquisa os candidatos eleitos com base nos partidos dos candidatos
SELECT p.codPartido        AS Numero,
       p.sigla             AS Sigla,
       p.nomePartido       AS Nome,
       COUNT(c.codPartido) AS Eleitos
FROM CANDIDATO c
INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
WHERE c.resultado LIKE 'ELEITO%'
GROUP BY c.codPartido
ORDER BY 4 DESC;


-- Pesquisa os candidatos não eleitos com base nos partidos dos candidatos
SELECT p.codPartido        AS Numero,
       p.sigla             AS Sigla,
       p.nomePartido       AS Nome,
       COUNT(c.codPartido) AS Eleitos
FROM CANDIDATO c
INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
WHERE c.resultado NOT LIKE 'ELEITO%'
GROUP BY c.codPartido
ORDER BY 4 DESC;


-- Indíce para diminuir o tempo de procura por candidatos quando forem procurados por cpf ou número do partido
CREATE INDEX idxCANDIDATOSPARTIDOS
ON CANDIDATO (cpf, codPartido);

-- Cria uma visão com as candidaturas, os candidatos eleitos e os candidatos não eleitos com base nos partidos dos candidatos
CREATE VIEW vwCANDIDATOSPARTIDOS AS
SELECT p.codPartido    AS Numero,
       p.sigla         AS Sigla,
       p.nomePartido   AS Nome,
       ca.candidaturas AS Candidaturas,
       e.eleitos       AS Eleitos,
       ne.naoEleitos   AS 'Nao Eleitos'
FROM PARTIDO p
INNER JOIN (SELECT p.codPartido,
                   COUNT(c.codPartido) AS candidaturas
            FROM CANDIDATO c
            INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
            GROUP BY c.codPartido) AS ca ON p.codPartido = ca.codPartido
INNER JOIN (SELECT p.codPartido,
                   COUNT(c.codPartido) AS eleitos
            FROM CANDIDATO c
            INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
            WHERE c.resultado LIKE 'ELEITO%'
            GROUP BY c.codPartido) AS e ON p.codPartido = e.codPartido
INNER JOIN (SELECT p.codPartido,
                   COUNT(c.codPartido) AS naoEleitos
            FROM CANDIDATO c
            INNER JOIN PARTIDO p ON p.codPartido = c.codPartido
            WHERE c.resultado NOT LIKE 'ELEITO%'
            GROUP BY c.codPartido) AS ne ON p.codPartido = ne.codPartido
ORDER BY 4 DESC,
         5 DESC,
         6 DESC;

-- Pesquisa as candidaturas, os candidatos eleitos e os candidatos não eleitos com base nos partidos dos candidatos
SELECT *
FROM vwCANDIDATOSPARTIDOS;