# System Architecture

## Context

Exam Intelligence is a local-first modular monolith for V0: one Python application, one SQLite operational database and file-based knowledge/raw-source stores. Module boundaries are explicit so components can evolve without premature distributed systems.

The architecture has two equally important halves:

1. **Exam/Candidate Intelligence** — what the exam demands and what the candidate demonstrates;
2. **Learning Operating System** — how Batismo 2.0, Masterclass Neurociência, learning science and candidate-local evidence convert a diagnosed gap into the right study action and verify that the problem was actually repaired.

The product is not complete when it can display questions. It is complete only when it can improve the next learning decision and close the remediation loop.

## Logical architecture

```text
                                SOURCE LAYER
          ┌────────────────────────┼────────────────────────┐
          │                        │                        │
     Quest/API               Official PDFs          CSV/XLSX/JSON
          │                        │                        │
          └────────────────────────┼────────────────────────┘
                                   ▼
                        INGESTION / PROVENANCE
                 adapters → staging → quality gates
                      → quarantine → normalization
                                   ▼
                         CANONICAL EXAM MODEL
             exam / form / question / occurrence / key
                     stimulus / media / provenance
                       ↙                    ↘
              ATOMIC TREE               AUTHORITY GRAPH
                       \                    /
                        \                  /
                         ▼                ▼
                         ASSESSMENT ENGINE
                 session → item → attempt → score
                                   ▼
                          CANDIDATE ENGINE
           accuracy / coverage / time / confidence / retention
                                   ▼
                          DIAGNOSIS ENGINE
           knowledge / recall / trap / attention / time / calibration
                                   ▼
                  LEARNING ALERT / REMEDIATION ENGINE
       evidence sufficiency → type → severity → lifecycle → retest
                                   ▼
                         LEARNING OPERATING SYSTEM
          ┌──────────────────┬───────────────────┬─────────────────┐
          │                  │                   │                 │
   BATISMO STRATEGY   MASTERCLASS GATES   LEARNING SCIENCE   LOCAL EVIDENCE
 phase/allocation      readiness/flow      technique rules    intervention outcome
          └──────────────────┴───────────────────┴─────────────────┘
                                   ▼
                           INTERVENTION ENGINE
           theory / retrieval / contrast / questions / memory / simulation
                                   ▼
                         RETEST / LEARNING EVIDENCE
                                   ▼
                    RESOLVED | ESCALATED | OBSERVE
                                   ▼
                           DECISION ENGINE
                                   ▼
                                 TODAY
                                   ↺
```

## Learning Alert & Remediation boundary

A Learning Alert is not a notification count. It is a **stateful evidence object** created only when the accumulated candidate/exam evidence is strong enough to alter the plan or demand targeted validation.

Canonical alert classes include:
- knowledge gap;
- misconception / confident-wrong;
- concept confusion;
- retention decay;
- coverage gap;
- source gap;
- bank trap;
- time/fluency;
- attention/execution.

Lifecycle:

```text
DETECTED
→ ACKNOWLEDGED
→ REMEDIATION_ASSIGNED
→ REMEDIATION_ACTIVE
→ RETEST_PENDING
→ RETESTED
→ RESOLVED | ESCALATED | OBSERVE
```

The engine must preserve the detection evidence snapshot, detector version, severity, intervention lineage and resolution evidence. It must be able to say `INSUFFICIENT_EVIDENCE` rather than creating false certainty.

See `LEARNING_ALERT_ENGINE.md`.

## Learning knowledge lane

```text
PRIVATE / OWNED SOURCES
Batismo 2.0 + Masterclass + OQF + Benites + other practitioner material
                     ↓
              lossless ingestion
                     ↓
       transcript segments / source lineage
                     ↓
         rules / techniques / protocols
                     ↓
             PRACTITIONER CANON
                     │
                     ├─────────┐
                     │         │
                     ▼         ▼
              outcome evidence  scientific evidence
                     \         /
                      \       /
                       ▼     ▼
                      LEARNING CANON
                           ↓
                    intervention registry
```

The recovered Batismo/Masterclass corpus is a **design authority**, not merely a RAG source. Full paid/restricted materials remain local; derived redistributable doctrine can live in Git.

## Batismo strategy state

The system must represent these operational states:

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

Durations are templates/configurable; transitions should ultimately use observed coverage, performance, urgency and available capacity.

Open high-leverage Learning Alerts can influence D1…Dn and phase allocation, but weak `WATCH` signals must not hijack the plan.

## Masterclass execution gates

Before a study prescription becomes executable:

```text
safety / official constraints
→ target + phase
→ readiness
→ goal clarity
→ attention environment
→ challenge-skill match
→ active-learning mode
→ feedback design
→ recovery constraints
→ telemetry / adaptation rule
```

The engine measures observable proxies. It does not infer dopamine, BDNF or a user's neural state.

Learning Alerts must distinguish content remediation from execution/readiness remediation; many wrong answers do not automatically imply more theory.

## Runtime boundaries

### Deterministic core
Must work offline and without an LLM:
- migrations and persistence;
- canonical question rendering;
- answer capture;
- scoring;
- key-version resolution;
- basic filters/metrics;
- provenance lookup;
- session reproduction;
- Batismo phase snapshot storage;
- alert lifecycle persistence;
- deterministic alert baselines once implemented;
- deterministic intervention rules once encoded;
- review/retest scheduling policy where deterministic.

### Optional model-assisted services
May use LLM/classifier capabilities later:
- PDF structure recovery where deterministic parsing fails;
- Atomic Tree classification suggestions;
- semantic question-family proposals;
- distractor/trap labeling;
- Question Learning Packet synthesis;
- knowledge-atom extraction;
- explanation synthesis grounded in source/authority;
- candidate error-classification suggestions;
- alert-diagnosis suggestions when evidence is ambiguous.

Model output is never silently promoted to authoritative data. Alert creation/severity must preserve detector/model version and evidence.

## Storage

### SQLite
Operational source of truth for structured exam/candidate/learning/alert-event data.

### Files
- raw/private source assets: local, immutable, gitignored;
- paid course transcripts/videos: local/private;
- redistributable canonical Markdown/JSONL: Git;
- large media: local storage; Git stores manifests/hashes where appropriate.

### Future analytics
DuckDB/Parquet remains an optional analytical projection if SQLite becomes limiting. It is not a V0 dependency.

## Deployment model

V0 runs locally. Codex Cloud can edit code and public documentation, but private corpora/candidate DBs live locally unless an explicit secure storage design is adopted later.

## Architectural quality attributes

Priority order:
1. exam and learning evidence integrity;
2. reproducibility;
3. source/provenance traceability;
4. actionable study decision quality;
5. closed-loop remediation quality;
6. extensibility without rewriting history;
7. local usability;
8. performance;
9. visual polish.

## Core architectural invariant

> **Never optimize for building an exam platform. Optimize for generating better learning decisions, detecting material problems early, applying the right remediation, and proving whether the problem was fixed.**
