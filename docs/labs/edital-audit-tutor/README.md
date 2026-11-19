# Edital Audit + Tutor Lab — experimental proposal v0.1
Status: **DOCUMENTATION ONLY / RESEARCH BRANCH / NOT MERGED**.
Owner: experimental Lab; existing Exam Intelligence project ownership and active M001 remain unchanged.

## Objective
Explore a source-grounded, exam-specific system combining atomic edital coverage, real historical questions, authorial item generation, independent annulment-quality review, user appeals, versioned repairs, adaptive diagnostics, directed study, and a federated AI Tutor contract.

## Boundary
This is **not a replacement** for the existing Exam Intelligence Atomic Tree, Learning OS, Learning Alert/Remediation Engine, candidate data model, or the active M001 milestone. First compare and decide reuse/adapt via ADR. Do not copy production learner events, paid PDFs, private Drive references or secrets into public Git.

## Read order for Codex
1. Repository `AGENTS.md` and `docs/CODEX_CONTEXT_HANDOFF.md`.
2. `docs/PROJECT_STATE.md`, `docs/PROJECT_CONTEXT_CANON.md`, architecture and active M001.
3. This README and the companion lab docs.
4. Compare contracts, identify conflicts, produce a non-destructive ADR.
5. Only write to a separately approved feature branch/sandbox. Never alter `main`, M001 or remote owners from this document.

## Contents
- `ARCHITECTURE_CANDIDATE.md`: conceptual modules and features.
- `FEDERATION_DATA_CONTRACT.md`: read-only federation, CSV→SQLite, interfaces.
- `TUTOR_PEDAGOGY_QA.md`: reusable tutoring, independent audit and evaluation.
- `HANDOFF_AND_DECISIONS.md`: backlog, decisions, state and next step.

## Claims and status
No API, crawler, new database, new learner model, audit agent or tutor bridge is implemented by these files. Official item occurrence ≠ authorial item. Confidence declared is optional **in the LAB proposal**, creating an explicit conflict with existing repository capture requirements requiring ADR, tests and compatibility plan before any code change.

## Release history
- `LAB-DOC-v0.1` — initial research-only specification on isolated branch. Git commit SHA(s) are the real version trace; this README does not claim CI/test PASS.
