library(tidyverse)
library(here)
source(here::here("crawler/parlamentares/mandatos/analyzer_mandatos.R"))

if(!require(optparse)){
  install.packages("optparse")
  suppressWarnings(suppressMessages(library(optparse)))
}

args = commandArgs(trailingOnly=TRUE)

message("LEIA O README deste diretório")
message("Use --help para mais informações\n")

option_list = list(
  make_option(c("-i", "--input"), type="character", default=here::here("crawler/raw_data/parlamentares.csv"), 
              help="nome do arquivo de entrada [default= %default]", metavar="character"),
  
  make_option(c("-o", "--out"), type="character", default=here::here("crawler/raw_data/mandatos_senadores.csv"), 
              help="nome do arquivo de saída [default= %default]", metavar="character")
) 

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

df_parlamentares <- readr::read_csv(opt$input)
saida <- opt$out

message("Iniciando processamento...")
message("Baixando dados de mandatos...")
mandatos <- extract_mandatos_senadores(df_parlamentares)

message(paste0("Salvando o resultado em ", saida))
readr::write_csv(mandatos, saida)

message("Concluído!")
