import simplejson
from django.shortcuts import render

from visual.models import Banco


def index(request):
    b = Banco()
    lista_json_partido = simplejson.dumps(b.partido())
    lista_json_raca = simplejson.dumps(b.raca())
    lista_json_candidatura = simplejson.dumps(b.candidatoEleitos())
    lista_json_candidato_regiao = simplejson.dumps(b.candidato_regiao())
    lista_json_participacao_f = simplejson.dumps(b.participacao_sexo_f())
    lista_json_participacao_m = simplejson.dumps(b.participacao_sexo_m())
    lista_json_feminino_eleito = simplejson.dumps(b.feminino_eleito())
    lista_json_masculino_eleito = simplejson.dumps(b.masculino_eleito())

    return render(request, 'index.html', {
        "lista": lista_json_partido,
        "lista_json_raca": lista_json_raca,
        "lista_json_candidatura": lista_json_candidatura,
        "lista_json_candidato_regiao": lista_json_candidato_regiao,
        "lista_json_participacao_f": lista_json_participacao_f,
        "lista_json_participacao_m": lista_json_participacao_m,
        "lista_json_feminino_eleito": lista_json_feminino_eleito,
        "lista_json_masculino_eleito": lista_json_masculino_eleito
    })


def teste(request):
    return render(request, 'test.html')
