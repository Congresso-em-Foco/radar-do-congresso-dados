library(tidyverse)	
library(here)	

 if(!require(optparse)){	
  install.packages("optparse")	
  library(optparse)	
}	

 message("Leia o README deste diretório")	
message("Use --help para mais informações\n")	

 option_list <- list(	
  make_option(c("-o", "--output"), 	
              type="character", 	
              default=here::here("bd/data/"), 	
              help="diretório de saída [default= %default]", 	
              metavar="character")	
)	

opt_parser <- OptionParser(option_list=option_list)	

opt <- parse_args(opt_parser)	

output <- opt$output	

message("Processando dados...")	

message("Processando parlamentares/processa_parlamentares")
source(here::here("bd/processor/parlamentares/processa_parlamentares.R"))
parlamentares <- processa_parlamentares()

message("Processando partidos/processa_partidos")
source(here::here("bd/processor/partidos/processa_partidos.R"))
partidos <- processa_partidos()

message("Processando gastos_ceap/processa_gastos_ceap")
source(here::here("bd/processor/gastos_ceap/processa_gastos_ceap.R"))
gastos_ceap <- processa_gastos_ceap()

message("Processando proposicoes/processa_proposicoes")
source(here::here("bd/processor/proposicoes/processa_proposicoes.R"))
proposicoes <- processa_proposicoes()

message("Processando parlamentares_proposicoes/processa_parlamentares_proposicoes")
source(here::here("bd/processor/parlamentares_proposicoes/processa_parlamentares_proposicoes.R"))
parlamentares_proposicoes <- processa_parlamentares_proposicoes()

message("Processando votacoes/processa_votacoes")
source(here::here("bd/processor/votacoes/processa_votacoes.R"))
votacoes <- processa_votacoes()

message("Processando votos/processa_votos")
source(here::here("bd/processor/votos/processa_votos.R"))
votos <- processa_votos()

message("Processando patrimonio/processa_patrimonio")
source(here::here("bd/processor/patrimonio/processa_patrimonio.R"))
patrimonio <- processa_patrimonio()

message("Processando discursos/processa_discursos")
source(here::here("bd/processor/discursos/processa_discursos.R"))
discursos <- processa_discursos()

message("Processando eleicoes/processa_votos_eleicao")
source(here::here("bd/processor/eleicoes/processa_votos_eleicao.R"))
votos_eleicao <- processa_votos_eleicao()

message("Processando assiduidade/processa_assiduidade")
source(here::here("bd/processor/assiduidade/processa_assiduidade.R"))
assiduidade <- processa_assiduidade()

message("Escrevendo dados em csv...")	
write_csv(parlamentares, paste0(output, "parlamentares.csv"))
write_csv(partidos, paste0(output, "partidos.csv"))
write_csv(gastos_ceap, paste0(output, "gastos_ceap_congresso.csv"))
write_csv(proposicoes, paste0(output, "proposicoes.csv"))
write_csv(parlamentares_proposicoes, paste0(output, "parlamentares_proposicoes.csv"))
write_csv(patrimonio, paste0(output, "patrimonio.csv"))
write_csv(discursos, paste0(output, "discursos.csv"))
write_csv(votacoes, paste0(output, "votacoes.csv"))
write_csv(votos, paste0(output, "votos.csv"))
write_csv(votos_eleicao, paste0(output, "votos_eleicao.csv"))
write_csv(assiduidade, paste0(output, "assiduidade.csv"))

message("Concluído")
