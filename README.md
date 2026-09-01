# Exam Intelligence

> Local-first intelligence system for competitive-exam preparation. It combines **exam evidence + candidate telemetry + Batismo 2.0 / Masterclass Neurociência operating doctrine + learning science** to choose the best next study action.

**Status:** V0 architecture frozen · Learning OS canonicalized · **Active milestone:** M001 — Corpus In → First Attempt Out · **DB schema:** v3 · **Runtime:** Python + FastAPI + Jinja/HTMX + SQLite

## Why this exists

Most exam platforms optimize for content access, question volume, dashboards or engagement. Exam Intelligence optimizes for a different question:

> **What should the candidate study now, for how long, with which intervention, under which conditions, and why?**

The system is a closed learning loop:

```text
TARGET EXAM
    ↓
Edital + Atomic Tree + historical exams + recurrence + scoring
    ↓
QUESTION / SOURCE CORPUS
    ↓
Candidate answers + time + confidence + exposure + session context
    ↓
CANDIDATE DIAGNOSIS
    ↓
BATISMO PHASE
(material validation / 80-20 / 20-80 / mesocycle / final states)
    ↓
MASTERCLASS EXECUTION GATES
(readiness / focus / clarity / difficulty / feedback / recovery)
    ↓
LEARNING INTERVENTION
(retrieval / theory / contrast / questions / memory / simulation / behavior)
    ↓
Delayed validation / transfer / exam evidence
    ↓
DECISION ENGINE
    ↺
```

The end product is not a generic dashboard. The end product is a defensible **Today** queue: what to study, how, for how long, in which state, and why that activity has the highest expected return.

## The Learning Operating System

Batismo 2.0 and the Masterclass Neurociência are **not optional content modules** in this project.

The recovered source corpus established two complementary roles:

- **Batismo 2.0** controls the strategic preparation state: material validation, basic formation `80/20 → 20/80`, D1…Dn prioritization, mesocycles, urgency, final-stage templates and simulation/debrief.
- **Masterclass Neurociência** controls session execution: target focus, readiness/alertness, task clarity, challenge-skill calibration, active practice, feedback/progress, start friction/habit, frustration and recovery.
- **Learning science** strengthens/refines the techniques and corrects overconfident causal explanations where necessary.
- **Candidate-local evidence** personalizes the doctrine: interventions that do not improve delayed/exam-relevant performance are adapted or replaced.

Canonical principle:

> **A practical method can work even if one proposed biological explanation is incomplete. Method efficacy, practitioner outcome evidence and mechanism truth are tracked separately.**

See:
- `docs/LEARNING_OPERATING_SYSTEM.md`;
- `docs/BATISMO_MASTERCLASS_INTEGRATION.md`;
- `docs/SCIENTIFIC_LEARNING_CANON.md`;
- ADRs `0009` and `0010`.

## Core product domains

| Domain | Canonical question | Main evidence |
|---|---|---|
| **Exam Intelligence** | What matters on the target exam? | edital, Atomic Tree, bank, role, organ, year, recurrence, scoring policy, legal/version context |
| **Candidate Intelligence** | What does the candidate actually demonstrate? | correctness, score, time, confidence, novelty, coverage, retention, answer changes, error taxonomy |
| **Learning Intelligence** | Which intervention fixes the diagnosed state in the current phase/condition? | Batismo, Masterclass, learning science, intervention outcomes, delayed validation |
| **Decision Intelligence** | Where should the next hour go? | exam leverage × gap × coverage × retention × phase × readiness × intervention value × time-to-exam |

## Architectural thesis

```text
                         EXAM INTELLIGENCE
                                │
                 ┌──────────────┼──────────────┐
                 ▼              ▼              ▼
             EXAM ENGINE   CANDIDATE ENGINE  KNOWLEDGE
                 │              │              │
                 └──────────────┼──────────────┘
                                ▼
                         DIAGNOSIS ENGINE
                                ▼
                      LEARNING OPERATING SYSTEM
                  Batismo + Masterclass + Science
                                ▼
                       INTERVENTION ENGINE
                                ▼
                         NEW EVIDENCE
                                ▼
                         DECISION ENGINE
                                ▼
                         O QUE FAZER AGORA?
                                ↺
```

The project is **source-agnostic**. Quest API, CSV/XLSX/JSON, official PDFs, answer-key PDFs, public datasets and manually created questions all pass through adapters into the same staging contract and canonical model.

## Non-negotiable semantics

### Exam/data semantics
- **Question identity ≠ exam occurrence ≠ presentation.**
- **Source duplication ≠ historical recurrence.** The same PF 2025 occurrence imported twice is one occurrence; the same canonical question appearing in PF 2021 and PF 2025 is two legitimate historical signals.
- **Official bank key ≠ universal truth.** It records what counted for that bank, exam and key version.
- **Generated questions never contaminate official Bank DNA.**
- **Historical frequency is evidence, not certainty.**
- **Raw sources and provenance are immutable.**
- **Legal authority is time-versioned.**

### Learning semantics
- **Accuracy ≠ mastery.** Mastery is coverage/novelty/retention/confidence aware.
- **Immediate performance ≠ durable learning.** Delayed unseen/equivalent validation matters.
- **Error ≠ generic “do more questions.”** Error type routes intervention.
- **80/20 and 20/80 are phase/allocation logic, not universal minute formulas.**
- **Batismo phase is historical context.** Snapshot model/version with the session.
- **Readiness modifies task/dose/timing; it is not diagnosis.**
- **Neuroscience labels are not user KPIs.** No dopamine/BDNF score or automated clinical inference.
- **Practitioner outcomes and scientific mechanisms are distinct evidence lanes.**

## Batismo-aligned preparation states

```text
intake
→ material_validation
→ basic_80_20
→ basic_20_80
→ mesocycle | edital_imminent | surprise_subject | final_sprint_50 | countdown_10
→ simulation
→ exam
→ post_exam
```

Calendar durations in practitioner material are templates unless current exam/candidate evidence justifies a hard boundary. The engine should transition primarily on coverage, performance, urgency and capacity.

## M001 — Corpus In → First Attempt Out

M001 remains deliberately narrow. It proves the trustworthy evidence foundation and adds only minimal Learning-OS-ready hooks:

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
                 SQLite schema v3
                         ↓
               FastAPI Mini-QC
                         ↓
        answer + timer + confidence
                         ↓
                persisted attempt
                         +
         optional minimal study_context
      (goal / phase / readiness / next action)
                         ↓
             first topic diagnosis
```

M001 does **not** implement automatic Batismo phase inference, adaptive readiness scheduling, full OQF or Today. It merely prevents the first evidence from becoming contextless.

The GitHub acceptance criteria live in issue **#1** and `docs/M001_FOUNDATION.md`.

## Current schema learning hooks

Schema v3 adds:
- `learning_intervention` — versioned executable intervention definitions;
- `study_context` — optional 1:1 session snapshot for Batismo phase, goal, focused/planned time, low-friction readiness/task context, intervention lineage, completion and next action.

These are extension points, not an excuse to bloat M001.

## Repository map

```text
exam-intelligence/
├── AGENTS.md
├── README.md
├── CONTRIBUTING.md
├── THIRD_PARTY_NOTICES.md
├── docs/
│   ├── README.md
│   ├── PROJECT_CONTEXT_CANON.md
│   ├── CODEX_CONTEXT_HANDOFF.md
│   ├── PRODUCT_VISION.md
│   ├── PROJECT_PRINCIPLES.md
│   ├── SYSTEM_ARCHITECTURE.md
│   ├── LEARNING_OPERATING_SYSTEM.md
│   ├── BATISMO_MASTERCLASS_INTEGRATION.md
│   ├── SCIENTIFIC_LEARNING_CANON.md
│   ├── LEARNING_TELEMETRY.md
│   ├── DOMAIN_MODEL.md
│   ├── DATA_MODEL.md
│   ├── INGESTION_ENGINE.md
│   ├── QUESTION_IDENTITY_AND_RECURRENCE.md
│   ├── ATOMIC_TREE_AND_SYLLABUS.md
│   ├── ASSESSMENT_ENGINE.md
│   ├── CANDIDATE_MODEL.md
│   ├── KNOWLEDGE_PIPELINE.md
│   ├── EVIDENCE_FRAMEWORK.md
│   ├── LEARNING_INTELLIGENCE.md
│   ├── PERIODIZATION_ENGINE.md
│   ├── DECISION_ENGINE.md
│   ├── QUESTION_LEARNING_PACKET.md
│   ├── BANK_DNA.md
│   ├── LEGAL_AUTHORITY_GRAPH.md
│   ├── FLASHCARDS_AND_FSRS.md
│   ├── MEASUREMENT_AND_METRICS.md
│   ├── M001_FOUNDATION.md
│   ├── ROADMAP.md
│   ├── PROJECT_STATE.md
│   ├── research/
│   │   └── MASTERCLASS_SCIENTIFIC_PACK.md
│   └── adr/
│       ├── 0009-batismo-masterclass-as-learning-os.md
│       └── 0010-separate-method-efficacy-from-mechanism-truth.md
├── schemas/
├── db/migrations/
├── src/exam_intelligence/
├── tests/
└── local-data/                  # gitignored private corpora / candidate data
```

## Engineering model

- **GitHub** is canonical for code, public-safe derived doctrine, schemas and architecture decisions.
- **Local filesystem** is canonical for paid/private raw corpora, source videos/transcripts and candidate DBs.
- **Codex Cloud** handles scoped implementation tasks/PRs.
- **VS Code + Codex** handles local execution, parsing, debugging and private-data workflows.
- Significant architecture changes require ADR + `PROJECT_STATE.md` update.

## Data and rights

This repository is public. Do **not** commit API keys, candidate performance DBs, paid-course videos/full transcripts, proprietary question-bank dumps, restricted PDFs or other non-redistributable content. Store them under gitignored local paths. Public docs can preserve source IDs, hashes, evidence conclusions and sufficiently abstracted operational doctrine.

See `docs/DATA_GOVERNANCE.md` and `THIRD_PARTY_NOTICES.md`.

## Start here

For a fresh Codex/engineer:

1. `docs/CODEX_CONTEXT_HANDOFF.md`
2. `docs/PROJECT_STATE.md`
3. `docs/PROJECT_CONTEXT_CANON.md`
4. `docs/README.md`
5. `docs/LEARNING_OPERATING_SYSTEM.md`
6. `docs/BATISMO_MASTERCLASS_INTEGRATION.md`
7. active milestone/domain docs.

---

**North star:** *Observe → diagnose → choose the right phase/intervention → study actively → test → learn from delayed result → repeat.*
