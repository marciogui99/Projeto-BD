CREATE TABLE individuo (
	documento VARCHAR(11), -- Documento do_individuo, nesse caso CPF
	nome VARCHAR(100) NOT NULL, -- Nome completo
	dt_nascimento DATE NOT NULL,
	
	PRIMARY KEY (documento)
);


CREATE TABLE processo_judicial (
	codigo SERIAL, -- Codigo do_processo
	doc_reu VARCHAR(11), -- Documento do_individuo associado ao processo 
	procedencia VARCHAR(12) DEFAULT 'Inocente', -- Inocente ou culpado. Inocente ate que se prove o contrario
	dt_termino DATE, -- Data do fim do processo
	
	PRIMARY KEY (codigo),
	CONSTRAINT fk_name FOREIGN KEY (doc_reu)
		REFERENCES individuo(documento)
		ON DELETE CASCADE -- Caso um individuo seja removido da tabela de indivios, seus processos sao apagados
);

-- Verifica se um processo possui data de termino
CREATE OR REPLACE FUNCTION situacao_processo(dt_termino DATE)
	RETURNS CHAR
	LANGUAGE PLPGSQL
	AS 
$$
DECLARE
	situacao CHAR(20);
BEGIN
	IF dt_termino IS NULL THEN
		situacao = 'Em tramitacao';
	ELSE
		situacao = 'Julgado';
	END IF;
	
	RETURN situacao;
END;
$$


CREATE TABLE partido (
	nome VARCHAR(30),
	programa TEXT NOT NULL,
	
	PRIMARY KEY (nome)
);

CREATE TABLE cargo(
	codigo SERIAL,
	nome VARCHAR(30), -- Nome do cargo, ex.: Prefeito, Vereador, Deputado Federal
	cidade VARCHAR(50),
	uf CHAR(2),
	federacao CHAR(2),
	qtd_eleitos SMALLINT NOT NULL CHECK (qtd_eleitos > 0),
	categoria VARCHAR(20), -- Municipal, Estadual ou Federal
	
	PRIMARY KEY (codigo),
	CONSTRAINT cargo_unico UNIQUE(nome,cidade,uf,federacao)
);

CREATE OR REPLACE FUNCTION eh_ficha_limpa(doc CHAR)  -- Funcao que verifica se um individuo eh ficha limpa ou nao
	RETURNS BOOL
	LANGUAGE plpgsql
AS
$$
DECLARE 
	ficha_limpa BOOL;
	num_processos_culpado INT;
BEGIN -- Conta o numero de processos que qualificam uma pessoa como nao ficha limpa
	SELECT COUNT(*) INTO num_processos_culpado
	FROM processo_judicial
	WHERE doc_reu = doc
		AND procedencia = 'Culpado(a)'
		AND date_part('year', age(dt_termino)) <= 5;  -- Verifica se o processo te mais de 5 anos

	IF num_processos_culpado > 0 THEN 
		ficha_limpa = FALSE;
	ELSE
		ficha_limpa = TRUE;
	END IF;
	RETURN ficha_limpa;
END;
$$

CREATE TABLE candidatura (
	doc_candidato CHAR(11),
	ano_eleicao CHAR(4),
	cod_cargo SMALLINT,
	partido VARCHAR(30),
	doc_vice CHAR(11),
	pleito INTEGER NOT NULL CHECK (pleito >= 0) DEFAULT 0, -- Numero de votos
	eleito BOOL DEFAULT NULL, -- Null -> Eleicao ainda nao ocorreu
	
	PRIMARY KEY (doc_candidato, ano_eleicao),
	CONSTRAINT fk_candidatura_individuo -- Inidividuo
		FOREIGN KEY (doc_candidato)
			REFERENCES individuo(documento),
	CONSTRAINT fk_candidatura_cargo  -- Cargo
		FOREIGN KEY (cod_cargo)
			REFERENCES cargo(codigo),
	CONSTRAINT fk_candidatura_partido -- Partido unico
		FOREIGN KEY (partido)
			REFERENCES partido(nome),
	CONSTRAINT ficha_limpa CHECK (eh_ficha_limpa(doc_candidato)) -- Verifica se o individui possui ficha limpa
);

CREATE TABLE equipe_de_apoio(
	doc_candidato CHAR(11),
	ano_eleicao CHAR(4),
	nome_equipe VARCHAR(30) NOT NULL,
	
	PRIMARY KEY (doc_candidato, ano_eleicao, nome_equipe),
	CONSTRAINT fk_doacao_pf_candidatura
		FOREIGN KEY (doc_candidato, ano_eleicao)
			REFERENCES candidatura(doc_candidato, ano_eleicao)
);

CREATE TABLE participante_equipe(
	doc_participante CHAR(11),
	doc_candidato CHAR(11),
	ano_eleicao CHAR(4),
	nome_equipe VARCHAR(30) NOT NULL,
	
	PRIMARY KEY (doc_participante, doc_candidato, ano_eleicao),
	
);

CREATE TABLE doacao_pf(
	doc_doador CHAR(11),
	doc_candidato CHAR(11),
	ano_eleicao CHAR(4),
	valor NUMERIC(6,2) NOT NULL CHECK (valor > 0),
	
	CONSTRAINT fk_doacao_pf_candidatura
		FOREIGN KEY (doc_candidato, ano_eleicao)
			REFERENCES candidatura(doc_candidato, ano_eleicao),
	CONSTRAINT fk_doacao_pf_doador
		FOREIGN KEY (doc_doador)
			REFERENCES individuo(documento)
);

INSERT INTO doacao_pf VALUES(1, 2, '2020', 500.25);
INSERT INTO doacao_pf VALUES(1, 2, '2020', 500.25);
INSERT INTO doacao_pf VALUES(1, 2, '2020', 500.25);
INSERT INTO doacao_pf VALUES(2, 1, '2020', 500.25);
SELECT * FROM doacao_pf ;

CREATE TABLE doacao_pj(
	cnpj_doador CHAR(12),
	doc_candidato CHAR(11),
	ano_eleicao CHAR(4),
	valor NUMERIC(6,2),
	
	PRIMARY KEY (cnpj_doador, doc_candidato, ano_eleicao),
	CONSTRAINT uma_doacao_ano UNIQUE (cnpj_doador, ano_eleicao)
);


--DROP TABLE IF EXISTS individuo CASCADE;
--DROP TABLE IF EXISTS processo_judicial CASCADE;
--DROP TABLE IF EXISTS partido CASCADE;
--DROP TABLE IF EXISTS cargo CASCADE;
--DROP TABLE IF EXISTS equipe_apoio CASCADE;
--DROP TABLE IF EXISTS candidatura CASCADE;
--DROP TABLE IF EXISTS doacao_pf CASCADE;