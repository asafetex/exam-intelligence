# Knowledge Pipeline

## Purpose

Convert long-form practitioner/scientific study sources into a durable, source-grounded Learning Canon **without collapsing a multi-hour lesson into a lossy summary**.

This pipeline remains the standard for future sources. However, Batismo 2.0 and the Masterclass Neurociência are **no longer hypothetical future ingestion targets**: their canonical packages have already been reconstructed and are now design inputs to the Learning Operating System.

## Current recovered corpus state

### Batismo 2.0
Recovered canonical package based on **11 lesson transcripts** with:
- lesson-by-lesson ingestion;
- integrated canonical doctrine;
- machine-readable rules/schema;
- decision engine;
- evidence/conflict register;
- source manifest;
- implementation bridge.

Materially recovered concepts include:
- intake/material validation;
- 80/20 then 20/80 basic formation;
- D1…Dn ranking;
- error taxonomy;
- mesocycle/periodization;
- overload, continuity, specificity, individuality and variability;
- edital urgency/surprise subject;
- final-sprint/countdown templates;
- optimized reading/question practice;
- simulation/debrief.

### Masterclass Neurociência
Recovered canonical package based on **6 lesson transcripts** with:
- integrated doctrine;
- claims registry;
- technique registry;
- study protocols;
- project integration spec;
- assistant playbook;
- **19-document scientific attachment audit**.

Materially recovered concepts include:
- focus/exclusion;
- readiness/alertness/recovery;
- task clarity;
- challenge-skill calibration;
- active practice;
- feedback/progress;
- habit architecture;
- frustration/procrastination;
- progressive variation;
- non-clinical safety boundaries.

### Scientific pack
The 19-document pack has already been audited for source integrity and permitted inference. At least two artifacts demonstrated why content-level verification is mandatory: one source was mislabeled relative to its actual content and another was only a placeholder rather than a usable primary article.

Derived public-safe synthesis lives in:
- `research/MASTERCLASS_SCIENTIFIC_PACK.md`;
- `SCIENTIFIC_LEARNING_CANON.md`.

### OQF protocol
The recovered protocol has been operationalized as a 30-day behavioral/performance experiment with baseline, controlled progression, specificity and end-of-cycle reassessment—not as a magical habit/neural deadline.

## Current role in architecture

Batismo/Masterclass are now governed by ADR 0009:

> **They are first-class Learning Operating System design authorities, not merely future RAG content.**

The Knowledge Pipeline continues to preserve and extend their source lineage, while the normative product rules live in:
- `LEARNING_OPERATING_SYSTEM.md`;
- `BATISMO_MASTERCLASS_INTEGRATION.md`;
- `LEARNING_INTELLIGENCE.md`;
- `PERIODIZATION_ENGINE.md`;
- `DECISION_ENGINE.md`.

## Core rule

> **NO SOURCE → NO CANON.**

Every canonical learning recommendation must preserve lineage back to source segments/pages or a reviewed derived rule. Explicit course claims, operational translations, scientific evidence and inference remain distinguishable.

## Source preservation

For video lessons, keep privately/local:
- immutable original video;
- timestamped transcript;
- relevant slide/frame references when visual content changes meaning;
- source metadata/hash;
- extraction version.

Do not reduce video to audio when slides, diagrams, screen demonstrations or visual examples carry information.

## Transcript representation

Machine-friendly transcript format is JSONL, e.g.:

```json
{"id":"oqf_neuro_01_s001","start":"00:00:00","end":"00:03:42","speaker":"source_speaker","text":"..."}
```

JSONL supports chunk processing, patching and timestamp-level citation better than one monolithic JSON document.

## Five-pass pipeline

### Pass 1 — Extraction
Extract exhaustive knowledge units by source chunk. Do not summarize away examples, exceptions, warnings or conditions.

### Pass 2 — Normalization
Group repeated/related atoms while preserving the original atoms and lineage.

### Pass 3 — Synthesis
Build concept pages that reconcile related atoms without erasing disagreement.

### Pass 4 — Operationalization
Translate useful knowledge into structures such as:

```text
condition → diagnosis → intervention → protocol → measurement
```

### Pass 5 — Coverage Audit
Every source segment must map to extracted atoms/rules or be explicitly labeled `UNCOVERED`. This is the guard against silent knowledge loss.

## Knowledge atom types

Initial vocabulary:
- definition;
- principle;
- claim;
- mechanism;
- protocol;
- heuristic;
- decision_rule;
- exercise;
- example;
- counterexample;
- exception;
- warning;
- metric;
- framework;
- case;
- evidence;
- outcome_claim;
- guardrail;
- conflict;
- source_defect.

Suggested fields:

```text
id
type
concept
claim
conditions
exceptions
application
examples
source_id
source_locator
extraction_version
confidence: explicit | inferred
evidence_refs
risk
```

## Human + machine representations

- **JSONL/JSON:** atoms, segment mappings, claims, evidence/technique registries.
- **Markdown:** canonical lesson/source documents, integration docs and concept pages.

Illustrative transformation:

```text
3h lesson
→ timestamped segments
→ exhaustive atoms
→ concepts / conflicts
→ operational rules
→ techniques / protocols
→ evidence mappings
→ Learning OS integration
```

Counts are not targets; preservation and operational usefulness are.

## Evidence architecture

Do not collapse all learning evidence into a single ladder. Preserve at least:
- practitioner protocol evidence;
- practitioner outcome evidence;
- scientific intervention evidence;
- mechanism evidence;
- candidate-local evidence.

A method may produce useful outcomes even when the practitioner's biological explanation is incomplete. Conversely, mechanistic plausibility does not prove exam improvement.

See `EVIDENCE_FRAMEWORK.md` and ADR 0010.

## Cross-source concept pages

As more methods enter the system, compare:
- Batismo/Masterclass position;
- Benites position;
- EARA/other practitioner position;
- direct learning-science evidence;
- mechanistic evidence where useful;
- convergence;
- contradiction;
- current operational recommendation;
- candidate-local validation status.

The purpose is not to flatten methods into generic advice. Preserve distinctive operational procedures and test which solves the diagnosed state best.

## Next knowledge priorities

Because Batismo/Masterclass canon is already recovered, the next knowledge tasks are:
1. preserve/import the derived machine-readable technique/claim registries locally or in Git where rights permit;
2. map technique IDs to our `learning_intervention` registry;
3. add auditable practitioner cohort/outcome evidence where source material exists;
4. ingest Benites/other practitioner corpus with the same lossless method;
5. continuously extend scientific evidence by concept rather than accumulating unstructured papers.

## Private-source rule

Paid/owned course videos, full transcripts and restricted ebooks remain outside public Git. This public repository stores:
- schemas/pipeline code;
- source IDs/hashes/manifests when appropriate;
- sufficiently abstracted derived doctrine;
- evidence mappings;
- operational protocols that do not reproduce restricted source content.
