# Development Workflow — GitHub + Codex Cloud + VS Code

## Source of truth
GitHub repository code/docs + migrations are canonical.

## Codex Cloud
Use for repository-contained work that does not require local proprietary corpora or local secrets:
- code implementation
- tests
- refactors
- schema/migration work
- documentation updates
- pull requests

## VS Code / local Codex
Use for:
- running the local web app
- ingesting private PDFs/question exports
- paid-course/video processing
- parser debugging against local files
- SQLite inspection
- local secrets/API tokens

## Branch discipline
- `main`: known-good canonical state
- feature work: `codex/<milestone-or-task>`
- merge only after tests and documentation/state updates

## State handoff
Every material merge updates `docs/PROJECT_STATE.md`. This is the compact handoff between ChatGPT, Codex Cloud and local VS Code sessions.
