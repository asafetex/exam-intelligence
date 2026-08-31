# Legal Authority Graph

## Motivation

In law-heavy public exams, the operationally correct answer is often “what the bank accepted under the legal/jurisprudential context of that exam,” not a timeless scientific truth.

## Core distinction

```text
OFFICIAL BANK KEY
        ≠
CURRENT/HISTORICAL LEGAL EVIDENCE
```

A question occurrence can link to:
- statute/law;
- article/paragraph/item;
- regulation;
- precedent/súmula/theme;
- doctrine reference where relevant;
- authority version valid at the exam date.

## Temporal model

```text
legal_authority
    ↓
legal_authority_version
    ├── valid_from
    ├── valid_to
    ├── source/provenance
    └── text/identifier

question_occurrence
    ↕
occurrence_authority
```

This allows the system to mark a historical question as:
- still current;
- legally outdated after amendment;
- jurisprudentially superseded;
- controversial/divergent;
- bank-specific interpretation requiring caution.

## Bank interpretation analysis

Only after enough evidence may the system compare how banks treat a proposition. “Cebraspe thinks X” is not inferred from one disputed item. Preserve sample size, dates and authority versions.

## Study value

The graph enables future queries such as:
- most-tested articles for a target bank;
- provisions with recent incidence growth;
- candidate weak articles;
- questions invalidated by later legal change;
- recurrent bank disputes on the same authority.

## Verification principle

AI-generated explanations must not be presented as authoritative legal sources. The UI should visually separate bank key, verified authority and AI synthesis/confidence.
