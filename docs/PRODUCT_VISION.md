# Product Vision

## Problem

Competitive-exam study is usually managed with coarse proxies: hours studied, percentage of a course watched, overall subject accuracy, number of questions answered and generic revision schedules. These metrics are useful but insufficient because they fail to answer the operational question that determines progress:

> **Where should the next hour go to create the largest increase in expected exam performance?**

A candidate may have 90% accuracy while covering only a narrow slice of the syllabus, 70% accuracy inflated by repeated questions, good immediate performance with poor D+14 retention, or strong content knowledge combined with systematic susceptibility to bank-specific traps.

## Vision

Exam Intelligence becomes a personal learning/assessment operating system that continuously fuses:

1. **Target demand** — what the edital and historical exam evidence indicate matters.
2. **Candidate state** — what responses demonstrate at atomic-topic and transversal-skill level.
3. **Learning knowledge** — what intervention is appropriate for the diagnosed problem.
4. **Time/context** — days to exam, available time, fatigue, coverage and phase of preparation.

The system then produces and re-evaluates a concrete study decision.

## Core loop

```text
Observe → Diagnose → Choose Intervention → Study → Test → Learn from Result → Repeat
```

- Atomic Tree says **where**.
- Historical exams say **how much it appears to matter**.
- Mini-QC measures **what the candidate demonstrates**.
- Learning Canon says **how to improve the diagnosed state**.
- Decision Engine decides **where the next hour goes**.

## Product wedge

The project begins as a local single-user system rather than a general commercial platform. This is a feature: it permits unusually deep personalization, strict evidence preservation and rapid experimentation without needing onboarding, community, monetization or universal UX.

## Long-term output

A mature `Today` view may say:

```text
TODAY — 3h00 available

55m  Administrative Law > Administrative Acts > Revocation
     Why: high target incidence + 47% unseen validation accuracy
     Intervention: contrastive study + 12 unseen bank questions

40m  Constitutional Law > Fundamental Rights
     Why: retention fell 19pp on comparable probes
     Intervention: retrieval + delayed retest

35m  Portuguese > Interpretation
     Why: maintenance of high-weight stable area

30m  Unseen VUNESP validation battery

20m  Confident-wrong review across subjects
```

The explanation is part of the product: recommendations must be inspectable, not opaque.

## Success criterion

The system is successful only if it improves study allocation, retention, calibrated decision-making and ultimately exam score/probability of approval compared with simpler baselines.
