# Exam Intelligence

Local-first, single-user system for turning exam evidence into better study decisions.

## North-star question

> What should I study now, for how long, using which intervention, and why?

## V0 philosophy
- Optimize for better learning decisions, not for building another generic exam platform.
- Questions are evidence about the candidate, not merely content to consume.
- The official bank key is what counted on that exam/version; it is not universal truth.
- Every imported item keeps provenance and rights metadata.
- Raw sources are immutable and private by default.
- Historical frequency is evidence, never certainty.
- Accuracy without coverage is not mastery.
- Generated questions never contaminate official Bank DNA.
- Same content, different booklet/order, is not a new historical recurrence.

## Frozen V0 vertical slice
1. Ingest structured questions (JSON/CSV/XLSX/Quest API adapter contract).
2. Ingest an official exam PDF + answer-key PDF into staging.
3. Normalize to the canonical question schema while preserving stimuli/media and presentation order.
4. Detect source duplicates and exact cross-exam repetitions without confusing alternate booklets.
5. Persist exams, forms, questions, occurrences, options, answer keys, taxonomy and sources in SQLite.
6. Run a local Mini-QC session: question → timer → answer → confidence → verdict.
7. Save longitudinal candidate evidence with reproducible scoring snapshots.
8. Produce first topic-level diagnostic and next-action report.

See `docs/V0_FROZEN_SPEC.md` and `docs/FINAL_AUDIT.md`.

## Data safety
This repository may be public, but imported question banks, paid-course material, raw PDFs/videos, API secrets and candidate performance data must remain outside Git. See `docs/DATA_GOVERNANCE.md`.
