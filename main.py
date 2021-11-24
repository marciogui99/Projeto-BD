from typing import get_origin
from fastapi import FastAPI
import psycopg2
from psycopg2.extras import RealDictCursor
import json
from enum import Enum

con = psycopg2.connect(host='localhost', database='projeto_bd',
        user='postgres', password='1')


class AnoEleicao(str, Enum):
    a2016 = "2016"
    a2018 = "2018"
    a2020 = "2020"

class Cargo(str, Enum):
    ver = "Vereador"
    pref = "Prefeito"
    gov = "Governador"
    dep_est = "Deputado Estadual"
    dep_fed = "Deputado Federal"
    sen = "Senador"
    pr = "Presidente"

class Uf(str, Enum):
    ac = "AC"
    al = "AL"
    ap = "AP"
    am = "AM"
    ba = "BA"
    ce = "CE"
    df = "DF"
    es = "ES"
    go = "GO"
    ma = "MA"
    mt = "MT"
    ms = "MS"
    mg = "MG"
    pa = "PA"
    pb = "PB"
    pr = "PR"
    pe = "PE"
    pi = "PR"
    rj = "RJ"
    rn = "RN"
    rs = "RS"
    ro = "RO"
    rr = "RR"
    sc = "SC"
    sp = "SP"
    se = "SE"
    to = "TO"

app = FastAPI()

@app.get("/candidatos")
def select_candidatos():
    cur = con.cursor(cursor_factory=RealDictCursor)

    todos_candidatos = """
        SELECT ano_eleicao, partido, i.nome nome_candidato, car.nome cargo, cidade, uf, pleito
        FROM candidatura
        JOIN individuo i ON doc_candidato = documento
        JOIN cargo car ON cod_cargo = codigo"""


    cur.execute(todos_candidatos)

    return {"resultados" : cur.fetchall(), "query" : todos_candidatos}

@app.get("/individuos")
def select_candidatos():
    cur = con.cursor(cursor_factory=RealDictCursor)

    indi = """
        SELECT * FROM individuo"""

    cur.execute(indi)

    return {"resultados" : cur.fetchall(), "query" : indi}

@app.get("/cargos")
def select_candidatos(cursor_factory=RealDictCursor):
    cur = con.cursor()

    todos_candidatos = """
        SELECT * FROM cargo"""

    cur.execute(todos_candidatos)

    return {"resultados" : cur.fetchall(), "query" : todos_candidatos}


@app.delete("/candidatos/{ano}/{doc_candidato}")
def remove_candidatura(doc_candidato:str, ano:str):
    cur = con.cursor()

    remove = f"""DELETE FROM candidatura
    WHERE doc_candidato = '{doc_candidato}' AND ano_eleicao = '{ano}'
    RETURNING *;"""

    cur.execute(remove)

    return {"result":cur.fetchall(), "query": remove}

@app.get("candidatos/eleitos/{ano}")
def select_eleitos(ano : AnoEleicao):
    cur = con.cursor(cursor_factory=RealDictCursor)

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
    cur = con.cursor(cursor_factory=RealDictCursor)

    ficha_limpa_query = """
    SELECT documento Documento, nome AS Nome_reu, codigo AS Cod_processo,
		procedencia AS Procedencia, CAST(dt_termino AS VARCHAR) AS Data_de_termino, situacao AS Situacao, eh_ficha_limpa(documento)
	FROM individuo
	JOIN processo_judicial ON documento = doc_reu
	WHERE eh_ficha_limpa(documento) = TRUE;"""

    cur.execute(ficha_limpa_query)

    return cur.fetchall()

