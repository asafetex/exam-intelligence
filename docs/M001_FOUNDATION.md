# M001 — Corpus In → First Attempt Out

## Mission

Prove the complete vertical slice from real source ingestion to real candidate telemetry without expanding product scope.

M001 is still the data/assessment foundation. It must ensure the first candidate evidence is **Learning-OS-ready and Alert-Engine-ready** rather than contextless.

## Why M001 comes first

Before advanced Atomic Tree, Bank DNA, adaptive recommendations or automatic remediation, the project must prove that it can ingest thousands of questions, preserve identity/provenance, execute a question locally and persist reproducible evidence.

We already know future decisions depend on phase/readiness/intervention context and on a closed alert→remediation→retest lifecycle. Schema v4 therefore adds minimal hooks; M001 does **not** implement automatic alert detection or remediation.

## Scope

### A. Database/migrations
- run ordered migrations programmatically through schema v4;
- verify idempotent startup;
- preserve foreign keys/WAL/busy timeout;
- no destructive rewrite of merged migration history;
- verify `learning_intervention`, `study_context`, `learning_alert` and `learning_alert_event` constraints/FKs.

### B. Structured ingestion
Support JSON/JSONL, CSV and XLSX with smart mapping, preview, validation and quarantine.

Acceptance dataset: **≥1,000 structured questions**.

### C. Quest API adapter
- credentials via environment only;
- adapter output conforms to staging contract;
- provider/external IDs/provenance preserved;
- no architecture dependency on Quest API availability.

### D. Official PDF path
Ingest at least one real VUNESP exam PDF and its final answer-key PDF independently.

Requirements:
- immutable source/hash;
- native extraction first, OCR fallback only where needed;
- preserve shared stimulus/media or quarantine incomplete item;
- validate question/key counts;
- answer-key updates versioned, not destructive.

### E. Identity/load
- normalize canonical question/options;
- version identity algorithm;
- prevent source duplicates and alternate cadernos from inflating recurrence;
- preserve legitimate exact cross-exam recurrence;
- load canonical entities into SQLite.

### F. Mini-QC
Local FastAPI/Jinja/HTMX page with:
- one question at a time;
- progress;
- timer;
- answer controls appropriate to type;
- confidence 1–5 committed before feedback;
- submit/next;
- minimal learn/validate semantics.

### G. Candidate persistence
Persist session/item, response/blank/skip, first/final response where supported, answer-change state, time, confidence, correctness/score, key/scoring snapshot, timestamps and exposure metadata where available.

### H. Minimal Learning OS context hook
For at least one session, persist/read optional `study_context` with:
- session goal;
- optional/provisional Batismo phase;
- one readiness/context field;
- one task-context field;
- completion/next action;
- optional intervention reference.

Do not add a long mandatory questionnaire.

### I. Alert Engine schema hook
Prove the alert lifecycle storage can be created and read without implementing the detector.

Synthetic test/demo only:
- create one `learning_alert` linked to a taxonomy node when available or without node during schema test;
- append at least `detected` and one subsequent lifecycle event;
- validate severity/status constraints and intervention/session/attempt FKs where used.

No user-facing alert detector is required in M001.

### J. First diagnostic
Show at least one basic topic-level result from persisted attempts. Descriptive only; no advanced mastery/alert model in M001.

## Required tests

- migrations through v4 + idempotence;
- Learning OS context constraints/FKs;
- Learning Alert lifecycle constraints/FKs;
- staging schema validation;
- CSV/XLSX/JSON mapping cases;
- source duplicate vs cross-exam recurrence fixture;
- alternate option-order/caderno fixture;
- answer-key version fixture;
- quarantine fixture for missing image/stimulus;
- scoring fixture;
- end-to-end session persistence;
- session context persistence/retrieval.

## Explicit non-goals

No:
- automatic alert detection/severity calculation;
- alert-driven D1 reprioritization;
- remediation assignment/retest scheduler;
- automatic Batismo phase inference;
- adaptive readiness scheduler;
- full OQF engine;
- semantic family clustering;
- Bank Trap DNA;
- FSRS UI;
- adaptive Today;
- IRT/TRI;
- auth/React/cloud DB/gamification.

## Definition of done

A developer can clone the repo, install dependencies, import a 1,000+ question corpus plus one official VUNESP exam/key, run Mini-QC, persist a reproducible attempt, attach minimal optional study context, validate the alert-lifecycle schema hook, and inspect a basic topic result.

The resulting evidence can later feed Candidate Intelligence → Learning Alert Engine → Intervention → Retest without destructive redesign.
