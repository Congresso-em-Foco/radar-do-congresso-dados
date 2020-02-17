DROP TABLE IF EXISTS "gastos_ceap";

CREATE TABLE IF NOT EXISTS "gastos_ceap" (
  "id" SERIAL,
  "id_parlamentar_voz" VARCHAR(40) REFERENCES "parlamentares" ("id_parlamentar_voz") ON DELETE SET NULL ON UPDATE CASCADE,
  "casa" VARCHAR(255),
  "ano" INTEGER,
  "mes" INTEGER,
  "documento" VARCHAR(400),
  "descricao" VARCHAR(800),
  "especificacao" VARCHAR(1500),
  "data_emissao" DATE,
  "fornecedor" VARCHAR(255),
  "cnpj_cpf_fornecedor" VARCHAR(255),
  "valor_documento" NUMERIC(15, 2),
  "valor_glosa" NUMERIC(15, 2),
  "valor_liquido" NUMERIC(15, 2),
  "num_parcela" INTEGER,
  "valor_reembolsado" NUMERIC(15, 2),
  PRIMARY KEY("id")
);  