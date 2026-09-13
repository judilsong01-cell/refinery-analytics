# Rendimento de Destilação numa Refinaria | Análise em R

Análise reproduzível de **32 lotes de destilação de petróleo bruto**, relacionando quatro
propriedades físico-químicas do crude com o rendimento em gasolina obtido.

É deliberadamente o projeto mais pequeno do portefólio, e o mais focado numa questão:
**o que se pode e o que não se pode concluir com 32 observações.**

**Stack:** R 4.5.2 · apenas R base · sem dependências externas

---

## Resultado principal

> **O fraction end point é o que mais acompanha o rendimento (r = +0,71).** É a temperatura à qual
> a destilação termina — quanto mais alto, mais fração é recolhida.

![Rendimento versus fraction end point](06_GRAFICOS/yield_vs_fraction_end_point.png)

| Variável | Correlação com o rendimento |
|---|---:|
| Fraction end point | **+0,712** |
| Vapour pressure | +0,384 |
| 10% distillation point | −0,315 |
| Gravity | +0,246 |

![Correlações com o rendimento](06_GRAFICOS/yield_correlations.png)

**Estatística descritiva das variáveis de processo:**

| Variável | Média | Mediana | Desvio-padrão | Mín | Máx |
|---|---:|---:|---:|---:|---:|
| Rendimento (%) | 19,66 | 17,80 | 10,72 | 2,8 | 45,7 |
| Gravity | 39,25 | 40,00 | 5,64 | 31,8 | 50,8 |
| Vapour pressure | 4,18 | 4,80 | 2,62 | 0,2 | 8,6 |
| 10% distillation point | 241,5 | 231,0 | 37,54 | 190 | 316 |
| Fraction end point | 332,1 | 349,0 | 69,76 | 205 | 444 |

O rendimento varia entre 2,8% e 45,7% — uma amplitude de 16× — o que confirma que há de facto
sinal a explicar nestes dados.

## O verdadeiro tema: os preditores não são independentes

> **Vapour pressure e 10% distillation point têm uma correlação de −0,91.**
> Não são duas variáveis, são praticamente a mesma informação em escalas diferentes.

| Par de preditores | Correlação |
|---|---:|
| Vapour pressure × 10% distillation point | **−0,906** |
| Gravity × 10% distillation point | −0,700 |
| Gravity × Vapour pressure | **+0,621** |
| 10% distillation point × Fraction end point | +0,412 |
| Gravity × Fraction end point | −0,322 |
| Vapour pressure × Fraction end point | −0,298 |

![Matriz de dispersão](06_GRAFICOS/predictor_pairs.png)

Três dos quatro preditores estão fortemente ligados entre si. Num modelo de regressão múltipla
esta multicolinearidade tornaria os coeficientes instáveis e sem interpretação individual fiável:
a variável que aparecesse como "significativa" dependeria em boa medida da ordem em que fossem
introduzidas. Com **32 observações para 4 preditores**, o problema agrava-se — a amostra não tem
graus de liberdade para separar efeitos tão sobrepostos.

Por isso este projeto reporta correlações simples e estatística descritiva, e **não ajusta um
modelo múltiplo**. Chamar-lhe uma limitação seria enganador: reconhecer o que a amostra não
suporta é o próprio resultado.

## Método

1. **Importação** — CSV original lido de `01_DADOS_BRUTOS`, sem alteração.
2. **Inspeção** — dimensões, valores em falta e duplicados exatos medidos antes da limpeza.
3. **Limpeza** — nomes normalizados para *snake_case*.
4. **Transformação** — conversão de tipos, com falha explícita se algum valor não for numérico.
   **Não são criadas variáveis derivadas**, precisamente para não aumentar o número de preditores
   face a uma amostra de 32 observações.
5. **Validação** — registo de qualidade em `07_TABELAS/validacao_limpeza.csv`.
6. **Análise, gráficos e exportação** — incluindo a tabela explícita de multicolinearidade entre
   preditores, em `07_TABELAS/predictor_multicollinearity.csv`.

**Qualidade dos dados:** 32 linhas → 32 linhas · 0 valores em falta · 0 duplicados exatos ·
0 linhas removidas.

## Reproduzir

```bash
Rscript 04_SCRIPTS_R/09_executar_pipeline.R
```

## Estrutura

```
01_DADOS_BRUTOS/    CSV original, imutável
03_DADOS_LIMPOS/    dados tratados, gerados pelo pipeline
04_SCRIPTS_R/       9 etapas, uma por ficheiro
05_NOTEBOOKS/       notebook R Markdown para Kaggle
06_GRAFICOS/        gráficos PNG
07_TABELAS/         tabelas de resultados em CSV
09_DOCUMENTACAO/    dicionário de dados e dependências
```

## Limitações

Trinta e duas observações são poucas para qualquer conclusão robusta: com esta dimensão, o
intervalo de confiança de uma correlação de 0,71 vai grosso modo de 0,48 a 0,85, e uma correlação
de 0,25 não é distinguível de zero. Os lotes provêm de dez crudes diferentes, o que introduz
estrutura de grupo que esta análise não modela. Nada aqui é causal: o fraction end point é uma
condição de operação escolhida pelo operador, e pode estar a ser escolhido em função de
características do crude que não constam do dataset.

## Dados

Dataset clássico de destilação de petróleo bruto (Prater, 1956), amplamente republicado em
manuais de regressão e disponível no Kaggle. O CSV original está em `01_DADOS_BRUTOS` sem
alterações.

## Licença

Código sob licença MIT (ver `LICENSE`). O dataset mantém os termos da fonte original.
