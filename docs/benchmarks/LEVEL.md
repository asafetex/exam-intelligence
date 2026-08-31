# Benchmark — LEVEL Preparação

## Why benchmark it

LEVEL demonstrates several product patterns directly relevant to Exam Intelligence: large official question bank, topic proficiency, adaptive study path, FSRS-based revision, flashcards, bank traps and rich post-question explanations.

This document records applicable patterns without turning LEVEL into the product specification.

## Applicable patterns

### Today/adaptive path as primary interface
Strong validation of our Decision Engine thesis: the useful home screen is what needs to be done now, not merely charts.

### Rich question execution
Observed post-answer flow includes:
- discipline/topic/bank/organ/year/cargo metadata;
- official key;
- AI commentary;
- legal basis;
- comparison/contrast table;
- concept/map-style synthesis;
- alternative-by-alternative analysis;
- explicit trap warning.

This informed `QUESTION_LEARNING_PACKET.md`.

### Legal grounding
LEVEL's use of cited law/articles reinforces the need for an Authority Graph. Exam Intelligence goes further by separating bank key, authority version and AI synthesis.

### Trap/distractor analysis
Its “pegadinha” framing validates our Assessment DNA / distractor taxonomy direction.

### Inline learning capture
Creating/editing study material/flashcards from question context is highly applicable and should later preserve question + Atomic Topic lineage automatically.

### FSRS
LEVEL's spaced-repetition direction independently supports the decision to use FSRS rather than inventing a scheduler.

## Patterns not copied in V0

- gamification/XP/ranking;
- community/social features;
- polished content editor;
- music/focus-mode extras;
- broad commercial-platform concerns.

## TRI/IRT caution

LEVEL exposes proficiency concepts inspired by TRI/IRT. For our single-user system, item parameters are not trustworthy unless calibrated from suitable population data or imported from a reliable external source. V0 therefore uses transparent descriptive/probabilistic primitives and keeps IRT as a deferred option.

## Differentiation

LEVEL appears to optimize an adaptive exam-preparation platform. Exam Intelligence is narrower: it optimizes **personal decision quality from one candidate's longitudinal evidence**, with deeper provenance, source ingestion and personalized intervention experiments.
