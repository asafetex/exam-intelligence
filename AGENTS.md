# AGENTS.md — Exam Intelligence

This file is the mandatory operating contract for Codex and any automated contributor.

## 1. Mission

Build a local-first, single-user exam intelligence system whose primary output is a **better next study decision**.

Never optimize for “more platform.” Optimize for better inference about:

1. what the target exam values;
2. what the candidate actually knows;
3. why the candidate is failing;
4. whether the evidence is strong enough to change the plan;
5. which Batismo/Masterclass/science intervention is appropriate;
6. under which readiness/phase conditions it should be executed;
7. whether remediation actually fixed the problem;
8. where the next unit of study time produces the highest expected return.

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
9. `docs/LEARNING_ALERT_ENGINE.md`
10. `docs/BATISMO_MASTERCLASS_INTEGRATION.md`
11. architecture/domain document relevant to the task
12. active milestone spec
13. relevant ADRs, especially 0009–0011 for learning work
14. active GitHub issue

### Context already recovered
For subsequent task work, minimum read order:

1. `docs/PROJECT_STATE.md`
2. `docs/README.md`
3. relevant architecture/domain doc
4. `docs/LEARNING_OPERATING_SYSTEM.md` for learning/session behavior
5. `docs/LEARNING_ALERT_ENGINE.md` for detection/remediation/retest behavior
6. active milestone spec
7. relevant ADRs/issue

If code and docs conflict, do not silently choose. Flag the conflict and update the canonical document as part of the change.

## 3. Hard product rules

1. Never turn the project into a generic QConcursos/TEC/Gran clone.
2. Questions are measurement instruments and learning instruments, not merely content inventory.
3. Historical frequency is evidence, never certainty.
4. Accuracy alone is not mastery. Preserve coverage, novelty, sample size, recency, retention, confidence and response time.
5. AI/user-generated questions must never enter official Bank DNA or historical-incidence statistics as if official.
6. Deep question enrichment is on-demand; do not precompute expensive explanations for the entire corpus.
7. **Batismo 2.0 + Masterclass Neurociência are first-class Learning OS design authorities**, refined by learning science and candidate-local evidence.
8. **Learning Alert & Remediation is a first-class loop**, not UI decoration.
9. Separate method/protocol efficacy from the truth of a proposed neuroscience mechanism.
10. Every learning recommendation must reduce to observable logic: `problem → intervention → evidence → metric → adjustment`.
11. Readiness modifies task/dose/timing; it is not a clinical diagnostic channel.
12. Practitioner outcome history is legitimate evidence; numeric product facts require provenance.
13. V0 is single-user/local-first. No auth/SaaS/community/payments/manipulative gamification/React/vector DB/cloud DB/agent swarm/IRT without accepted ADR and measured need.

## 4. Batismo / Masterclass learning invariants

1. Preserve Batismo state machine: `material_validation → basic_80_20 → basic_20_80 → mesocycle / urgency states → simulation → exam → post_exam`.
2. Phase durations/examples are templates unless current data justifies hard boundaries; exits become evidence-driven.
3. `80/20` and `20/80` describe dominant allocation, not universal minute ratios.
4. D1…Dn combines weakness with exam leverage/prerequisite value; not merely lowest accuracy.
5. Keep relevant disciplines alive while concentrating extra capacity on differential targets unless evidence supports another strategy.
6. Masterclass execution order: readiness → task clarity → attention environment → challenge-skill fit → active practice → feedback → recovery → telemetry/adaptation.
7. Prefer attempt/recall before passive rereading when knowledge should be retrievable.
8. Error type routes intervention; “do more questions” is never universal.
9. Confidence is captured before feedback; `confident_wrong` is high-priority misconception/calibration evidence.
10. Review is adaptive/performance-driven; no universal 7/14/21 rule.
11. Simulations become progressively exam-specific; never buy pressure with unsafe overload/sleep loss/stimulants.
12. Habit architecture targets reliable entry into deliberate study, not symbolic streaks or pseudo-addiction.

## 5. Learning Alert / Remediation invariants

1. An alert exists only when evidence can plausibly change study priority, intervention or measurement.
2. Never implement a naive rule such as `errors >= N → alert` without sample size/novelty/coverage/context.
3. The engine must be allowed to output `INSUFFICIENT_EVIDENCE` / `WATCH` instead of false certainty.
4. Prefer unseen/equivalent validation evidence; repeated identical items have lower mastery weight.
5. Canonical alert families: knowledge gap, misconception, concept confusion, retention decay, coverage gap, source gap, bank trap, time/fluency, attention/execution.
6. Severity is allocation priority, not emotional punishment: `WATCH | MEDIUM | HIGH | CRITICAL`.
7. Preserve detector version + evidence snapshot. Never retrospectively rewrite why an alert was created.
8. Alert lifecycle is historical/append-oriented: `DETECTED → remediation → RETEST → RESOLVED | ESCALATED | OBSERVE`.
9. Clicking “done” does not resolve an alert. Resolution requires alert-appropriate evidence, preferably delayed unseen/equivalent validation.
10. Failed retest should trigger re-diagnosis/escalation; do not blindly repeat the same intervention forever.
11. Distinguish content failure from execution/readiness failure. Many errors do not automatically mean more theory.
12. Repeated detector runs must not spam duplicate unresolved alerts for the same underlying problem.
13. Open high-leverage alerts may later affect D1/Today priority; `WATCH` signals must not hijack the plan.
14. M001 only preserves alert schema/lifecycle hooks. Automatic detection/remediation begins after Atomic Tree/Candidate evidence are trustworthy.

## 6. Question identity / recurrence invariants

1. `question` = canonical content identity.
2. `question_occurrence` = question in a distinct official exam/form context.
3. `exam_form` = booklet/caderno/version within one exam.
4. `source_question_link` = another source describing an existing occurrence; it must not create recurrence.
5. Alternate cadernos/forms must not inflate recurrence.
6. Exact canonical content in two genuinely distinct exams **must** remain two occurrences and is a meaningful recurrence signal.
7. Semantic-family recurrence and Atomic-Topic incidence are separate signals.
8. Canonical option identity is independent of A/B/C/D/E label/order.
9. Identity/normalization algorithms are versioned; never change hashing silently.

## 7. Evidence / truth invariants

1. `official_bank_key` records the bank's decision for an occurrence/key version, not universal truth.
2. Provisional/final/changed/annulled keys are historical records, not destructive updates.
3. Legal authority is time-versioned.
4. Separate: exam fact, bank decision, practitioner protocol, practitioner outcome evidence, scientific intervention evidence, mechanism evidence, candidate-local evidence, deterministic derivation, statistical/model inference and hypothesis.
5. Model-generated classifications preserve classifier/version/confidence/review metadata.
6. Scientific artifact filenames/titles are not trusted evidence without integrity validation.
7. Paid/private course material stays outside public Git; derived doctrine must not reconstruct restricted source text unnecessarily.

## 8. Ingestion invariants

1. Raw source assets are immutable.
2. Every import has `source_asset`, `import_batch` and per-record ledger entry.
3. No parser writes directly to canonical tables without staging/quality gates.
4. Parser ambiguity goes to quarantine/`needs_review`; no silent failures.
5. Preserve shared text/tables/figures/diagrams; unresolved dependencies quarantine the item.
6. Support independent exam and final-key arrival.
7. Preserve rights/license/redistribution metadata.

## 9. Candidate / learning evidence invariants

1. Candidate attempts are append-oriented historical evidence.
2. Persist session order/selection reason and scoring/key snapshot for reproducibility.
3. Capture confidence before feedback.
4. Preserve first/final answer + change state when supported.
5. Distinguish `learn`, `validate`, `exam` evidence.
6. Prefer unseen/equivalent questions for validation; repeated items cannot silently inflate mastery.
7. Phase/intervention/context snapshots are historical facts; never rewrite old sessions with a new model version.
8. Optional readiness/context fields remain low-friction.
9. Candidate-local intervention effectiveness should use delayed/transfer outcomes where possible.
10. Back up non-rebuildable candidate evidence before destructive migrations.

## 10. Safety / clinical boundary

The system is an educational performance engine. It must not:
- diagnose ADHD/depression/sleep disorder or another clinical condition from telemetry;
- prescribe/adjust medication;
- prescribe supplement doses/brands;
- use stimulants/supplements as automated learning interventions;
- trade sleep for study load;
- infer neurotransmitter/brain-region state from behavior;
- use humiliation/coercive reward escalation/approval guarantees.

## 11. Engineering rules

- Python 3.11+.
- FastAPI + Jinja2 + HTMX + minimal JavaScript.
- SQLite with FKs, WAL, busy timeout and ordered versioned migrations.
- No ORM/framework addition without measured benefit and ADR.
- Runner/scoring/phase/alert-rule paths should be deterministic when inputs are deterministic; no mandatory LLM/network dependency.
- External integrations behind adapters/ports.
- Prefer explicit schemas and pure functions at ingest/identity/scoring/learning/alert boundaries.
- UTC timezone-aware ISO-8601 timestamps.
- Migrations are immutable once merged; add a new migration.
- Tests are required for ingestion, identity, dedupe, scoring, migrations, Learning OS and alert invariants as implemented.

## 12. Documentation rules

- `docs/README.md` is the map.
- `docs/PROJECT_CONTEXT_CANON.md` preserves conversation rationale/context.
- `docs/CONTEXT_PARITY_AUDIT.md` records parity.
- `docs/PROJECT_STATE.md` is concise/current.
- Stable architecture belongs in domain docs.
- Significant decisions belong in ADRs.
- Research/benchmarks are evidence, not automatic product policy.
- `docs/LEARNING_OPERATING_SYSTEM.md` is normative for learning behavior.
- `docs/LEARNING_ALERT_ENGINE.md` is normative for alert/remediation/retest behavior.
- Update docs in the same change as behavior/schema changes.

## 13. Scope gate

Before implementing a feature, answer:

> Can this materially change what the candidate studies, how they study, how they answer, whether a detected problem changes the plan, or the reliability of that decision?

If not, defer it.

## 14. Current definition of done

See `docs/PROJECT_STATE.md` and active milestone. For M001, success is corpus→persisted attempt + minimal Learning-OS-ready session context + alert-lifecycle schema hook + basic topic diagnostic. Full adaptive phase/alert/remediation logic remains post-M001.
