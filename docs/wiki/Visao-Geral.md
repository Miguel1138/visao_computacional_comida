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

**Incluído no MVP**

- Tirar foto ou escolher da galeria (1 a 3 fotos)
- Detecção de ingredientes via Gemini, com retorno em JSON
- Lista de ingredientes editável (adicionar, remover, corrigir)
- Filtros simples: tempo de preparo e tipo de refeição
- Sugestão de 3 receitas com ingredientes usados e faltantes
- Salvar receitas favoritas localmente

**Fora do escopo (por enquanto)**

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
