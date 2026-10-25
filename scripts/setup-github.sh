#!/usr/bin/env bash
# Cria labels, milestones (M0–M6) e issues do plano de entregas (docs/TAP.md).
# Requer GitHub CLI autenticado: gh auth login
# Uso: ./scripts/setup-github.sh   (rodar uma vez, na raiz do repositório)
set -euo pipefail

REPO="${REPO:-Miguel1138/visao_computacional_comida}"

echo "==> Labels"
label() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force >/dev/null; echo "  $1"; }
label feature "1f883d" "Nova funcionalidade"
label bug     "d73a4a" "Algo não funciona"
label ui      "a2eeef" "Telas e Compose"
label ia      "8250df" "Gemini, prompts e detecção"
label infra   "6e7781" "Build, CI, Firebase"
label docs    "0075ca" "Documentação"

echo "==> Milestones"
milestone() {
  if gh api "repos/$REPO/milestones?state=all" --jq '.[].title' | grep -qxF "$1"; then
    echo "  $1 (já existe)"
  else
    gh api "repos/$REPO/milestones" -f title="$1" -f description="$2" >/dev/null
    echo "  $1"
  fi
}
milestone "M0 · Setup e validação"     "Semana 1"
milestone "M1 · Telas com dados falsos" "Semanas 1 e 2"
milestone "M2 · Detecção com IA"        "Semana 3"
milestone "M3 · Lista editável"         "Semana 4"
milestone "M4 · Receitas"               "Semana 5"
milestone "M5 · Favoritos"              "Semana 6"
milestone "M6 · Polimento e v1.0"       "Semanas 7 e 8"

echo "==> Issues"
issue() {
  local ms="$1" labels="$2" title="$3"
  gh issue create --repo "$REPO" --milestone "$ms" --label "$labels" \
    --title "$title" --body "Parte do plano de entregas em [docs/TAP.md](https://github.com/$REPO/blob/main/docs/TAP.md)." >/dev/null
  echo "  [$ms] $title"
}

M="M0 · Setup e validação"
issue "$M" "infra" "Criar projeto Android (Compose, minSdk 26, Kotlin DSL)"
issue "$M" "infra" "Ativar build, lint e testes no GitHub Actions"
issue "$M" "ia"    "Testar prompt de detecção no AI Studio com 30 fotos"

M="M1 · Telas com dados falsos"
issue "$M" "feature,ui" "Tela inicial com botão de foto"
issue "$M" "feature,ui" "Tela de lista de ingredientes"
issue "$M" "feature,ui" "Tela de receitas sugeridas"
issue "$M" "feature,ui" "Tela de detalhe da receita"
issue "$M" "feature,ui" "Navegação entre telas com Navigation Compose"

M="M2 · Detecção com IA"
issue "$M" "infra"      "Configurar Firebase e App Check"
issue "$M" "feature"    "Integrar Photo Picker"
issue "$M" "feature,ia" "Enviar foto ao Gemini via Firebase AI Logic"
issue "$M" "feature,ia" "Definir schema JSON dos ingredientes e fazer o parse"

M="M3 · Lista editável"
issue "$M" "feature,ui" "Adicionar, remover e editar ingredientes"
issue "$M" "feature"    "Juntar resultados de várias fotos sem duplicar itens"
issue "$M" "feature,ui" "Estados de carregamento e erro"

M="M4 · Receitas"
issue "$M" "feature,ia" "Prompt de geração de receitas com schema JSON"
issue "$M" "feature,ui" "Filtros de tempo e tipo de refeição"
issue "$M" "feature,ui" "Destacar ingredientes faltantes"

M="M5 · Favoritos"
issue "$M" "infra"      "Configurar Room"
issue "$M" "feature"    "Salvar e remover favoritas"
issue "$M" "feature,ui" "Tela de favoritas"

M="M6 · Polimento e v1.0"
issue "$M" "ui"      "Revisar UX e textos"
issue "$M" "infra"   "Testes de unidade nos ViewModels e no parse"
issue "$M" "ui"      "Ícone e tela de abertura"
issue "$M" "infra"   "Gerar release v1.0 com APK no GitHub"

echo "Pronto."
