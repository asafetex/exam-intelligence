# Candidate Model

## Goal

Estimate what the candidate currently demonstrates, with uncertainty, at a level granular enough to change study decisions.

## Evidence channels

### Accuracy / score
Necessary but insufficient. Keep raw correctness and scoring-policy outcome separate.

### Coverage
How much of the target Atomic Tree has actually been sampled with enough breadth.

### Novelty / exposure
Unseen-question performance is stronger evidence of transferable mastery than repeated-item recognition. Track first-seen and seen counts.

### Response time
Distinguishes slow-correct from fluent retrieval and may reveal exam-time risk.

### Confidence / calibration
Capture before reveal. Detect confident-wrong states, chronic underconfidence and calibration changes.

### Retention
Current performance is not durable mastery. Use delayed comparable probes and/or memory-review evidence.

### Error type
Canonical taxonomy can include knowledge, retrieval, interpretation, calculation, trap, attention, metacognition and time pressure. Keep collection low-friction.

## Three performance channels

```text
learning_accuracy
validation_accuracy
exam_accuracy
```

Do not collapse them into one percentage.

## Coverage-aware mastery

A topic with 90% accuracy from 10 repeated questions concentrated in one subtopic should be marked as insufficient evidence rather than “90% mastered.”

Mastery estimates should retain confidence/uncertainty based on sample size, breadth and recency.

## Confident-wrong

Wrong + high confidence is a particularly valuable diagnostic event because it suggests a stable misconception, false rule or calibration problem rather than random uncertainty.

## Answer changing

Track first/final answer rather than assuming changes are bad. Later analysis can estimate candidate-specific answer-change value by confidence/context.

## Personal learning experiments

Later, interventions can be evaluated as N-of-1 experiments on comparable topics with delayed outcome measurements. Do not infer user-specific method superiority from one or two examples.

## Model evolution

V0/M001: descriptive primitives and topic-level evidence.
Later: Bayesian/shrinkage mastery estimates, retention models or knowledge tracing only if they improve predictive/decision quality over simple baselines.
