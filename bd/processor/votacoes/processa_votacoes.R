#' @title Processa dados de votações
#' @description Processa os dados de votações e retorna no formato correto para o banco de dados
#' @param votacoes_data_path Caminho para o arquivo de dados das proposições sem tratamento
#' @return Dataframe de Votações tratado no formato do banco de dados
processa_votacoes <- function(
  votacoes_data_path = here::here("crawler/raw_data/votacoes_com_orientacao.csv"),
  proposicoes_votadas_data_path = here::here("crawler/raw_data/proposicoes_votadas.csv")) {
  library(tidyverse)
  library(here)
  
  votacoes <- read_csv(votacoes_data_path)
  
  proposicoes_votadas <- read_csv(proposicoes_votadas_data_path)
  
  votacoes_alt <- votacoes %>%
    filter(id_proposicao %in% (proposicoes_votadas %>% pull(id_proposicao))) %>% 
    mutate(
      id_proposicao_voz = paste0(dplyr::if_else(casa == "camara", 1, 2),
                                 id_proposicao))
  votacoes_alt <- votacoes_alt %>%
    select(id_proposicao_voz, id_votacao, casa, obj_votacao, data_hora, votacao_secreta, apelido, status_importante, orientacao, url_votacao)
  return(votacoes_alt)
}
