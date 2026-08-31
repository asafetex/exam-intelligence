# Measurement and Metrics

## Metric hierarchy

Raw evidence should be preserved separately from derived metrics.

### Attempt-level
- correctness;
- score under policy;
- response time;
- confidence;
- first/final answer;
- exposure count;
- mode;
- error event.

### Topic-level
- learning/validation/exam accuracy;
- sample size;
- unseen ratio;
- tree breadth/coverage;
- time distribution;
- confident-wrong count/rate;
- retention evidence;
- recency.

### Exam-demand
- current syllabus inclusion;
- historical incidence;
- exact recurrence;
- family recurrence;
- recency;
- contextual target similarity;
- source/legal change flags.

## Confidence calibration

Confidence is captured before feedback. Later metrics may include Brier-style score, calibration curves/ECE and signed over/under-confidence. With sparse samples, prefer simple summaries over noisy charts.

## Multi-choice probability intuition

For five-option single-choice items, blind guessing is 20%; after eliminating one option 25%, two 33.3%, three 50%. Confidence should reflect the candidate's real evidence, not a post-feedback feeling.

For Cebraspe-style +1/-1, expected value under simplified assumptions is `EV = 2p - 1`, with break-even `p = 0.5`. General threshold under gain `G` and loss `L` is `p > L/(G+L)`. Actual policies must be represented explicitly rather than hard-coded globally.

## Mastery reporting rule

Never report mastery from accuracy alone. A topic can be:
- high accuracy / low coverage;
- low accuracy / high coverage;
- high current accuracy / poor delayed retention;
- high content accuracy / poor bank-specific traps.

The UI should surface the evidence state rather than a single seductive percentage.

## Forecast evaluation

Any model estimating exam importance must be evaluated on later held-out exams where possible, with no temporal leakage. Advanced models must beat simple baselines before adoption.
