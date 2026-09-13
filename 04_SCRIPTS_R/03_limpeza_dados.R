# Etapa 3 - Limpeza
# Normaliza nomes de colunas para snake_case e converte marcadores textuais
# de ausencia ("", "NA", "unknown", ...) em NA verdadeiro.
# Nenhuma linha e removida nesta etapa: duplicados exatos sao quantificados,
# nao eliminados, porque nao existe identificador que prove erro de registo.

normalizar_nomes <- function(x) {
  x <- gsub("([a-z0-9])([A-Z])", "\\1_\\2", x, perl = TRUE)
  x <- tolower(iconv(x, to = "ASCII//TRANSLIT"))
  gsub("(^_|_$)", "", gsub("[^a-z0-9]+", "_", x))
}

normalizar_ausencias <- function(x) {
  if (!is.character(x)) return(x)
  x <- trimws(enc2utf8(x))
  x[tolower(x) %in% c("", "na", "n/a", "null", "unknown")] <- NA_character_
  x
}

limpar_dados <- function(raw) {
  clean <- raw
  names(clean) <- normalizar_nomes(names(clean))
  clean[] <- lapply(clean, normalizar_ausencias)
  clean
}
