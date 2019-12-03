import simplejson
from django.shortcuts import render

from visual.models import Banco


def index(request):
    b = Banco()
    lista_json_partido = simplejson.dumps(b.partido())
    lista_json_raca = simplejson.dumps(b.raca())
    lista_json_candidatura = simplejson.dumps(b.candidatoEleitos())
    lista_json_candidato_regiao = simplejson.dumps(b.candidato_regiao())
    lista_json_participacao = simplejson.dumps(b.participacao_sexo())

    return render(request, 'index.html', {
        "lista": lista_json_partido,
        "lista_json_raca": lista_json_raca,
        "lista_json_candidatura": lista_json_candidatura,
        "lista_json_candidato_regiao": lista_json_candidato_regiao,
        "lista_json_participacao": lista_json_participacao,
    })


def teste(request):
    return render(request, 'test.html')
