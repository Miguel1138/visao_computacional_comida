# Riscos e premissas

## Premissas e restrições

**Premissas**

- A cota gratuita do Gemini basta para uso pessoal, com as imagens reduzidas antes do envio
- Fotos com boa iluminação dão detecção aceitável
- A edição manual da lista compensa os erros do modelo

**Restrições**

- Android 8.0+ (minSdk 26), Kotlin, Jetpack Compose e Material 3
- Um desenvolvedor, cerca de 3 h por semana
- Orçamento próximo de zero
- Requer internet para detectar e gerar receitas (favoritas e histórico funcionam offline)
- Curva de aprendizado de Compose no início


## Riscos

| Risco | Impacto | Mitigação |
| --- | --- | --- |
| Detecção erra itens em potes ou embalagens | Alto | Confirmação dos itens de baixa confiança; lista editável; testar prompts no AI Studio antes |
| Receitas inventadas ou inviáveis | Médio | Prompt com regras claras; saída em schema JSON; até 3 faltantes; botão "Gerar outras" |
| Resposta da IA fora do schema | Médio | Tratada como erro recuperável, sem crash; testes de unidade do parse |
| Perder ritmo e abandonar o projeto | Alto | Entregas pequenas e semanais; MVP enxuto |
| Estouro da cota gratuita | Baixo | Fotos reduzidas (≤ 1024 px, JPEG) antes do envio |
| Mudança de preço ou limite da API | Baixo | Camada de repositório isolando a IA |
| Fotos ficarem guardadas no aparelho | Baixo | Descarte ao fim da detecção, com sucesso ou erro |
| Compose demora a engrenar | Médio | Etapa 1 só com telas e dados falsos |
