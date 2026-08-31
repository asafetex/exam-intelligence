# ADR-0006 — Use FSRS instead of a homegrown spaced-repetition scheduler

**Status:** Accepted

## Context
A mature open implementation already exists and can later optimize parameters from review history. Scheduling research is not the project's differentiator.

## Decision
Integrate `py-fsrs` when the memory phase begins. Do not reimplement FSRS or clone Anki's full application architecture.

## Consequences
- reduced algorithmic risk;
- memory UI/domain remains ours;
- review logs can later tune scheduler parameters;
- question-based validation stays separate from flashcard retrievability.
