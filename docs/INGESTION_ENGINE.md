# Ingestion Engine

## Goal

Make corpus acquisition cheap enough that study is never bottlenecked by manual data entry while preserving enough provenance and quality controls for downstream analytics to be trusted.

## Source-agnostic pipeline

```text
SOURCE
  ↓
SOURCE REGISTRY
  ↓
ADAPTER / EXTRACTOR
  ↓
STAGING CONTRACT
  ↓
QUALITY GATES
  ├── pass → NORMALIZE / IDENTITY / LOAD
  └── fail → QUARANTINE / REVIEW
  ↓
CANONICAL DB
```

## Supported source families

- Quest API / future authorized APIs;
- JSON / JSONL;
- CSV / XLSX with smart column mapping;
- official exam PDF;
- independent answer-key PDF;
- public/open datasets;
- legitimate platform exports/print artifacts;
- manual/user-created and AI-generated items with explicit source type.

## Structured import UX

The importer should inspect headers/data and propose mappings such as:

```text
Questão        → stem
Alternativa A  → option_a
...
Gabarito       → answer
Banca          → bank
Disciplina     → subject
Ano            → year
Cargo          → role
```

User confirmation is required when mapping confidence is low. Import preview must expose missing/ambiguous fields before canonical load.

## PDF route

Default order:
1. preserve original PDF and hash;
2. native text/layout extraction;
3. detect question/option/stimulus boundaries;
4. create staging records with source page/locator;
5. parse answer key independently;
6. join by stable exam/form/question-number context;
7. validate expected counts and dependencies;
8. quarantine ambiguous records;
9. canonical load.

OCR is fallback, not default. Image/table-dependent questions remain incomplete until media dependencies are preserved.

## Quality gates

At minimum:
- expected vs extracted question count;
- allowed question type and option cardinality;
- answer-key coverage and orphan answers;
- duplicated external IDs/question numbers within context;
- unresolved shared stimulus/media;
- parser confidence threshold;
- exam/form ambiguity;
- schema-contract validation;
- identity conflicts;
- rights/provenance metadata.

## Import report

Every batch should produce an audit summary such as:

```text
48,237 discovered
46,891 loaded
913 source duplicates linked
301 incomplete/quarantined
132 require review
0 silent failures
```

## Adapter philosophy

External formats change. Each provider-specific adapter converts to the same internal staging contract. Canonical tables must never contain provider-specific layout assumptions.

## Append workflow

After initial historical bootstrap, normal operation is append-only: download a new official exam/key, place it in the incoming source area, ingest, update recurrence/incidence and preserve the source asset.
