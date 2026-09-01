# Learning Telemetry Contract

## Purpose

Exam Intelligence can only personalize Batismo/Masterclass if it records **how study was executed**, not only whether a question was correct.

Telemetry should remain low-friction, interpretable and non-clinical. We collect variables that can change a study decision.

---

## 1. Three evidence levels

### Attempt-level
Captured automatically for each question:
- question/session item ID;
- first answer;
- final answer;
- changed answer state;
- blank/skip/timeout;
- confidence before feedback;
- response time;
- score/correctness;
- official-key/scoring snapshot;
- prior exposure / seen count.

### Session-level
Captured once or derived across a block:
- target exam;
- Batismo phase snapshot;
- Atomic Topic / task scope;
- learning mode (`learn | validate | exam`);
- session goal;
- planned minutes;
- actual focused minutes;
- start latency;
- technique/intervention ID + version;
- source/material used;
- task clarity;
- perceived difficulty;
- alertness/readiness;
- frustration;
- distraction events;
- completion state;
- next action.

### Cycle-level
Aggregated weekly/mesocycle/OQF:
- weighted coverage delta;
- unique question volume;
- validation accuracy;
- response-time trend;
- error distribution;
- confidence calibration;
- retention/delayed validation;
- study execution rate;
- D1 progression;
- simulation score/strategy;
- intervention outcomes;
- phase transition decision.

---

## 2. Minimum M001-ready session fields

M001 should preserve hooks without implementing the full Learning OS.

Recommended additions to `practice_session` or a linked `study_context` snapshot:

```text
study_phase_snapshot      nullable string/versioned
session_goal              nullable text
planned_minutes           nullable integer
start_latency_seconds     nullable integer
focused_seconds           nullable integer
alertness_1_5             nullable integer
sleep_quality_1_5         nullable integer
task_clarity_1_5          nullable integer
perceived_difficulty_1_5  nullable integer
frustration_1_5           nullable integer
distraction_events        nullable integer
intervention_id           nullable string
intervention_version      nullable string
completion_status         nullable enum/text
next_action               nullable text
context_json              nullable JSON for versioned experimental fields
```

Most fields are optional. The UI should not force a questionnaire before every question.

---

## 3. Capture strategy

### At session start — 5–10 seconds max
Prefer:
- goal already prefilled by planner;
- optional alertness 1–5;
- optional task clarity if not obvious;
- start timestamp automatic.

### During
Automatic:
- focused/session timer;
- answer times;
- confidence;
- question exposure;
- errors.

One-click optional:
- distraction event;
- “too easy / appropriate / too hard” signal;
- pause reason.

### End
One short closeout:
- completion;
- perceived difficulty/frustration if useful;
- next action generated or confirmed.

Sleep quality/duration can be captured once per day if enabled, never repeatedly per session.

---

## 4. Why these variables exist

| Variable | Decision it can change |
|---|---|
| alertness | heavy vs light task / preferred D1 window |
| task clarity | clarify/decompose before more effort |
| perceived difficulty + accuracy | challenge-skill adjustment |
| frustration | scaffold/repair vs continue overload |
| distraction events | environment/block structure |
| confidence | calibration and misconception detection |
| response time | fluency/time-risk intervention |
| seen count | validation contamination control |
| error category | intervention routing |
| focused time | real cost of progress |
| next action | start friction next session |
| phase snapshot | interpret same result differently by preparation stage |

If a field does not affect a future decision or research question, do not collect it by default.

---

## 5. Derived metrics

### Execution
```text
execution_rate = completed_valid_sessions / planned_sessions
focus_ratio = focused_minutes / planned_minutes
start_latency trend
```

Do not reward raw hours without learning output.

### Learning
```text
unique_question_accuracy
unseen_validation_accuracy
delayed_retrieval_accuracy
median_response_time
omission_rate
error_type_distribution
```

### Calibration
Use counts first. Later:
- Brier score;
- ECE/calibration curves;
- confident-wrong rate.

### Coverage
```text
atomic_nodes_sampled
atomic_nodes_validated
weighted_coverage
```

Coverage and accuracy remain separate.

### Intervention effectiveness
Conceptual:

```text
outcome_delta / focused_minutes
```

Estimate only on comparable delayed validation, not immediate post-training items alone.

---

## 6. Batismo phase snapshots

Store the phase assigned **at the time of the session**, including rule/version used.

Example:

```json
{
  "phase": "basic_20_80",
  "phase_model_version": "batismo-v1",
  "reason": [
    "basic_80_20_complete",
    "question_coverage_incomplete"
  ]
}
```

Historical attempts must remain interpretable if the phase model evolves later.

---

## 7. Intervention lineage

Every prescribed intervention should eventually carry:

```text
intervention_id
version
triggering_diagnosis
target_topics
method_sources          # Batismo/Masterclass/Benites/etc.
science_claim_refs
expected_effect
success_metric
measurement_window
stop_or_progress_rule
```

This enables real personalized learning experiments instead of vague recollection such as “flashcards seemed good.”

---

## 8. Readiness is context, not diagnosis

Allowed:
- candidate reports poor sleep;
- alertness = 2/5;
- response times increased;
- attention errors increased;
- planner selects a lighter block.

Not allowed:
- infer sleep disorder;
- infer ADHD/depression;
- infer dopamine level;
- prescribe medication/supplement;
- diagnose based on telemetry.

The system is an educational performance engine.

---

## 9. Avoid self-report overload

Self-report is useful when paired with behavioral data but becomes noise if overcollected.

Rules:
- automate objective fields;
- ask one-click contextual questions;
- sample rather than constantly interrogate;
- remove fields that do not improve decisions;
- preserve missing as `unknown`, never fabricate defaults.

---

## 10. Events

Recommended event vocabulary:

```text
DAY_CONTEXT_RECORDED
SESSION_PLANNED
SESSION_STARTED
DISTRACTION_RECORDED
ATTEMPT_SUBMITTED
FEEDBACK_REVEALED
ERROR_CLASSIFIED
INTERVENTION_STARTED
SESSION_COMPLETED
RETEST_SCHEDULED
DELAYED_VALIDATION_COMPLETED
SIMULATION_COMPLETED
WEEK_REVIEWED
MESOCYCLE_REVIEWED
PHASE_CHANGED
```

Event history should be append-oriented where practical.

---

## 11. The key causal dataset

Over time, the most valuable dataset is not the question corpus itself. It is:

```text
candidate state before
+ exam/topic context
+ intervention used
+ study cost
+ immediate outcome
+ delayed outcome
+ transfer/exam outcome
```

That dataset lets Exam Intelligence learn which Batismo/Masterclass/science interventions produce the most improvement for this candidate.
