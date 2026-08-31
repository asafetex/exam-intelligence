# Exam Intelligence

> Local-first intelligence system for competitive-exam preparation. It converts exam evidence, candidate behavior and learning-science rules into the best next study action.

**Status:** V0 architecture frozen · **Active milestone:** M001 — Corpus In → First Attempt Out · **Primary runtime:** Python + FastAPI + Jinja/HTMX + SQLite

## Why this exists

Most exam platforms optimize for content access, question volume, dashboards or engagement. Exam Intelligence optimizes for a different question:

> **What should the candidate study now, for how long, with which intervention, and why?**

The system is designed as a closed evidence loop:

```text
TARGET EXAM
    ↓
Edital + Atomic Tree + historical exams + Bank DNA
    ↓
QUESTION CORPUS
    ↓
Candidate answers + time + confidence + repetition history
    ↓
CANDIDATE MODEL
    ↓
Gap / retention / interpretation / trap / calibration diagnosis
    ↓
LEARNING INTERVENTION
    ↓
New evidence
    ↓
DECISION ENGINE
    ↺
```

The end product is not a generic dashboard. The end product is a defensible **Today** queue: what to study, how, for how long, and why that activity has the highest expected return.

## Core product domains

| Domain | Canonical question | Main evidence |
|---|---|---|
| **Exam Intelligence** | What matters on the target exam? | edital, Atomic Tree, bank, role, organ, year, recurrence, scoring policy, legal/version context |
| **Candidate Intelligence** | What does the candidate actually demonstrate? | correctness, score, time, confidence, novelty, coverage, retention, answer changes, error taxonomy |
| **Learning Intelligence** | Which intervention is most likely to fix the diagnosed state? | Learning Canon, OQF/Benites corpus, retrieval/spacing evidence, personal experiments |
| **Decision Intelligence** | Where should the next hour go? | exam importance × mastery gap × coverage need × retention × time-to-exam × intervention value |

## Architectural thesis

```text
                    EXAM INTELLIGENCE
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
   KNOWLEDGE ENGINE   EXAM ENGINE     CANDIDATE ENGINE
          │                │                │
          └────────────────┼────────────────┘
                           ▼
                    DECISION ENGINE
                           │
                           ▼
                 O QUE FAZER AGORA?
```

The project is **source-agnostic**. Quest API, CSV/XLSX/JSON, official PDFs, answer-key PDFs, public datasets and manually created questions all pass through adapters into the same staging contract and canonical model.

## Non-negotiable semantics

- **Question identity ≠ exam occurrence ≠ presentation.**
- **Source duplication ≠ historical recurrence.** The same PF 2025 question imported twice is one occurrence; the same canonical question appearing in PF 2021 and PF 2025 is two legitimate historical signals.
- **Official bank key ≠ universal truth.** It records what counted for that bank, exam and key version.
- **Accuracy ≠ mastery.** Mastery is coverage-aware and must consider novelty, sample size, recency, confidence and retention.
- **Generated questions never contaminate official Bank DNA.**
- **Historical frequency is evidence, not certainty.**
- **Raw sources and provenance are immutable.**
- **Legal authority is time-versioned.** Historical questions must be interpreted against the legal/jurisprudential context valid at the exam date.

## What V0 contains

V0 freezes the structural contracts needed so future features can be appended rather than requiring a redesign:

- source registry and rights/provenance metadata;
- structured and document ingestion contracts;
- staging + quality gates + quarantine ledger;
- canonical exam / exam-form / question / occurrence / option model;
- independent provisional/final/changed/annulled answer-key history;
- versioned question identity and presentation hashing;
- rich stimulus/media references;
- Atomic Tree and source-faithful syllabus mapping hooks;
- assessment sessions with reproducible ordering/scoring snapshots;
- candidate attempts with answer, blank/skip status, time, confidence and correctness;
- Authority Graph hooks;
- question-family/recurrence hooks;
- memory/FSRS hooks;
- ordered SQLite migrations and backup rules.

## M001 — Corpus In → First Attempt Out

M001 proves one vertical slice end-to-end:

```text
1,000+ structured questions + 1 official VUNESP exam/key
                         ↓
               adapters / PDF parser
                         ↓
                   staging JSON
                         ↓
            quality gates + quarantine
                         ↓
              normalize / identity
                         ↓
                      SQLite
                         ↓
               FastAPI Mini-QC
                         ↓
        answer + timer + confidence
                         ↓
                persisted attempt
                         ↓
             first topic diagnosis
```

The GitHub acceptance criteria live in issue **#1** and `docs/M001_FOUNDATION.md`.

## Repository map

```text
exam-intelligence/
├── AGENTS.md                    # hard rules for Codex/agents
├── README.md                    # project entrypoint
├── CONTRIBUTING.md              # engineering workflow
├── THIRD_PARTY_NOTICES.md
├── docs/
│   ├── README.md                # canonical documentation index
│   ├── PRODUCT_VISION.md
│   ├── PROJECT_PRINCIPLES.md
│   ├── SYSTEM_ARCHITECTURE.md
│   ├── DOMAIN_MODEL.md
│   ├── INGESTION_ENGINE.md
│   ├── QUESTION_IDENTITY_AND_RECURRENCE.md
│   ├── ATOMIC_TREE_AND_SYLLABUS.md
│   ├── ASSESSMENT_ENGINE.md
│   ├── CANDIDATE_MODEL.md
│   ├── KNOWLEDGE_PIPELINE.md
│   ├── LEARNING_INTELLIGENCE.md
│   ├── DECISION_ENGINE.md
│   ├── QUESTION_LEARNING_PACKET.md
│   ├── BANK_DNA.md
│   ├── LEGAL_AUTHORITY_GRAPH.md
│   ├── FLASHCARDS_AND_FSRS.md
│   ├── MEASUREMENT_AND_METRICS.md
│   ├── M001_FOUNDATION.md
│   ├── ROADMAP.md
│   ├── PROJECT_STATE.md
│   ├── RISK_REGISTER.md
│   ├── TESTING_STRATEGY.md
│   ├── GLOSSARY.md
│   ├── benchmarks/
│   ├── research/
│   └── adr/
├── schemas/                     # source→staging contracts
├── db/migrations/               # immutable ordered schema migrations
├── src/exam_intelligence/       # application/runtime code
├── tests/                       # unit/integration/contract tests
└── local-data/                  # gitignored: corpora, PDFs, DB, private sources
```

## Engineering model

- **GitHub** is the canonical source for code, public documentation, schemas and architecture decisions.
- **Local filesystem** is the canonical location for private/raw corpora, paid-course sources and candidate data.
- **Codex Cloud** handles scoped implementation tasks/PRs.
- **VS Code + Codex** handles local execution, parsing, debugging and private data workflows.
- Material architectural changes require an ADR and a `PROJECT_STATE.md` update.

## Data and rights

This repository is currently public. Do **not** commit API keys, candidate performance databases, paid-course videos/transcripts, proprietary question-bank dumps, restricted PDFs or other non-redistributable content. Store those under gitignored local paths and keep source hashes/manifests/provenance in the system where appropriate.

See `docs/DATA_GOVERNANCE.md` and `THIRD_PARTY_NOTICES.md`.

## Start here

1. Read `AGENTS.md`.
2. Read `docs/README.md` for the canonical map.
3. Read `docs/PROJECT_STATE.md` for what is true **now**.
4. For implementation, read the active milestone specification only after the architecture docs it references.

---

**North star:** *Observe → diagnose → choose intervention → study → test → learn from result → repeat.*
