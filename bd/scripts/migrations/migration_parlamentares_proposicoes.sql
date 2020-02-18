-- PARLAMENTARES_PROPOSIÇÕES
BEGIN;

CREATE TEMP TABLE temp_parlamentares_proposicoes AS SELECT * FROM parlamentares_proposicoes LIMIT 0;

\copy temp_parlamentares_proposicoes FROM './data/parlamentares_proposicoes.csv' WITH NULL AS 'NA' DELIMITER ',' CSV HEADER;

INSERT INTO parlamentares_proposicoes
  SELECT * FROM temp_parlamentares_proposicoes
  ON CONFLICT (id_proposicao_voz, id_parlamentar_voz) 
  DO NOTHING;

DELETE FROM parlamentares_proposicoes
 WHERE (id_proposicao_voz, id_parlamentar_voz) NOT IN 
 (SELECT id_proposicao_voz, id_parlamentar_voz FROM temp_parlamentares_proposicoes);

DROP TABLE temp_parlamentares_proposicoes;

COMMIT;