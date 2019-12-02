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
-- Data Ultima Alteracao ..: 22/12/2019
--   => Cria consultas
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 02 Usuarios
--         => 01 índice
-- -----------------------------------------------------------------

USE TF_E_dupla2_fimBD;


SELECT p.codPartido         AS 'Numero do Partido',
       p.sigla              AS 'Sigla do Partido',
       count(c.idCandidato) AS 'Candidatos por Partido'
FROM CANDIDATO c
INNER JOIN PARTIDO p ON c.codPartido = p.codPartido
GROUP BY c.codPartido;


SELECT descRaca             AS 'Raca',
       count(c.idCandidato) AS 'Candidatos por Raca'
FROM CANDIDATO c
INNER JOIN RACA r ON r.codRaca = c.codRaca
GROUP BY r.descRaca;


SELECT max(r.total)
FROM (SELECT c.siglaUf,
             count(c.siglaUf) AS total
      FROM CANDIDATO c
      INNER JOIN partido p ON p.codPartido = c.codPartido
      GROUP BY c.siglaUf,
               c.codPartido
     ) AS r;


-- Candidaturas por região
SELECT c.siglaUf        AS 'Sigla da UF',
       count(c.siglaUf) AS 'Candidatos por Regiao'
FROM CANDIDATO c
INNER JOIN partido p ON p.codPartido = c.codPartido
GROUP BY c.siglaUf
ORDER BY 2 DESC;


-- Quantidade de candidatos por partido
SELECT p.nomePartido       AS 'Nome do Partido',
       count(c.codPartido) AS 'Candidatos por Partido'
FROM CANDIDATO c
INNER JOIN partido p ON p.codPartido = c.codPartido
GROUP BY c.codPartido
ORDER BY 2 DESC;


SELECT p.nomePartido       AS 'Nome do Partido',
       p.sigla             AS 'Sigla do Partido',
       count(c.codPartido) AS 'Eleitos do Partido'
FROM CANDIDATO c
INNER JOIN partido p ON p.codPartido = c.codPartido
WHERE c.resultado LIKE 'ELEITO %'
GROUP BY c.codPartido
ORDER BY 3 DESC;


SELECT p.nomePartido       AS 'Nome do Partido',
       p.sigla             AS 'Sigla do Partido',
       count(c.codPartido) AS 'Candidaturas do Partido'
FROM CANDIDATO c
INNER JOIN partido p ON p.codPartido = c.codPartido
GROUP BY c.codPartido
ORDER BY 3;


-- candidaturas por partido X candidatos eleitos
SELECT r.nomePartido       AS 'Nome do Partido',
       r.sigla             AS 'Sigla do Partido',
       r.totalCandidaturas AS 'Candidaturas do Partido',
       c.totalEleitos      AS 'Eleitos do Partido'
FROM (SELECT p.nomePartido,
             p.sigla,
             count(c.codPartido) AS totalCandidaturas
      FROM CANDIDATO c
      INNER JOIN partido p ON p.codPartido = c.codPartido
      GROUP BY c.codPartido) AS r
INNER JOIN (SELECT p.nomePartido,
                   p.sigla,
                   count(c.codPartido) AS totalEleitos
            FROM CANDIDATO c
            INNER JOIN partido p ON p.codPartido = c.codPartido
            WHERE c.resultado LIKE 'ELEITO %'
            GROUP BY c.codPartido) AS c ON c.sigla = r.sigla
ORDER BY 4 DESC;


-- partidos com maior quantidade de eleitos por região

SELECT *
FROM (SELECT p.sigla          AS 'Sigla do Partido',
             c.siglaUf        AS 'Sigla da UF',
             count(c.siglaUf) AS 'Eleitos do Partido'
      FROM CANDIDATO c
      INNER JOIN partido p ON p.codPartido = c.codPartido
      GROUP BY c.siglaUf, c.codPartido) AS m
ORDER BY 3 DESC;


SELECT c.siglaUf        AS 'Sigla da UF',
       count(c.siglaUf) AS total
FROM CANDIDATO c
GROUP BY c.siglaUf
ORDER BY 2 DESC;