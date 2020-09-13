\copy partidos FROM './data/partidos.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy parlamentares FROM './data/parlamentares.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy gastos_ceap FROM './data/gastos_ceap_congresso.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy proposicoes FROM './data/proposicoes.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy parlamentares_proposicoes FROM './data/parlamentares_proposicoes.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy discursos FROM './data/discursos.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy patrimonio FROM './data/patrimonio.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy votacoes FROM './data/votacoes.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy votos FROM './data/votos.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy votos_eleicao FROM './data/votos_eleicao.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy assiduidade FROM './data/assiduidade.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
\copy transparencia FROM './data/transparencia.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;
