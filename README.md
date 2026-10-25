# Visão Computacional Comida

App Android que reconhece os itens da geladeira por foto e sugere receitas com o que você tem em casa.

> Status: em planejamento (M0). Veja o [Termo de Abertura do Projeto](docs/TAP.md).

## Como funciona

1. Tire uma foto da geladeira ou escolha da galeria
2. O Gemini identifica os ingredientes
3. Você revisa a lista (adiciona, remove, corrige)
4. O app sugere receitas com o que você tem e mostra o que falta

## Stack

| Camada | Tecnologia |
| --- | --- |
| UI | Kotlin, Jetpack Compose, Material 3 |
| Arquitetura | MVVM (ViewModel + StateFlow) |
| IA | Gemini via Firebase AI Logic + App Check |
| Dados locais | Room |
| CI | GitHub Actions |

## Roadmap

| Marco | Entrega | Semana |
| --- | --- | --- |
| M0 | Setup e validação do prompt | 1–2 |
| M1 | Telas com dados falsos | 3–4 |
| M2 | Detecção de ingredientes com IA | 5–6 |
| M3 | Lista editável | 7–8 |
| M4 | Sugestão de receitas | 9–10 |
| M5 | Favoritos | 11–12 |
| M6 | Polimento e v1.0 | 13–16 |

Detalhes e issues de cada marco estão em [docs/TAP.md](docs/TAP.md#9-plano-de-entregas).

## Rodando localmente

> Será preenchido no M0, após a criação do projeto Android.

Pré-requisitos previstos:

- Android Studio (versão estável mais recente)
- JDK 17
- Projeto no Firebase com o app Android registrado
- `google-services.json` em `app/` (não versionado)

## Contribuindo (convenções)

- Branches: `feat/<issue>-descricao`, `fix/<issue>-descricao`
- Commits: [Conventional Commits](https://www.conventionalcommits.org/pt-br/) (`feat:`, `fix:`, `docs:`, `chore:`)
- Toda mudança entra por PR na `main`

## Licença

[MIT](LICENSE)
