# AGENTS.md — Exam Intelligence

This file is the mandatory operating contract for Codex and any automated contributor.

## 1. Mission

Build a local-first, single-user exam intelligence system whose primary output is a **better next study decision**.

Never optimize for “more platform.” Optimize for better inference about:

1. what the target exam values;
2. what the candidate actually knows;
3. why the candidate is failing;
4. which intervention is appropriate;
5. where the next unit of study time produces the highest expected return.

## 2. Read order before material work

1. `docs/PROJECT_STATE.md`
2. `docs/README.md`
3. `docs/PRODUCT_VISION.md`
4. `docs/PROJECT_PRINCIPLES.md`
5. architecture/domain document relevant to the task
6. active milestone spec
7. relevant ADRs

If code and docs conflict, do not silently choose. Flag the conflict and update the canonical document as part of the change.

## 3. Hard product rules

1. Never turn the project into a generic QConcursos/TEC/Gran clone.
2. Questions are measurement instruments and learning instruments, not merely content inventory.
3. Historical frequency is evidence, never certainty.
4. Accuracy alone is not mastery. Always preserve the ability to account for coverage, novelty, sample size, recency, retention, confidence and response time.
5. AI/user-generated questions must never enter official Bank DNA or historical-incidence statistics as if they were official questions.
6. Deep question enrichment is on-demand. Do not precompute expensive explanations for the entire corpus.
7. V0 is single-user/local-first. No auth, SaaS, community, payments, gamification, React SPA, vector DB, cloud DB, agent swarm or IRT/TRI without an accepted ADR showing measured need.

## 4. Question identity / recurrence invariants

1. `question` = canonical content identity.
2. `question_occurrence` = the question appearing in a distinct official exam/form context.
3. `exam_form` = booklet/caderno/version within one exam.
4. `source_question_link` = another source describing an existing occurrence; it must not create recurrence.
5. Alternate cadernos/forms must not inflate historical recurrence.
6. Exact canonical content appearing in two genuinely distinct exams **must** remain two occurrences and is a meaningful recurrence signal.
7. Semantic-family recurrence and Atomic-Topic incidence are separate signals from exact recurrence.
8. Canonical option identity is independent of A/B/C/D/E label/order.
9. Identity/normalization algorithms are versioned; never change hashing semantics silently.

## 5. Evidence / truth invariants

1. `official_bank_key` records the bank's scoring decision for a particular occurrence/key version. It is not universal truth.
2. Provisional, final, changed and annulled keys are historical records, not destructive updates.
3. Legal authority is time-versioned and linked to historical occurrences.
4. Separate: official fact/source, bank decision, deterministic derivation, statistical estimate, LLM inference and hypothesis.
5. Model-generated classifications must preserve classifier/version/confidence/review metadata.

## 6. Ingestion invariants

1. Raw source assets are immutable.
2. Every import must have a `source_asset`, `import_batch` and per-record ledger entry.
3. No parser writes directly to canonical tables without staging validation/quality gates.
4. Parser ambiguity goes to quarantine/`needs_review`; there are no silent failures.
5. PDFs may contain shared text, tables, figures or diagrams. Never drop unresolved stimulus/media dependencies.
6. Support independent arrival of exam and final answer key.
7. Preserve source rights/license/redistribution metadata.

## 7. Candidate evidence invariants

1. Candidate attempts are append-oriented historical evidence.
2. Persist the session item order/selection reason and scoring/key snapshot required to reproduce the result.
3. Capture confidence before feedback/reveal.
4. Preserve first answer, final answer and answer-change state when supported.
5. Distinguish `learn`, `validate` and `exam` evidence.
6. Prefer unseen questions for validation; repeated items cannot silently inflate mastery.
7. Back up non-rebuildable candidate evidence before destructive migrations.

## 8. Engineering rules

- Python 3.11+.
- FastAPI + Jinja2 + HTMX + minimal JavaScript.
- SQLite with foreign keys, WAL, busy timeout and ordered versioned migrations.
- No ORM/framework addition without measured benefit and ADR.
- Runner/scoring paths should be deterministic and must not require an LLM or network call.
- External integrations live behind adapters/ports.
- Prefer explicit schemas and pure functions at ingest/identity/scoring boundaries.
- UTC timezone-aware ISO-8601 timestamps.
- Migration files are immutable once merged; add a new migration instead of editing history.
- Tests are required for ingestion, identity, dedupe, scoring and migration invariants.

## 9. Documentation rules

- `docs/README.md` is the documentation map.
- `docs/PROJECT_STATE.md` is concise and current, not a design essay.
- Stable architecture belongs in domain docs.
- Irreversible/significant decisions belong in `docs/adr/`.
- Research/benchmark material is evidence, not automatically product policy.
- Update documentation in the same PR as behavior/schema changes.

## 10. Scope gate

Before implementing a feature, answer:

> Can this materially change what the candidate studies, how they study, how they answer, or the reliability of that decision?

If not, defer it.

## 11. Current definition of done

See `docs/PROJECT_STATE.md` and the active milestone. For M001, success is an end-to-end path from real corpus ingestion to one persisted candidate attempt and a first evidence-backed topic diagnostic.
