# Scoring Policies

## Principle

Question representation and scoring policy are separate concerns. A binary item does not inherently imply +1/-1, and a multiple-choice item should not hard-code one exam's penalties.

## Policy contract

A scoring policy should define, at minimum:
- gain for correct response;
- loss/penalty for incorrect response;
- value for blank/skipped;
- annulled-item treatment;
- partial-credit rule where applicable;
- rounding/aggregation behavior;
- policy version and source/exam applicability.

Attempts persist the policy/key snapshot required to reproduce historical scores.

## Cebraspe-style expected value

Under the simplified classic +1 correct / -1 wrong / 0 blank rule:

```text
EV(answer) = p(+1) + (1-p)(-1) = 2p - 1
```

Break-even is `p = 0.5`.

General gain/loss threshold:

```text
p > L / (G + L)
```

where `G` is gain and `L` is magnitude of loss. This is a decision aid only when the actual edital scoring policy matches the configured policy.

## Single-choice

Ordinary five-option single-choice policies typically award a correct response and zero for wrong/blank, but the engine must read the exam policy rather than assume this globally.

## Multiple-choice / numeric

Future policies may support exact-set, Jaccard/partial credit or tolerance bands. These are deferred until a target exam requires them.

## Key changes

A provisional key later changed/annulled must not silently mutate an old attempt. The original scoring snapshot remains reproducible; the system may also expose a recomputed score under the final key as a separate derived view.
