#' @title Enumera votações
#' @description Recebe um dataframe com coluna voto e enumera o valor para um número
#' @param df Dataframe com a coluna voto
#' @return Dataframe com coluna voto enumerada
#' @examples
#' enumera_votacoes(df)
enumera_voto <- function(df) {
  df %>%
    mutate(
      voto = case_when(
        str_detect(voto, "Não") ~ -1,
        str_detect(voto, "Sim") ~ 1,
        str_detect(voto, "Obstrução|P-OD") ~ 2,
        str_detect(voto, "Abstenção") ~ 3,
        str_detect(voto, "Art. 17|art. 51 RISF|Art.17") ~ 4,
        str_detect(voto, "Liberado") ~ 5,
        #TODO: Tratar caso P-NRV: Presente mas não registrou foto
        TRUE ~ 0
      )
    )
}

#' @title Recupera descrição do voto a partir do código enumerado do voto
#' @description Recebe um integer que representa o código do voto e retorna a descrição do mesmo
#' @param voto Voto para descrição
#' @return Descrição do voto apssado como parâmetro
#' @examples
#' get_descricao_voto(2)
get_descricao_voto <- function(voto) {
  voto_descricao <- case_when(
    voto == -1 ~ "Não",
    voto == 1 ~ "Sim",
    voto == 2 ~ "Obstrução",
    voto == 3 ~ "Abstenção",
    voto == 4 ~ "Art. 17",
    voto == 5 ~ "Liberado",
    TRUE ~ "Não votou")
  
  return(voto_descricao)
}

#' @title Recupera valor do voto
get_val_voto <- function(voto) {
  voto_descricao <- case_when(
    str_detect(voto, "Não") ~ -1,
    str_detect(voto, "Sim") ~ 1,
    str_detect(voto, "Obstrução|P-OD") ~ 2,
    str_detect(voto, "Abstenção") ~ 3,
    str_detect(voto, "Art. 17|art. 51 RISF|Art.17") ~ 4,
    str_detect(voto, "Liberado") ~ 5,
    #TODO: Tratar caso P-NRV: Presente mas não registrou foto
    TRUE ~ 0
  )
  
  return(voto_descricao)
}

#' @title Mapeia um nome eleitoral para id correspondente
#' @description Recebe dois dataframes contendo nome eleitoral e um deles com informação de id
#' @param target_df Dataframe a receber o id do parlamentar
#' @return Dataframe target_df contendo coluna id
mapeia_nome_eleitoral_to_id_senado <- function(target_df) {
  library(tidyverse)
  
  senadores_df <- read_csv(here::here("crawler/raw_data/parlamentares.csv")) %>% 
    filter(casa == "senado")
  
  result <- 
    target_df %>% 
    left_join(
      senadores_df %>%
        select(nome_eleitoral, id), 
         by=c("nome_eleitoral"))
  
  return(result)
}

#' @title Busca o Codigo do Líder do Senado
#' @return int Codigo do líder
getLiderSenado <- function(){
  library(tidyverse)
  library(RCurl)
  library(xml2)

  xml <- getURL("https://legis.senado.leg.br/dadosabertos/plenario/lista/liderancas") %>% read_xml()
  lideranca <- xml_find_all(xml, ".//DadosLiderancas/Lideranca") %>%
    map_df(function(x) {
        list(
          SiglaUnidLideranca = xml_find_first(x, "./SiglaUnidLideranca") %>% xml_text(),
          CodigoParlamentar = xml_find_first(x, ".//CodigoParlamentar") %>% xml_text()
        )
    }) %>%
    filter(SiglaUnidLideranca == "Governo") %>%
    select(CodigoParlamentar)
    
  return(lideranca)
}