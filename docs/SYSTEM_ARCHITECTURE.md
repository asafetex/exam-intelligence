# System Architecture

## Context

Exam Intelligence is a modular monolith for V0: one Python application, one SQLite operational database and file-based knowledge/raw-source stores. Module boundaries are explicit so components can evolve independently without premature distributed systems.

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
               content gap / retrieval / trap / calibration / etc.
                       ↙                       ↘
              QUESTION PRACTICE          MEMORY / FSRS
                       \                       /
                        \                     /
                         ▼                   ▼
                           LEARNING EVIDENCE
                                   ▼
                           DECISION ENGINE
                                   ▼
                                 TODAY
```

Parallel knowledge lane:

```text
OQF + neuroscience masterclass + Benites + EARA + research
                              ↓
                      lossless ingestion
                              ↓
                     source-grounded atoms
                              ↓
                      concepts / protocols
                              ↓
                        Learning Canon
                              ↓
                    Intervention selection
```

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
- session reproduction.

### Optional model-assisted services
May use LLM/embedding/classifier capabilities later:
- PDF structure recovery where deterministic parsing fails;
- Atomic Tree classification suggestions;
- semantic question-family proposals;
- distractor/trap labeling;
- Question Learning Packet synthesis;
- knowledge atom extraction.

Model output is never silently promoted to authoritative data.

## Storage

### SQLite
Operational source of truth for structured exam/candidate data.

### Files
- raw/private source assets: local, immutable, gitignored;
- Markdown/JSONL knowledge artifacts: Git when redistributable, local otherwise;
- large media: local storage; Git stores metadata/manifests where appropriate.

### Future analytics
DuckDB/Parquet is an optional analytical projection if/when SQLite queries become limiting. It is not a V0 dependency.

## Deployment model

V0 runs on localhost. Codex Cloud may edit code but should not be treated as the canonical storage location for private corpora. Local VS Code/runtime handles private PDFs/videos and candidate DB.

## Architectural quality attributes

Priority order:
1. correctness and evidence integrity;
2. reproducibility;
3. source/provenance traceability;
4. extensibility without historical rewrites;
5. local usability;
6. performance;
7. visual polish.
