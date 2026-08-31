# Project State

Status: **V0 frozen and repository bootstrapped after final loose-end audit**

Current DB schema version: **2**

Active milestone: **M001 — Corpus In → First Attempt Out**
- GitHub issue: `#1`
- working branch: `codex/m001-foundation`

## M001 acceptance test
- Import >= 1,000 structured questions into SQLite.
- Import 1 official VUNESP exam + final answer key through independent staging paths.
- Preserve shared stimulus/media references or quarantine unresolved items.
- Zero silent parser failures: unresolved records are present in the ingestion ledger.
- Prevent source duplicates and alternate booklets from inflating historical recurrence.
- Start a local practice session in browser.
- Record answer, response status, response time, confidence and scoring snapshot.
- Persist attempt and show topic-level result.

## Frozen structural safeguards
- exam vs exam form/booklet separated
- canonical option content vs occurrence label/order separated
- official bank key vs reference answer separated
- source duplicate vs cross-exam repeat separated
- legal authority versioned by date and linked to occurrences
- staging/quarantine ledger exists
- source rights/privacy metadata exists
- user/AI questions can exist without official exam occurrences
- session item order is persisted for reproducibility
- identity/presentation hashing is explicitly versioned
- stimulus media has provenance locators
- ordered idempotent migration runner exists
- backup requirement for non-rebuildable candidate evidence is documented

## Deferred until after M001
- Semantic question-family clustering.
- Deep Question Learning Packets.
- Legal source auto-verification.
- FSRS flashcard UI.
- Adaptive scheduler / Today page.
- Knowledge-ingestion pipeline for OQF/Benites.
- Bank Trap DNA.
- IRT/TRI.
