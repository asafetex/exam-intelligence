# Architecture

```text
                           SOURCES
                              |
        +---------------------+----------------------+
        |                     |                      |
    Quest/API            PDFs + Keys           Public/Manual
        |                     |                      |
        +---------------------+----------------------+
                              |
                       SOURCE REGISTRY
                              |
                         IMPORT BATCH
                              |
                           ADAPTERS
                              |
                         STAGING JSON
                              |
                        QUALITY GATES
                              |
                 QUARANTINE / NORMALIZE
                              |
                    IDENTITY + DEDUPE
                              |
       +----------------------+-----------------------+
       |                      |                       |
    QUESTIONS             OCCURRENCES            ANSWER KEYS
       |                      |                       |
       |                  EXAM FORMS                   |
       |                      |                       |
       +----------+-----------+-----------+-----------+
                  |                       |
             ATOMIC TREE            AUTHORITY VERSIONS
                  |                       |
                  +-----------+-----------+
                              |
                        ASSESSMENT RUNNER
                              |
                       SESSION ITEM LOG
                              |
                         CANDIDATE LOG
                              |
                         BASIC DIAGNOSIS
                              |
                         NEXT ACTION
```

## Identity layers

```text
Source asset -> ingestion record -> canonical question -> exam occurrence -> presentation
```

- **source duplicate**: same occurrence from multiple providers; no recurrence increment.
- **alternate booklet/form**: same exam, potentially reordered options/questions; no historical recurrence increment.
- **exact cross-exam repeat**: same canonical content in distinct exams; recurrence increment.
- **semantic family**: same proposition/skill with different wording; later model.

## Rich-content path
Shared text, tables, images and diagrams are first-class `stimulus`/media references. Canonical content is Markdown-compatible text plus referenced source/media metadata rather than plain text assumptions.

Parallel future learning lane:

```text
OQF / Benites / papers / books
          |
Knowledge ingestion
          |
Learning Canon
          |
Intervention Engine
          |
Decision Engine
```
