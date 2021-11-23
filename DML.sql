INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (1, 'Caio', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (2, 'Luiz', '2007-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (3, 'Marcelo', '2004-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (10, 'Joao', '2002-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (11, 'Marcia', '2001-03-03');
SELECT * FROM individuo;

DELETE FROM individuo WHERE documento = '11';

INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('11', 'Culpado(a)', '2001-03-03');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('1', 'Culpado(a)', '2001-03-03');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('1', 'Culpado(a)', '2001-03-04');
INSERT INTO processo_judicial(doc_reu) VALUES ('2');
-- TODO Criar rotina para impedir que processos sem data de termino sejam culpados
SELECT * FROM processo_judicial;

INSERT INTO partido VALUES ('PSOL', 'Aalndlandilw awwdiajidoasoid wqidonwqiodnqowid asdioasndioasdnsad asoisadnas') RETURNING *;
INSERT INTO partido VALUES ('PSC', 'AalndlaQlw awwdiajidoasoid wqidonwqiodnqowid asdioasndioasdnsad asoisadnas') RETURNING *;
INSERT INTO partido VALUES ('PSDB', 'AalndQWEoid wqidonwqiodnqowid asdioasndioasdnsad asoisadnas') RETURNING *;
INSERT INTO partido VALUES ('PSL', '') RETURNING *;  -- Pode string vazia
INSERT INTO partido VALUES ('PSM') RETURNING *;
SELECT * FROM partido;

INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Prefeito', 'Belo Horizonte', 'MG', 'BR', 1) RETURNING *;
INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Deputado', 'Belo Horizonte', 'MG', 'BR', 15) RETURNING *;
INSERT INTO cargo(nome,qtd_eleitos) VALUES ('Senador', 1) RETURNING *;
INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Presidente', 'Belo Horizonte', 'MG', 'BA', 2) RETURNING *;
INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Vereador', 'Belo Horizonte', 'MG', 'BR', 9) RETURNING *;
SELECT * FROM cargo;

INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('1', '2020', 1, 'PSOL', 200) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('1', '2018', 2, 'PSC', 100) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('2', '2020', 1, 'PSOL', 270) RETURNING *;
-- INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('2', '2020', 1, 'PSC', 2006) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('3', '2016', 5, 'PSDB', 200) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('11', '2020', 1, 'PSL', 200) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('10', '2020', 1, 'PSL', 200) RETURNING *;
SELECT * FROM candidatura;

SELECT documento, i.nome, ano_eleicao, c.nome AS cargo FROM candidatura
	JOIN individuo i ON doc_candidato = documento
	JOIN partido p ON partido = p.nome
	JOIN cargo c ON cod_cargo = c.codigo;