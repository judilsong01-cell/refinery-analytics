# Etapa 8 - Exportacao
# Escreve os dados limpos em 03_DADOS_LIMPOS e todas as tabelas em 07_TABELAS.

exportar_resultados <- function(clean, analise, validacao, ausencias, project_root) {
  dir.create(file.path(project_root, "03_DADOS_LIMPOS"), FALSE, TRUE)
  dir.create(file.path(project_root, "07_TABELAS"), FALSE, TRUE)

  write.csv(clean, file.path(project_root, "03_DADOS_LIMPOS", FICHEIRO_LIMPO),
            row.names = FALSE, na = "")
  write.csv(validacao, file.path(project_root, "07_TABELAS", "validacao_limpeza.csv"),
            row.names = FALSE)
  write.csv(ausencias, file.path(project_root, "07_TABELAS", "missingness_por_coluna.csv"),
            row.names = FALSE)

  for (nome in names(analise)) {
    write.csv(analise[[nome]], file.path(project_root, "07_TABELAS", paste0(nome, ".csv")),
              row.names = identical(nome, "correlations"))
  }
  message(sprintf("Exportadas %d tabelas.", length(analise) + 2L))
}
