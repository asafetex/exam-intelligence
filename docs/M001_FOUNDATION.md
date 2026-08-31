# M001 — Corpus In → First Attempt Out

## Mission

Prove the complete vertical slice from real source ingestion to real candidate telemetry without expanding product scope.

## Why M001 comes first

The intelligence layers depend on trustworthy data. Before Atomic Tree sophistication, Bank DNA or learning recommendations, the project must prove that it can ingest thousands of questions, preserve identity/provenance, execute a question locally and persist a reproducible attempt.

## Scope

### A. Database/migrations
- run ordered migrations programmatically;
- verify idempotent startup;
- preserve foreign keys/WAL/busy timeout;
- no destructive rewrite of merged migration history.

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
- time;
- confidence;
- correctness/score;
- key/scoring snapshot;
- timestamps;
- exposure/seen metadata where available.

### H. First diagnostic
Show at least one basic topic-level result from persisted attempts. This can be descriptive; no advanced mastery model in M001.

## Required tests

- migration from empty DB and rerun idempotence;
- staging schema validation;
- CSV/XLSX/JSON mapping cases;
- source duplicate vs cross-exam recurrence fixture;
- alternate option-order/caderno fixture;
- answer-key version fixture;
- quarantine fixture for missing image/stimulus;
- scoring policy fixture;
- end-to-end session persistence.

## Non-goals

No semantic embeddings, semantic question-family clustering, Bank Trap DNA, OQF ingestion, deep Question Learning Packets, FSRS UI, adaptive scheduler, IRT/TRI, auth, React, cloud DB, gamification or generic SaaS features.

## Definition of done

A developer can clone the repo, install dependencies, import a 1,000+ question corpus plus one official VUNESP exam/key, start the local server, answer a question with timer/confidence, and inspect a persisted attempt/basic topic result. All ingestion ambiguity is visible in the ledger rather than silently discarded.
