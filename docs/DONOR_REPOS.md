# Donor Repository Archaeology

This project is not a fork of any donor. We reuse architectural patterns and only copy/adapt code where license permits and the code materially reduces implementation risk.

## 1. abhiksark/examen — PRIMARY RUNNER DONOR
License: MIT.

Adopt:
- artifact-as-contract between generator/importer and deterministic runner
- Python + FastAPI + HTMX + SQLite local-first shape
- confidence captured before answer reveal
- longitudinal session/answer history
- topic-level aggregates and confidence calibration separation
- versioned SQLite migrations, foreign keys, WAL and busy timeout
- deterministic runner that does not need an LLM to score

Do not adopt:
- code-review-graph domain model
- code-specific topic discovery
- blast-radius question type
- its exact adaptive difficulty algorithm before our item difficulty is trustworthy

## 2. heshengtao/exameow — PRIMARY IMPORT/PRACTICE DONOR
License: Apache-2.0.

Adopt:
- smart CSV/XLSX header detection
- configurable column mapping
- positional fallback only as low-confidence fallback
- combined-option parsing / delimiter detection
- import preview + missing-field validation
- separate question-bank and practice-session concepts
- sequential/random/mock/wrong modes as reference
- import/export architecture

Do not adopt:
- Tauri/Rust/Cloudflare multi-backend complexity
- browser localStorage as system of record
- AI generation as core ingestion path
- multiplayer/online exam relay

## 3. open-spaced-repetition/py-fsrs — FLASHCARD SCHEDULER
License: MIT.

Integrate as a library later; do not reimplement FSRS.
Use its Card/ReviewLog/Scheduler model and later optimizer after enough personal review logs exist.

## 4. Refloow/Exam-Quiz-Test — MICRO-UX REFERENCE
License: MIT.

Reference only:
- simple timer
- randomization
- single/multiple choice rendering
- tiny browser-based question schema

No need to inherit its single-file architecture.

## 5. aliflab/DrillMCQ — VISUAL/UX REFERENCE ONLY
README claims MIT, but repository-level licensing was not sufficiently clear during archaeology. Do not copy code until license is verified.
Useful concepts:
- one-question-at-a-time UI
- resume
- result history
- incorrect-only review
- category filtering

## 6. TAO Assessment
Domain reference only. Too large and GPL-2.0 for our V0.

## Frozen donor decision
- Runner/state/history: **Examen-inspired**
- Import/mapping: **Exameow-inspired**
- Flashcard scheduling: **py-fsrs library**
- UI: **our own minimal FastAPI/Jinja/HTMX implementation**
