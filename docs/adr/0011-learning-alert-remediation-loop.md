# ADR 0011 — Learning Alert & Remediation Engine is a first-class component

**Status:** Accepted  
**Date:** 2026-09-01

## Context

Candidate errors should not merely increase a dashboard counter. Repeated, high-confidence, high-leverage or persistent failures can require an immediate change in the study plan. Conversely, raw error counts can be misleading when sample size, novelty, coverage or execution context are weak.

The project therefore needs an explicit mechanism between diagnosis and intervention that can:
- detect when evidence is sufficient to justify action;
- distinguish content vs execution problems;
- preserve alert evidence and severity;
- assign remediation;
- require retest;
- close or escalate the problem based on outcome.

This behavior is central to the Batismo selective-return logic and to the Masterclass emphasis on error/feedback/adaptation.

## Decision

Add a first-class **Learning Alert & Remediation Engine** between Diagnosis and Intervention/Decision.

Canonical loop:

`candidate evidence → diagnosis → alert → remediation → retest → resolved/escalated → decision`.

Alerts are stateful evidence objects, not UI notifications.

Canonical alert families:
- knowledge gap;
- misconception/confident-wrong;
- concept confusion;
- retention decay;
- coverage gap;
- source gap;
- bank trap;
- time/fluency;
- attention/execution.

Severity vocabulary:
`WATCH | MEDIUM | HIGH | CRITICAL`.

Lifecycle history is append-oriented. Resolution requires evidence appropriate to the alert, preferably delayed/unseen/equivalent validation; clicking “done” is not sufficient.

## Schema

Schema v4 adds:
- `learning_alert` — current alert identity/state + detection evidence snapshot;
- `learning_alert_event` — append-oriented lifecycle/remediation/retest history.

M001 only validates the schema/lifecycle hooks. Automatic detection starts later after Atomic Tree and Candidate Intelligence are trustworthy.

## Rejected alternatives

1. **Simple `errors >= N` notifications** — rejected due sample-size, repetition and coverage bias.
2. **Dashboard-only weak-topic percentages** — rejected because they do not force remediation or verify resolution.
3. **Wait until Today Engine to model alerts** — rejected because lifecycle/evidence must be preserved earlier.
4. **Immediate ML anomaly detector** — rejected; interpretable deterministic baselines come first.

## Consequences

Positive:
- errors can change D1/Today priority;
- remediation becomes measurable;
- persistent problems are escalated instead of repeating the same technique blindly;
- source gaps and execution failures are not confused with lack of knowledge;
- intervention-effectiveness data becomes much cleaner.

Costs:
- more state/evidence modeling;
- alert dedup/cooldown rules;
- resolution policies must be versioned;
- M003/M004 gain explicit alert responsibilities.
