DROP TABLE IF EXISTS "votacoes";

CREATE TABLE IF NOT EXISTS "votacoes" (
    "id_proposicao_voz" VARCHAR(40) REFERENCES "proposicoes" ("id_proposicao_voz") ON DELETE CASCADE ON UPDATE CASCADE,
    "id_votacao" VARCHAR(40),
    "casa" VARCHAR(255),
    "obj_votacao" VARCHAR(500),
    "data_hora" DATE,
    "votacao_secreta" BOOLEAN,
    PRIMARY KEY("id_proposicao_voz", "id_votacao")
);