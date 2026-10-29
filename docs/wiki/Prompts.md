# Prompts de IA

Os prompts do Gemini ficam versionados em [`docs/prompts/`](https://github.com/Miguel1138/visao_computacional_comida/tree/main/docs/prompts).

| Prompt | Uso | Marco |
| --- | --- | --- |
| [Detecção de ingredientes](https://github.com/Miguel1138/visao_computacional_comida/blob/main/docs/prompts/deteccao-ingredientes.md) | 1 a 3 fotos → `ingredientes[]` com nome, quantidade, categoria e confiança | M0 (teste), M2 (app) |
| Geração de receitas (`docs/prompts/geracao-receitas.md`) | Lista, filtros e títulos já mostrados → exatamente 3 receitas em JSON | M4 (a criar) |

**Regras que o app aplica sobre a resposta**

- Detecção: confiança alta e média entram direto na lista; baixa passa pela confirmação. A quantidade é só informativa.
- Receitas: no máximo 3 faltantes por receita; sal, açúcar, óleo e água não contam. "Gerar outras" envia os títulos já mostrados para não repetir.
- Qualquer resposta fora do schema vira erro com "Tentar de novo".

Fluxo: testar no Google AI Studio, registrar a taxa de acerto no próprio arquivo do prompt (meta da detecção: ≥ 80% em 30 fotos), e só então levar ao app.
