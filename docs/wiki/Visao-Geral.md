# Visão geral

## Identificação

App Android que reconhece os itens da geladeira por foto e sugere receitas com o que há em casa. Projeto pessoal, desenvolvido por uma pessoa.

| Item | Valor |
| --- | --- |
| Nome | A definir (provisório: App de Receitas) |
| Tipo | Projeto pessoal |
| Responsável | Desenvolvedor único (dono do produto e dev) |
| Plataforma | Android nativo |
| Duração estimada | Cerca de 16 semanas para o MVP |
| Repositório | [Miguel1138/visao\_computacional\_comida](https://github.com/Miguel1138/visao_computacional_comida) |


## Justificativa

Decidir o que cozinhar com o que já está em casa toma tempo e leva a desperdício ou a pedir delivery. Listar ingredientes à mão é chato; uma foto resolve em segundos.

O projeto também serve para praticar Jetpack Compose, Firebase com Kotlin e integração com IA multimodal.


## Objetivos

1. Identificar pelo menos 80% dos itens visíveis numa foto da geladeira, medido em 30 fotos de teste.
2. Ir da foto às sugestões de receita em menos de 30 segundos.
3. Sugerir 3 receitas viáveis usando principalmente itens detectados.
4. Publicar o MVP no próprio aparelho (APK de debug) em até 16 semanas.
5. Usar o app pelo menos 3 vezes por semana no primeiro mês.


## Escopo

Escopo do TAP refinado pela ERS de 28/10/2026; detalhes e IDs em [[Requisitos]].

**Incluído no MVP**

- Tirar foto com a câmera do sistema ou escolher da galeria (1 a 3 fotos), descartadas após a detecção
- Detecção de ingredientes via Gemini, com retorno em JSON; itens de baixa confiança só entram após confirmação
- Lista de ingredientes editável (adicionar por texto com sugestões, remover, corrigir)
- Histórico das últimas 5 listas, reabríveis sem nova foto
- Filtros: tempo de preparo, tipo de refeição e dificuldade
- Sugestão de 3 receitas com até 3 faltantes (sal, açúcar, óleo e água não contam) e botão "Gerar outras"
- Salvar receitas favoritas completas, abertas sem internet

**Fora do escopo (por enquanto)**

- CameraX (o MVP usa a câmera do sistema)
- Restrições alimentares nos filtros
- Imagem nas receitas
- Login e sincronização em nuvem
- iOS
- Controle de validade e estoque
- Lista de compras
- Informação nutricional detalhada
- Monetização e publicação na Play Store


## Critérios de sucesso

- [ ] Fluxo foto → lista → receitas funcionando de ponta a ponta no aparelho
- [ ] Detecção acerta 80% dos itens nas fotos de teste
- [ ] Pelo menos 1 receita sugerida preparada de fato por semana
- [ ] README com instruções de build e prints das telas
