#!/usr/bin/env bash
# Cria labels, milestones (M0–M6) e issues do plano de entregas (docs/TAP.md) e requisitos em docs/ERS.md.
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
milestone "M0 · Setup e validação"     "Semanas 1 e 2 · Aceite: prompt de detecção com ≥ 80% de acerto em 30 fotos; CI verde"
milestone "M1 · Telas com dados falsos" "Semanas 3 e 4 · Aceite: fluxo navegável com dados falsos"
milestone "M2 · Detecção com IA"        "Semanas 5 e 6 · Aceite: foto real vira lista no aparelho"
milestone "M3 · Lista editável"         "Semanas 7 e 8 · Aceite: várias fotos sem duplicar; confirmação de baixa confiança; erro recuperável"
milestone "M4 · Receitas"               "Semanas 9 e 10 · Aceite: 3 receitas com ≤ 3 faltantes em menos de 30 s"
milestone "M5 · Favoritos e histórico"  "Semanas 11 e 12 · Aceite: favoritas e últimas 5 listas abrem em modo avião"
milestone "M6 · Polimento e v1.0"       "Semanas 13 a 16 · Aceite: critérios de sucesso do TAP atendidos; APK publicado"

echo "==> Issues"
# Usa a API REST (funciona em qualquer ambiente) e pula issues que já existem
EXISTING="$(gh api --paginate "repos/$REPO/issues?state=all&per_page=100" --jq '.[].title')"
issue() {
  local ms="$1" labels="$2" title="$3"
  if grep -qxF "$title" <<<"$EXISTING"; then echo "  [$ms] $title (já existe)"; return; fi
  local num
  num="$(gh api "repos/$REPO/milestones?state=all" --jq ".[] | select(.title == \"$ms\") | .number")"
  local args=(-f title="$title" -f body="Parte do plano de entregas. Requisitos em [docs/ERS.md](https://github.com/$REPO/blob/main/docs/ERS.md)." -F milestone="$num")
  local l; IFS=',' read -ra ls <<<"$labels"; for l in "${ls[@]}"; do args+=(-f "labels[]=$l"); done
  gh api "repos/$REPO/issues" "${args[@]}" >/dev/null
  echo "  [$ms] $title"
}

M="M0 · Setup e validação"
issue "$M" "infra" "Criar projeto Android (Compose, minSdk 26, Kotlin DSL)"
issue "$M" "infra" "Ativar build, lint e testes no GitHub Actions"
issue "$M" "ia"    "Testar prompt de detecção no AI Studio com 30 fotos"

M="M1 · Telas com dados falsos"
issue "$M" "feature,ui" "Tela inicial com galeria, câmera e miniaturas das fotos"
issue "$M" "feature,ui" "Tela de lista de ingredientes"
issue "$M" "feature,ui" "Adicionar item por texto com sugestões, editar e remover"
issue "$M" "feature,ui" "Tela de receitas sugeridas"
issue "$M" "feature,ui" "Tela de detalhe da receita"
issue "$M" "feature,ui" "Navegação entre telas com Navigation Compose"
issue "$M" "ui"         "Tema claro e escuro e textos em pt-BR"
issue "$M" "ui"         "Acessibilidade básica nas telas"

M="M2 · Detecção com IA"
issue "$M" "infra"      "Configurar Firebase e App Check"
issue "$M" "feature"    "Escolher fotos pela galeria e pela câmera do sistema (1 a 3)"
issue "$M" "feature"    "Redimensionar e comprimir fotos antes do envio"
issue "$M" "feature,ia" "Enviar fotos ao Gemini via Firebase AI Logic"
issue "$M" "feature,ia" "Converter a resposta do Gemini em itens da lista"
issue "$M" "feature"    "Descartar as fotos ao fim da detecção"

M="M3 · Lista editável"
issue "$M" "feature,ui" "Confirmar itens de baixa confiança antes de entrarem na lista"
issue "$M" "feature"    "Juntar resultados de várias fotos sem duplicar itens"
issue "$M" "feature,ui" "Agrupar itens da lista por categoria"
issue "$M" "feature,ui" 'Estados de carregamento e erro com "Tentar de novo"'

M="M4 · Receitas"
issue "$M" "feature,ia" "Prompt de geração de receitas com schema JSON"
issue "$M" "feature,ui" "Filtros de tempo, tipo de refeição e dificuldade"
issue "$M" "feature,ui" "Limitar a 3 faltantes e destacá-los"
issue "$M" "feature,ui" 'Botão "Gerar outras" sem repetir receitas'
issue "$M" "infra"      "Medir o tempo da foto às receitas (< 30 s)"

M="M5 · Favoritos e histórico"
issue "$M" "infra"      "Configurar Room com favoritas e histórico"
issue "$M" "feature"    "Favoritar e desfavoritar receitas"
issue "$M" "feature,ui" "Tela de favoritas"
issue "$M" "feature"    "Salvar automaticamente as últimas 5 listas"
issue "$M" "feature,ui" "Tela de histórico: reabrir e apagar listas"

M="M6 · Polimento e v1.0"
issue "$M" "ui"      "Revisar UX e textos"
issue "$M" "infra"   "Testes de unidade nos ViewModels, no parse e no redimensionamento"
issue "$M" "ui"      "Ícone e tela de abertura"
issue "$M" "infra"   "Gerar release v1.0 com APK no GitHub"

echo "Pronto."
