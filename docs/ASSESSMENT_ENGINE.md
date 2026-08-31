# Assessment Engine / Mini-QC

## Purpose

The Mini-QC is not primarily a question-bank UI. It is the main behavioral sensor of the system.

Every resolved item should create trustworthy candidate telemetry with minimal friction.

## Modes

### Learn
Feedback/explanation and learning interventions may appear immediately. These questions are learning evidence and should not be mixed blindly with clean validation estimates.

### Validate
Prefer unseen/equivalent items. Minimal immediate feedback. Designed to estimate what the candidate can currently retrieve/apply without consultation.

### Exam
Timed exam conditions using the real scoring policy. Feedback is deferred until submission/end.

## Question types

Initial canonical types:
- `binary` (C/E);
- `single_choice`;
- `multiple_choice`;
- numeric/free-response hooks may exist but are not required for M001.

Scoring policy is separate from question type so Cebraspe +1/-1 and ordinary single-choice scoring remain plugins/configuration rather than branching the whole model.

## Per-attempt telemetry

Minimum:
- session/item/question/occurrence IDs;
- first response and final response;
- `answer_changed`;
- answered / blank / skipped / time-expired status;
- correctness and score;
- response time;
- confidence 1–5 committed before reveal;
- seen count at attempt time;
- question/key/scoring snapshot/version;
- timestamps.

## Post-question behavior

Feedback depth is adaptive, not universally verbose:

```text
correct + high confidence  → brief rule/verdict
correct + low confidence   → brief clarification
wrong + low confidence     → explanation + source
wrong + high confidence    → deep misconception packet
```

The full rich model is described in `QUESTION_LEARNING_PACKET.md` and is deferred beyond M001.

## Universal abstraction

```text
Item → propositions → alternatives → candidate response → scoring rule
```

For five-option single choice, probabilities are normalized across options; do not model each option as an independent binary truth event.

## Reproducibility

A completed session should be reproducible from stored ordered session items, random seed/filter snapshot and scoring/key snapshot. Later changes to answer keys must not silently rewrite historical attempt scores.
