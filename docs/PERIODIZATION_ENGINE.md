# Periodization Engine — Batismo-Aligned

## Purpose

Study allocation changes with candidate state, syllabus coverage, urgency and exam proximity. Periodization is a control system, not a fixed weekly timetable.

Batismo 2.0 is the primary practitioner strategy canon for this engine. Generic labels such as Foundation/Build/Peak can still be used for analytics, but the operational state machine must preserve the actual Batismo logic.

## Canonical operational states

### 1. `material_validation`
Goal: establish the real target knowledge universe and verify source sufficiency.

Exit:
- edital mapped;
- every node has source or explicit gap;
- obvious stale/excess material identified.

### 2. `basic_80_20`
Goal: broad first coverage and usable conceptual representations.

Dominant activity:
- acquisition/reading/explanation;
- small diagnostic question samples already present.

Exit by coverage and execution, not calendar alone.

### 3. `basic_20_80`
Goal: retrieval/application dominance and error-driven selective theory return.

Dominant activity:
- unique questions;
- error classification;
- targeted source repair;
- immediate/new retrieval.

### 4. `mesocycle`
Goal: concentrate additional capacity on a high-leverage weak discipline/topic while keeping the rest alive.

Typical policy from the course:
- roughly 40–50% to differential target when justified;
- maintenance in other disciplines;
- target progression conceptually from theory-heavy → balanced → question-heavy;
- re-evaluate and rotate.

The corpus declares a five-week structure but incompletely describes one position. Store unresolved template structure rather than inventing it.

### 5. `edital_imminent`
Goal: adjust allocation when official progress materially changes urgency.

### 6. `surprise_subject`
Goal: accelerate a newly introduced subject without abandoning the rest.

Pattern:
- reverse-engineer questions;
- establish recurring vocabulary/concepts;
- broad coverage;
- question-dominant repair;
- maintain other subjects.

Any numeric split/sample from the course is a configurable heuristic until validated against the actual exam/candidate.

### 7. `final_sprint_50`
Batismo template for approximately the final 50 days where timeline/state make it applicable.

Pattern:
- daily maintenance/simulation component;
- concentrated differential block;
- rotate differential targets;
- increase exam pace/specificity.

This state is not entered solely because a clock hits exactly 50 days; coverage/readiness and current exam state also matter.

### 8. `countdown_10`
Batismo template for the final approximately ten days:
- diagnose weak/high-value nodes;
- proportional exam sets;
- solve before feedback;
- correct and return to exact source;
- retest errors;
- full-condition simulation;
- stabilize logistics/readiness.

### 9. `simulation`
Goal: expose execution failure under realistic format, scoring and timing.

### 10. `post_exam`
Goal: preserve outcome evidence and update candidate/method model.

---

## Generic analytical mapping

For interoperability/research only:

| Batismo state | Generic label |
|---|---|
| material_validation | Intake/Foundation |
| basic_80_20 | Foundation/Build |
| basic_20_80 | Build/Consolidation |
| mesocycle | Consolidation/Specific Preparation |
| surprise_subject | Accelerated Build |
| final_sprint_50 | Peak/Specific Preparation |
| countdown_10 | Peak/Taper |
| simulation | Specific/Peak |
| post_exam | Debrief |

Do not replace Batismo state with the generic label in historical records.

---

## Phase inputs

Transition logic should consider:
- `days_to_exam`;
- official exam status;
- syllabus/tree coverage;
- validated mastery distribution;
- unique-question coverage;
- retention state;
- simulation readiness;
- available study hours;
- candidate D1…Dn ranking;
- exam importance/weight/incidence;
- fatigue/readiness where explicitly tracked;
- new/removed syllabus areas.

---

## D1…Dn priority inside a phase

D1 is not simply “lowest accuracy.”

Conceptual score:

```text
D_priority ≈ exam_leverage
           × candidate_gap
           × prerequisite_value
           × opportunity_to_improve
           × urgency
```

High recurrence and bank-specific importance may affect `exam_leverage` but never create certainty.

---

## Continuity rule

Concentrated work must not silently delete the rest of the edital from retrieval for long periods.

Maintenance frequency depends on:
- retention evidence;
- exam weight;
- prior mastery;
- time to exam;
- current differential target;
- cost of reactivation.

---

## Overload / variability / specificity

Batismo periodization principles become measurable controls:

### Individuality
Use actual candidate/exam data.

### Overload
Increase difficulty, density, speed or independence only when the current level is stable enough.

### Continuity
Reactivation before severe decay.

### Specificity
Progressively reproduce the real exam's item types, timing, transitions and scoring decisions.

### Variability
Vary stimulus/task when it trains discrimination/transfer or prevents overfitting; do not randomize for novelty alone.

---

## Masterclass readiness override

Phase says what would be strategically ideal. Readiness says what can be executed effectively now.

Example:

```text
phase = mesocycle
D1 = mathematics
planned = hard unseen set
alertness = very low after poor sleep
```

The engine may keep the strategic target but choose a lower-risk task or move the hard block to the best available window. It does not automatically use stimulants or remove sleep.

---

## Exit criteria over calendar worship

Every state should define:
- entry evidence;
- target outputs;
- exit evidence;
- fallback/escalation;
- maximum acceptable drift from exam timeline.

The corpus contains multiple formation-duration examples (roughly 6–10 weeks). Store those as templates and let coverage/execution data govern the actual transition.

See `LEARNING_OPERATING_SYSTEM.md` and `BATISMO_MASTERCLASS_INTEGRATION.md`.
