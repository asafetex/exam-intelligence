# Implementation Map

This document maps canonical domains to an intended modular-monolith code layout. It is a dependency guide, not a requirement to create empty abstractions prematurely.

Batismo 2.0 / Masterclass Neurociência are now first-class Learning OS authorities (ADR 0009). Therefore the `learning/` boundary is no longer a distant M005-only concern, although full adaptive behavior remains post-M001.

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
│   ├── attempts.py
│   └── learning.py            # phase/intervention value objects when needed
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
│   ├── tree.py
│   ├── syllabus.py
│   └── mapping.py
│
├── learning/                  # starts minimally in M001/M003; grows post-foundation
│   ├── context.py             # study_context persistence/read models
│   ├── phases.py              # Batismo phase rules (post-M001)
│   ├── interventions.py       # versioned technique registry
│   ├── readiness.py           # non-clinical execution gates
│   ├── routing.py             # diagnosis → intervention
│   ├── outcomes.py            # delayed/transfer intervention evidence
│   └── protocols.py           # OQF/mesocycle/review orchestration later
│
├── memory/                    # later FSRS integration
│   ├── items.py
│   └── scheduler.py
│
├── exam_intelligence/         # recurrence/family/Bank DNA analytics later
│
├── decision/                  # Today / prioritization after prerequisite evidence exists
│   ├── priority.py
│   ├── today.py
│   └── explain.py
│
└── web/
    ├── routes/
    ├── templates/
    └── static/
```

Do not create all modules merely to match the diagram. Create boundaries when behavior arrives.

## Dependency direction

```text
web → application/services → domain/persistence ports

ingestion adapters → staging contract → canonical loader
assessment → candidate evidence
candidate diagnostics → learning routing
syllabus + exam intelligence + candidate state + Learning OS → decision
learning outcomes → candidate/decision evidence
```

The deterministic scoring/identity/phase-rule core must not depend on web templates or LLM services.

## M001 modules

M001 still implements only the minimum vertical slice:
- DB/migration bootstrap through schema v3;
- ingestion contracts/registry/quality/normalization/identity/loader;
- structured adapters + one official PDF path;
- assessment session/scoring/attempt services;
- candidate basic metrics;
- local web routes/templates;
- **minimal `study_context` persistence/read path** so first evidence is Learning-OS-ready.

M001 explicitly does **not** implement:
- automatic Batismo phase inference;
- readiness-based scheduling;
- intervention routing;
- OQF orchestration;
- adaptive Today.

## Near-term post-M001 boundaries

### M002 — syllabus
Implement Atomic Tree/current edital and question mapping.

### M003 — candidate + learning telemetry
Implement:
- coverage-aware candidate state;
- error taxonomy;
- confident-wrong;
- study context capture;
- phase snapshot plumbing;
- delayed-validation event model.

### M004 — Learning OS v1
Implement:
- Batismo phase rules;
- D1…Dn ranking inputs;
- seeded/versioned intervention registry derived from recovered canon;
- Masterclass readiness/task-difficulty gates;
- diagnosis → intervention routing;
- first weekly/mesocycle review.

### Later
Add FSRS/memory, deeper question learning packets, semantic families/Bank DNA, then Today/Decision as enough evidence exists.

## Knowledge implementation boundary

Private paid transcripts/videos are not application dependencies. The runtime consumes reviewed derived artifacts:
- intervention definitions;
- phase rules;
- evidence/claim references;
- protocol versions.

The private source corpus is used for provenance/audit, not bundled into the public runtime.

## Interface rules

- Provider adapters never write directly to canonical DB tables.
- Web routes orchestrate services rather than implement identity/scoring/learning logic inline.
- Derived analytics should be recomputable from source evidence when practical.
- Learning recommendations must reference a deterministic rule/intervention version even when an LLM helps explain them.
- LLM/model-assisted code belongs behind explicit interfaces with provenance/version metadata.
- No learning module may make medical/supplement decisions from telemetry.

## Implementation philosophy

The codebase should make this path progressively executable:

```text
exam evidence
→ candidate evidence
→ Batismo phase
→ Masterclass execution gate
→ diagnosed intervention
→ active study
→ delayed validation
→ better next decision
```

Do not build infrastructure that cannot improve one of these transitions.
