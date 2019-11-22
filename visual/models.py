import mysql.connector
import simplejson

class Banco:
    def partido(self):
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
        cursor = cnx.cursor()
        query = "select p.sigla, count(c.idCandidato) from candidato c inner join PARTIDO p on c.codPartido=p.codPartido group by c.codPartido;"
        
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

    def raca(query):
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                              host='127.0.0.1',
                              database='candidatura')
        
        cursor = cnx.cursor()
        query = "select descRaca, count(c.idCandidato) from candidato c inner join raca r on r.codRaca=c.codRaca group by r.descRaca;"
        
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

