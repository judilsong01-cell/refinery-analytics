# Etapa 6 - Analise exploratoria
# Com 32 observacoes e 4 preditores, a analise fica-se pela estatistica
# descritiva e pela matriz de correlacao. A multicolinearidade entre
# preditores e forte e esta explicitamente quantificada.

analisar_dados <- function(clean) {
  resultado <- list()

  resultado$process_summary <- data.frame(
    variable = names(clean),
    mean     = vapply(clean, mean,   numeric(1)),
    median   = vapply(clean, median, numeric(1)),
    sd       = vapply(clean, sd,     numeric(1)),
    min      = vapply(clean, min,    numeric(1)),
    max      = vapply(clean, max,    numeric(1)),
    row.names = NULL
  )

  co <- cor(clean)
  resultado$correlations <- co

  yc <- data.frame(variable = rownames(co),
                   correlation_with_yield = co[, "percentage_yield"],
                   row.names = NULL)
  yc <- yc[yc$variable != "percentage_yield", ]
  resultado$yield_correlations <- yc[order(-abs(yc$correlation_with_yield)), ]

  # Multicolinearidade: pares de preditores com |r| >= 0.6
  preditores <- setdiff(colnames(co), "percentage_yield")
  pares <- t(combn(preditores, 2))
  mc <- data.frame(variable_a = pares[, 1], variable_b = pares[, 2],
                   correlation = co[pares])
  resultado$predictor_multicollinearity <- mc[order(-abs(mc$correlation)), ]

  resultado
}
