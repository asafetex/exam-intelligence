# M001 — Corpus In → First Attempt Out

## Mission

Prove the complete vertical slice from real source ingestion to real candidate telemetry without expanding product scope.

M001 is still the data/assessment foundation. After the Batismo/Masterclass integration decision (ADR 0009), it must also ensure that the first candidate evidence is **Learning-OS-ready** rather than contextless.

## Why M001 comes first

The intelligence layers depend on trustworthy data. Before advanced Atomic Tree, Bank DNA or adaptive recommendations, the project must prove that it can ingest thousands of questions, preserve identity/provenance, execute a question locally and persist a reproducible attempt.

At the same time, we now know the eventual decision engine needs phase/readiness/intervention context. Schema v3 therefore adds minimal hooks; it does **not** implement full Batismo/Masterclass adaptation in M001.

## Scope

### A. Database/migrations
- run ordered migrations programmatically through schema v3;
- verify idempotent startup;
- preserve foreign keys/WAL/busy timeout;
- no destructive rewrite of merged migration history;
- verify `learning_intervention` + `study_context` constraints without building adaptive scheduling yet.

### B. Structured ingestion
Support:
- JSON/JSONL;
- CSV;
- XLSX;
- smart header detection/mapping;
- combined options/delimiter handling;
- preview;
- missing/ambiguous field detection;
- staging-contract validation;
- quarantine ledger.

Acceptance dataset: **≥1,000 structured questions**.

### C. Quest API adapter
- credentials via environment only;
- adapter output conforms to staging contract;
- provider/external IDs/provenance preserved;
- no architecture dependency on Quest API availability.

### D. Official PDF path
Ingest at least one real VUNESP exam PDF and its final answer-key PDF independently.

Requirements:
- preserve original source asset/hash;
- native extraction first, OCR fallback only where needed;
- preserve shared stimulus/media or quarantine incomplete item;
- validate question/key counts;
- answer-key updates are versioned, not destructive.

### E. Identity/load
- normalize canonical question/options;
- version identity algorithm;
- prevent source duplicates and alternate cadernos from inflating recurrence;
- preserve legitimate exact cross-exam recurrence;
- load canonical entities into SQLite.

### F. Mini-QC
Local FastAPI/Jinja/HTMX page:
- one question at a time;
- progress;
- timer;
- answer controls appropriate to type;
- confidence 1–5 committed before feedback;
- submit/next;
- minimal verdict in learn/validate semantics.

### G. Candidate persistence
Persist:
- session;
- ordered session item;
- response/blank/skip status;
- first/final response when supported;
- answer-changed flag;
- time;
- confidence;
- correctness/score;
- key/scoring snapshot;
- timestamps;
- exposure/seen metadata where available.

### H. Minimal Learning OS context hook
For at least one M001 session, prove the system can persist/read an optional `study_context` without requiring the future adaptive engine.

Minimum demo:
- `session_goal`;
- optional Batismo `phase_code` (can be manually supplied/provisional);
- one readiness/context field such as `alertness_1_5`;
- one task-context field such as `task_clarity_1_5` or `perceived_difficulty_1_5`;
- optional intervention reference if a seeded intervention is used;
- next action or completion status.

The normal Mini-QC flow must remain fast. Do not add a long mandatory questionnaire.

### I. First diagnostic
Show at least one basic topic-level result from persisted attempts. This can be descriptive; no advanced mastery model in M001.

## Required tests

- migration from empty DB and rerun idempotence through v3;
- Learning OS context/FK/range constraints;
- staging schema validation;
- CSV/XLSX/JSON mapping cases;
- source duplicate vs cross-exam recurrence fixture;
- alternate option-order/caderno fixture;
- answer-key version fixture;
- quarantine fixture for missing image/stimulus;
- scoring policy fixture;
- end-to-end session persistence;
- one session context persistence/retrieval fixture.

## Explicit non-goals

No:
- automatic Batismo phase inference;
- adaptive readiness scheduler;
- full OQF 30-day engine;
- semantic embeddings;
- semantic question-family clustering;
- Bank Trap DNA;
- full private-course ingestion;
- deep Question Learning Packets;
- FSRS UI;
- adaptive Today queue;
- IRT/TRI;
- auth/React/cloud DB/gamification.

## Definition of done

A developer can clone the repo, install dependencies, import a 1,000+ question corpus plus one official VUNESP exam/key, start the local server, answer a question with timer/confidence, persist a reproducible attempt, optionally attach minimal learning context, and inspect a basic topic result. All ingestion ambiguity is visible in the ledger rather than silently discarded.

The resulting evidence is sufficient to feed future Batismo/Masterclass phase and intervention logic without redesigning the session model.
