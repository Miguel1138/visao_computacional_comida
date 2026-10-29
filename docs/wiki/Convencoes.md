# Convenções do repositório


Fluxo simples para um dev só: `main` sempre compilando, uma branch por issue e PR para registrar o histórico.

**Estrutura de pastas**

```
/
├── app/                  # Código do app Android
├── docs/
│   ├── TAP.md            # Termo de abertura
│   ├── ERS.md            # Especificação de requisitos
│   ├── prompts/          # Prompts do Gemini versionados
│   └── wiki/             # Páginas publicadas na wiki
├── .github/
│   ├── workflows/        # CI (build e lint)
│   └── ISSUE_TEMPLATE/   # Modelos de issue
└── README.md
```

**Convenções**

| Item | Padrão |
| --- | --- |
| Branches | `feat/<issue>-descricao`, `fix/<issue>-descricao` |
| Commits | Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`) |
| Labels | `feature`, `bug`, `ui`, `ia`, `infra`, `docs` |
| Milestones | M0 a M6, como no [[Roadmap]] |
| Issues | Citam os IDs da ERS (RF-xx, RNF-xx) que entregam |
| Board | GitHub Projects com colunas A fazer, Fazendo, Feito |
| Versões | Tags semânticas (`v0.1.0` por marco, `v1.0.0` no fim) |

**Arquivos que nunca vão para o repo:** `google-services.json` e qualquer chave. Adicione ao `.gitignore`.
