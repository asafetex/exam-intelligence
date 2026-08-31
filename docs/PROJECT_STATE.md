# Project State

**Status:** Canonical V0 architecture frozen; documentation hardening in progress before M001 implementation.

**Current DB schema version:** 2

**Active milestone:** M001 — Corpus In → First Attempt Out
- GitHub issue: `#1`
- implementation branch: `codex/m001-foundation`
- documentation hardening branch: `docs/canonical-v0-hardening`

## Current truth

- Product north star and four intelligence domains are defined.
- Source-agnostic ingestion, provenance, staging/quarantine and rights rules are frozen.
- Question identity / occurrence / exam-form / source-duplicate semantics are frozen.
- Legitimate cross-exam exact recurrence is preserved as predictive evidence.
- Official bank keys are versioned and separate from universal/legal truth.
- Atomic Tree / source-faithful syllabus model is frozen conceptually.
- Mini-QC modes and candidate telemetry contract are defined.
- Knowledge Pipeline, Learning Intelligence, Question Learning Packet, FSRS and Decision Engine are documented as future layers, not M001 scope.
- SQLite migration runner exists through schema v2.
- M001 has an explicit definition of done and required semantic fixtures.

## Immediate next action

1. Merge canonical documentation hardening after review.
2. Fast-forward/sync `codex/m001-foundation` to the hardened `main`.
3. Execute M001 only; do not expand into M002+ features.

## Deferred

Semantic question-family clustering, deep learning packets, automatic legal verification, FSRS UI, Learning Canon ingestion, Bank Trap DNA, advanced mastery models and IRT/TRI remain post-M001.
