# Project Context Canon — Conversation-to-Repository Bridge

> Purpose: preserve the project-level context, reasoning and nuance that originally emerged in ChatGPT conversations so a new Codex/engineer can understand not only **what** was decided, but **why**. This file is not a replacement for domain docs. Domain docs remain normative for implementation. This is the canonical context bridge.

## 1. Why this project exists

Exam Intelligence is not intended to become another generic question bank, LMS or QConcursos/TEC/Gran clone. The project exists to answer one decision problem:

> Given the target exam, the candidate's current evidence, available time, scoring rules and learning state, where does the next unit of study time produce the largest expected increase in exam performance?

The product is therefore an **intelligence loop**, not a content catalog.

The candidate should eventually open the system and receive a defensible action such as:

- study this Atomic Topic;
- for this amount of time;
- with this intervention;
- because these exam/candidate signals justify it;
- then retest under these conditions.

Dashboards are secondary. The north-star output is the next learning decision.

## 2. Current exam context and why the architecture must be universal

Two exam contexts shaped the design:

1. **Polícia Federal / CEBRASPE** — the larger strategic target and the origin of many scoring/forecasting questions.
2. **Guarda Municipal de Paulínia / VUNESP** — the immediate experimental laboratory where the system can be built and validated on a current edital/prova context.

The architecture must not hard-code either bank. CEBRASPE, VUNESP and FGV differ materially in item structure and scoring, so the core abstraction is:

`Item -> propositions/options -> candidate response -> scoring policy`

Examples:

- CEBRASPE: binary proposition, often Certo/Errado, with a scoring policy that may reward correct responses and penalize errors.
- VUNESP/FGV: single-choice alternatives with one selected option.

Five alternatives are **not** modeled as five independent binary propositions. Selection probability and scoring are tied to the item policy.

The same content engine and candidate engine must work regardless of bank; bank-specific behavior lives in metadata, item structure, scoring policy and Bank DNA.

## 3. The four intelligence domains

The project is conceptually divided into four domains.

### EXAM Intelligence
Answers: **What matters on this exam?**

Evidence includes:

- edital/syllabus;
- versioned Atomic Tree;
- historical official exams;
- bank, role, organization, year and period;
- incidence and recency;
- exact cross-exam recurrence;
- semantic question-family recurrence;
- scoring policy;
- legal/regulatory changes;
- Bank DNA / distractor patterns later.

Historical frequency is evidence, never certainty. The system must never turn `frequent in history` into `guaranteed next exam`.

### CANDIDATE Intelligence
Answers: **What does the candidate actually demonstrate?**

Evidence includes:

- correctness and score;
- first exposure vs repeated exposure;
- response time;
- confidence before feedback;
- first answer vs final answer;
- answer changes;
- error taxonomy;
- topic breadth/coverage;
- retention over time;
- mode: learn / validate / exam.

Accuracy alone is explicitly insufficient. A candidate can score 90% on a topic while having sampled only one narrow subtopic. The system must be able to say `coverage insufficient` instead of inventing mastery.

### LEARNING Intelligence
Answers: **Which intervention addresses the diagnosed problem?**

A gap is not automatically solved by “study more”. Different diagnoses imply different interventions:

- comprehension gap -> theory/example/elaboration;
- retrieval/forgetting gap -> retrieval practice / spaced memory;
- application gap -> targeted questions;
- confusion between close concepts -> contrastive learning;
- distractor susceptibility -> bank-specific practice;
- confident-wrong misconception -> deeper correction + delayed retest;
- slow-but-correct -> fluency/timing practice.

The Learning Intelligence layer will be grounded in the Knowledge Pipeline, practitioner methods and external learning-science evidence.

### DECISION Intelligence
Answers: **What should happen next?**

It combines exam importance, candidate gap, coverage need, retention, time-to-exam, available time and intervention evidence into a prioritized action queue. The eventual primary screen is `Today`, not a generic dashboard.

## 4. Closed-loop thesis

The canonical loop is:

`Edital -> Atomic Tree -> historical exams -> incidence/recurrence -> question corpus -> candidate attempts -> coverage/confidence/retention/errors -> diagnosis -> intervention -> study -> new evidence -> recalibration`

A shorter operating thesis is:

> Observe -> diagnose -> choose intervention -> study -> test -> learn from result -> repeat.

Every major feature should strengthen this loop.

## 5. Atomic Tree and syllabus verticalization

A raw discipline percentage such as `Direito Administrativo: 81%` is often misleading. The system needs a hierarchical knowledge map:

`Subject -> Macro Topic -> Topic -> Subtopic -> Atomic Topic / Atomic Skill`

Example:

`Direito Administrativo -> Atos Administrativos -> Revogação`

or

`Improbidade -> sujeitos -> atos -> dolo -> sanções -> prescrição -> processo -> alterações legislativas`

Granularity should only increase when it can change diagnosis or study allocation. Over-granular taxonomies are also a failure mode.

The edital is ingested source-faithfully, verticalized, then mapped into the canonical versioned Atomic Tree. The source wording must not be silently rewritten merely to fit the taxonomy.

Useful exam-side states include:

- **Historical Core**: repeatedly tested and still present in current edital;
- **Emerging / Uncertain**: new topic, new law, weak history;
- **Historical Tail**: present but historically rare.

`Never tested historically` must never become `will not be tested`.

## 6. Question corpus philosophy

A large question corpus is raw material, not the product.

The system should make it easy to ingest 1,000, 10,000 or 50,000+ questions without manual column-by-column work. The purpose is to make question availability cheap enough that the scarce resource becomes candidate evidence and decision quality.

Target source routes:

- structured JSON/CSV/XLSX;
- Quest API;
- public/open datasets;
- official exam PDFs + official answer-key PDFs;
- lawful platform exports/prints when available;
- manual questions;
- AI-generated practice questions, always labeled separately.

The internal architecture is source-agnostic:

`Source -> adapter/parser -> staging -> quality gates -> normalization -> identity/dedupe -> canonical DB`

No provider owns the internal schema.

## 7. PDF ingestion is a first-class route

Official exam PDFs and final answer-key PDFs are expected to become the long-term append mechanism.

After the historical bootstrap, ongoing maintenance should be simple:

1. a new official exam appears;
2. exam PDF + final key are added locally;
3. parser extracts/stages questions;
4. quality gates verify question count, alternatives, stimulus/media and key coverage;
5. unresolved items go to quarantine;
6. canonical DB and historical analytics update.

The answer key is an independent versioned source because provisional and final keys may arrive at different times.

PDF parsing must preserve shared passages, images, tables and diagrams. An item with an unresolved dependency is quarantined rather than silently converted into a broken text-only question.

## 8. Question identity, duplicate data and real recurrence

This distinction is central to the project.

### Source duplicate
The same official occurrence is imported from Quest API and later from an official PDF. This adds provenance, not historical recurrence.

### Alternate booklet/form
The same exam has multiple cadernos with reordered questions/options. This is one exam context and must not inflate recurrence.

### Exact cross-exam recurrence
The materially same canonical question appears in genuinely different official exams. This is **meaningful historical evidence** and must be preserved as multiple `question_occurrence` rows linked to one canonical `question`.

Example discussed explicitly:

- PF 2021 contains a combinatorics question;
- PF 2025 contains the same question.

This is not “duplicate garbage”. It is a signal that the question/content pattern has been reused by the bank.

### Semantic question family
Different wording/numbers/context test the same proposition, skill or template. This is distinct from exact recurrence and is deferred until after the foundation is trustworthy.

The hierarchy of signals is therefore:

`source duplicate != exact recurrence != semantic-family recurrence != Atomic-Topic incidence`

All four may exist simultaneously and must remain analytically separable.

## 9. Bank interpretation and legal truth

For legal subjects the system must never store a bank answer as universal truth.

Use:

`official_bank_key`

meaning:

> this was the bank's official scoring decision for this occurrence/key version.

A question can have:

- provisional key;
- final key;
- changed key;
- annulled status.

Legal authority is time-versioned. Historical questions may have been valid under a law/jurisprudential state that later changed.

The future Authority Graph connects:

`question occurrence -> official bank key -> legal authority/version -> exam date`

This allows later detection of:

- historical-but-outdated questions;
- controversial items;
- differences in how banks operationalize the same legal topic;
- incidence by article/precedent.

## 10. Mini-QC is a measurement instrument

The local question runner is not just a quiz UI. Every response creates candidate telemetry.

Three modes are canonical:

### Learn
Feedback/explanation/intervention can appear after the answer.

### Validate
Prefer unseen questions; minimal feedback; use for more trustworthy mastery evidence.

### Exam
Timed exam conditions; feedback deferred until completion; scoring reproduces the target policy.

Minimum per-attempt telemetry:

- question/occurrence;
- selected response;
- blank/skipped/time-expired state;
- first response and final response when relevant;
- answer changed;
- response time;
- confidence 1-5 captured before reveal;
- first-seen / seen-count context;
- timestamp;
- correctness and score;
- answer-key and scoring-policy snapshot.

Confidence is important because `correct + low confidence` and `wrong + high confidence` are different learning states.

## 11. Error taxonomy

Candidate errors should remain low-friction but diagnostically useful. The broader taxonomy considered includes:

- knowledge;
- retrieval;
- interpretation;
- calculation;
- trap/distractor;
- attention;
- metacognition/confidence;
- time.

The initial UI can expose a simpler subset and map into richer categories later.

The goal is to identify cross-subject skill problems too. Repeated errors on negation, exceptions or conditionals across Portuguese/Law/Math may imply a transversal skill issue rather than separate subject weaknesses.

## 12. LEVEL benchmark — what was adopted conceptually

LEVEL was studied as a functional benchmark, especially its post-question experience.

Useful patterns adopted conceptually:

- question metadata visible and structured;
- official answer distinct from explanation;
- legal source/authority links;
- alternative-by-alternative analysis;
- explicit trap/pegadinha identification;
- contrast tables for confusable concepts;
- inline creation of memory material;
- adaptive study trail / `Today` orientation;
- FSRS-based memory scheduling;
- real edital weighting and subject breakdown.

Our intended improvement is adaptive explanation depth:

- correct + high confidence -> minimal feedback;
- correct + low confidence -> quick rule reinforcement;
- wrong + low confidence -> targeted explanation;
- wrong + high confidence -> deeper correction / Question Learning Packet.

The goal is not to copy LEVEL's screen literally. The goal is:

> question -> evidence about candidate -> exact amount/type of learning needed.

Gamification, community and generic SaaS features are intentionally deferred.

## 13. Question Learning Packet

A question may later receive an on-demand enrichment packet containing:

- official answer;
- decisive rule;
- authority/source;
- distractor analysis;
- trap pattern;
- contrastive unit;
- concept map;
- memory candidate;
- candidate-specific intervention.

This enrichment is not precomputed for 50,000 questions. It is generated or curated on demand for high-value questions, errors, recurring patterns or Historical Core topics.

## 14. Flashcards and FSRS

The project does not intend to rebuild Anki.

Flashcards/memory items share Atomic Tree nodes with questions and later use `py-fsrs` as the scheduler instead of a homegrown spaced-repetition algorithm.

Potential card types:

- basic;
- cloze;
- contrast;
- misconception.

Not every error becomes a flashcard. The intervention engine decides whether the problem is memory, conceptual understanding, application or distractor handling.

## 15. Knowledge Pipeline — practitioner methods without knowledge loss

A major future lane is ingesting long-form learning-method material, especially the user's owned course/material corpus (for example OQF/Rosemara and Paulo Benites), plus external learning-science sources.

A naive `transcript -> summary` pipeline is explicitly rejected because it is lossy.

The intended source-grounded pipeline is:

1. **Extraction** — exhaustive knowledge atoms by timestamp/page/chunk;
2. **Normalization** — relate repeated/overlapping atoms without deleting originals;
3. **Synthesis** — concept pages derived from traceable atoms;
4. **Operationalization** — turn theory into condition -> intervention -> protocol -> measurement;
5. **Coverage Audit** — every source segment maps to extracted knowledge or is explicitly marked uncovered.

Knowledge atom types include:

`principle, claim, mechanism, protocol, heuristic, example, counterexample, exception, warning, metric, decision_rule, exercise, case, evidence, definition, framework`

Canonical rule:

> NO SOURCE -> NO CANON.

Machine representation: JSONL. Human representation: Markdown canon/playbooks.

The goal is not to choose a guru. It is to decompose methods into interventions and compare them against evidence and personal outcomes.

## 16. Evidence framework

Evidence types must not collapse into one undifferentiated confidence score.

Practical case evidence (for example, real approval outcomes) and mechanistic scientific evidence answer different questions.

A working hierarchy for external evidence:

- A: meta-analysis/systematic review;
- B: multiple studies;
- C: isolated study;
- D: expert/practitioner;
- E: hypothesis/marketing.

The initial learning-science baseline supporting the system includes retrieval practice, spacing, successive relearning, feedback, desirable difficulties, calibration and the distinction between short-term performance and durable learning.

The repository's research docs should distinguish source-derived claims from engineering inference.

## 17. Personalized learning experiments

The long-term candidate model is allowed to learn which interventions work better for this specific candidate, but cautiously.

Potential N-of-1 comparisons use comparable topics and delayed probes (for example immediate, D+3, D+7, D+21 or adaptive intervals).

Current performance is not synonymous with durable learning. Retention probes and delayed mastery are future requirements.

## 18. Periodization

Preparation phase affects the optimal intervention mix. The conceptual phases are:

`Foundation -> Build -> Consolidation -> Specific Preparation -> Peak/Reta Final -> Taper`

Transitions should depend on time-to-exam, syllabus coverage, mastery evidence, fatigue and available time rather than fixed calendar rituals.

## 19. Scoring and confidence

Scoring policy is a plugin/versioned configuration rather than an assumption in question content.

For a generic gain/loss item, a response threshold can be reasoned from the scoring policy. In CEBRASPE-like +1/-1 settings, expected value depends strongly on calibrated probability of correctness.

The project must never infer answer-taking strategy from raw confidence labels alone. Confidence should be empirically calibrated over time using metrics such as Brier-style measures / calibration error when enough data exists.

## 20. Forecasting philosophy

The system may eventually forecast exam importance using signals such as:

- frequency;
- recency;
- syllabus similarity;
- temporal stability;
- bank/role similarity;
- structural recurrence;
- legal changes.

But advanced models must be backtested against simple baselines with held-out later exams and no leakage. Fancy ML on tiny exam histories is explicitly rejected unless it demonstrably improves prediction.

## 21. Donor repositories and implementation lessons

Repository archaeology identified:

### Examen — primary runner donor
Useful: FastAPI/HTMX/SQLite local-first shape, confidence capture, longitudinal history, migrations, artifact-as-contract.

### Exameow — primary import/practice donor
Useful: CSV/XLSX mapping, import preview/validation, practice-mode patterns, question-bank separation.

### py-fsrs
Use directly for later memory scheduling.

### Exam-Quiz-Test
Micro-UX reference only.

### DrillMCQ
UX inspiration only until licensing is unequivocally safe.

### TAO
Assessment-domain reference only; too large/GPL-heavy for the base architecture.

The project is not a wholesale fork of any donor.

## 22. Rejected / intentionally deferred directions

These were discussed and intentionally rejected or deferred:

- building a generic exam SaaS before proving personal decision value;
- auth/multi-user/community/payments/gamification in V0;
- React SPA when Jinja/HTMX is enough;
- PostgreSQL/cloud DB before SQLite proves insufficient;
- vector DB/agent swarm without measured need;
- deep learning on tiny exam counts;
- IRT/TRI before trustworthy item calibration data exists;
- scraping proprietary platforms as a core dependency;
- treating rereading/highlighting as default high-value learning interventions;
- showing the same deep explanation after every answered question;
- precomputing AI commentary for the entire corpus;
- treating platform/API data as more authoritative than official source assets;
- treating repeated imports as repeated exam evidence.

## 23. Source/privacy model

GitHub is the canonical source for code, architecture, schemas, manifests and non-sensitive canon.

Private/local by default:

- paid-course video/audio/raw transcripts;
- proprietary question-bank exports/dumps;
- API secrets;
- candidate performance DB;
- raw assets whose redistribution rights are unclear.

Cloud Codex should work on repository-contained, non-sensitive code/docs. Local VS Code/Codex is the preferred environment for proprietary corpora, private PDFs, secrets and candidate data.

## 24. Current implementation state

At the time of this context bridge:

Already implemented:

- repository architecture/documentation;
- `AGENTS.md` operating contract;
- SQLite migration runner;
- schema migrations through v2;
- staging JSON schemas;
- smoke tests for migrations/schema;
- M001 issue and branch.

Not yet implemented:

- production FastAPI app;
- Mini-QC UI;
- generic JSON/CSV/XLSX importer;
- Quest API adapter;
- PDF exam parser;
- answer-key parser;
- canonical loader end-to-end;
- candidate analytics/diagnosis runtime.

## 25. M001 — why it is the first implementation slice

M001 is intentionally narrow:

`real corpus -> staging -> quality gates/quarantine -> normalization/identity -> SQLite -> Mini-QC -> persisted attempt -> first basic diagnostic`

It proves all critical boundaries without prematurely building M002+ intelligence.

Acceptance includes:

- >=1,000 structured questions through staging;
- JSON/CSV/XLSX import path;
- Quest API adapter behind env credentials;
- one official VUNESP exam PDF;
- independent final answer-key PDF path;
- stimulus/media handling or quarantine;
- no silent parser failures;
- source duplicates and alternate forms do not inflate recurrence;
- legitimate cross-exam recurrence is preserved;
- local FastAPI/Jinja/HTMX question runner;
- answer/time/confidence/scoring persistence;
- first topic-level diagnostic.

## 26. How new agents should use this file

1. Read this once to understand project history, rationale and conceptual boundaries.
2. Then use `docs/README.md` to navigate normative domain specifications.
3. Use `docs/PROJECT_STATE.md` for current operational truth.
4. Use the active milestone spec and GitHub issue as the implementation contract.
5. If this context bridge conflicts with a newer normative domain doc/ADR, the newer normative document wins and this file should be updated.

The purpose of this file is context parity across ChatGPT, Codex Cloud, VS Code and future engineering sessions — not to create a second implementation specification.
