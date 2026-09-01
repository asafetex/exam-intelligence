# AGENTS.md — Exam Intelligence

This file is the mandatory operating contract for Codex and any automated contributor.

## 1. Mission

Build a local-first, single-user exam intelligence system whose primary output is a **better next study decision**.

Never optimize for “more platform.” Optimize for better inference about:

1. what the target exam values;
2. what the candidate actually knows;
3. why the candidate is failing;
4. which Batismo/Masterclass/science intervention is appropriate;
5. under which readiness/phase conditions it should be executed;
6. where the next unit of study time produces the highest expected return.

## 2. Context recovery and read order

### Fresh Codex / fresh engineer / new environment
Before material work in a session that does not already understand the project, read:

1. `docs/CODEX_CONTEXT_HANDOFF.md`
2. `docs/PROJECT_STATE.md`
3. `docs/PROJECT_CONTEXT_CANON.md`
4. `docs/CONTEXT_PARITY_AUDIT.md`
5. `docs/README.md`
6. `docs/PRODUCT_VISION.md`
7. `docs/PROJECT_PRINCIPLES.md`
8. `docs/LEARNING_OPERATING_SYSTEM.md`
9. `docs/BATISMO_MASTERCLASS_INTEGRATION.md`
10. architecture/domain document relevant to the task
11. active milestone spec
12. relevant ADRs, especially 0009–0010 for learning work
13. active GitHub issue

### Context already recovered
For subsequent task work, the minimum read order is:

1. `docs/PROJECT_STATE.md`
2. `docs/README.md`
3. relevant architecture/domain doc
4. `docs/LEARNING_OPERATING_SYSTEM.md` when behavior/learning/session design is involved
5. active milestone spec
6. relevant ADRs/issue

If code and docs conflict, do not silently choose. Flag the conflict and update the canonical document as part of the change.

## 3. Hard product rules

1. Never turn the project into a generic QConcursos/TEC/Gran clone.
2. Questions are measurement instruments and learning instruments, not merely content inventory.
3. Historical frequency is evidence, never certainty.
4. Accuracy alone is not mastery. Preserve coverage, novelty, sample size, recency, retention, confidence and response time.
5. AI/user-generated questions must never enter official Bank DNA or historical-incidence statistics as if they were official questions.
6. Deep question enrichment is on-demand. Do not precompute expensive explanations for the entire corpus.
7. **Batismo 2.0 + Masterclass Neurociência are first-class Learning OS design authorities**, refined by learning science and candidate-local evidence. Do not demote them to optional RAG content.
8. Separate method/protocol efficacy from the truth of a proposed neuroscience mechanism. A useful safe protocol is not deleted solely because its biological explanation was overstated.
9. Every learning recommendation must reduce to observable logic: `problem → intervention → evidence → metric → adjustment`. Never justify an action only with “dopamine”, “BDNF”, “hippocampus”, “flow” or similar labels.
10. Readiness modifies task/dose/timing; it is not a clinical diagnostic channel.
11. Practitioner outcome history is legitimate evidence. Numeric claims used as product facts require auditable provenance; do not invent denominators/counts.
12. V0 is single-user/local-first. No auth, SaaS, community, payments, manipulative gamification, React SPA, vector DB, cloud DB, agent swarm or IRT/TRI without accepted ADR and measured need.

## 4. Batismo / Masterclass learning invariants

1. Preserve the operational Batismo state machine: `material_validation → basic_80_20 → basic_20_80 → mesocycle / urgency states → simulation → exam → post_exam`.
2. Phase durations/examples from the course are templates unless current data justifies a hard boundary; exit criteria should become evidence-driven.
3. `80/20` and `20/80` describe dominant allocation, not universal minute-level ratios.
4. D1…Dn priority combines candidate weakness with exam leverage/prerequisite value; it is not merely lowest accuracy.
5. Keep relevant disciplines alive while concentrating extra capacity on the differential target unless explicit evidence supports another strategy.
6. Masterclass execution order: readiness → task clarity → attention environment → challenge-skill fit → active practice → feedback → recovery → telemetry/adaptation.
7. Prefer attempt/recall before passive rereading when knowledge should be retrievable.
8. Error type routes intervention; “do more questions” is never a universal error response.
9. Confidence is captured before feedback; `confident_wrong` is a high-priority misconception/calibration state.
10. Review is adaptive/performance-driven. Do not encode a universal 7/14/21 schedule.
11. Simulations become progressively exam-specific; never simulate pressure through sleep deprivation, unsafe overload or stimulant use.
12. Habit architecture targets reliable **entry into deliberate study**, not symbolic streaks or pseudo-addiction.

## 5. Question identity / recurrence invariants

1. `question` = canonical content identity.
2. `question_occurrence` = the question appearing in a distinct official exam/form context.
3. `exam_form` = booklet/caderno/version within one exam.
4. `source_question_link` = another source describing an existing occurrence; it must not create recurrence.
5. Alternate cadernos/forms must not inflate historical recurrence.
6. Exact canonical content appearing in two genuinely distinct exams **must** remain two occurrences and is a meaningful recurrence signal.
7. Semantic-family recurrence and Atomic-Topic incidence are separate signals from exact recurrence.
8. Canonical option identity is independent of A/B/C/D/E label/order.
9. Identity/normalization algorithms are versioned; never change hashing semantics silently.

## 6. Evidence / truth invariants

1. `official_bank_key` records the bank's scoring decision for a particular occurrence/key version. It is not universal truth.
2. Provisional, final, changed and annulled keys are historical records, not destructive updates.
3. Legal authority is time-versioned and linked to historical occurrences.
4. Separate: exam fact, bank decision, practitioner protocol, practitioner outcome evidence, scientific intervention evidence, mechanism evidence, candidate-local evidence, deterministic derivation, statistical/model inference and hypothesis.
5. Model-generated classifications preserve classifier/version/confidence/review metadata.
6. Scientific artifact filenames/titles are not trusted evidence without content/integrity validation.
7. Paid/private course material stays outside public Git; derived doctrine must not reconstruct non-redistributable source text unnecessarily.

## 7. Ingestion invariants

1. Raw source assets are immutable.
2. Every import must have a `source_asset`, `import_batch` and per-record ledger entry.
3. No parser writes directly to canonical tables without staging validation/quality gates.
4. Parser ambiguity goes to quarantine/`needs_review`; there are no silent failures.
5. PDFs may contain shared text, tables, figures or diagrams. Never drop unresolved stimulus/media dependencies.
6. Support independent arrival of exam and final answer key.
7. Preserve source rights/license/redistribution metadata.

## 8. Candidate / learning evidence invariants

1. Candidate attempts are append-oriented historical evidence.
2. Persist session item order/selection reason and scoring/key snapshot required to reproduce result.
3. Capture confidence before feedback/reveal.
4. Preserve first answer, final answer and answer-change state when supported.
5. Distinguish `learn`, `validate` and `exam` evidence.
6. Prefer unseen/equivalent questions for validation; repeated items cannot silently inflate mastery.
7. Phase/intervention/context snapshots are historical facts; never rewrite old sessions using a new model version.
8. Optional readiness/context fields remain low-friction. Do not force a questionnaire before every question.
9. Candidate-local intervention effectiveness should be judged with delayed/transfer outcomes where possible, not immediate post-study accuracy only.
10. Back up non-rebuildable candidate evidence before destructive migrations.

## 9. Safety / clinical boundary

The system is an educational performance engine. It must not:
- diagnose ADHD, depression, sleep disorder or any clinical condition from telemetry;
- prescribe or adjust medication;
- prescribe supplement doses/brands;
- use stimulant/supplement use as an automated learning intervention;
- trade sleep for study load;
- infer neurotransmitter or brain-region state from behavior;
- use humiliation, coercive reward escalation or approval guarantees.

## 10. Engineering rules

- Python 3.11+.
- FastAPI + Jinja2 + HTMX + minimal JavaScript.
- SQLite with foreign keys, WAL, busy timeout and ordered versioned migrations.
- No ORM/framework addition without measured benefit and ADR.
- Runner/scoring/phase-rule paths should be deterministic when their inputs are deterministic; they must not require an LLM or network call.
- External integrations live behind adapters/ports.
- Prefer explicit schemas and pure functions at ingest/identity/scoring/learning-rule boundaries.
- UTC timezone-aware ISO-8601 timestamps.
- Migration files are immutable once merged; add a new migration instead of editing history.
- Tests are required for ingestion, identity, dedupe, scoring, migrations and Learning OS invariants as they become implemented.

## 11. Documentation rules

- `docs/README.md` is the documentation map.
- `docs/PROJECT_CONTEXT_CANON.md` preserves conversation-level rationale/context; it is not a competing implementation spec.
- `docs/CONTEXT_PARITY_AUDIT.md` records project-decision parity between ChatGPT context and repository memory.
- `docs/PROJECT_STATE.md` is concise and current, not a design essay.
- Stable architecture belongs in domain docs.
- Significant/irreversible decisions belong in `docs/adr/`.
- Research/benchmark material is evidence, not automatically product policy.
- `docs/LEARNING_OPERATING_SYSTEM.md` is normative for learning behavior.
- Update documentation in the same PR as behavior/schema changes.

## 12. Scope gate

Before implementing a feature, answer:

> Can this materially change what the candidate studies, how they study, how they answer, or the reliability of that decision?

If not, defer it.

## 13. Current definition of done

See `docs/PROJECT_STATE.md` and the active milestone. For M001, success is an end-to-end path from real corpus ingestion to one persisted candidate attempt, minimal Learning-OS-ready session context, and a first evidence-backed topic diagnostic. Full adaptive Batismo/Masterclass logic remains post-M001.
