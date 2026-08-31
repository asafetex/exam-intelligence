# Context Parity Audit — ChatGPT Conversation vs Repository

Date: 2026-08-31

Purpose: verify that material project context discussed in ChatGPT exists in durable repository form before Codex Cloud implements M001.

## Audit method

The conversation was treated as design history. The repository was checked for durable representation of each material decision domain. A domain is considered covered when either:

- a normative domain document exists; or
- the nuance/rationale is preserved in `PROJECT_CONTEXT_CANON.md` and linked to normative docs.

This audit does **not** attempt to copy every sentence from chat. It preserves decisions, rationale, examples, constraints, rejected directions and unresolved items relevant to engineering/product behavior.

## Parity matrix

| Conversation domain | Durable repository location | Status |
|---|---|---|
| North-star next-action thesis | `PRODUCT_VISION.md`, `PROJECT_PRINCIPLES.md`, `PROJECT_CONTEXT_CANON.md` | COVERED |
| PF strategic context + Paulínia/VUNESP lab | `PROJECT_CONTEXT_CANON.md` | COVERED |
| Universal item abstraction across CEBRASPE/VUNESP/FGV | `QUESTION_TAXONOMY.md`, `SCORING_POLICIES.md`, context canon | COVERED |
| Four intelligence domains: Exam/Candidate/Learning/Decision | `SYSTEM_ARCHITECTURE.md`, `PRODUCT_VISION.md`, context canon | COVERED |
| Atomic Tree and edital verticalization | `ATOMIC_TREE_AND_SYLLABUS.md` | COVERED |
| Accuracy != mastery / coverage-aware mastery | `CANDIDATE_MODEL.md`, `MEASUREMENT_AND_METRICS.md` | COVERED |
| Source-agnostic import architecture | `INGESTION_ENGINE.md` | COVERED |
| Quest API / CSV / XLSX / JSON / public datasets | `INGESTION_ENGINE.md`, `M001_FOUNDATION.md` | COVERED |
| Official PDF + independent answer-key ingestion | `INGESTION_ENGINE.md`, `M001_FOUNDATION.md` | COVERED |
| Staging, quality gates, quarantine, no silent failure | `INGESTION_ENGINE.md`, `TESTING_STRATEGY.md` | COVERED |
| Rich stimulus/media preservation | `DOMAIN_MODEL.md`, `INGESTION_ENGINE.md` | COVERED |
| Source duplicate vs alternate form vs exact recurrence vs semantic family | `QUESTION_IDENTITY_AND_RECURRENCE.md`, ADR 0003, context canon | COVERED |
| PF 2021 vs PF 2025 repeated-question nuance | `QUESTION_IDENTITY_AND_RECURRENCE.md`, context canon | COVERED |
| Recurrence as signal, not certainty | `BANK_DNA.md`, `PROJECT_PRINCIPLES.md`, context canon | COVERED |
| Official bank key != universal truth | `LEGAL_AUTHORITY_GRAPH.md`, ADR 0004 | COVERED |
| Provisional/final/changed/annulled keys | `LEGAL_AUTHORITY_GRAPH.md`, `DOMAIN_MODEL.md` | COVERED |
| Time-versioned law/jurisprudence | `LEGAL_AUTHORITY_GRAPH.md` | COVERED |
| Bank-specific interpretation/DNA | `BANK_DNA.md`, context canon | COVERED |
| Mini-QC learn/validate/exam modes | `ASSESSMENT_ENGINE.md` | COVERED |
| Timer, confidence, first/final answer, seen-count telemetry | `ASSESSMENT_ENGINE.md`, `CANDIDATE_MODEL.md` | COVERED |
| Confidence calibration and confident-wrong | `CANDIDATE_MODEL.md`, `MEASUREMENT_AND_METRICS.md` | COVERED |
| Error taxonomy | `ERROR_TAXONOMY.md` | COVERED |
| Question Learning Packet / LEVEL post-question benchmark | `QUESTION_LEARNING_PACKET.md`, `benchmarks/LEVEL.md` | COVERED |
| Adaptive explanation depth | `QUESTION_LEARNING_PACKET.md`, context canon | COVERED |
| Distractor/Trap DNA | `BANK_DNA.md`, `QUESTION_TAXONOMY.md` | COVERED |
| Inline note/flashcard/misconception capture | `QUESTION_LEARNING_PACKET.md`, `FLASHCARDS_AND_FSRS.md` | COVERED |
| FSRS instead of rebuilding Anki | `FLASHCARDS_AND_FSRS.md`, ADR 0006 | COVERED |
| Lossless OQF/Benites knowledge pipeline | `KNOWLEDGE_PIPELINE.md`, context canon | COVERED |
| Knowledge atoms + source lineage + coverage audit | `KNOWLEDGE_PIPELINE.md` | COVERED |
| Evidence levels and claim/source separation | `EVIDENCE_FRAMEWORK.md` | COVERED |
| Learning-science baseline | `research/LEARNING_SCIENCE_BASELINE.md` | COVERED |
| Intervention-by-diagnosis philosophy | `INTERVENTION_LIBRARY.md`, `LEARNING_INTELLIGENCE.md` | COVERED |
| N-of-1 personalized learning experiments | `LEARNING_INTELLIGENCE.md`, context canon | COVERED |
| Periodization phases | `PERIODIZATION_ENGINE.md` | COVERED |
| Decision Engine / Today queue | `DECISION_ENGINE.md` | COVERED |
| Advanced forecast must beat simple baseline / no leakage | `BANK_DNA.md`, context canon | COVERED |
| IRT/TRI deferred until calibrated | ADR 0007, `MEASUREMENT_AND_METRICS.md` | COVERED |
| Donor repo archaeology | `DONOR_REPOS.md` | COVERED |
| LEVEL benchmark | `benchmarks/LEVEL.md` | COVERED |
| Local-first Python/FastAPI/HTMX/SQLite stack | ADR 0002, `SYSTEM_ARCHITECTURE.md` | COVERED |
| GitHub + Codex Cloud + VS Code operating model | `DEV_WORKFLOW.md`, context canon | COVERED |
| Private/proprietary corpora outside public Git | `DATA_GOVERNANCE.md`, ADR 0008, `SECURITY.md` | COVERED |
| M001 vertical slice and explicit non-goals | `M001_FOUNDATION.md`, issue #1, `PROJECT_STATE.md` | COVERED |
| Roadmap M002+ | `ROADMAP.md`, `IMPLEMENTATION_MAP.md` | COVERED |
| Risks, tests, glossary | `RISK_REGISTER.md`, `TESTING_STRATEGY.md`, `GLOSSARY.md` | COVERED |

## Gaps found during this audit

Before this bridge, the repository already had the architecture and requirements but some **conversation-native rationale** was scattered across multiple domain docs. The following were strengthened by adding `PROJECT_CONTEXT_CANON.md`:

1. why PF and Paulínia both matter to the architecture;
2. the explicit PF 2021/PF 2025 recurrence example and why repeated official occurrence is signal, not noise;
3. the reason a 50k-question corpus is raw material rather than product value;
4. the distinction between practitioner success evidence and mechanistic scientific evidence;
5. the intended adaptive explanation-depth behavior inspired by LEVEL;
6. the explicit rejection history: generic SaaS, premature IRT, deep ML on tiny histories, full Anki clone, indiscriminate AI enrichment, proprietary scraping dependency;
7. the desired split between Cloud Codex and local/private execution;
8. the original conceptual evolution from question bank to exam/candidate/learning/decision intelligence loop.

These gaps are now represented durably.

## Remaining non-repository context by design

The following should **not** be copied into the public repository merely to achieve “100% chat parity”:

- unrelated personal history;
- private credentials;
- paid-course raw content;
- proprietary question-bank dumps;
- candidate private performance data;
- raw copyrighted materials where redistribution rights are unclear;
- conversational filler that does not change project behavior.

## Confidence statement

After this audit, all material project decisions presently known from the conversation are represented either normatively in domain documentation or contextually in `PROJECT_CONTEXT_CANON.md`.

This is stronger than transferring a raw chat transcript because:

- decisions are indexed by domain;
- contradictions have a precedence rule;
- sensitive content is excluded;
- Codex can read stable files repeatedly;
- future sessions do not depend on ChatGPT conversation availability.

Absolute literal 100% transcript equivalence is neither claimed nor desirable. **Project-decision parity is the target, and this audit considers it achieved as of the date above.**
