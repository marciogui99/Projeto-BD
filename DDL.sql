-- DROP TABLE IF EXISTS individuo CASCADE;

CREATE TABLE individuo (
	documento VARCHAR(11), -- Documento do_individuo, nesse caso CPF -- TODO trocar de varchar para char
	nome VARCHAR(100) NOT NULL, -- Nome completo
	dt_nascimento DATE NOT NULL, 
	ficha_limpa BOOL DEFAULT TRUE, -- Campo derivado, verifica se um individuo eh culpado de um processo recente
	
	PRIMARY KEY (documento)
);

-- DROP TABLE IF EXISTS processo_judicial;

CREATE TABLE processo_judicial (
	codigo SERIAL, -- Codigo do_processo
	doc_reu VARCHAR(11), -- Documento do_individuo associado ao processo 
	procedencia VARCHAR(12) DEFAULT 'Inocente', -- Inocente ou culpado. Inocente ate que se prove o contrario
	dt_termino DATE, -- Data do fim do processo
	
	PRIMARY KEY (codigo),
	CONSTRAINT fk_name
		FOREIGN KEY (doc_reu)
			REFERENCES individuo(documento)
			ON DELETE CASCADE -- Caso um individuo seja removido da tabela de indivios, seus processos sao apagados
);

-- DROP TABLE IF EXISTS partido CASCADE;

CREATE TABLE partido (
	nome VARCHAR(30),
	programa TEXT NOT NULL,
	
	PRIMARY KEY (nome)
);

-- DROP TABLE IF EXISTS cargo CASCADE;

CREATE TABLE cargo(
	codigo SERIAL,
	nome VARCHAR(30), -- Nome do cargo, ex.: Prefeito, Vereador, Deputado Federal
	cidade VARCHAR(50) DEFAULT 'Brasilia',
	uf CHAR(2) DEFAULT 'DF',
	federacao CHAR(2) DEFAULT 'BR',
	qtd_eleitos SMALLINT NOT NULL CHECK (qtd_eleitos > 0),
	categoria VARCHAR(20), -- Municipal, Estadual ou Federal -- TODO Verificar se precisa de CONSTRAINT NOT NULL
	
	PRIMARY KEY (codigo),
	CONSTRAINT cargo_unico UNIQUE(nome,cidade,uf,federacao)
);

-- DROP TABLE IF EXISTS candidatura CASCADE;

CREATE TABLE candidatura (
	doc_candidato VARCHAR(11),
	ano_eleicao CHAR(4),
	cod_cargo SMALLINT,
	partido VARCHAR(30),
	doc_vice VARCHAR(11),
	pleito INTEGER NOT NULL CHECK (pleito >= 0), -- Numero de votos
	eleito BOOL DEFAULT NULL, -- Null -> Eleicao ainda nao ocorreu
	
	PRIMARY KEY (doc_candidato, ano_eleicao),
	CONSTRAINT fk_candidatura_individuo
		FOREIGN KEY (doc_candidato)
			REFERENCES individuo(documento),
	CONSTRAINT fk_candidatura_cargo
		FOREIGN KEY (cod_cargo)
			REFERENCES cargo(codigo),
	CONSTRAINT fk_candidatura_partido
		FOREIGN KEY (partido)
			REFERENCES partido(nome)
);