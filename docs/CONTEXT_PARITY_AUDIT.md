# Context Parity Audit — Conversation + Learning Corpus vs Repository

**Initial audit:** 2026-08-31  
**Learning-OS extension:** 2026-09-01

Purpose: verify that material project context discussed in ChatGPT **and the recovered Batismo 2.0 / Masterclass Neurociência / scientific corpus** exists in durable repository form before Codex Cloud implements M001 and later Learning OS milestones.

## Audit method

The conversation and private source packages were treated as design/source history. The public repository was checked for durable representation of each material decision domain.

A domain is considered covered when either:
- a normative domain document exists; or
- the nuance/rationale is preserved in `PROJECT_CONTEXT_CANON.md` and linked to normative docs; or
- proprietary/full-text source material is intentionally excluded but a reviewed derived doctrine/evidence bridge exists.

This audit does **not** copy every sentence or paid source into Git. It preserves decisions, operating rules, rationale, examples, constraints, evidence distinctions, rejected directions and unresolved items that change engineering/product behavior.

## Core project parity

| Domain | Durable repository location | Status |
|---|---|---|
| North-star next-action thesis | `PRODUCT_VISION.md`, `PROJECT_PRINCIPLES.md`, `PROJECT_CONTEXT_CANON.md` | COVERED |
| PF strategic context + Paulínia/VUNESP lab | `PROJECT_CONTEXT_CANON.md` | COVERED |
| Universal item/scoring abstraction | `QUESTION_TAXONOMY.md`, `SCORING_POLICIES.md` | COVERED |
| Exam/Candidate/Learning/Decision intelligence loop | `SYSTEM_ARCHITECTURE.md`, root `README.md` | COVERED |
| Atomic Tree / edital verticalization | `ATOMIC_TREE_AND_SYLLABUS.md` | COVERED |
| Accuracy != mastery / coverage-aware evidence | `CANDIDATE_MODEL.md`, `MEASUREMENT_AND_METRICS.md` | COVERED |
| Source-agnostic import | `INGESTION_ENGINE.md`, `M001_FOUNDATION.md` | COVERED |
| Quest API / CSV / XLSX / JSON / PDFs | `INGESTION_ENGINE.md`, `M001_FOUNDATION.md` | COVERED |
| Staging / quality gates / quarantine | `INGESTION_ENGINE.md`, `TESTING_STRATEGY.md` | COVERED |
| Stimulus/media preservation | `DOMAIN_MODEL.md`, `INGESTION_ENGINE.md` | COVERED |
| Source duplicate vs caderno vs exact recurrence vs family | `QUESTION_IDENTITY_AND_RECURRENCE.md`, ADR 0003 | COVERED |
| PF 2021 vs PF 2025 exact repeat = real signal | `QUESTION_IDENTITY_AND_RECURRENCE.md`, `PROJECT_CONTEXT_CANON.md` | COVERED |
| Official bank key != universal truth | `LEGAL_AUTHORITY_GRAPH.md`, ADR 0004 | COVERED |
| Versioned provisional/final/annulled key | `DATA_MODEL.md`, `LEGAL_AUTHORITY_GRAPH.md` | COVERED |
| Mini-QC learn/validate/exam | `ASSESSMENT_ENGINE.md` | COVERED |
| Timer/confidence/first-final response/exposure | `ASSESSMENT_ENGINE.md`, `CANDIDATE_MODEL.md` | COVERED |
| LEVEL Question Learning Packet benchmark | `QUESTION_LEARNING_PACKET.md`, `benchmarks/LEVEL.md` | COVERED |
| FSRS as memory scheduler, not Anki clone | `FLASHCARDS_AND_FSRS.md`, ADR 0006 | COVERED |
| Donor repo archaeology | `DONOR_REPOS.md` | COVERED |
| Local-first/Codex Cloud/VS Code split | `DEV_WORKFLOW.md`, `CODEX_CONTEXT_HANDOFF.md` | COVERED |
| Public/private data boundary | `DATA_GOVERNANCE.md`, `SECURITY.md`, ADR 0008 | COVERED |

## Batismo 2.0 parity — 11 transcript-derived lessons

| Recovered Batismo domain | Repository location | Status |
|---|---|---|
| Primary target + source/material validation | `LEARNING_OPERATING_SYSTEM.md`, `BATISMO_MASTERCLASS_INTEGRATION.md` | COVERED |
| Basic formation `80/20` | `LEARNING_OPERATING_SYSTEM.md`, `PERIODIZATION_ENGINE.md` | COVERED |
| Basic formation `20/80` | same | COVERED |
| Ratios as dominant allocation, not rigid minutes | `LEARNING_OPERATING_SYSTEM.md`, `AGENTS.md` | COVERED |
| Formation-duration ambiguity / evidence-driven exit | `PERIODIZATION_ENGINE.md` | COVERED |
| D1…Dn = weakness + exam leverage | `PERIODIZATION_ENGINE.md`, `DECISION_ENGINE.md` | COVERED |
| Keep relevant disciplines alive | `PERIODIZATION_ENGINE.md`, `AGENTS.md` | COVERED |
| Error taxonomy + cause-specific action | `ERROR_TAXONOMY.md`, `LEARNING_INTELLIGENCE.md` | COVERED |
| Adaptive review instead of universal 7/14/21 rereading | `LEARNING_OPERATING_SYSTEM.md`, `SCIENTIFIC_LEARNING_CANON.md` | COVERED |
| Individuality / overload / continuity / specificity / variability | `PERIODIZATION_ENGINE.md` | COVERED |
| Mesocycle 40–50% differential target template | `PERIODIZATION_ENGINE.md` | COVERED |
| Five-week mesocycle ambiguity preserved | `PERIODIZATION_ENGINE.md` | COVERED |
| Surprise-subject / edital urgency strategy | `LEARNING_OPERATING_SYSTEM.md`, `ROADMAP.md` | COVERED |
| ~50-day final sprint template | `PERIODIZATION_ENGINE.md` | COVERED |
| ~10-day countdown template | `PERIODIZATION_ENGINE.md` | COVERED |
| Optimized reading + questions as acquisition/retrieval axes | `BATISMO_MASTERCLASS_INTEGRATION.md` | COVERED |
| Long summary / copy-every-error / indiscriminate flashcards not defaults | `LEARNING_INTELLIGENCE.md`, `BATISMO_MASTERCLASS_INTEGRATION.md` | COVERED |
| Full simulation + post-test autopsy | `LEARNING_OPERATING_SYSTEM.md`, `DECISION_ENGINE.md` | COVERED |
| State machine `intake → ... → post_exam` | `LEARNING_OPERATING_SYSTEM.md`, `PERIODIZATION_ENGINE.md` | COVERED |

## Masterclass Neurociência parity — 6 transcript-derived lessons

| Recovered Masterclass domain | Repository location | Status |
|---|---|---|
| Focus as exclusion / one primary target | `LEARNING_OPERATING_SYSTEM.md`, `AGENTS.md` | COVERED |
| Readiness / sleep / alertness context | `LEARNING_OPERATING_SYSTEM.md`, `LEARNING_TELEMETRY.md` | COVERED |
| Quality/focused time > seated hours | `LEARNING_TELEMETRY.md` | COVERED |
| Challenge-skill calibration | `LEARNING_OPERATING_SYSTEM.md`, `LEARNING_INTELLIGENCE.md` | COVERED |
| Flow only via observable proxies | `LEARNING_OPERATING_SYSTEM.md`, `AGENTS.md` | COVERED |
| Active attempt/retrieval > passive repetition default | `SCIENTIFIC_LEARNING_CANON.md`, `LEARNING_INTELLIGENCE.md` | COVERED |
| Error = routing information | `LEARNING_INTELLIGENCE.md` | COVERED |
| Immediate informative feedback | `SCIENTIFIC_LEARNING_CANON.md`, `QUESTION_LEARNING_PACKET.md` | COVERED |
| Visible proximal progress | `DECISION_ENGINE.md`, `LEARNING_INTELLIGENCE.md` | COVERED |
| Stable cue + minimum start / habit architecture | `LEARNING_OPERATING_SYSTEM.md` | COVERED |
| Frustration/procrastination as diagnosable system state | `LEARNING_INTELLIGENCE.md`, `LEARNING_TELEMETRY.md` | COVERED |
| Progressive variation/habituation response | `LEARNING_OPERATING_SYSTEM.md`, `PERIODIZATION_ENGINE.md` | COVERED |
| Recovery without sleep sacrifice | `AGENTS.md`, `SCIENTIFIC_LEARNING_CANON.md` | COVERED |
| No supplement/medication/clinical automation | `AGENTS.md`, ADR 0010 | COVERED |

## OQF / protocol parity

| Recovered OQF domain | Repository location | Status |
|---|---|---|
| Behavior target + cue + minimum/normal/progression | `LEARNING_OPERATING_SYSTEM.md` | COVERED |
| 30 days as experimental/admin window, not magic habit deadline | `LEARNING_OPERATING_SYSTEM.md`, `SCIENTIFIC_LEARNING_CANON.md` | COVERED |
| Baseline → execution → specificity → retest | `LEARNING_OPERATING_SYSTEM.md`, `DECISION_ENGINE.md` | COVERED |
| Safe pressure simulation | `BATISMO_MASTERCLASS_INTEGRATION.md`, `AGENTS.md` | COVERED |
| Output metrics beyond hours | `LEARNING_TELEMETRY.md` | COVERED |
| End-cycle `maintain/adapt/replace/investigate/progress` | `LEARNING_INTELLIGENCE.md` | COVERED |

## Scientific-pack parity — 19 audited artifacts

| Evidence issue | Repository location | Status |
|---|---|---|
| E01–E04 dopamine/value/effort nuance | `research/MASTERCLASS_SCIENTIFIC_PACK.md`, `SCIENTIFIC_LEARNING_CANON.md` | COVERED |
| “more dopamine” not universal | same | COVERED |
| E05 mislabeled artifact detected | `research/MASTERCLASS_SCIENTIFIC_PACK.md`, `EVIDENCE_FRAMEWORK.md` | COVERED |
| E08 habit variability / 66-days caveat | `SCIENTIFIC_LEARNING_CANON.md` | COVERED |
| E09 sleep deprivation/effort | same | COVERED |
| E10 contextual attention/working-memory support without diagnosis | same | COVERED |
| E11 reward-prediction-error translated to feedback loop | same | COVERED |
| E12 physical activity evidence contextual, not fixed BDNF recipe | same | COVERED |
| E13 placeholder-only source detected | `research/MASTERCLASS_SCIENTIFIC_PACK.md`, `EVIDENCE_FRAMEWORK.md` | COVERED |
| E14/E17 habit circuitry context | `research/MASTERCLASS_SCIENTIFIC_PACK.md` | COVERED |
| E15 pharmacological evidence kept clinical | same + `AGENTS.md` | COVERED |
| E18 addiction not equated to study | same | COVERED |
| E19 creatine outside core Learning OS | same | COVERED |

## Broader learning-science parity

| Learning-science domain | Repository location | Status |
|---|---|---|
| Retrieval practice | `SCIENTIFIC_LEARNING_CANON.md` | COVERED |
| Distributed practice/spacing | same | COVERED |
| Successive relearning | same | COVERED |
| Corrective feedback | same | COVERED |
| Generation/pretesting | same | COVERED |
| Elaboration | same | COVERED |
| Interleaving/discrimination | same | COVERED |
| Performance != learning | same + `MEASUREMENT_AND_METRICS.md` | COVERED |
| Confidence/calibration | same + `CANDIDATE_MODEL.md` | COVERED |
| Answer-changing telemetry | same + `ASSESSMENT_ENGINE.md` | COVERED |
| Sleep/recovery | same | COVERED |

## Evidence-model parity

The project now explicitly distinguishes:
- practitioner protocol evidence;
- practitioner outcome evidence;
- scientific intervention evidence;
- neuroscience/mechanism evidence;
- candidate-local evidence.

This distinction is canonical in `EVIDENCE_FRAMEWORK.md` and ADR 0010.

This resolves an important failure mode: treating a program's real-world success history as worthless because some mechanistic explanation is incomplete, or treating a mechanistic paper as proof that an entire exam protocol causes approvals.

## Runtime/schema parity

Learning doctrine is not only documentation:
- schema v3 adds `learning_intervention`;
- schema v3 adds optional 1:1 `study_context` with phase, goal, low-friction readiness/task context, intervention lineage, completion and next action;
- M001 tests/spec now include these hooks while keeping full adaptive Learning OS out of M001 scope.

See `DATA_MODEL.md`, migration `0003_learning_os_hooks.sql` and `M001_FOUNDATION.md`.

## Remaining private-source context by design

The following should **not** be copied into the public repository merely for literal parity:
- paid-course full transcripts/videos;
- copyrighted scientific full texts where redistribution rights are absent;
- private candidate performance data;
- proprietary question-bank dumps;
- credentials/secrets;
- unrelated personal history;
- conversational filler that does not change product behavior.

## Remaining evidence work — not a context gap

These are future evidence improvements, not missing architectural understanding:
1. attach auditable cohort/outcome provenance to numeric practitioner claims such as total approvals when source records are available;
2. import reviewed machine-readable technique/claim registries where rights permit;
3. continue adding direct learning-science evidence by intervention;
4. collect the candidate's own intervention/delayed-outcome evidence.

## Confidence statement

As of 2026-09-01, all material engineering/product decisions presently recovered from the Exam Intelligence conversation plus the Batismo 2.0 / Masterclass Neurociência / OQF / scientific packages are represented durably either:
- normatively in domain/Learning OS documentation;
- contextually in `PROJECT_CONTEXT_CANON.md`;
- or as a public-safe evidence bridge where the raw source must remain private.

Absolute literal transcript equivalence is neither claimed nor desirable. **Project-decision + learning-doctrine parity is the target, and this audit considers it achieved.**
