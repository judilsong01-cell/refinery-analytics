# Etapa 2 - Inspecao inicial
# Mede dimensoes, valores em falta e duplicados antes de qualquer limpeza.

inspecionar_dados <- function(raw) {
  list(
    linhas     = nrow(raw),
    colunas    = ncol(raw),
    duplicados = sum(duplicated(raw)),
    em_falta   = sum(is.na(raw)),
    tipos      = vapply(raw, function(x) class(x)[1], character(1))
  )
}
