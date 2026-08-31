# Codex Context Handoff

This document defines how a fresh Codex Cloud / VS Code session should recover the full project context without access to prior ChatGPT conversations.

## Why this exists

ChatGPT conversations were the original design environment, but chat history must not be a runtime dependency for engineering. The repository is the durable project memory.

`PROJECT_CONTEXT_CANON.md` preserves the conversation-level rationale and conceptual evolution. Domain docs preserve normative implementation rules. `PROJECT_STATE.md` preserves current operational truth.

## Mandatory first-session read order

A fresh Codex environment should read:

1. `AGENTS.md`
2. `docs/PROJECT_STATE.md`
3. `docs/PROJECT_CONTEXT_CANON.md`
4. `docs/CONTEXT_PARITY_AUDIT.md`
5. `docs/README.md`
6. `docs/PRODUCT_VISION.md`
7. `docs/PROJECT_PRINCIPLES.md`
8. `docs/SYSTEM_ARCHITECTURE.md`
9. `docs/DOMAIN_MODEL.md`
10. `docs/IMPLEMENTATION_MAP.md`
11. active milestone document
12. relevant domain docs and ADRs
13. active GitHub issue

After the first context recovery, normal task work can use the shorter read order in `AGENTS.md`.

## Precedence

If files disagree, use this precedence:

1. accepted/superseding ADR;
2. current normative domain document;
3. current milestone spec + GitHub acceptance issue;
4. `PROJECT_STATE.md` for operational state;
5. `PROJECT_CONTEXT_CANON.md` for historical rationale/context;
6. benchmarks/research as evidence inputs only.

Do not silently resolve conflicts. Flag and update the appropriate canonical file.

## M001 kickoff instruction

For M001, a fresh Codex session should receive only a short instruction because the repository contains the context:

> Recover project context using `docs/CODEX_CONTEXT_HANDOFF.md`. Then implement GitHub issue #1 on `codex/m001-foundation`. Respect the frozen architecture and M001 scope gate. Do not implement M002+ features. Work incrementally, run tests at each checkpoint, preserve provenance/recurrence/scoring invariants, and update `docs/PROJECT_STATE.md` with material progress.

## Cloud vs local boundary

Codex Cloud is appropriate for repository-contained code/docs/tests and synthetic fixtures.

Local VS Code/Codex is preferred when work requires:

- proprietary or paid-course corpora;
- raw private exam/question exports;
- local candidate database;
- API credentials;
- large/private media;
- parser debugging against assets intentionally excluded from public Git.

## Required handoff behavior after meaningful work

Before handing work to another agent/session:

1. commit coherent changes;
2. ensure tests are green or document failures;
3. update `PROJECT_STATE.md` if state changed materially;
4. update domain docs/ADR if architecture or behavior changed;
5. ensure no sensitive corpus/secrets entered Git;
6. leave the branch/PR in a reproducible state.

This process is the replacement for relying on conversational memory.
