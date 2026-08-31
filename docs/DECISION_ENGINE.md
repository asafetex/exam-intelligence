# Decision Engine

## North-star output

> **What should I study today, for how long, by which method, and why?**

The Decision Engine consumes evidence; it does not manufacture confidence from sparse data.

## Inputs

### Exam-side
- current edital/Atomic Tree;
- historical incidence;
- exact recurrence / semantic-family recurrence;
- recency;
- bank/role/organ similarity;
- scoring policy;
- legal/content changes;
- time to exam.

### Candidate-side
- validation/exam accuracy;
- tree coverage;
- novelty/exposure;
- confidence calibration;
- response time;
- retention trajectory;
- error/trap patterns;
- intervention outcomes.

### Operational context
- available study time;
- preparation phase;
- pending due reviews/retests;
- workload/fatigue constraints where explicitly available.

## Baseline priority model

Start interpretable. A conceptual baseline can use:

```text
priority ≈ target_importance
         × mastery_gap
         × coverage_need
         × opportunity_factor
```

Then add evidence only when it improves decisions:
- retention risk;
- time-to-exam urgency;
- recurrence features;
- response-time risk;
- intervention effectiveness;
- maintenance requirement.

Do not jump directly to deep ML.

## Output contract

Each recommendation should be explainable:

```text
55 min — Administrative Acts > Revocation
Why:
- high target relevance
- unseen validation accuracy = 47%
- adequate sample breadth
- 3 recent confident-wrong events
Intervention:
- contrastive rule review
- 12 unseen VUNESP questions
Success check:
- delayed validation battery
```

## Baselines and backtesting

Advanced prioritization must be compared with simple alternatives such as:
- weakest-topic-first;
- highest-frequency-first;
- equal allocation;
- spaced/retest due-first.

Use held-out later exams or prospective candidate performance where possible. If complexity does not improve decisions, discard it.

## Uncertainty

The engine must be allowed to say:
- insufficient coverage;
- weak historical evidence;
- new syllabus area;
- model disagreement;
- uncertain question-family assignment.

False precision is worse than an explicit uncertainty state.
