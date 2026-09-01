# Roadmap

The roadmap is vertical-slice oriented. A milestone advances only when the previous layer produces trustworthy study evidence.

Batismo 2.0 + Masterclass Neurociência are already canonical Learning OS inputs. The new **Learning Alert & Remediation Engine** closes the loop between diagnosis and intervention: a material problem must be detected, remediated, retested and either resolved or escalated.

## Parallel workstream — Knowledge Canon
Already recovered:
- Batismo 2.0: 11 lesson transcripts;
- Masterclass Neurociência: 6 lesson transcripts;
- OQF/30-day protocol;
- 19-document scientific attachment audit;
- derived technique/claim/evidence structures.

Next: reviewed machine-readable interventions, practitioner outcome provenance, Benites/other practitioner ingestion, continued learning-science evidence.

---

## M001 — Foundation: Corpus In → First Attempt Out
**Outcome:** trustworthy exam/candidate evidence enters the system and is Learning-OS/Alert-Engine-ready.

- migrations through schema v4;
- JSON/CSV/XLSX + Quest API + one official VUNESP PDF/key path;
- provenance/staging/quarantine;
- identity/occurrence/caderno handling;
- local Mini-QC;
- answer/time/confidence/score persistence;
- optional minimal `study_context`;
- `learning_alert` + `learning_alert_event` schema/lifecycle smoke test only;
- first basic topic diagnostic.

**Gate:** full tests pass and end-to-end corpus→attempt works. No automatic alerts yet.

---

## M002 — Atomic Tree + Verticalized Syllabus
**Outcome:** candidate evidence is attached to actionable knowledge nodes and exam leverage.

- current edital ingestion;
- versioned Atomic Tree;
- syllabus→tree mapping;
- question classification;
- historical coverage/incidence;
- prerequisite/dependency hooks;
- current target-exam configuration.

---

## M003 — Candidate Intelligence + Alert Detection v0
**Outcome:** the system identifies candidate states and can distinguish “needs more evidence” from a material problem.

- unseen vs repeated performance;
- coverage-aware evidence states;
- confidence/confident-wrong;
- time distributions;
- error taxonomy;
- retention/delayed-validation primitives;
- low-friction study context;
- D1…Dn ranking inputs;
- deterministic alert candidates for:
  - knowledge gap;
  - misconception/confident-wrong;
  - coverage gap;
  - time/fluency;
  - attention/execution;
- evidence sufficiency / `WATCH` vs actionable alert;
- detector version + evidence snapshot.

**Gate:** rules produce interpretable alerts without raw-threshold spam or repeated-item contamination.

---

## M004 — Learning OS v1 + Remediation Lifecycle
**Outcome:** alerts alter the study plan and close through remediation/retest.

### Batismo strategy
- material-validation / `basic_80_20` / `basic_20_80` / mesocycle rules;
- D1…Dn + continuity/maintenance;
- urgency/final-stage templates.

### Masterclass execution
- readiness;
- task clarity;
- challenge-skill adjustment;
- attention/environment response;
- feedback/progress;
- start-friction/frustration handling.

### Alert/Remediation Engine
- severity: `WATCH | MEDIUM | HIGH | CRITICAL`;
- dedup/cooldown;
- lifecycle:
  `DETECTED → REMEDIATION_ASSIGNED → RETEST_PENDING → RESOLVED/ESCALATED/OBSERVE`;
- content vs execution diagnosis;
- alert influence on D1/Today priority;
- resolution criteria by alert type;
- failed-retest escalation rather than blind repetition of the same technique.

### Intervention registry/routing
- theory/worked example;
- retrieval/retest;
- contrastive discrimination;
- targeted questions;
- source repair;
- timing/fluency;
- attention/reset;
- simulation;
- behavior/start intervention.

**Gate:** two different failure patterns receive different interventions, and the system can prove whether remediation worked.

---

## M005 — Retention + Memory + Intervention Outcomes
**Outcome:** judge learning by durable/exam-relevant improvement.

- delayed retest queues;
- successive relearning;
- adaptive spacing;
- FSRS for appropriate memory items;
- intervention outcome log;
- N-of-1 comparisons;
- retention/decay alerts;
- `maintain | adapt | replace | investigate | progress` decisions.

---

## M006 — Question / Bank Intelligence
**Outcome:** historical corpus exposes reusable assessment patterns.

- exact recurrence analytics;
- semantic question families;
- distractor/trap taxonomy;
- Bank DNA;
- bank-trap alerts;
- legal/authority enrichment;
- Question Learning Packet depth rules.

---

## M007 — Decision Engine / Today
**Outcome:** the system prescribes the next action with reasons.

Inputs include:
- exam leverage;
- candidate gap/coverage/retention;
- Batismo phase;
- readiness;
- open Learning Alerts and severity;
- remediation/retest obligations;
- intervention effectiveness;
- available time.

North-star output:

```text
what to study
+ why it matters
+ what problem is active
+ alert/evidence strength
+ which intervention to use
+ duration/conditions
+ what retest will close or escalate the problem
```

---

## M008+ — only if evidence justifies
Adaptive testing, calibrated IRT/TRI, knowledge tracing, score simulations, DuckDB/Parquet, advanced automation, multi-user/cloud.

None outranks a reliable closed learning loop.
