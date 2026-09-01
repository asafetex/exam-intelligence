# Implementation Map

This document maps canonical domains to the intended modular-monolith layout. It is a dependency guide, not a requirement to create empty abstractions prematurely.

Batismo 2.0 / Masterclass Neurociência are first-class Learning OS authorities (ADR 0009). Learning Alert & Remediation is a first-class loop (ADR 0011).

## Target package shape

```text
src/exam_intelligence/
├── app.py
├── config.py
├── db.py
│
├── domain/
│   ├── questions.py
│   ├── exams.py
│   ├── scoring.py
│   ├── attempts.py
│   ├── learning.py
│   └── alerts.py              # alert types/severity/lifecycle value objects
│
├── ingestion/
│   ├── contracts.py
│   ├── registry.py
│   ├── quality.py
│   ├── normalize.py
│   ├── identity.py
│   ├── loader.py
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
├── learning/
│   ├── context.py
│   ├── phases.py
│   ├── interventions.py
│   ├── readiness.py
│   ├── routing.py
│   ├── outcomes.py
│   └── protocols.py
│
├── alerts/                    # schema hook M001; behavior M003/M004
│   ├── repository.py          # lifecycle persistence
│   ├── detectors.py           # interpretable versioned detection rules
│   ├── severity.py            # evidence sufficiency / severity policy
│   ├── dedupe.py              # open-alert identity/cooldown
│   ├── remediation.py         # alert → intervention assignment
│   └── resolution.py          # retest / resolve / escalate policy
│
├── memory/
│   ├── items.py
│   └── scheduler.py
│
├── exam_intelligence/         # recurrence/family/Bank DNA later
│
├── decision/
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
web → application/services → domain/persistence

ingestion → staging → canonical loader
assessment → candidate evidence
candidate diagnostics → alert detection
alert + phase/readiness → intervention routing
intervention → retest/outcome
syllabus + exam intelligence + candidate + open alerts + Learning OS → decision
```

Scoring/identity/phase/alert baseline rules must not depend on web templates or mandatory LLM/network calls.

## M001 modules

M001 implements only:
- DB/migrations through schema v4;
- ingestion path;
- structured adapters + one official PDF path;
- assessment session/scoring/attempt persistence;
- basic candidate metrics;
- local Mini-QC;
- minimal `study_context` persistence/read path;
- **alert lifecycle persistence/schema smoke test only** (`learning_alert`, `learning_alert_event`).

M001 does **not** implement automatic alert detection, severity scoring, remediation, retest scheduling, phase inference or Today.

## Post-M001

### M002 — syllabus
Atomic Tree/current edital/question mapping.

### M003 — candidate + alert detection v0
- coverage-aware state;
- error taxonomy;
- confident-wrong;
- time/retention/readiness context;
- deterministic alert candidates;
- evidence sufficiency;
- detector version/evidence snapshot;
- alert dedup/cooldown.

### M004 — Learning OS + remediation lifecycle
- Batismo phase rules;
- D1…Dn;
- Masterclass execution gates;
- versioned intervention registry;
- alert severity;
- content vs execution routing;
- remediation assignment;
- retest/resolution/escalation;
- first weekly/mesocycle closed loop.

### M005+
Retention/FSRS/intervention outcomes, Bank DNA/trap alerts, then Today/Decision.

## Interface rules

- Provider adapters never write directly to canonical tables.
- Web routes orchestrate services rather than implement scoring/identity/learning/alert logic inline.
- Alert detectors receive explicit evidence read models and return versioned decisions; they do not mutate candidate history.
- Alert lifecycle persistence is append-oriented through events.
- Repeated detector runs update an unresolved underlying alert rather than spam duplicates.
- Derived analytics should be recomputable from source evidence when practical.
- Learning/alert recommendations reference rule/intervention versions even when an LLM helps explain them.
- No learning/alert module may make medical/supplement decisions.

## Implementation philosophy

```text
exam evidence
→ candidate evidence
→ diagnosis
→ enough evidence?
→ alert / observe
→ Batismo phase + Masterclass execution gate
→ remediation/intervention
→ delayed/unseen retest
→ resolved or escalated
→ better next decision
```

Do not build infrastructure that cannot improve one of these transitions.
