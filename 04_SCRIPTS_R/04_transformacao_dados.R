# Etapa 4 - Transformacao
# Dataset pequeno (32 observacoes) e integralmente numerico: garante os tipos
# e nao cria variaveis derivadas, para nao inflacionar o numero de preditores
# face ao numero de observacoes.

transformar_dados <- function(clean) {
  for (v in names(clean)) clean[[v]] <- suppressWarnings(as.numeric(clean[[v]]))
  if (anyNA(clean)) stop("Transformacao falhou: valores nao numericos.", call. = FALSE)
  clean
}
