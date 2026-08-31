# ADR-0005 — Source-agnostic ingestion through staging contracts

**Status:** Accepted

## Context
Corpora may arrive via API, CSV/XLSX/JSON, official PDF, public dataset or legitimate platform export. External formats change.

## Decision
Every source adapter emits a versioned staging contract. Validation/quality gates occur before canonical load.

## Consequences
- canonical DB is decoupled from provider layouts;
- Quest API is useful but not a hard dependency;
- parser failures are quarantined/auditable;
- new source adapters can be appended without redesigning assessment logic.
