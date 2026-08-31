# Identity and Normalization V0

Identity rules are versioned. Never change V0 normalization silently. A future rule change creates a new `identity_version` and explicit migration/reconciliation path.

## Canonical question identity — v0
Input components:
- question type
- normalized stem
- normalized shared stimulus identity when semantically required
- normalized **set** of option texts (labels/order ignored)

Normalization:
1. Unicode NFKC.
2. Normalize line endings.
3. Trim leading/trailing whitespace.
4. Collapse repeated internal whitespace outside meaningful code/preformatted blocks.
5. Preserve lexical case and accents in stored text; hashing may use a documented normalized representation, not destructive source rewriting.
6. Normalize trivial presentation-only punctuation/HTML wrappers only when demonstrably safe.
7. SHA-256 the serialized canonical representation.

`question.identity_hash` uses this representation and `identity_version='v0'`.

## Presentation identity — v0
`presentation_hash` preserves occurrence-specific:
- original stem rendering
- option labels and order
- occurrence stimulus/media presentation

This lets shuffled booklets map to the same canonical question while retaining their exact presentation.

## ID strategy
- Content entities may use stable IDs derived from SHA-256 prefixes plus type namespace.
- Operational events (`import_batch`, session, attempt) use random UUIDs/ULIDs.
- Never derive historical recurrence from IDs alone; use exam/form/occurrence semantics.

## Time
Persist timestamps as timezone-aware ISO-8601 UTC. Convert to local time only for display.
