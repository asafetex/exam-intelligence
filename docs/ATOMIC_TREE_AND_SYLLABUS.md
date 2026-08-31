# Atomic Tree and Syllabus Engine

## Problem

“81% in Administrative Law” is often meaningless. It can hide severe sample concentration: 90 questions from one subtopic and almost none from the rest of the edital.

## Canonical hierarchy

```text
Matter / Subject
  → Macrotheme
    → Topic
      → Subtopic
        → Atomic Topic / Concept / Atomic Skill
```

Example:

```text
Administrative Law
  → Administrative Acts
    → Extinction/Withdrawal
      → Revocation
```

Descend only when the additional granularity can materially change diagnosis, scheduling or intervention. Avoid taxonomy theater.

## Source-faithful verticalization

The current edital is first extracted exactly as published, then represented as verticalized `syllabus_item` records. Canonical Atomic Tree mapping is a separate layer.

```text
OFFICIAL EDITAL TEXT
        ↓ preserve
VERTICALIZED SYLLABUS ITEMS
        ↓ map
VERSIONED ATOMIC TREE
```

Do not rewrite source wording merely to make taxonomy cleaner.

## Historical coverage states

Useful evidence classes:
- **Historical Core:** repeatedly tested and present in current edital;
- **Emerging / Uncertain:** new/changed law, new syllabus area or insufficient history;
- **Historical Tail:** present but historically rare/unseen.

“Never tested” does not imply “will not be tested.”

## Coverage metrics

- **Tree Coverage:** breadth of target nodes with adequate candidate evidence.
- **Historical Coverage:** portion of current edital represented in historical exam data.
- **Validated Mastery:** candidate estimate adjusted for coverage, novelty and evidence quality.

## Many-to-many mapping

A question may legitimately test multiple nodes. Primary/secondary contribution or weights may be introduced when needed, but arbitrary over-tagging should be avoided.

## Transversal skill layer

Later, recurring operations such as negation, exception handling, conditional reasoning or reading precision may be modeled as `skill_node`s that cut across subjects. Do not force every error into a subject-only taxonomy.
