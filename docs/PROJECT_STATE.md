# Project State

**Status:** Canonical V0 architecture frozen; Batismo 2.0 + Masterclass Neurociência + scientific learning corpus are core Learning OS inputs; Learning Alert & Remediation Engine is now a first-class component. M001 remains active.

**Current DB schema version:** 4

**Active milestone:** M001 — Corpus In → First Attempt Out
- GitHub issue: `#1`
- implementation branch: `codex/m001-foundation`
- canonical milestone spec: `docs/M001_FOUNDATION.md`

## Current truth

### Repository / context
- Root README and `docs/README.md` are canonical entrypoints.
- `docs/PROJECT_CONTEXT_CANON.md` preserves conversation-level rationale and examples.
- `docs/CONTEXT_PARITY_AUDIT.md` records conversation + recovered-learning-corpus → repository parity.
- `docs/CODEX_CONTEXT_HANDOFF.md` defines fresh-session recovery.

### Exam/corpus foundation
- Source-agnostic ingestion, provenance, staging/quarantine and rights rules are frozen.
- Question identity / occurrence / exam-form / source-duplicate semantics are frozen.
- Legitimate cross-exam exact recurrence is preserved as predictive evidence.
- Official bank keys are versioned and separate from universal/legal truth.
- Atomic Tree / source-faithful syllabus model is frozen conceptually.
- Scoring policy is separate from question type and reproducible.
- Mini-QC modes and core candidate attempt telemetry are defined.

### Learning Operating System
- Batismo 2.0: 11 transcript-derived lessons recovered into strategic phase/allocation doctrine.
- Masterclass Neurociência: 6 transcript-derived lessons recovered into readiness/focus/challenge/feedback/habit/recovery doctrine.
- OQF is represented as a measurable behavioral/performance cycle.
- 19-document Masterclass scientific pack was audited; public-safe synthesis exists.
- `LEARNING_OPERATING_SYSTEM.md` is normative for learning behavior.
- ADR 0009 promotes Batismo/Masterclass to core design authority.
- ADR 0010 separates method efficacy/outcome evidence from mechanism truth.

### Learning Alert & Remediation Engine
- `LEARNING_ALERT_ENGINE.md` is canonical for alert detection, severity, lifecycle, remediation, retest and resolution.
- ADR 0011 makes the engine a first-class architecture component between Diagnosis and Intervention/Decision.
- Alert types include knowledge gap, misconception, concept confusion, retention decay, coverage gap, source gap, bank trap, time/fluency and attention/execution.
- Alerts are evidence objects, not notification counters.
- Severity: `WATCH | MEDIUM | HIGH | CRITICAL`.
- Lifecycle: `DETECTED → remediation → RETEST → RESOLVED | ESCALATED | OBSERVE`.
- Raw thresholds such as `errors >= N` are explicitly rejected without evidence sufficiency/novelty/coverage context.
- Open high-leverage alerts may later alter D1…Dn and Today priority.
- Resolution requires appropriate evidence, preferably delayed unseen/equivalent validation.

### Schema/runtime readiness
- Migration chain is now designed through schema v4.
- v3: `learning_intervention` + `study_context`.
- v4: `learning_alert` + append-oriented `learning_alert_event`.
- Smoke tests now expect v4 and include a synthetic alert lifecycle/constraint test.
- Full repository pytest execution remains an implementation-environment gate before M001 feature work is considered green.

## Immediate next action

Execute M001 on `codex/m001-foundation`:
1. synchronize branch with current `main`;
2. recover context using `docs/CODEX_CONTEXT_HANDOFF.md` plus Learning OS/Alert docs;
3. run full tests first;
4. build ingestion + canonical load;
5. prove >=1,000 structured questions;
6. prove one official VUNESP exam + independent final key;
7. run Mini-QC;
8. persist first real attempt + minimal optional `study_context`;
9. validate alert-lifecycle schema hook only;
10. emit basic topic diagnostic.

## Post-M001 priority

1. **M002** — Atomic Tree/current edital;
2. **M003** — Candidate Intelligence + Learning Telemetry + interpretable Alert Detection v0;
3. **M004** — executable Batismo/Masterclass Learning OS + Alert Remediation/Retest lifecycle;
4. **M005** — retention, FSRS/memory and intervention outcomes;
5. **M006** — deeper Question/Bank Intelligence + Bank Trap alerts;
6. **M007** — Today Decision Engine using phase/readiness/open-alert/remediation evidence.

## Still deferred from M001

Automatic alert detection/severity, alert-driven D1 reprioritization, remediation scheduler, phase inference, full OQF orchestration, adaptive readiness scheduling, semantic families, Bank Trap DNA, FSRS UI, deep packets, advanced mastery/IRT/TRI and cloud/multi-user productization.
