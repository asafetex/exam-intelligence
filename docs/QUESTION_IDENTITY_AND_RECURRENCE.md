# Question Identity and Recurrence

This is one of the project's most important semantic contracts.

## Four different phenomena

### 1. Source duplicate — noise
The same official occurrence is imported from Quest API and again from an official PDF. Result: one occurrence, multiple source links. **No recurrence increase.**

### 2. Alternate exam form/booklet — presentation variation
The same exam distributes cadernos with reordered questions/options. Result: distinct `exam_form`/presentation information where necessary, without pretending the bank tested the knowledge twice. **No historical recurrence increase.**

### 3. Exact cross-exam recurrence — evidence
The same canonical question appears in PF 2021 and PF 2025. Result: one canonical `question`, two legitimate `question_occurrence` rows. **Exact recurrence increases.** This is a meaningful signal of what the bank repeatedly values.

### 4. Semantic family recurrence — later evidence layer
Different wording/numbers/context test essentially the same proposition or operation. These belong to a `question_family` when evidence supports the grouping.

## Three recurrence levels for exam intelligence

```text
EXACT QUESTION RECURRENCE
        ↓
QUESTION FAMILY RECURRENCE
        ↓
ATOMIC TOPIC INCIDENCE
```

These signals must remain distinct because they answer different questions.

## Why exact recurrence matters

A reused official item is stronger evidence than two copies of a dataset row. It can indicate a stable content pattern, but it never means the item is guaranteed to recur again. The Decision Engine may treat recurrence as one predictive feature alongside recency, target similarity and syllabus relevance.

## Canonical identity

The identity algorithm uses normalized semantic content and is versioned. Option labels/order do not define canonical identity; content does. Presentation details are captured separately so the system can reproduce the original exam context.

## Near duplicate caution

Typos, whitespace or small formatting changes may indicate the same item. Material changes in conditions, legal date, numerical values or proposition meaning may create a distinct canonical question even if text similarity is high. Automatic merging must be conservative and reviewable.

## Question family caution

Semantic grouping is probabilistic/model-assisted later. A family should encode a meaningful reusable proposition/skill, not merely “same subject.” Family assignment must preserve method/version/confidence and allow human review.

## Study interpretation

Exact recurrence should trigger investigation of the underlying pattern:

```text
exact repeat
    ↓
question family / proposition
    ↓
atomic concept or skill
    ↓
priority / mastery requirement
```

The goal is not memorizing a numeric answer. It is identifying the reusable knowledge structure the bank is signaling.
