# Etapa 5 - Validacao
# Compara o bruto com o limpo e produz o registo de qualidade dos dados.

validar_dados <- function(raw, clean) {
  if (nrow(clean) != nrow(raw)) {
    stop("Validacao falhou: contagem de linhas alterada.", call. = FALSE)
  }
  data.frame(
    raw_rows             = nrow(raw),
    clean_rows           = nrow(clean),
    columns              = ncol(clean),
    exact_duplicate_rows = sum(duplicated(raw)),
    rows_removed         = 0L,
    missing_cells_raw    = sum(is.na(raw)),
    missing_cells_clean  = sum(is.na(clean))
  )
}

tabela_ausencias <- function(clean) {
  data.frame(
    column      = names(clean),
    missing_n   = vapply(clean, function(x) sum(is.na(x)), integer(1)),
    missing_pct = round(vapply(clean, function(x) mean(is.na(x)) * 100, numeric(1)), 2),
    row.names   = NULL
  )
}
