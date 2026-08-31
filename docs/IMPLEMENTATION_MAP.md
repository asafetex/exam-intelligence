# Implementation Map

This document maps canonical domains to an intended modular-monolith code layout. It is a dependency guide, not a requirement to create empty abstractions prematurely.

## Target package shape

```text
src/exam_intelligence/
├── app.py                     # FastAPI composition root
├── config.py                  # environment/local paths
├── db.py                      # connection + migration bootstrap
│
├── domain/                    # pure domain types/rules where useful
│   ├── questions.py
│   ├── exams.py
│   ├── scoring.py
│   └── attempts.py
│
├── ingestion/
│   ├── contracts.py           # staging schema-facing types
│   ├── registry.py            # source/import ledger
│   ├── quality.py             # quality gates/quarantine
│   ├── normalize.py           # canonical normalization
│   ├── identity.py            # versioned hashes/identity
│   ├── loader.py              # staging → canonical DB
│   └── adapters/
│       ├── json_adapter.py
│       ├── csv_adapter.py
│       ├── xlsx_adapter.py
│       ├── quest_api.py
│       └── pdf_exam.py
│
├── assessment/
│   ├── sessions.py
│   ├── selection.py
│   ├── scoring.py
│   └── attempts.py
│
├── candidate/
│   ├── metrics.py
│   └── diagnostics.py
│
├── syllabus/                  # M002+
├── learning/                  # M005+
├── memory/                    # M006+
├── decision/                  # M007+
│
└── web/
    ├── routes/
    ├── templates/
    └── static/
```

Do not create all modules in M001 just to match the diagram. Create boundaries as functionality arrives.

## Dependency direction

```text
web → application/services → domain/persistence ports
ingestion adapters → staging contract → canonical loader
candidate metrics → persisted evidence
later decision → exam + candidate + learning read models
```

The deterministic scoring/identity core must not depend on web templates or LLM services.

## M001 modules

M001 should need only:
- DB/migration bootstrap;
- ingestion contracts/registry/quality/normalization/identity/loader;
- structured adapters + one official PDF path;
- assessment session/scoring/attempt services;
- candidate basic metrics;
- local web routes/templates.

Everything else remains a documented extension point.

## Interface rules

- Provider adapters never write directly to canonical DB tables.
- Web routes should orchestrate services rather than implement identity/scoring logic inline.
- Derived analytics should be recomputable from source evidence when practical.
- LLM/model-assisted code belongs behind explicit interfaces with provenance/version metadata.
