# Knowledge Pipeline

## Purpose

Convert long-form study sources into a durable, source-grounded Learning Canon **without collapsing a 2–3 hour lesson into a lossy summary**.

The pipeline is designed for owned/private material such as OQF/Rosemara lessons, neuroscience masterclasses and Paulo Benites' method, plus public/open learning-science research.

## Core rule

> **NO SOURCE → NO CANON.**

Every canonical learning recommendation must preserve lineage back to source segments/pages and distinguish explicit claims from inference.

## Source preservation

For video lessons, keep:
- immutable original video locally;
- timestamped transcript;
- relevant slide/frame references when visual content changes meaning;
- source metadata/hash;
- extraction version.

Do not reduce video to audio when slides, diagrams, screen demonstrations or visual examples carry information.

## Transcript representation

Machine-friendly transcript format is JSONL, e.g.:

```json
{"id":"oqf_neuro_01_s001","start":"00:00:00","end":"00:03:42","speaker":"Rosemara","text":"..."}
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
- definition
- principle
- claim
- mechanism
- protocol
- heuristic
- decision_rule
- exercise
- example
- counterexample
- exception
- warning
- metric
- framework
- case
- evidence

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
```

## Human + machine representations

- **JSONL**: atoms, segment mappings, evidence registry.
- **Markdown**: canonical lesson/source documents and concept pages.

Illustrative transformation for one long lesson:

```text
3h lesson
→ ~200 transcript segments
→ ~120 knowledge atoms
→ ~35 concepts
→ ~17 operational rules
→ protocols / examples / exceptions / evidence claims
→ one source-grounded playbook
```

Counts are not targets; preservation and operational usefulness are.

## Canon structure

Likely canonical files:
- `OQF_CANON.md`
- `OQF_NEUROSCIENCE_MAP.md`
- `BENITES_CANON.md`
- `LEARNING_CANON.md`
- `CLAIMS_EVIDENCE_MATRIX.md`

Cross-source concept pages should compare:
- OQF position;
- Benites position;
- EARA/other practitioner position;
- learning-science evidence;
- convergence;
- contradiction;
- current operational recommendation;
- personal validation status.

## Evidence levels

Use a simple evidence registry:

- **A** — systematic review/meta-analysis;
- **B** — multiple converging studies;
- **C** — isolated/limited study;
- **D** — practitioner/expert evidence;
- **E** — hypothesis/marketing claim.

Practical approval cases and mechanistic scientific claims are separate evidence types. A method may work in practice without a practitioner's proposed mechanism being scientifically established.

## Private-source rule

Paid/owned course videos, full transcripts and restricted ebooks remain outside public Git. The repository stores the pipeline, schemas and redistributable derived abstractions only when rights permit.
