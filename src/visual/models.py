import mysql.connector
import simplejson


def open_connection():
    return mysql.connector.connect(user='admin',
                                   password='@d2019',
                                   host='127.0.0.1',
                                   database='TF_E_dupla2_fimBD')


class Banco:
    def partido(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT p.sigla,
                   count(c.idCandidato) AS t
            FROM candidato c
            INNER JOIN PARTIDO p ON c.codPartido=p.codPartido
            GROUP BY c.codPartido
            ORDER BY t;
        """

        cursor.execute(query)
        lista_dict = []

        for (sigla, qtd) in cursor:
            lista = {
                "sigla": sigla,
                "qtd": qtd
            }
            lista_dict.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict

    def raca(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT descRaca,
                   count(c.idCandidato) 
            FROM candidato c
            INNER JOIN raca r ON r.codRaca=c.codRaca
            GROUP BY r.descRaca;
        """

        cursor.execute(query)
        lista_dict = []

        for (descRaca, qtd) in cursor:
            lista = {
                "descRaca": descRaca,
                "qtd": qtd
            }
            lista_dict.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict

    def candidatoEleitos(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT r.nomePartido, 
                   r.sigla,
                   r.totalCandidaturas, 
                   c.totalEleitos
            FROM (SELECT p.nomePartido, 
                         p.sigla,
                         count(c.codPartido) AS totalCandidaturas 
                  FROM candidato c
                  INNER JOIN partido p ON p.codPartido=c.codPartido 
                  GROUP BY c.codPartido) AS r
            INNER JOIN (SELECT p.nomePartido, 
                               p.sigla,
                               count(c.codPartido) AS totalEleitos 
                        FROM candidato c
                        INNER JOIN partido p ON p.codPartido=c.codPartido 
                        WHERE c.resultado LIKE 'ELEITO %'
                        GROUP BY c.codPartido ) c ON c.sigla=r.sigla
            ORDER BY totalEleitos asc;"""
        cursor.execute(query)
        lista_dict = []

        for (nomePartido, sigla, totalCandidaturas, totalEleitos) in cursor:
            lista = {
                "nomePartido": nomePartido,
                "sigla": sigla,
                "totalCandidaturas": totalCandidaturas,
                "totalEleitos" : totalEleitos
            }
            lista_dict.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict

    def candidato_regiao(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT c.siglaUf,
                   count(c.siglaUf) AS total 
            FROM candidato c
            GROUP BY c.siglaUf;
        """
        cursor.execute(query)
        lista_dict = []

        for (siglaUf, total) in cursor:
            lista = {
                "siglaUf": siglaUf,
                "total" : total
            }
            lista_dict.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict

    def participacao_sexo_f(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT c.sexo,
                   count(c.sexo) AS feminino
            FROM candidato c
            WHERE c.sexo = 'F';
        """

        cursor.execute(query)
        lista_dict_f = []

        for (sexo, feminino) in cursor:
            lista = {
                "sexo": sexo,
                "feminino" : feminino
            }
            lista_dict_f.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict_f

    def participacao_sexo_m(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT c.sexo,
                   count(c.sexo) AS masculino
            FROM candidato c
            WHERE c.sexo = 'M';"""

        cursor.execute(query)
        lista_dict_m = []

        for (sexo, masculino) in cursor:
            lista = {
                "sexo": sexo,
                "masculino" : masculino
            }
            lista_dict_m.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict_m

    def feminino_eleito(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT c.sexo,
                   count(c.sexo) AS totalEleito
            FROM candidato c
            WHERE c.sexo = 'F' and c.resultado LIKE 'ELEITO %';"""

        cursor.execute(query)
        lista_dict_f = []

        for (sexo, totalEleito) in cursor:
            lista = {
                "sexo": sexo,
                "feminino" : totalEleito
            }
            lista_dict_f.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict_f

    def masculino_eleito(self):
        cnx = open_connection()
        cursor = cnx.cursor()
        query = """
            SELECT c.sexo,
                   count(c.sexo) AS totalEleito
            FROM candidato c
            WHERE c.sexo = 'M' and c.resultado LIKE 'ELEITO %';"""

        cursor.execute(query)
        lista_dict_m = []

        for (sexo, totalEleito) in cursor:
            lista = {
                "sexo": sexo,
                "masculino" : totalEleito
            }
            lista_dict_m.append(lista)
        cursor.close()
        cnx.close()
        return lista_dict_m
