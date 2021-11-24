from fastapi import FastAPI
import psycopg2
import json
from enum import Enum

con = psycopg2.connect(host='localhost', database='projeto_bd',
        user='postgres', password='1')

def select_ficha_limpa():
    cur = con.cursor()

    ficha_limpa_query = """
    SELECT documento Documento, nome AS Nome_reu, codigo AS Cod_processo,
		procedencia AS Procedencia, CAST(dt_termino AS VARCHAR) AS Data_de_termino, situacao AS Situacao, eh_ficha_limpa(documento)
	FROM individuo
	JOIN processo_judicial ON documento = doc_reu
	WHERE eh_ficha_limpa(documento) = TRUE;"""

    cur.execute(ficha_limpa_query)

    return cur.fetchall()

# con.close()


app = FastAPI()

class AnoEleicao(str, Enum):
    a2016 = "2016"
    a2018 = "2018"
    a2020 = "2020"

@app.get("/eleitos/{ano}")
def select_eleitos(ano : AnoEleicao):
    cur = con.cursor()

    eleitos = """
        SELECT *
        FROM (
                SELECT i.nome nome_candidato, ano_eleicao,
                    c.nome nome_cargo, c.cidade, c.uf, c.qtd_eleitos ,pleito,
                    row_number() OVER
                        (partition by (cod_cargo, ano_eleicao)
                            order by (ano_eleicao, pleito) desc) as colocacao
                FROM candidatura
                JOIN individuo i ON doc_candidato = documento
                JOIN cargo c ON cod_cargo = c.codigo
            ) AS e
        WHERE ano_eleicao = '2020'
            AND colocacao <= qtd_eleitos
        ORDER BY ano_eleicao DESC, nome_cargo, pleito DESC;"""

    cur.execute(eleitos)

    return {"resultados" : cur.fetchall(), "query" : eleitos}

@app.get("/ficha-limpa")
def ficha_limpa():
    return select_ficha_limpa()