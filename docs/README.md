# Canonical Documentation Map

This directory is the durable source of truth for Exam Intelligence. The chat history is design context; the repository is the executable memory of the project.

## Start here

| Need | Read |
|---|---|
| What is the project? | `PRODUCT_VISION.md` |
| What principles cannot drift? | `PROJECT_PRINCIPLES.md` |
| What is true right now? | `PROJECT_STATE.md` |
| What is the overall architecture? | `SYSTEM_ARCHITECTURE.md` |
| What entities exist and why? | `DOMAIN_MODEL.md` + `DATA_MODEL.md` |
| How does corpus ingestion work? | `INGESTION_ENGINE.md` |
| How do duplicate/repeated questions work? | `QUESTION_IDENTITY_AND_RECURRENCE.md` |
| How is the edital represented? | `ATOMIC_TREE_AND_SYLLABUS.md` |
| How does Mini-QC work? | `ASSESSMENT_ENGINE.md` |
| What do we infer about the candidate? | `CANDIDATE_MODEL.md` |
| How will course/science knowledge be ingested? | `KNOWLEDGE_PIPELINE.md` |
| How do interventions/periodization work? | `LEARNING_INTELLIGENCE.md` |
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

### Canonical product/architecture
Normative. Implementation should conform or update the document via reviewed change.

### ADRs (`adr/`)
Why important choices were made. ADRs preserve the reasoning even if a later ADR supersedes the decision.

### Benchmarks (`benchmarks/`)
What products/repositories do well and what is applicable. Benchmark findings are **inputs**, not automatic requirements.

### Research (`research/`)
Scientific/practitioner evidence. Research claims must preserve source/evidence strength and should not silently become product facts.

### Project state
`PROJECT_STATE.md` stays short, operational and current. It must not become a duplicate architecture document.
