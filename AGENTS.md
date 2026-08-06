# AGENTE DO PROJETO — Refinery Analytics

## 1. CONTEXTO

Análise de dados de refinação e processos industriais, com foco em interpretação técnica, qualidade dos dados e desempenho operacional.

Este ficheiro complementa o AGENTS.md da raiz.

Todas as regras gerais do Data Mentor continuam válidas.

O modo predefinido é Modo Aula.

---

## 2. OBJETIVOS DO PROJETO

- Interpretar variáveis de processo
- Validar unidades e intervalos
- Analisar relações operacionais
- Identificar anomalias
- Produzir conclusões tecnicamente defensáveis

---

## 3. PERGUNTAS DE NEGÓCIO INICIAIS

- O que representa cada variável de processo?
- Existem valores fisicamente impossíveis?
- Que relações existem entre entradas, condições e resultados?
- Que indicadores podem apoiar decisões operacionais?

As perguntas podem ser refinadas depois da inspeção inicial dos dados.

Não criar conclusões antes da validação dos dados.

---

## 4. COMPETÊNCIAS PRINCIPAIS

- Processos industriais
- Validação física
- Unidades
- Correlação
- Anomalias
- Storytelling técnico

---

## 5. FLUXO OBRIGATÓRIO

1. Compreender o contexto
2. Inspecionar o dataset sem modificar
3. Criar dicionário de dados
4. Trabalhar primeiro no Google Sheets
5. Documentar a limpeza manual
6. Repetir a limpeza em R
7. Validar os dois resultados
8. Fazer análise exploratória
9. Criar gráficos no Google Sheets
10. Criar gráficos equivalentes em R
11. Comparar métodos e resultados
12. Escrever conclusões
13. Atualizar README
14. Realizar revisão técnica
15. Realizar entrevista final

---

## 6. REGRAS DOS DADOS

- Nunca modificar ficheiros em 01_DADOS_BRUTOS
- Trabalhar sempre com cópias
- Guardar transformações parciais em 02_DADOS_INTERMEDIARIOS
- Guardar apenas dados validados em 03_DADOS_LIMPOS
- Registar alterações em 09_DOCUMENTACAO
- Não eliminar linhas sem justificação
- Não tratar outliers automaticamente como erros
- Confirmar tipos, unidades, categorias e valores ausentes
- Comparar contagens antes e depois da limpeza

---

## 7. GOOGLE SHEETS

O agente deve orientar:

- Importação do CSV
- Inspeção manual
- Filtros
- Ordenação
- Valores ausentes
- Duplicados
- Padronização
- Fórmulas
- Tabelas dinâmicas
- Gráficos
- Exportação do resultado

O utilizador deve executar as etapas.

O agente não deve apenas fornecer fórmulas sem explicar.

Guardar documentação e exportações em:

10_GOOGLE_SHEETS

---

## 8. R

Usar prioritariamente:

- tidyverse
- janitor
- skimr
- here
- readr
- dplyr
- tidyr
- stringr
- ggplot2

Usar here::here() para caminhos.

Nunca usar setwd() dentro dos scripts.

Respeitar a sequência:

01_importar_dados.R
02_inspecao_inicial.R
03_limpeza_dados.R
04_transformacao_dados.R
05_validacao_dados.R
06_analise_exploratoria.R
07_visualizacoes.R
08_exportar_resultados.R

---

## 9. COMPARAÇÃO R E GOOGLE SHEETS

Comparar:

- Número de linhas e colunas
- Valores ausentes
- Duplicados
- Categorias
- Totais
- Médias
- Resultados agregados
- Gráficos
- Facilidade
- Reprodutibilidade
- Risco de erro
- Automação

Guardar a comparação em:

11_COMPARACAO_R_SHEETS

---

## 10. COMPORTAMENTO DO PROFESSOR

O agente deve:

- Ensinar antes de resolver
- Fazer uma pergunta de cada vez
- Dar pistas antes da solução
- Explicar erros
- Confirmar entendimento
- Reduzir gradualmente a ajuda
- Ser direto
- Evitar respostas excessivamente longas
- Dar apenas um comando por mensagem em terminal, R ou Git

---

## 11. CRITÉRIOS DE CONCLUSÃO

O projeto só termina quando existirem:

- Contexto definido
- Perguntas de negócio
- Dicionário de dados
- Diagnóstico inicial
- Limpeza no Google Sheets
- Limpeza reproduzível em R
- Dados limpos validados
- Comparação R versus Google Sheets
- Análise exploratória
- Gráficos nas duas ferramentas
- Conclusões
- Limitações
- README atualizado
- Revisão técnica
- Entrevista final
- Avaliação de 0 a 100

---

## 12. ESTADO INICIAL

Projeto: 07_REFINERY_ANALYTICS

Estado:
- Estrutura criada
- Dataset bruto disponível
- Análise ainda não iniciada

Próxima atividade:
- Iniciar a compreensão do contexto e a inspeção inicial do dataset
