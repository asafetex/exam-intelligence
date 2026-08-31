# Canonical Documentation Map

This directory is the durable source of truth for Exam Intelligence. Chat history is design context; the repository is the executable memory of the project.

## Start here

| Need | Read |
|---|---|
| Recover the full conversation-level project context? | `PROJECT_CONTEXT_CANON.md` |
| Verify conversation → repository parity? | `CONTEXT_PARITY_AUDIT.md` |
| Start a fresh Codex/VS Code session? | `CODEX_CONTEXT_HANDOFF.md` |
| What is the project? | `PRODUCT_VISION.md` |
| What principles cannot drift? | `PROJECT_PRINCIPLES.md` |
| What is true right now? | `PROJECT_STATE.md` |
| What is the overall architecture? | `SYSTEM_ARCHITECTURE.md` |
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
| How will course/science knowledge be ingested? | `KNOWLEDGE_PIPELINE.md` |
| How do we grade evidence quality? | `EVIDENCE_FRAMEWORK.md` |
| Which interventions exist? | `INTERVENTION_LIBRARY.md` |
| How does preparation phase alter study? | `PERIODIZATION_ENGINE.md` |
| How do learning interventions work? | `LEARNING_INTELLIGENCE.md` |
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

## Documentation classes

### Context bridge
`PROJECT_CONTEXT_CANON.md` preserves the conversation-level rationale, examples, rejected paths and conceptual evolution that may not belong inside a narrow normative spec. `CONTEXT_PARITY_AUDIT.md` records whether material project decisions from ChatGPT are durably represented. These files exist so Codex/VS Code never require access to chat history.

### Canonical product/architecture
Normative. Implementation should conform or update the document via reviewed change.

### ADRs (`adr/`)
Why important choices were made. ADRs preserve reasoning even when later superseded.

### Benchmarks (`benchmarks/`)
What products/repositories do well and what is applicable. Benchmark findings are inputs, not automatic requirements.

### Research (`research/`)
Scientific/practitioner evidence. Claims preserve source/evidence strength and do not silently become product facts.

### Project state
`PROJECT_STATE.md` stays short, operational and current. It must not become a duplicate architecture document.
