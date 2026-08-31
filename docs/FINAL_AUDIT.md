# Final Loose-End Audit — V0

This audit was performed before the first repository commit so future append work does not require redesigning the core identity model.

## Closed now (structural)
1. **Alternate booklets/forms** — modeled separately from exams so shuffled forms do not create false recurrence.
2. **Option shuffling** — canonical option identity is label/order-independent; presentation labels/order live on occurrences.
3. **Shared passages/images/tables** — first-class stimulus/media references; unresolved dependencies are quarantined.
4. **Answer-key changes** — versioned keys and historical scoring snapshots.
5. **Bank decision vs truth** — official key is occurrence/version-specific; non-official reference answers are separate.
6. **Historical law changes** — stable authority identity + time-versioned authority content linked to question occurrences.
7. **Manual/AI questions** — can exist and be practiced without fabricating an official exam occurrence.
8. **Parser failures** — ingestion ledger stores raw/normalized records, confidence and errors; no silent loss.
9. **Source duplication** — provenance links do not increase exam recurrence.
10. **Exam identity from multiple providers** — external exam/source links and forms prevent duplicate exams.
11. **Reproducible practice sessions** — ordered `session_item`, random seed and scoring/key snapshots.
12. **Copyright/terms/privacy** — source rights metadata and public-repo guardrails are explicit.
13. **Secrets/local data** — `.env`, DBs, imported corpora, private knowledge and generated candidate reports are ignored.
14. **Donor licensing** — architecture-only reuse is documented; copied code later must preserve license notices.
15. **Stable deduplication** — question/presentation normalization and hashing are explicitly versioned.
16. **Media provenance** — stimulus-to-source/media locators are first-class.
17. **Recovery** — private candidate evidence is identified as non-rebuildable and requires local backup before destructive migrations.

## Deliberately deferred (not loose ends)
- semantic question families
- near-duplicate embeddings
- distractor taxonomy / Bank Trap DNA
- Learning Packet generation
- Authority source auto-verification
- FSRS UI
- Knowledge ingestion from paid courses
- adaptive Today engine
- IRT/TRI

These are append features because the frozen schema has stable hooks for them.

## One operational warning
The GitHub repository is currently public. Code/docs are safe to commit, but paid-course files/transcripts, imported commercial question-bank content, API payload dumps, local PDFs, candidate-performance DBs and private reports must remain local unless the repository is made private and source rights permit storage.
