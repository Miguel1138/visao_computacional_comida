# Riscos e premissas

## Premissas e restrições

**Premissas**

- O plano gratuito do Gemini basta para uso pessoal
- Fotos com boa iluminação dão detecção aceitável
- A edição manual da lista compensa os erros do modelo

**Restrições**

- Um desenvolvedor, em tempo parcial
- Orçamento próximo de zero
- Requer internet para detectar e gerar receitas
- Curva de aprendizado de Compose no início


## Riscos

| Risco | Impacto | Mitigação |
| --- | --- | --- |
| Detecção erra itens em potes ou embalagens | Alto | Lista editável; testar prompts no AI Studio antes |
| Receitas inventadas ou inviáveis | Médio | Prompt com regras claras; saída em schema JSON |
| Perder ritmo e abandonar o projeto | Alto | Entregas pequenas e semanais; MVP enxuto |
| Mudança de preço ou limite da API | Baixo | Camada de repositório isolando a IA |
| Compose demora a engrenar | Médio | Etapa 1 só com telas e dados falsos |
