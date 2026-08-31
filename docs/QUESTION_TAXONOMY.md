# Question Taxonomy

## Universal abstraction

```text
Item → propositions → alternatives → candidate response → scoring rule
```

## Initial item types

- `binary` — C/E, true/false;
- `single_choice` — exactly one selected option;
- `multiple_choice` — one or more selected options;
- `numeric` / short response — schema-ready later.

## Stem operators

Useful normalized operators include:
- `select_correct`;
- `select_incorrect`;
- `except`;
- `best_answer`;
- `judge_statement`;
- `calculate`;
- `order_sequence`;
- `match`.

The operator is Assessment DNA and may explain errors that topic classification alone cannot.

## Proposition decomposition

Compound statements/options may later be decomposed into atomic claims for distractor analysis, but the original rendered item remains immutable. Do not over-decompose simple questions just to create graph complexity.

## Alternative relationship

For single-choice questions, options form a competitive set. Do not assign independent binary probabilities to five alternatives and pretend they sum arbitrarily. Candidate confidence can later be modeled as a probability distribution across the option set when useful.

## Distractor classes

Initial vocabulary:
- polarity inversion;
- deadline/value substitution;
- rule-vs-exception;
- absolutization;
- authority/competency substitution;
- similar-concept substitution;
- partially true;
- outdated rule;
- invented condition/exception;
- irrelevant-but-plausible.

Taxonomy labels are evidence with classifier/version/confidence, not timeless facts.

## Bank DNA relationship

Content taxonomy answers **what** is tested. Question/assessment taxonomy answers **how** the content is transformed into an item.
