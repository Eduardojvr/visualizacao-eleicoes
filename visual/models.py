import mysql.connector
import simplejson

class Banco:
    def partido(self):
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
        cursor = cnx.cursor()
        query = "select p.sigla, count(c.idCandidato) as t from candidato c inner join PARTIDO p on c.codPartido=p.codPartido group by c.codPartido order by t;"
        
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

    def candidatoEleitos(self):
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
            
        cursor = cnx.cursor()
        query = "select r.nomePartido, r.sigla, r.totalCandidaturas, c.totalEleitos from (select p.nomePartido, p.sigla, count(c.codPartido) as totalCandidaturas from candidato c inner join partido p on p.codPartido=c.codPartido group by c.codPartido) as r inner join ( select p.nomePartido, p.sigla, count(c.codPartido) as totalEleitos from candidato c inner join partido p on p.codPartido=c.codPartido where c.resultado like 'ELEITO %' group by c.codPartido ) c on c.sigla=r.sigla order by totalEleitos asc;"        
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
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
            
        cursor = cnx.cursor()
        query = "select c.siglaUf, count(c.siglaUf) as total from candidato c group by c.siglaUf;" 
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
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
            
        cursor = cnx.cursor()
        query = "select c.sexo, count(c.sexo) as feminino from candidato c where c.sexo = 'F';" 

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
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
            
        cursor = cnx.cursor()
        query = "select c.sexo, count(c.sexo) as masculino from candidato c where c.sexo = 'M';" 

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
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
            
        cursor = cnx.cursor()
        query = "select c.sexo, count(c.sexo) as totalEleito from candidato c where c.sexo = 'F' and c.resultado like 'ELEITO %';" 

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
        cnx = mysql.connector.connect(user='admin', password='@d2019',
                                host='127.0.0.1',
                                database='candidatura')
            
        cursor = cnx.cursor()
        query = "select c.sexo, count(c.sexo) as totalEleito from candidato c where c.sexo = 'M' and c.resultado like 'ELEITO %';" 

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
        