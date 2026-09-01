# Roadmap

The roadmap is intentionally vertical-slice oriented. A milestone advances only when the previous layer produces trustworthy study evidence, not because a feature list is complete.

After recovery of the Batismo 2.0 + Masterclass Neurociência + scientific corpus, the roadmap was revised: **Learning Intelligence is not a distant optional feature.** The recovered doctrine is already canonical; implementation follows as soon as the data and Atomic Tree prerequisites exist.

## Parallel supporting workstream — Knowledge Canon

This workstream is continuous and does not block every runtime milestone.

Already recovered:
- Batismo 2.0 canonical package from 11 lesson transcripts;
- Masterclass Neurociência canonical package from 6 lesson transcripts;
- OQF/30-day protocol reconstruction;
- 19-document scientific attachment audit;
- derived technique/claim/evidence structures.

Next:
- preserve/import reviewed machine-readable intervention definitions;
- add auditable practitioner cohort/outcome records when source material is available;
- ingest Benites/other practitioner sources with the same lossless pipeline;
- extend learning-science evidence by intervention concept.

Private paid source text/media remains outside public Git.

---

## M001 — Foundation: Corpus In → First Attempt Out
**Outcome:** real corpus enters; real candidate attempt exits; evidence is Learning-OS-ready.

- migration runner through schema v3;
- structured JSON/CSV/XLSX ingestion;
- Quest API adapter;
- official VUNESP PDF + independent final-key path;
- source registry / rights / staging / quarantine;
- canonical identity / occurrence / caderno handling;
- local Mini-QC;
- first/final answer + time + confidence + score persistence;
- minimal optional `study_context` hook (goal/phase/context/next action);
- first basic topic diagnostic.

**Gate:** full repository tests pass in the implementation environment, then a clean end-to-end vertical slice works with real data. No full adaptive Learning OS yet.

---

## M002 — Atomic Tree + Verticalized Syllabus
**Outcome:** system knows the target knowledge universe, breadth and exam-side structure.

- source-faithful current edital ingestion;
- versioned Atomic Tree;
- syllabus→tree mapping;
- initial question classification;
- historical coverage map;
- new/core/tail evidence states;
- prerequisite/dependency hooks;
- current target exam configuration.

**Gate:** questions and candidate evidence can be interpreted at actionable Atomic Topic granularity.

---

## M003 — Candidate Intelligence + Learning Telemetry
**Outcome:** system detects meaningful candidate/behavior states instead of reporting raw percentages.

- unseen vs repeated performance;
- coverage-aware evidence states;
- confident-wrong;
- response-time distributions;
- error taxonomy;
- first prioritized gap report;
- low-friction `study_context` capture;
- optional readiness/task-clarity/difficulty context;
- delayed-validation event model;
- phase snapshot/version plumbing;
- first D1…Dn ranking inputs.

**Gate:** enough evidence exists to route different problems to different interventions.

---

## M004 — Learning Operating System v1
**Outcome:** Batismo/Masterclass doctrine becomes executable rather than merely documented.

### Batismo strategy engine
- material-validation state;
- `basic_80_20` / `basic_20_80` phase rules;
- mesocycle state;
- D1…Dn ranking + continuity/maintenance policy;
- urgency/surprise/final-stage templates as configuration, not rigid calendar laws.

### Masterclass execution engine
- readiness gate;
- goal/task clarity;
- challenge-skill adjustment;
- attention/environment response;
- feedback/proximal-progress logic;
- start-friction/habit intervention hooks;
- frustration/failure routing.

### Intervention registry
Seed reviewed versioned interventions derived from the recovered canon and scientific evidence:
- focused theory/worked example;
- retrieval/retest;
- contrastive discrimination;
- targeted question practice;
- source repair;
- timing/fluency;
- attention/reset;
- simulation;
- behavior/start intervention.

### First routing
`candidate diagnosis + phase + exam priority + readiness → intervention`.

**Gate:** the system can explain why two different errors receive two different study prescriptions and measure the result.

---

## M005 — Retention + Memory + Intervention Outcomes
**Outcome:** interventions are evaluated by durable learning, not immediate fluency.

- delayed validation/retest queues;
- successive relearning;
- adaptive spacing by performance;
- memory-item creation only for appropriate atomic targets;
- `py-fsrs` integration;
- retention/decay evidence;
- intervention-instance/outcome log;
- N-of-1 comparisons on comparable topics;
- `maintain | adapt | replace | investigate | progress` cycle decisions.

**Gate:** the system can distinguish an intervention that felt productive from one that improved delayed/exam-like performance.

---

## M006 — Question / Bank Intelligence
**Outcome:** historical corpus reveals reusable assessment patterns without contaminating learning evidence.

- exact cross-exam recurrence analytics;
- conservative near-duplicate detection;
- semantic question-family experiments;
- recurrence features;
- distractor/trap taxonomy;
- Bank DNA baselines;
- legal/authority enrichment where valuable;
- Question Learning Packet depth rules.

This milestone can partially overlap M005 when a bank-specific pattern directly fixes a diagnosed failure, but does not outrank foundational Learning OS work.

---

## M007 — Decision Engine / Today
**Outcome:** system prescribes the next study actions with reasons and measured learning policy.

- interpretable priority baseline;
- Batismo phase-aware allocation;
- readiness-aware task timing/dose;
- due review/retest integration;
- intervention effectiveness signal;
- Today queue;
- weekly/mesocycle recalibration;
- OQF/cycle review where appropriate;
- compare policy with simple baselines and unpersonalized Batismo template.

**North-star output:**

```text
what to study
+ why it matters on the exam
+ why it is the candidate's current bottleneck
+ which Batismo/Masterclass/science intervention to use
+ how long / under which conditions
+ what measurement determines the next move
```

---

## M008+ — Advanced only if evidence justifies

Possible:
- richer adaptive testing;
- externally calibrated IRT/TRI;
- knowledge tracing;
- approval/score simulations with leakage-safe validation;
- DuckDB/Parquet analytical projection;
- more automated scientific/practitioner evidence updates;
- multi-agent maintenance;
- multi-user/cloud productization.

None of these outrank a reliable personalized Learning OS.

## Roadmap rule

A later milestone may be pulled forward only if:
1. a current study decision materially depends on it;
2. prerequisites are trustworthy;
3. scope does not endanger the active vertical slice;
4. the change is recorded in `PROJECT_STATE.md` and, if architectural, an ADR.
