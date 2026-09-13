# Etapa 7 - Visualizacoes

criar_graficos <- function(clean, analise, project_root) {
  dir.create(file.path(project_root, "06_GRAFICOS"), FALSE, TRUE)
  grafico <- function(nome) file.path(project_root, "06_GRAFICOS", nome)

  png(grafico("yield_vs_fraction_end_point.png"), 1440, 900, res = 150)
  par(mar = c(5, 5, 4, 2))
  plot(clean$fraction_end_point, clean$percentage_yield, pch = 19, col = "#2874A6",
       xlab = "Fraction end point", ylab = "Rendimento (%)",
       main = "Rendimento versus fraction end point (r = 0,71)")
  abline(lm(percentage_yield ~ fraction_end_point, clean), col = "#C0392B", lwd = 2)
  dev.off()

  y <- analise$yield_correlations
  png(grafico("yield_correlations.png"), 1440, 900, res = 150)
  par(mar = c(5, 13, 4, 2))
  barplot(rev(y$correlation_with_yield), names.arg = rev(y$variable), horiz = TRUE, las = 1,
          col = ifelse(rev(y$correlation_with_yield) < 0, "#C0392B", "#1E8449"),
          xlab = "Correlacao de Pearson com o rendimento",
          main = "Que propriedades acompanham o rendimento")
  abline(v = 0, col = "grey40")
  dev.off()

  png(grafico("predictor_pairs.png"), 1600, 1600, res = 150)
  pairs(clean, pch = 19, cex = 0.7, col = "#2874A6",
        main = "Matriz de dispersao das variaveis de processo")
  dev.off()
}
