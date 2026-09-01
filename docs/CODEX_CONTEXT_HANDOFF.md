# Codex Context Handoff

This document defines how a fresh Codex Cloud / VS Code session should recover the full project context without access to prior ChatGPT conversations.

## Why this exists

ChatGPT conversations were the original design environment, but chat history must not be a runtime dependency for engineering. The repository is the durable project memory.

`PROJECT_CONTEXT_CANON.md` preserves conversation-level rationale and conceptual evolution. Domain docs preserve normative implementation rules. `PROJECT_STATE.md` preserves current operational truth.

The project also has a now-frozen learning doctrine: **Batismo 2.0 + Masterclass Neurociência are core Learning Operating System inputs**, refined by learning science and candidate-local evidence. A fresh engineer must understand this before changing session/learning/decision behavior.

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
9. **`docs/LEARNING_OPERATING_SYSTEM.md`**
10. **`docs/BATISMO_MASTERCLASS_INTEGRATION.md`**
11. `docs/SCIENTIFIC_LEARNING_CANON.md`
12. `docs/EVIDENCE_FRAMEWORK.md`
13. `docs/DOMAIN_MODEL.md`
14. `docs/DATA_MODEL.md`
15. `docs/IMPLEMENTATION_MAP.md`
16. active milestone document
17. relevant domain docs and ADRs — for learning work include ADR 0009 and ADR 0010
18. active GitHub issue

After the first context recovery, normal task work can use the shorter read order in `AGENTS.md`.

## Critical reconstructed project rule

Do not reinterpret the project as:

```text
question bank + generic learning tips
```

The intended architecture is:

```text
exam evidence
+ candidate evidence
→ diagnosis
→ Batismo strategic phase/allocation
→ Masterclass readiness/attention/difficulty gates
→ learning-science-refined intervention
→ active execution
→ delayed/transfer evidence
→ next decision
```

Practitioner protocol/outcome evidence and scientific mechanism evidence are separate lanes. Do not discard a safe, useful exam-preparation protocol solely because one neuroscience explanation is incomplete; also do not turn a neuroscience mechanism into an automated intervention without behavioral/outcome support.

## Precedence

If files disagree, use this precedence:

1. safety/current official source for the target domain;
2. accepted/superseding ADR;
3. current normative domain document;
4. for learning behavior, `LEARNING_OPERATING_SYSTEM.md` + its specific integration/evidence docs;
5. current milestone spec + GitHub acceptance issue for scope;
6. `PROJECT_STATE.md` for operational state;
7. `PROJECT_CONTEXT_CANON.md` for historical rationale/context;
8. benchmarks/research as evidence inputs only.

Do not silently resolve conflicts. Flag and update the appropriate canonical file.

## M001 kickoff instruction

For M001, a fresh Codex session can receive a short instruction because the repository contains the context:

> Recover the complete project context using `docs/CODEX_CONTEXT_HANDOFF.md`. Then implement GitHub issue #1 on `codex/m001-foundation`. Respect the frozen architecture, including Learning OS ADRs 0009–0010 and schema-v3 context hooks, but do not implement the full adaptive Learning OS in M001. Work incrementally, run tests at each checkpoint, preserve provenance/recurrence/scoring/session-context invariants, and update `docs/PROJECT_STATE.md` with material progress.

## Cloud vs local boundary

Codex Cloud is appropriate for repository-contained code/docs/tests and synthetic fixtures.

Local VS Code/Codex is preferred when work requires:
- proprietary or paid-course corpora;
- full Batismo/Masterclass/OQF source transcripts/videos;
- raw private exam/question exports;
- local candidate database;
- API credentials;
- large/private media;
- parser debugging against assets intentionally excluded from public Git.

The Cloud runtime should consume reviewed derived Learning OS rules, not require access to paid raw transcripts.

## Required handoff behavior after meaningful work

Before handing work to another agent/session:

1. commit coherent changes;
2. ensure tests are green or document failures;
3. update `PROJECT_STATE.md` if state changed materially;
4. update domain docs/ADR if architecture or behavior changed;
5. ensure no sensitive corpus/secrets entered Git;
6. preserve phase/intervention/model version where historical learning evidence is created;
7. leave the branch/PR in a reproducible state.

This process replaces reliance on conversational memory.
