# Evidence Framework

## Why it exists

Exam Intelligence combines official exam facts, Batismo/Masterclass practitioner doctrine, reported outcome history, scientific literature, candidate experiments, legal authority and model inference. These answer different questions and must never collapse into one undifferentiated label such as “proven.”

## Evidence classes

### Exam evidence
Official syllabus, exam occurrence, answer-key version, scoring policy, bank/role/date context.

### Authority evidence
Law/regulation/precedent/source version valid at a particular time.

### Practitioner protocol evidence
What Batismo/Masterclass/Benites/etc. actually prescribe, including conditions, phases, techniques, examples and exceptions.

### Practitioner outcome evidence
Observed or reported real-world outcomes associated with a method/cohort: approvals, classifications, TAF progression, scores or other exam-relevant outcomes.

When numeric claims become product facts, preserve auditable provenance such as cohort, source, denominator/selection definition and method version. Outcome history is important pragmatic evidence but does not by itself identify which component or biological mechanism caused the result.

### Scientific intervention evidence
Human learning/behavior research directly relevant to the technique: retrieval practice, spacing, feedback, elaboration, sleep/readiness, habit, etc.

### Mechanism evidence
Neural/cognitive explanation (dopamine, striatal circuitry, BDNF, plasticity, etc.). Mechanism evidence is useful context but is generally farther from a direct exam-study action than intervention/outcome evidence.

### Candidate-local evidence
Observed attempts, delayed retention, transfer, simulation and intervention outcomes for the actual candidate.

### Model inference
Atomic Topic suggestion, semantic family, trap label, generated explanation. Preserve model/version/confidence/review state.

## Method efficacy and mechanism truth are separate dimensions

A safe behavioral protocol can remain valuable when a practitioner's mechanism is incomplete. Conversely, a plausible mechanism does not prove an intervention improves exam performance.

Therefore track at least:

```text
protocol_support
practitioner_outcome_support
scientific_intervention_support
mechanism_support
candidate_local_support
```

Do not compress them into one score unless the aggregation is explicit and reversible.

## Action precedence under conflict

For deciding what the system should do:

1. safety / law / current official exam source;
2. verified target-exam facts;
3. observed candidate evidence;
4. strong direct human learning evidence;
5. Batismo/Masterclass operational canon + documented outcome evidence;
6. indirect/mechanistic evidence;
7. practitioner heuristic/example;
8. unsupported metaphor/marketing claim.

This is a conflict-resolution rule, not a dismissal of practitioner expertise.

## Learning claim strength

Working scientific scale:
- **A:** systematic review/meta-analysis or multiple strong convergent human studies;
- **B:** multiple convergent studies with relevant populations/tasks;
- **C:** isolated/limited/contextual study;
- **D:** indirect/mechanistic evidence;
- **X:** contradicted, unsafe or source-defective.

Practitioner outcome evidence uses separate fields rather than being forced into this hierarchy.

## Evidence convergence

Strongest operational state:

```text
practitioner method
+ direct learning evidence
+ candidate-local improvement
+ exam relevance
```

If one lane is missing but the intervention is safe, the system may use the method as a measured prior rather than discarding it.

## Claims matrix

Canonical rows should be able to include:

```text
claim_id
claim
course_source + locator
protocol/intervention
conditions
exceptions
best use
bad use
practitioner outcome refs
scientific intervention refs
mechanism refs
scientific verdict
candidate validation status
risk
version/reviewer/date
```

## Source integrity

The recovered Masterclass scientific pack contained at least two defective artifacts (one mislabeled source and one placeholder). Therefore:
- filename/title is not evidence;
- preserve hash and integrity status;
- inspect study type/population;
- preserve prohibited inference;
- never mark a source as supporting a claim only because it appears in course material.

## Conflict rule

Do not erase disagreement. Preserve:
- what the course teaches;
- what outcomes are documented/reported;
- what scientific evidence directly supports;
- what mechanism evidence supports;
- what this candidate's data shows.

The Learning Canon states the current operational recommendation and why. Scientific correction should improve the causal story without deleting a useful safe protocol solely because its original biological explanation was overconfident.

See:
- `BATISMO_MASTERCLASS_INTEGRATION.md`;
- `SCIENTIFIC_LEARNING_CANON.md`;
- ADR 0010.
