# Canonical Documentation Map

This directory is the durable source of truth for Exam Intelligence. Chat history is design context; the repository is the executable memory of the project.

## Start here

| Need | Read |
|---|---|
| Recover the full conversation-level project context? | `PROJECT_CONTEXT_CANON.md` |
| Verify conversation/source → repository parity? | `CONTEXT_PARITY_AUDIT.md` |
| Start a fresh Codex/VS Code session? | `CODEX_CONTEXT_HANDOFF.md` |
| What is the project? | `PRODUCT_VISION.md` |
| What principles cannot drift? | `PROJECT_PRINCIPLES.md` |
| What is true right now? | `PROJECT_STATE.md` |
| What is the overall architecture? | `SYSTEM_ARCHITECTURE.md` |
| **What learning doctrine controls the product?** | **`LEARNING_OPERATING_SYSTEM.md`** |
| How are Batismo 2.0 and Masterclass Neurociência combined? | `BATISMO_MASTERCLASS_INTEGRATION.md` |
| What does the scientific learning evidence imply operationally? | `SCIENTIFIC_LEARNING_CANON.md` |
| What learning/readiness telemetry do we preserve? | `LEARNING_TELEMETRY.md` |
| How should code modules be organized? | `IMPLEMENTATION_MAP.md` |
| What entities exist and why? | `DOMAIN_MODEL.md` + `DATA_MODEL.md` |
| How does corpus ingestion work? | `INGESTION_ENGINE.md` |
| How do duplicate/repeated questions work? | `QUESTION_IDENTITY_AND_RECURRENCE.md` |
| How are question structures/distractors modeled? | `QUESTION_TAXONOMY.md` |
| How is the edital represented? | `ATOMIC_TREE_AND_SYLLABUS.md` |
| How does scoring differ by exam? | `SCORING_POLICIES.md` |
| How does Mini-QC work? | `ASSESSMENT_ENGINE.md` |
| What do we infer about the candidate? | `CANDIDATE_MODEL.md` |
| How are candidate errors classified? | `ERROR_TAXONOMY.md` |
| How are private course/science sources ingested losslessly? | `KNOWLEDGE_PIPELINE.md` |
| How do we distinguish practitioner outcomes, intervention evidence and mechanisms? | `EVIDENCE_FRAMEWORK.md` |
| Which intervention families exist? | `INTERVENTION_LIBRARY.md` + `LEARNING_INTELLIGENCE.md` |
| How does Batismo phase alter study? | `PERIODIZATION_ENGINE.md` |
| What ultimately chooses the next action? | `DECISION_ENGINE.md` |
| What is the rich post-question model? | `QUESTION_LEARNING_PACKET.md` |
| How do banks differ? | `BANK_DNA.md` |
| How is legal authority/version handled? | `LEGAL_AUTHORITY_GRAPH.md` |
| How will flashcards work? | `FLASHCARDS_AND_FSRS.md` |
| Which metrics are valid? | `MEASUREMENT_AND_METRICS.md` |
| What exactly is M001? | `M001_FOUNDATION.md` |
| What comes next? | `ROADMAP.md` |
| What can go wrong? | `RISK_REGISTER.md` |
| How are we testing it? | `TESTING_STRATEGY.md` |
| What terms mean? | `GLOSSARY.md` |

## Learning-OS research map

The private source corpus is richer than what can legally/safely live in a public repository. The public repo therefore contains **derived, auditable doctrine**, not paid transcripts/full scientific text.

Key research bridge:
- `research/MASTERCLASS_SCIENTIFIC_PACK.md` — project-safe audit of the recovered 19-document Masterclass scientific pack, including source-integrity defects and permitted operational translations;
- `SCIENTIFIC_LEARNING_CANON.md` — broader learning-science canon for retrieval, spacing, feedback, elaboration, interleaving, metacognition, sleep and related product rules;
- `research/LEARNING_SCIENCE_BASELINE.md` — earlier background/reference research where relevant;
- `EVIDENCE_FRAMEWORK.md` — how practitioner outcome history, protocol evidence, scientific intervention evidence, mechanism evidence and candidate-local evidence coexist.

## Normative precedence for learning behavior

When a learning/session implementation is ambiguous, read in this order:

1. `AGENTS.md` safety/hard rules;
2. `LEARNING_OPERATING_SYSTEM.md`;
3. `BATISMO_MASTERCLASS_INTEGRATION.md`;
4. `SCIENTIFIC_LEARNING_CANON.md` + `EVIDENCE_FRAMEWORK.md`;
5. domain-specific docs (`PERIODIZATION_ENGINE.md`, `LEARNING_INTELLIGENCE.md`, `DECISION_ENGINE.md`, etc.);
6. relevant ADRs, especially `0009` and `0010`;
7. active milestone/issue for scope.

The active milestone can restrict **what is implemented now**, but it must not silently contradict the frozen Learning OS.

## Documentation classes

### Context bridge
`PROJECT_CONTEXT_CANON.md` preserves conversation-level rationale, examples, rejected paths and conceptual evolution that may not belong inside a narrow normative spec. `CONTEXT_PARITY_AUDIT.md` records whether material project decisions and recovered learning doctrine are durably represented. These files exist so Codex/VS Code never require access to chat history.

### Canonical product/architecture
Normative. Implementation should conform or update the document via reviewed change.

### Learning Operating System
Normative for study behavior and intervention selection. Batismo 2.0 and Masterclass Neurociência are first-class practitioner design authorities, refined by scientific and candidate evidence rather than treated as optional content.

### ADRs (`adr/`)
Why important choices were made. ADRs preserve reasoning even when later superseded.

### Benchmarks (`benchmarks/`)
What products/repositories do well and what is applicable. Benchmark findings are inputs, not automatic requirements.

### Research (`research/`)
Scientific/practitioner evidence. Claims preserve source/evidence strength and do not silently become product facts.

### Project state
`PROJECT_STATE.md` stays short, operational and current. It must not become a duplicate architecture document.
