# Contributing / Engineering Workflow

Exam Intelligence is currently a single-user project, but changes follow production-grade discipline so Codex Cloud, VS Code and human work remain interoperable.

## Branch model

- `main`: canonical, reviewable state.
- `codex/<milestone-or-task>`: implementation branches.
- `docs/<topic>`: documentation/architecture branches.
- Avoid long-lived divergent branches.

## Before coding

1. Read `AGENTS.md`.
2. Read `docs/PROJECT_STATE.md`.
3. Read the active milestone specification and relevant ADR/domain docs.
4. Identify invariants that the change can break.
5. Add/adjust tests before or alongside implementation.

## Pull request expectations

Every material PR should state:

- problem and intended outcome;
- scope and explicit non-goals;
- architecture/data-model impact;
- migrations/contracts changed;
- tests added/run;
- data/privacy/licensing implications;
- docs updated;
- rollback or recovery notes when relevant.

## Migration policy

Merged migrations are immutable. New schema evolution is a new numbered migration. Before destructive operations, protect non-rebuildable candidate data according to `docs/BACKUP_AND_RECOVERY.md`.

## Data policy

Never commit secrets, private candidate DBs, paid-course corpora, proprietary question dumps or restricted raw documents. Use gitignored local paths and source manifests/provenance as appropriate.

## Quality bar

A change is not complete because the happy path works. It must protect source provenance, identity semantics, recurrence semantics, reproducibility and candidate-evidence integrity.
