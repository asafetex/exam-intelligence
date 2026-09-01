# Decision Engine

## North-star output

> **What should I study today, for how long, by which method, under which conditions, and why?**

The Decision Engine combines exam evidence, candidate evidence, open Learning Alerts and the Batismo/Masterclass Learning Operating System. It does not reduce planning to “weakest subject first.”

## Decision order

```text
1. safety / official constraints
2. primary exam target
3. Batismo phase
4. exam-side priority
5. candidate gap / coverage / retention
6. open Learning Alerts + severity/persistence
7. readiness / workload context
8. task clarity / attention environment
9. challenge-skill match
10. remediation/intervention selection
11. retest / resolution design
12. recovery/continuity
13. next measurement and adaptation
```

A high-priority alert can change what is studied next. A weak `WATCH` signal should not hijack the plan.

## Inputs

### Exam-side
- edital/Atomic Tree;
- historical incidence;
- exact/semantic recurrence;
- recency;
- bank/role/organization similarity;
- scoring policy;
- legal/content changes;
- days to exam;
- prerequisite centrality.

### Candidate-side
- validation/exam accuracy;
- tree coverage;
- novelty/exposure;
- confidence/calibration;
- response time;
- retention;
- error/trap patterns;
- source gaps;
- D1…Dn state;
- intervention outcomes.

### Learning Alert-side
- open alert type;
- severity;
- detector/evidence confidence;
- persistence/episode history;
- prerequisite impact;
- remediation status;
- retest due/failed;
- prior interventions and outcomes.

### Learning OS
- Batismo phase/allocation;
- readiness/alertness;
- task clarity;
- difficulty/frustration;
- attention/start friction;
- due retrieval/relearning;
- OQF/mesocycle state.

### Operational context
- available time;
- obligations/workload;
- best observed high-alert window;
- pending retests;
- simulation/logistics constraints.

## Priority baseline

Start interpretable:

```text
priority ≈ exam_leverage
         × candidate_gap
         × coverage_need
         × retention_or_transfer_need
         × opportunity_to_improve
         × phase_urgency
```

Then use interpretable modifiers:
- recurrence;
- response-time risk;
- confidence/misconception risk;
- prerequisite value;
- intervention effectiveness;
- maintenance requirement;
- **open alert severity/persistence**;
- **failed remediation/retest**.

Conceptually:

```text
alert_priority_modifier
≈ severity
× exam_leverage
× persistence
× prerequisite_value
× repair_opportunity
```

No frozen numeric formula until data supports calibration.

## Alert-aware decisions

### `WATCH`
Collect more evidence or schedule targeted validation. Do not automatically replace the plan.

### `MEDIUM`
Surface and schedule a bounded targeted action/retest.

### `HIGH`
Enter remediation queue and materially alter allocation when exam leverage supports it.

### `CRITICAL`
May block progression on a high-leverage prerequisite/misconception until repaired or explicitly overridden.

## Examples

### High-value misconception

```text
Target: Administrative Law > Revocation
Alert: HIGH / MISCONCEPTION
Evidence:
- weak unseen validation
- repeated high-confidence wrong
- adequate sample breadth
- high exam relevance
Phase: basic_20_80
Action:
- Revocation × Annulment contrastive repair
- 10–12 mixed unseen items
- delayed retest
Resolution:
- successful delayed unseen validation
```

### Execution alert, not content alert

```text
Target: Portuguese
Alert: HIGH / ATTENTION_EXECUTION
Evidence:
- conceptual accuracy acceptable
- repeated EXCETO/NÃO mistakes
- errors cluster under low alertness/time pressure
Action:
- parsing/execution protocol + shorter timed block
Not action:
- reread the whole grammar source
```

### Coverage warning

```text
Local accuracy: 90%
Atomic Tree breadth: low
Repeated-item concentration: high
Alert: WATCH/MEDIUM — COVERAGE_GAP
Action:
- expand unseen sampling before declaring mastery
```

## Today output contract

Each action should expose:

```text
55 min — Administrative Acts > Revocation
Phase: basic_20_80
Alert: HIGH / MISCONCEPTION
Why:
- high exam leverage
- 5/9 unseen errors
- 3 high-confidence wrong
- adequate evidence breadth
Method:
- contrastive repair
- 12 unseen bank questions
Condition:
- high-alert window
Success check:
- delayed unseen retest
If retest fails:
- escalate diagnosis/intervention instead of repeating blindly
```

## Closed-loop requirement

A Today action created from an alert must eventually be able to answer:

```text
What alert triggered this?
What evidence supported it?
What intervention was assigned?
What did it cost?
What happened immediately?
What happened on delayed/transfer retest?
Was the alert resolved or escalated?
```

Without this lineage, the system cannot learn which remediation works.

## Proximal progress

Show meaningful progress:
- nodes validated;
- alerts resolved;
- misconceptions repaired;
- delayed retrieval passed;
- response time improved;
- weighted coverage gained;
- simulation score/strategy improved.

Do not substitute vanity XP or alert-count reduction without validation.

## OQF / cycle evaluation

Compare baseline vs end-state:
- adherence;
- active output;
- weighted coverage;
- validation accuracy;
- delayed retention;
- time/omissions;
- error distribution;
- alerts opened/resolved/escalated;
- simulation/exam-specific result.

Then output:
`maintain | adapt | replace | investigate | progress`.

## Baselines/backtesting

Advanced prioritization must beat simple alternatives:
- weakest-first;
- highest-frequency-first;
- equal allocation;
- due-retest-first;
- unpersonalized Batismo template;
- alert-count-only ranking.

If complexity does not improve later performance/decision quality, remove it.

## Uncertainty

The engine must be able to say:
- insufficient evidence;
- weak coverage;
- repeated-item contamination;
- alert uncertain;
- source gap;
- intervention effect unknown;
- readiness missing;
- model disagreement.

False precision is worse than explicit uncertainty.

## Hard rule

The Decision Engine outputs:

```text
problem
→ evidence sufficiency
→ alert/observe
→ intervention
→ retest
→ resolved/escalated
→ next decision
```

Never justify an action only with a neuroscience label or an uncalibrated error count.

See `LEARNING_ALERT_ENGINE.md`, `LEARNING_OPERATING_SYSTEM.md`, `PERIODIZATION_ENGINE.md`, and `LEARNING_TELEMETRY.md`.
