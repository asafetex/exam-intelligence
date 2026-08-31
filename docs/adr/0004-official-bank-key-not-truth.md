# ADR-0004 — Official bank key is a scoring decision, not universal truth

**Status:** Accepted

## Context
Legal/technical questions can be controversial, later annulled or affected by legal/jurisprudential change. Different banks may adopt different interpretations.

## Decision
Store versioned `official_bank_key` records (provisional/final/changed/annulled) per occurrence. Keep legal/scientific authority in separate evidence structures.

## Consequences
- historical scoring remains reproducible;
- later key changes do not rewrite attempt history;
- Authority Graph can represent historical/current legal context independently;
- UI can distinguish bank decision from source-verified explanation.
