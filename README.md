<p align="center"><a href="https://i.pinimg.com/originals/2e/e6/99/2ee6998e34c3e2eff7b894c66cfc5267.jpg" target="_blank"><img width="500"src="https://i.pinimg.com/originals/2e/e6/99/2ee6998e34c3e2eff7b894c66cfc5267.jpg"></a></p>
<p align="center">


#  Visualização de dados: Eleições

Este software consite em um dashboard voltado para a visulização de dados de forma simplificada das eleições brasileiras
de 2016. Os dados utilizados nesta ferramenta foram obtidos por meio do "Brasil IO", disponível no endereço: https://brasil.io/dataset/eleicoes-brasil/candidatos.

# Rodando a aplicação

## Utilizando o terminal do seu computador, siga os passos abaixo.

### 1 - Clone o repositório
```Terminal
$ git clone https://github.com/Eduardojvr/visualizacao-eleicoes.git
```
### 2 - Utilizando o terminal, navegue até a pasta scripts localizada dentro do repositório clonado e, execute os scripts: "TF_E_dupla2_fimFisico.sql", "TF_E_dupla2_fimPopula.sql"
e "TF_E_dupla2_fimControle.sql", respectivamente

### 3 - Utilizando o pyenv com o python 3.6.4 instalado, execute o seguinte comando no terminal unix

```Terminal
$ pip install -r requirements.txt
```

### 4 - Utilizando o terminal, acesse a pastas src e execute o seguinte comando

```Terminal
$ ./manage.py runserver
```

### 5 - No navegador, acesse

```Terminal
http://127.0.0.1:8000/
```
