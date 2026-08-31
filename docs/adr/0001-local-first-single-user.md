# ADR-0001 — Local-first, single-user initial architecture

**Status:** Accepted

## Context
The project exists to optimize one candidate's study decisions, not to launch a multi-user SaaS. Private corpora and candidate telemetry are central.

## Decision
V0 runs locally and assumes one user. Multi-user auth/cloud tenancy is explicitly deferred.

## Consequences
- faster iteration and deeper personalization;
- simpler privacy model;
- local file access for PDFs/videos;
- no early auth/community/payment complexity;
- future multi-user work requires a deliberate ADR rather than accidental coupling.
