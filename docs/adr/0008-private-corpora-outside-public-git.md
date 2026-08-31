# ADR-0008 — Keep private/restricted corpora outside public Git

**Status:** Accepted

## Context
The project uses owned paid courses, candidate telemetry, API credentials and potentially restricted question exports. The code repository is public today.

## Decision
Raw proprietary/private corpora and candidate DBs remain in gitignored local storage. Git contains code, schemas, public docs, manifests/hashes and redistributable derived artifacts only when rights allow.

## Consequences
- lower copyright/privacy/security risk;
- Cloud coding tasks cannot assume private corpora are available;
- local VS Code/runtime remains essential for source ingestion and candidate data.
