# Domain Model

## Bounded domains

### Source / Ingestion
Owns source providers/assets, acquisition metadata, rights, adapters, staging batches and quarantine.

### Exam
Owns banks, organizations/roles, exams, forms, scoring policies, canonical questions, occurrences, answer keys and recurrence identity.

### Syllabus / Knowledge Topology
Owns versioned taxonomy schemes, Atomic Tree nodes, verticalized edital items and mappings.

### Assessment
Owns practice sessions, ordered session items, candidate responses, scoring snapshots and execution mode.

### Candidate
Owns longitudinal evidence/derived diagnostics such as coverage, calibrated confidence, retention and error patterns.

### Authority
Owns legal/normative sources and time-versioned authority linked to historical occurrences.

### Learning / Memory
Owns learning-source atoms, protocols, intervention evidence, memory items and spaced-repetition reviews.

### Decision
Consumes all other domains and produces explainable priorities/actions. It does not rewrite source evidence.

## Critical entity distinctions

```text
SOURCE ASSET
    ↓ describes
QUESTION OCCURRENCE ─── belongs to ─── EXAM FORM ─── EXAM
    │
    ├── renders CANONICAL QUESTION
    ├── labels/orders CANONICAL OPTIONS
    └── receives versioned OFFICIAL BANK KEY
```

A canonical question can exist without an official occurrence (manual/AI/user-created). An official occurrence always belongs to an exam form/context.

## Candidate evidence

```text
PRACTICE SESSION
       ↓
SESSION ITEM  ── selection reason / ordering / scoring snapshot
       ↓
ATTEMPT       ── first/final response / status / time / confidence / score
       ↓
ERROR EVENT   ── optional diagnosed error taxonomy
```

Attempt history is evidence. Aggregate mastery is a derived estimate and should be recomputable.

## Taxonomy

```text
SUBJECT
  └── MACRO TOPIC
       └── TOPIC
            └── SUBTOPIC
                 └── ATOMIC TOPIC
```

This is a canonical topology, not a replacement for edital wording. Source-faithful syllabus items map into it.

## Recurrence topology

```text
CANONICAL QUESTION
  ├── occurrence: Exam A
  ├── occurrence: Exam B       ← exact recurrence signal
  └── question_family          ← later semantic relation

ATOMIC TOPIC
  └── many question families   ← broader incidence signal
```

Source copies of one occurrence do not belong in this recurrence count.
