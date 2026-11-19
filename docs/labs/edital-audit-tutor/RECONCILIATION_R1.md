# Crosswalk R1: existing Exam Intelligence vs. experimental Lab
Date: 2026-11-19. Scope: documentation and selective repository reading, **no runtime tests**.
This file does not amend the normative documents under docs/ or the M001 execution branch.

## Existing authority and implementation boundary
The main repository already has design documents for ingestion, official exam identity, question occurrence, Atomic Tree, assessment, error taxonomy, candidate telemetry, Learning Alert/Remediation, Decision Engine and question learning packets.
The active M001 aims to prove an end-to-end structured import, one official VUNESP exam/key, Mini-QC and first persisted attempt; later behavior is not claimed functional merely because it is described.
All future contributions must first read AGENTS.md, docs/CODEX_CONTEXT_HANDOFF.md, docs/PROJECT_STATE.md and relevant design docs, resolve ADR conflicts, and verify local tests.

## Feature-to-owner crosswalk
Status legend: REUSE_DESIGN = concept documented; EXTEND = specific subfeature still proposed; LATER = deferred by M001; EXTERNAL_REVIEW = external local adapter not verified here; NEW_SPEC = no implementation proof.

| LAB feature | Existing reference | Proposed disposition |
| --- | --- | --- |
| F001 official edital/version ingest | ATOMIC_TREE_AND_SYLLABUS; M002 | REUSE_DESIGN, EXTEND parser/version QA |
| F002 Atomic Tree and skills | ATOMIC_TREE_AND_SYLLABUS | REUSE_DESIGN, no second taxonomy |
| F003 source/course coverage audit | LEARNING_OPERATING_SYSTEM material validation | EXTEND claim-to-atom QA |
| F004 official and structured question ingest | INGESTION_ENGINE; M001 | M001_TARGET, validate actual running code |
| F005 bank DNA/recurrence | QUESTION_IDENTITY_AND_RECURRENCE; BANK_DNA | LATER, keep synthetic out |
| F006 authored-question generator | provenance concepts | NEW_SPEC, QA before use |
| F007 adversarial prepublication audit | ingestion staging/quarantine design | EXTEND semantic and legal QA |
| F008 official annulment vs suspicion | key-version rules | EXTEND provenance-specific cases |
| F009 repairs with lineage | append/version policies | NEW_SPEC, independent re-review |
| F010 user appeals | none established | NEW_SPEC, review lifecycle |
| F011 bank scan/10x heuristic | target historical evidence | EXTEND, not mastery evidence |
| F012 learner adaptive scan | M001 descriptive diagnostic | LATER, sufficiency/information gain |
| F013 observed-error engine | ERROR_TAXONOMY; LEARNING_ALERT_ENGINE | REUSE_DESIGN, M001 only schema hook |
| F014 directed intervention | DECISION_ENGINE; LEARNING_OS | REUSE_DESIGN, execution later |
| F015 dashboard with uncertainty | MEASUREMENT_AND_METRICS | REUSE_DESIGN, no fake calibrated mastery |
| F016 reusable Tutor interface | intervention/learning contracts | EXTERNAL_REVIEW, no duplicate owner |
| F017 authorized course-to-teacher | external course ETL adapter candidate | EXTERNAL_REVIEW, no copy in public repo |
| F018 read-only federation | repo sources and existing ownership | NEW_SPEC, enforce Reader technically |
| F019 QA/release and replay | AGENTS; M001 tests | REUSE_DESIGN, lab runtime not tested |
| F020 learning by doing | user collaboration requirement | documented practice, no implicit competence |
| F021 exam simulator blueprint | ASSESSMENT_ENGINE exam mode; scoring | EXTEND full form assembler |
| F022 simulator longitudinal telemetry | MEASUREMENT; DECISION_ENGINE | EXTEND by blueprint/version |
| F023 personal Gold notes from questions | QUESTION_LEARNING_PACKET | EXTEND with existing Q owner |
| F024 bought/ready summaries | source validation + separate editorial owner | EXTERNAL_REVIEW, no assumed coverage |
| F025 active directed study | interventions and Learning OS | EXTEND explicit research tasks |
| F026 hybrid personal study book | Gold proposals/personal notes | NEW_SPEC; owner ADR |
| F027 essay/rubric module | future numeric/free hooks only | DEFER pending user-provided skeleton |
| F028 author/books/text-source intelligence | bank/evidence context | RESEARCH, no unsupported predictions |
| F029 simulation cadence by exam phase | Batismo periodization/simulation | EXTEND, configurable not fixed |
| F030 retention/longitudinal mastery | candidate and metrics/alert contracts | REUSE_DESIGN, calibrated claims later |

## Major conflicts / ADRs needed
1. Lab one-tap flow with optional declared confidence vs M001/AGENTS pre-feedback 1–5 requirement. Preserve existing events and schema; change requires accepted ADR and migration/tests.
2. CSV is transport/staging for experimental imports; existing SQLite v4 remains canonical operational DB.
3. Tutor owns pedagogy only; consumers own facts, evaluation, assessment and learner state. External adapters are not connected.
4. Simulator needs a source-grounded form blueprint; authored challenge items cannot be sold as calibrated exam mirrors.
5. Paid third-party summaries and comments require license/rights validation; do not treat purchase as proof of syllabus coverage.
6. Local scraper v2 documented by user is a candidate external provider; code/checkout/remotes must be inspected locally, not assumed present here.

## Release boundary
This research branch intentionally changes only lab documentation. No branch merge, API, database migration, privileged federation, question generation or test pass is implied.
Next: produce one ADR for ownership/confidence, inspect local source checkouts, then pilot one authenticated syllabus slice with 5–10 authored items and independent QA.
