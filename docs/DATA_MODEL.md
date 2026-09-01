# Data Model — Frozen V0 + Learning OS Hooks

## Core principles
- Provenance and rights are first-class.
- Canonical question content is not the same as its presentation in a booklet or its occurrence in an exam.
- Option identity is separate from option label/order so shuffled booklets do not create false repeats.
- Bank keys are versioned and occurrence-specific.
- Legal authority is versioned by time and linked to occurrences.
- Taxonomy is hierarchical and versioned by scheme.
- Candidate evidence is append-oriented and scoring must be reproducible.
- Questions may exist without an official exam occurrence (manual/AI/user-created).
- Learning decisions must preserve the **phase/intervention/context that existed when the session occurred**.
- Readiness telemetry is educational context, never a clinical diagnosis.

**Current schema version:** 3.

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
Canonical semantic item identity. `identity_hash` ignores option label/order but includes normalized stem, option-content set and relevant stimulus identity. Identity rules are versioned by `identity_version`.

### question_option
Canonical option content, without A/B/C labels.

### question_stimulus / stimulus_asset
Question ↔ stimulus relation plus source/media assets with locators (page/bbox/file).

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

### Recurrence semantics — frozen rule
Recurrence is evidence, not a deduplication artifact.

- **Source duplicate:** the same official occurrence imported from multiple providers/files remains **one `question_occurrence`** with multiple source links. It must not increase recurrence.
- **Booklet/form duplicate:** the same item appearing in multiple cadernos/forms of the **same exam event** must not be counted as independent historical recurrence.
- **True cross-exam exact repetition:** if the same canonical `question` appears in genuinely different exam events/years, preserve **one canonical question with multiple `question_occurrence` rows**. Each independent exam occurrence is a real recurrence signal.
- **Semantic recurrence:** different questions testing the same proposition/pattern may later be grouped in `question_family`.
- **Atomic-topic recurrence:** frequency at taxonomy-node level is a third, broader signal.

Deduplication removes duplicated representations of the same occurrence, never legitimate repeated use across different exams.

Future analytics expose these separately: `source_count`, `exam_occurrence_count`, `exact_repeat_count`, `family_recurrence_count`, topic incidence.

## Assessment / candidate evidence
### practice_session
Mode, target/scoring snapshot, random seed and filter snapshot.

### session_item
Ordered items shown, including selection reason. Supports abandoned/blank/time-expired items and reproducibility.

### attempt
Candidate response evidence. Stores first/final response, response status, confidence, time, correctness, score, exposure count and answer-key/scoring snapshot.

### error_event
Diagnostic event for wrong/uncertain responses.

## Learning Operating System

### learning_intervention
Versioned registry entry for an executable learning intervention.

Minimum semantics:
- stable `intervention_id`;
- `intervention_version`;
- human-readable name;
- source refs (Batismo/Masterclass/science/etc.);
- evidence status;
- protocol JSON;
- active flag.

Future protocol payload may include:
- triggering diagnosis;
- prerequisites;
- procedure;
- expected effect;
- success metric;
- delayed-validation window;
- stop/progress criteria.

### study_context
One versioned context snapshot linked 1:1 to a `practice_session` when learning telemetry is available.

Fields introduced in schema v3:
- `phase_code`;
- `phase_model_version`;
- phase reasons;
- session goal;
- planned/focused time and start latency;
- optional alertness / sleep quality / task clarity / perceived difficulty / frustration;
- distraction count;
- intervention ID/version;
- completion state;
- next action;
- extensible `context_json`.

This table exists now so M001 evidence does not become contextless once Batismo/Masterclass adaptive logic is implemented.

### Why context is snapshotted
A session classified `basic_20_80` under `batismo-v1` must remain reproducible after a future `batismo-v2` changes rules. Never retrospectively rewrite old phase/intervention context as though the new rule had existed historically.

## Authority Graph
### legal_authority
Stable identity (law/article/precedent etc.).

### legal_authority_version
Text/version valid for a date range, with source provenance.

### occurrence_authority
Occurrence ↔ authority version. Historical legal interpretation is never timeless.

## Memory
### memory_item / memory_review
Reserved for later FSRS phase. Memory is one intervention channel, not the universal learning model.

## Future learning evidence entities

Do not create these until their behavior is implemented, but preserve the concepts:
- `intervention_instance` — prescription/execution of a technique;
- `delayed_validation` — post-intervention unseen/equivalent outcome;
- `cycle_review` — week/mesocycle/OQF review and decision;
- `phase_transition` — append-oriented state transition with reason;
- `day_context` — optional once-per-day readiness context;
- `practitioner_outcome_record` — auditable cohort/result evidence for methods.

See `LEARNING_TELEMETRY.md` and ADRs 0009–0010.
