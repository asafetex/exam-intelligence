# Project State

**Status:** Canonical V0 architecture frozen and documentation hardening merged. M001 is ready to execute.

**Current DB schema version:** 2

**Active milestone:** M001 — Corpus In → First Attempt Out
- GitHub issue: `#1`
- implementation branch: `codex/m001-foundation`
- canonical milestone spec: `docs/M001_FOUNDATION.md`

## Current truth

- Root README and `docs/README.md` now act as the canonical project entrypoints.
- Product north star and four intelligence domains are defined.
- Source-agnostic ingestion, provenance, staging/quarantine and rights rules are frozen.
- Question identity / occurrence / exam-form / source-duplicate semantics are frozen.
- Legitimate cross-exam exact recurrence is preserved as predictive evidence.
- Official bank keys are versioned and separate from universal/legal truth.
- Atomic Tree / source-faithful syllabus model is frozen conceptually.
- Scoring policy is separate from question type and is snapshot-reproducible.
- Mini-QC modes and candidate telemetry contract are defined.
- Candidate error taxonomy, confidence/calibration and coverage-aware mastery principles are documented.
- Knowledge Pipeline, Evidence Framework, Intervention Library, Periodization, Learning Intelligence, Question Learning Packet, FSRS and Decision Engine are documented as future layers, not M001 scope.
- Bank DNA / Legal Authority Graph semantics are documented for later milestones.
- SQLite migration runner exists through schema v2.
- M001 has an explicit definition of done, testing strategy and semantic fixtures.
- Architecture decisions are now recorded as append-only ADRs.

## Immediate next action

Execute M001 on `codex/m001-foundation` only:
1. build the ingestion + canonical-load path;
2. prove structured corpus import with >= 1,000 questions;
3. prove one official VUNESP exam + independent final key path;
4. run the local Mini-QC;
5. persist the first real candidate attempt and basic topic diagnostic.

Do not expand into M002+ features until the M001 acceptance gate is met.

## Deferred

Semantic question-family clustering, deep learning packets, automatic legal verification, FSRS UI, Learning Canon ingestion, Bank Trap DNA, advanced mastery models and IRT/TRI remain post-M001.
