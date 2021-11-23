-- Geração de relatório de candidaturas, indicando quais são os candidatos eleitos, inclusive os vices quando for o caso
SELECT * 
FROM (
		SELECT i.nome nome_candidato, ano_eleicao,
			c.nome nome_cargo, c.cidade, c.uf, c.qtd_eleitos ,pleito,
			row_number() OVER
				(partition by (cod_cargo, ano_eleicao)
					order by (ano_eleicao, pleito) desc) as classificacao
		FROM candidatura
		JOIN individuo i ON doc_candidato = documento
		JOIN cargo c ON cod_cargo = c.codigo
	) AS e
WHERE ano_eleicao = '2020'
	AND classificacao <= qtd_eleitos
ORDER BY ano_eleicao DESC, nome_cargo, pleito DESC;

-- Listar todos as pessoas ficha limpa, isto é, que podem ser candidatas.
SELECT documento Documento, nome AS Nome_reu, codigo AS Cod_processo,
		procedencia AS Procedencia, dt_termino AS Data_de_termino, situacao AS Situacao, eh_ficha_limpa(documento)
	FROM individuo
	JOIN processo_judicial ON documento = doc_reu
	--WHERE eh_ficha_limpa(documento) = TRUE;