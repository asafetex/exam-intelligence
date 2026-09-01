# Project State

**Status:** Canonical V0 architecture frozen; documentation/context parity hardened; Batismo 2.0 + Masterclass Neurociência + scientific learning corpus recovered and promoted to the core Learning Operating System. M001 remains the active implementation milestone.

**Current DB schema version:** 3

**Active milestone:** M001 — Corpus In → First Attempt Out
- GitHub issue: `#1`
- implementation branch: `codex/m001-foundation`
- canonical milestone spec: `docs/M001_FOUNDATION.md`

## Current truth

### Repository / context
- Root README and `docs/README.md` are canonical entrypoints.
- `docs/PROJECT_CONTEXT_CANON.md` preserves conversation-level rationale, examples, rejected paths and conceptual evolution.
- `docs/CONTEXT_PARITY_AUDIT.md` records conversation → repository decision parity.
- `docs/CODEX_CONTEXT_HANDOFF.md` defines fresh Codex/VS Code context recovery.

### Exam/corpus foundation
- Source-agnostic ingestion, provenance, staging/quarantine and rights rules are frozen.
- Question identity / occurrence / exam-form / source-duplicate semantics are frozen.
- Legitimate cross-exam exact recurrence is preserved as predictive evidence.
- Official bank keys are versioned and separate from universal/legal truth.
- Atomic Tree / source-faithful syllabus model is frozen conceptually.
- Scoring policy is separate from question type and snapshot-reproducible.
- Mini-QC modes and core candidate attempt telemetry are defined.

### Learning Operating System — now first-class
- Batismo 2.0 canonical source was recovered from **11 transcript-derived lessons** and includes phase/state, 80/20→20/80, D1…Dn, mesocycles, urgency/final-stage strategy, technique and simulation doctrine.
- Masterclass Neurociência canonical source was recovered from **6 transcript-derived lessons** and includes readiness, focus, challenge-skill, feedback, habit, frustration, progression and recovery doctrine.
- The OQF/30-day protocol is represented as a controlled behavioral/performance cycle with baseline and reassessment, not a magical habit/neural deadline.
- A **19-document Masterclass scientific pack** was audited for evidence and source integrity; derived public-safe rules are documented in `research/MASTERCLASS_SCIENTIFIC_PACK.md`.
- `LEARNING_OPERATING_SYSTEM.md` is now normative for learning behavior.
- `BATISMO_MASTERCLASS_INTEGRATION.md` defines strategic vs execution responsibilities.
- `SCIENTIFIC_LEARNING_CANON.md` adds retrieval, spacing, feedback, elaboration, discrimination, metacognition, sleep and related science rules.
- `EVIDENCE_FRAMEWORK.md` now separates practitioner outcome evidence, practitioner protocol evidence, scientific intervention evidence, mechanism evidence and candidate-local evidence.
- ADR 0009 promotes Batismo/Masterclass to core Learning OS design authority.
- ADR 0010 explicitly separates method efficacy from neuroscience-mechanism truth.

### Schema/runtime readiness
- SQLite migration runner exists through schema v3.
- Schema v3 adds `learning_intervention` and optional `study_context` so M001 evidence can preserve Batismo phase/session goal/readiness/intervention lineage without implementing the full adaptive engine.
- Smoke tests were updated to expect v3 and validate Learning OS constraints/FKs.

## Immediate next action

Execute M001 on `codex/m001-foundation` after this Learning OS hardening is merged/synchronized:
1. recover context using `docs/CODEX_CONTEXT_HANDOFF.md` and Learning OS docs;
2. build ingestion + canonical-load path;
3. prove structured corpus import with >= 1,000 questions;
4. prove one official VUNESP exam + independent final-key path;
5. run local Mini-QC;
6. persist the first real candidate attempt;
7. persist/read minimal optional `study_context` (goal + provisional phase/context) without adding questionnaire friction;
8. emit basic topic diagnostic.

## Post-M001 priority

1. M002 — Atomic Tree/current edital;
2. M003 — Candidate Intelligence + Learning Telemetry;
3. M004 — executable Batismo/Masterclass Learning OS v1;
4. M005 — delayed validation, retention, FSRS/memory and intervention outcomes;
5. M006 — deeper Question/Bank Intelligence;
6. M007 — phase/readiness/intervention-aware Today Decision Engine.

## Still deferred from M001

Automatic phase inference, full OQF orchestration, adaptive readiness scheduling, semantic question-family clustering, deep learning packets, automatic legal verification, FSRS UI, Bank Trap DNA, advanced mastery models, IRT/TRI, cloud/multi-user productization.

## Epistemic rule

The project treats Batismo/Masterclass real-world performance history as important practitioner evidence. It does **not** require every useful protocol to have a perfect mechanistic explanation before use. At the same time, a numeric outcome claim becomes a product fact only when auditable provenance exists, and no neuroscience mechanism alone can justify an educational/clinical action.
