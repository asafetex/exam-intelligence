# AGENTS.md — Exam Intelligence

## Mission
Build a local-first exam intelligence system whose output is a better next study decision.

## Non-negotiable rules
1. Never optimize for building a generic QConcursos clone. Optimize for candidate measurement and decision quality.
2. `docs/` is canonical. Update `docs/PROJECT_STATE.md` after any material architectural or schema change.
3. Raw sources are immutable. Never rewrite files under local/raw source directories.
4. Preserve provenance: every official occurrence and answer-key decision must be traceable to source assets and ingestion batches.
5. Separate fact, bank decision, inference, model estimate and hypothesis.
6. Historical frequency != future certainty.
7. `official_bank_key` means the bank's scoring decision for that occurrence/version, not universal truth.
8. Never let AI-generated or user-created questions enter official Bank DNA statistics.
9. Do not infer mastery from accuracy alone. Consider coverage, novelty, sample size, recency, confidence and time.
10. Question identity is separate from presentation and occurrence. Do not count source duplicates or alternate booklets as exam recurrence.
11. Prefer deterministic code in the runner. LLM enrichment is optional/on-demand and must not be required to render or score an official question.
12. Keep V0 small. No auth, multi-user, SaaS, community, gamification, React SPA, cloud DB, vector DB, agent swarm or IRT unless a measured need appears.
13. SQLite uses foreign keys, WAL mode and versioned migrations.
14. Question content must support rich text and external media references; never assume all questions are plain text.
15. Legal authority is time-versioned and occurrence-grounded. Never attach a timeless legal interpretation to a historical item.
16. Imported proprietary/question-bank data, paid-course material, candidate performance data and secrets are LOCAL/PRIVATE by default and must not be committed to a public repository.
17. If donor code is copied/adapted, preserve its license/notice and record it in `THIRD_PARTY_NOTICES.md`.
18. Every new feature must answer: can this change what the candidate studies, how they study, or how they answer?

## Current stack
- Python 3.11+
- FastAPI
- Jinja2 + HTMX + minimal JavaScript
- SQLite
- Markdown + JSONL for knowledge sources
- py-fsrs later for spaced repetition

## V0 definition of done
A real question corpus can be imported, an official PDF exam can be parsed into the same canonical schema, the user can answer questions locally with timer + confidence, attempts are persisted, and the system can identify at least one evidence-backed weak atomic topic.
