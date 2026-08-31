# Data Model — Frozen V0

## Core principles
- Provenance and rights are first-class.
- Canonical question content is not the same as its presentation in a booklet or its occurrence in an exam.
- Option identity is separate from option label/order so shuffled booklets do not create false repeats.
- Bank keys are versioned and occurrence-specific.
- Legal authority is versioned by time and linked to occurrences.
- Taxonomy is hierarchical and versioned by scheme.
- Candidate evidence is append-oriented and scoring must be reproducible.
- Questions may exist without an official exam occurrence (manual/AI/user-created).

## Ingestion / provenance
### source_provider
Who/what supplied data; includes terms/license notes.

### source_asset
Immutable file/API-payload identity and hash; includes rights/redistribution metadata.

### import_batch / import_batch_asset
One ingestion run and the assets used in it.

### ingestion_record
Per-record staging/quarantine ledger with raw JSON, normalized JSON, parser confidence and errors. This is the quality-gate audit trail.

## Exam identity
### scoring_policy
Immutable versioned scoring configuration.

### exam
Canonical application/event identity.

### exam_source_link
Maps provider/external exam IDs to the canonical exam.

### exam_form
Booklet/caderno/version inside the same exam. Prevents alternate forms from inflating recurrence.

## Question content / presentation
### stimulus
Shared passage/table/figure/context used by one or many questions.

### question
Canonical semantic item identity. `identity_hash` ignores option label/order but includes normalized stem, option-content set and relevant stimulus identity.

### question_option
Canonical option content, without A/B/C labels.

### question_stimulus
Question ↔ stimulus relation.

### question_occurrence
The item appearing in one exam form. Holds original stem/presentation hash and item weight.

### occurrence_option
Occurrence-specific option label, order and original rendering.

### source_question_link
Connects one occurrence to one or many sources without creating false recurrence.

### answer_key
Versioned official bank decisions: provisional/final/changed/annulled.

### reference_answer
Reference answer for non-official questions (manual/AI/user-created), separate from official bank keys.

## Atomic Tree / syllabus
### taxonomy_scheme
Versioned taxonomy namespace.

### taxonomy_node
Adjacency-list Atomic Tree.

### question_taxonomy
Question ↔ node with classifier provenance/confidence/review status.

### syllabus / syllabus_item / syllabus_taxonomy_map
Verticalized edital remains source-faithful while mapping into the canonical Atomic Tree.

## Recurrence
### question_family / question_family_member
Reserved for semantic recurrence; V0 can leave empty.

## Assessment / candidate evidence
### practice_session
Mode, target/scoring snapshot, random seed and filter snapshot.

### session_item
The ordered set actually shown in a session, including selection reason. Supports abandoned/blank/time-expired items and reproducibility.

### attempt
Candidate response evidence linked to a session item. Stores first/final response JSON, response status, confidence, time, correctness, score and answer-key/scoring snapshot.

### error_event
Optional diagnostic event for wrong/uncertain responses.

## Authority Graph
### legal_authority
Stable identity (law/article/precedent etc.).

### legal_authority_version
Text/version valid for a date range, with source provenance.

### occurrence_authority
Occurrence ↔ authority version. Historical legal interpretation is never timeless.

## Memory
### memory_item / memory_review
Reserved for later FSRS phase.
