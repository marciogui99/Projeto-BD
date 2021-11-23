INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (1, 'Caio Carlos', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (2, 'Luiz Luz', '2007-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (3, 'Marcelo Matos', '2004-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (4, 'Patricia Pereira', '2002-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (5, 'Maria Lucia', '2001-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (6, 'Jorge Menezes', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (7, 'Luiz Macedo', '2007-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (8, 'Marcelo Para', '2004-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (10, 'Joao Marcelo Paiva', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (11, 'Marciana Torres', '1993-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (11124, 'Juliana Meira', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (23, 'Luiza Souza', '1990-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (34, 'Rui Costa', '2000-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (101, 'Joao Doria', '2012-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (111, 'Tarcisio Pimenta', '2003-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (12, 'Wellington Dias', '1992-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (27, 'Raphael Novaes', '1950-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (9, 'Marcelo Camelo', '1950-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (104, 'Joao Jorge da Silva', '1953-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (1165, 'Gabriel Costa', '1960-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (145, 'Caio Maria', '1948-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (256, 'Luiza Pereira', '1922-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (376, 'Carla Zambeli', '1960-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (1086, 'Eduardo Paes', '2002-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (11987, 'Lucas Moura', '2001-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (176, 'Yan Almeida', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (2234, 'Rubens Alves', '2001-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (323423, 'Marcelo Moraes', '2004-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (10234, 'Joaquim Pereira', '2002-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (11234, 'Daniel Carlos', '2001-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (13243, 'Severino Costa', '1994-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (25432, 'Rui Junior', '2007-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (34573, 'Paco Rabanne', '2004-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (10234325, 'Leticia Almeida', '2002-03-03');
INSERT INTO individuo(documento, nome, dt_nascimento) VALUES (11436, 'Mario Luigi', '2001-03-03');
SELECT * FROM individuo;


INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('323423', 'Culpado(a)', '2018-03-03');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('323423', 'Culpado(a)', '2019-02-03');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('376', 'Culpado(a)', '2017-12-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('11', 'Culpado(a)', '2009-03-12');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('145', 'Culpado(a)', '1994-03-21');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('104', 'Culpado(a)', '2014-03-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('23', 'Inocente', '2014-03-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('12', 'Inocente', '2014-03-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('23', 'Inocente', '2014-03-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('12', 'Inocente', '2014-03-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('8', 'Inocente', '2014-03-04');
INSERT INTO processo_judicial(doc_reu, procedencia, dt_termino) VALUES ('23', 'Inocente', '2014-03-04');
INSERT INTO processo_judicial(doc_reu) VALUES ('9');
INSERT INTO processo_judicial(doc_reu) VALUES ('2');
INSERT INTO processo_judicial(doc_reu) VALUES ('10234325');
INSERT INTO processo_judicial(doc_reu) VALUES ('2234');
INSERT INTO processo_judicial(doc_reu) VALUES ('256');
INSERT INTO processo_judicial(doc_reu) VALUES ('176');
INSERT INTO processo_judicial(doc_reu) VALUES ('2234');
INSERT INTO processo_judicial(doc_reu) VALUES ('2');
-- TODO Criar rotina para impedir que processos sem data de termino sejam culpados
SELECT * FROM processo_judicial;

INSERT INTO partido VALUES ('PSOL', 'Partido da liberdade') RETURNING *;
INSERT INTO partido VALUES ('PSC', 'Partido Cristao') RETURNING *;
INSERT INTO partido VALUES ('PSDB', 'Tucanos') RETURNING *;
INSERT INTO partido VALUES ('PSL', 'Tradicao e aventura') RETURNING *;  -- Pode string vazia
INSERT INTO partido VALUES ('PSM', 'O maior dos maiores') RETURNING *;
SELECT * FROM partido;

INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Prefeito', 'Belo Horizonte', 'MG', 'BR', 1) RETURNING *;
INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Deputado', 'Belo Horizonte', 'MG', 'BR', 15) RETURNING *;
INSERT INTO cargo(nome,qtd_eleitos) VALUES ('Senador', 3) RETURNING *;
INSERT INTO cargo(nome,qtd_eleitos) VALUES ('Presidente', 1) RETURNING *;
INSERT INTO cargo(nome,cidade,uf,federacao,qtd_eleitos) VALUES ('Vereador', 'Belo Horizonte', 'MG', 'BR', 9) RETURNING *;
INSERT INTO cargo(nome,cidade,uf,qtd_eleitos) VALUES ('Vereador', 'Sao Carlos', 'SP', 9);
INSERT INTO cargo(nome,cidade,uf,qtd_eleitos) VALUES ('Prefeito', 'Sao Carlos', 'SP', 1);
INSERT INTO cargo(nome,cidade,uf,qtd_eleitos) VALUES ('Deputado Federal', 'Brasilia', 'DF', 9);
INSERT INTO cargo(nome,cidade,uf,qtd_eleitos) VALUES ('Deputado Federal', 'Salvador', 'BA', 9);
INSERT INTO cargo(nome,cidade,uf,qtd_eleitos) VALUES ('Vereador', 'Sao Paulo', 'SP', 50);
SELECT * FROM cargo;

INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('9', '2020', 11, 'PSOL', 200) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('12', '2018', 12, 'PSC', 120) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('2', '2020', 11, 'PSOL', 270) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('2', '2014', 11, 'PSOL', 270) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('3', '2016', 15, 'PSDB', 120) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('11', '2020', 11, 'PSL', 24) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('10', '2020', 11, 'PSL', 1200);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('104', '2022', 14, 'PSDB', 1000) RETURNING *;
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('18', '2020', 13, 'PSL', 1200);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('1', '2020', 13, 'PSOL', 1200);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('104', '2020', 13, 'PSOL', 1100);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('145', '2020', 13, 'PSOL', 12120);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('4', '2020', 13, 'PSL', 1120);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('5', '2020', 13, 'PSL', 1140);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('6', '2020', 13, 'PSL', 140);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('7', '2020', 13, 'PSL', 11100);
INSERT INTO candidatura(doc_candidato, ano_eleicao, cod_cargo, partido, pleito) VALUES ('8', '2020', 13, 'PSL', 180);
SELECT * FROM candidatura;


SELECT documento, i.nome, ano_eleicao, c.nome AS cargo FROM candidatura
	JOIN individuo i ON doc_candidato = documento
	JOIN partido p ON partido = p.nome
	JOIN cargo c ON cod_cargo = c.codigo;