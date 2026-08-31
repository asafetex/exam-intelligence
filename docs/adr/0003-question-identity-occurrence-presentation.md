# ADR-0003 — Separate question identity, occurrence and presentation

**Status:** Accepted

## Context
The same item may be imported from multiple sources, appear in multiple official exams or be reordered across cadernos. Treating every row as a separate question destroys recurrence analytics.

## Decision
Model canonical question content separately from official exam occurrence and occurrence-specific presentation/options.

## Consequences
- source duplicates do not inflate recurrence;
- alternate forms do not inflate incidence;
- legitimate cross-exam exact repetition is preserved as evidence;
- option label/order is occurrence-specific;
- identity algorithms require explicit versioning and conservative merges.
