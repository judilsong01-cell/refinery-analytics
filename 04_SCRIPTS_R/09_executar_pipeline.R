# Etapa 9 - Orquestrador
# Executa o pipeline completo. O projeto e autonomo: nao depende de nada
# fora desta pasta.
#
#   Rscript 04_SCRIPTS_R/09_executar_pipeline.R

script_from_source  <- tryCatch(sys.frame(1)$ofile, error = function(e) NA_character_)
script_from_rscript <- sub("^--file=", "", grep("^--file=", commandArgs(FALSE), value = TRUE)[1])
script_file <- if (!is.na(script_from_source) && nzchar(script_from_source)) script_from_source else script_from_rscript
script_file <- tryCatch(normalizePath(script_file, mustWork = TRUE), error = function(e) NA_character_)
if (is.na(script_file)) stop("Execute com source() ou Rscript.", call. = FALSE)

scripts_dir  <- dirname(script_file)
project_root <- dirname(scripts_dir)

for (etapa in c("01_importar_dados.R", "02_inspecao_inicial.R", "03_limpeza_dados.R",
                "04_transformacao_dados.R", "05_validacao_dados.R",
                "06_analise_exploratoria.R", "07_visualizacoes.R",
                "08_exportar_resultados.R")) {
  source(file.path(scripts_dir, etapa), local = environment())
}

raw       <- importar_dados(project_root)
inspecao  <- inspecionar_dados(raw)
clean     <- limpar_dados(raw)
clean     <- transformar_dados(clean)
validacao <- validar_dados(raw, clean)
ausencias <- tabela_ausencias(clean)
analise   <- analisar_dados(clean)

criar_graficos(clean, analise, project_root)
exportar_resultados(clean, analise, validacao, ausencias, project_root)

cat(sprintf("%s: pipeline concluido (%d linhas, %d colunas, %d duplicados exatos).\n",
            PROJETO, nrow(clean), ncol(clean), inspecao$duplicados))
