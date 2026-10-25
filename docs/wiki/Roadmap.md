# Roadmap


Sete marcos levam à v1.0 em cerca de 16 semanas, a 3 h por semana. Cada marco é um [milestone](https://github.com/Miguel1138/visao_computacional_comida/milestones) e cada item, uma [issue](https://github.com/Miguel1138/visao_computacional_comida/issues).

```mermaid
flowchart LR
  M0[M0 · Setup<br/>sem. 1–2] --> M1[M1 · Telas<br/>sem. 3–4] --> M2[M2 · Detecção IA<br/>sem. 5–6] --> M3[M3 · Lista<br/>sem. 7–8] --> M4[M4 · Receitas<br/>sem. 9–10] --> M5[M5 · Favoritos<br/>sem. 11–12] --> M6[M6 · Polimento<br/>sem. 13–16] --> V{{v1.0}}
```

M2 é o marco de maior risco: é quando a detecção real substitui os dados falsos.

### M0 · Setup e validação (semanas 1 e 2)

- [ ] Criar repositório com README, licença e .gitignore do Android
- [ ] Criar projeto Android (Compose, minSdk 26, Kotlin DSL)
- [ ] Configurar GitHub Actions com build e lint
- [ ] Testar o prompt de detecção no Google AI Studio com 30 fotos

### M1 · Telas com dados falsos (semanas 3 e 4)

- [ ] Tela inicial com botão de foto
- [ ] Tela de lista de ingredientes
- [ ] Tela de receitas sugeridas
- [ ] Tela de detalhe da receita
- [ ] Navegação entre telas com Navigation Compose

### M2 · Detecção com IA (semanas 5 e 6)

- [ ] Configurar Firebase e App Check
- [ ] Integrar Photo Picker
- [ ] Enviar foto ao Gemini via Firebase AI Logic
- [ ] Definir schema JSON dos ingredientes e fazer o parse

### M3 · Lista editável (semanas 7 e 8)

- [ ] Adicionar, remover e editar ingredientes
- [ ] Juntar resultados de várias fotos sem duplicar itens
- [ ] Estados de carregamento e erro

### M4 · Receitas (semanas 9 e 10)

- [ ] Prompt de geração de receitas com schema JSON
- [ ] Filtros de tempo e tipo de refeição
- [ ] Destacar ingredientes faltantes

### M5 · Favoritos (semanas 11 e 12)

- [ ] Configurar Room
- [ ] Salvar e remover favoritas
- [ ] Tela de favoritas

### M6 · Polimento e v1.0 (semanas 13 a 16)

- [ ] Revisar UX e textos
- [ ] Testes de unidade nos ViewModels e no parse
- [ ] Ícone e tela de abertura
- [ ] Gerar release v1.0 com APK no GitHub
