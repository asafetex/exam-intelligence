# Learning Alert & Remediation Engine

## Status

**Canonical component between Diagnosis and Intervention.**

The purpose of an alert is not to decorate a dashboard. An alert exists only when accumulated evidence is strong enough to **change the candidate's study plan**.

Core loop:

```text
ATTEMPTS / STUDY EVENTS
        ↓
CANDIDATE STATE
        ↓
DIAGNOSIS
        ↓
LEARNING ALERT ENGINE
        ↓
REMEDIATION / INTERVENTION
        ↓
RETEST
        ↓
RESOLVED | ESCALATED | CONTINUE OBSERVING
        ↓
DECISION ENGINE / TODAY
```

---

## 1. Alert principle

Do not ask only:

> Which subject has many errors?

Ask:

> Which knowledge/skill is failing, why is it failing, how reliable is that conclusion, how important is it to the target exam, and what is the lowest-cost intervention likely to fix it?

Then ask:

> Did the intervention actually fix it under delayed/unseen validation?

That final question closes the learning loop.

---

## 2. Alert is not a raw threshold

Forbidden baseline:

```text
if errors >= 3: alert
```

Three errors in three questions and three errors in one hundred questions do not carry the same evidence.

Alert detection should consider, as available:
- sample size;
- unseen vs repeated exposure;
- error rate / score;
- error taxonomy;
- confidence before feedback;
- recency/persistence;
- Atomic Topic breadth;
- target-exam importance/weight;
- historical/topic/question-family recurrence;
- candidate baseline;
- response time;
- retention/delayed probe;
- session mode (`learn | validate | exam`);
- source completeness;
- Batismo phase;
- readiness/context when relevant.

Conceptually:

```text
alert_strength ≈ evidence_sufficiency
               × problem_severity
               × persistence
               × exam_leverage
               × confidence_or_calibration_risk
```

This is a conceptual decomposition, not a frozen formula.

---

## 3. Evidence sufficiency before diagnosis

The engine must be allowed to say:
- `INSUFFICIENT_EVIDENCE`;
- `OBSERVE`;
- `ALERT`.

A low sample with weak breadth should not create a high-severity content alert merely because accuracy looks bad.

Prefer validation evidence from unseen/equivalent items. Repeated identical questions have lower diagnostic weight for mastery.

---

## 4. Canonical alert types

### `KNOWLEDGE_GAP`
Evidence suggests the candidate lacks the rule/concept/model.

Typical remediation:
- focused source/theory repair;
- worked example if needed;
- immediate retrieval/application;
- delayed unseen retest.

### `MISCONCEPTION`
Wrong answers with high confidence and/or persistent stable false rule.

This is a high-priority state.

Typical remediation:
- expose the false rule explicitly;
- authoritative/source-grounded correction;
- contrast with correct rule/counterexample;
- immediate discrimination set;
- delayed unseen validation.

### `CONCEPT_CONFUSION`
Candidate can partially recall concepts but repeatedly fails to discriminate adjacent rules/concepts.

Typical remediation:
- contrastive table/map;
- rule-vs-exception/counterexample;
- mixed discrimination questions;
- delayed retest.

### `RETENTION_DECAY`
Earlier validated knowledge degrades materially after delay.

Typical remediation:
- retrieval / successive relearning;
- adaptive review;
- reduced theory unless model itself is lost.

### `COVERAGE_GAP`
High apparent accuracy exists with insufficient Atomic Tree breadth/sample novelty.

Typical remediation:
- expand unseen sampling;
- do not declare mastery;
- cover unsampled nodes.

### `SOURCE_GAP`
Repeated failures are better explained by incomplete/stale/inadequate study material.

Typical remediation:
- repair/replace/escalate source;
- map missing source coverage;
- learn the missing material;
- retest.

### `BANK_TRAP`
Underlying concept is reasonably known but candidate repeatedly falls for bank-specific distractor/operator/transformation patterns.

Typical remediation:
- trap/distractor discrimination;
- bank-specific question family;
- wording/operator drills.

### `TIME_FLUENCY`
Correctness is acceptable but latency/omission under time constraint threatens exam performance.

Typical remediation:
- timed fluency;
- strategy/skip-return decisions;
- progressive exam specificity.

### `ATTENTION_EXECUTION`
Error pattern is dominated by execution slips rather than conceptual weakness.

Examples:
- negative operator (`NÃO`, `EXCETO`, `INCORRETA`);
- rushed marking;
- distraction;
- avoidable final-answer change;
- fatigue-linked slips.

Typical remediation:
- execution protocol;
- task/environment reset;
- shorter active block where appropriate;
- deliberate parsing then speed progression.

---

## 5. Severity

Canonical severity vocabulary:

### `WATCH`
Weak/early signal. Keep collecting evidence; no mandatory plan change.

### `MEDIUM`
Meaningful issue. Surface it and schedule targeted validation/remediation.

### `HIGH`
Evidence is strong enough to alter the study plan and enter remediation queue.

### `CRITICAL`
High-leverage prerequisite or dangerous misconception likely to corrupt downstream learning/exam performance. May block progression on dependent work until repaired or explicitly overridden.

Severity is not embarrassment or punishment. It is study-allocation priority.

---

## 6. Lifecycle

An alert is a stateful learning object:

```text
DETECTED
  ↓
ACKNOWLEDGED
  ↓
REMEDIATION_ASSIGNED
  ↓
REMEDIATION_ACTIVE
  ↓
RETEST_PENDING
  ↓
RETESTED
  ├──→ RESOLVED
  ├──→ ESCALATED
  └──→ OBSERVE
```

Additional administrative states:
- `SUPPRESSED` — known false-positive / intentionally deferred with reason;
- `SUPERSEDED` — replaced by a newer alert/diagnosis.

Historical events are append-oriented. Current state may be denormalized for convenient reads but must be reconstructable from event history.

---

## 7. Resolution is evidence-based

Do not resolve an alert because the candidate clicked “done” or reread the chapter.

Resolution should rely on a criterion appropriate to the alert, preferably delayed and unseen/equivalent.

Examples:

### Knowledge gap
```text
focused repair
→ unseen validation above target threshold
→ enough breadth/sample
→ no immediate persistent misconception
```

### Misconception
```text
false rule explicitly corrected
→ mixed discrimination success
→ delayed unseen success
→ confident-wrong pattern no longer recurring
```

### Retention decay
```text
successful retrieval
→ later retrieval after interval
→ stability recovered
```

### Attention/execution
```text
comparable timed set
→ execution-error rate materially reduced
```

The threshold/policy is versioned and can differ by phase/exam importance.

---

## 8. Escalation

If retest fails, do not automatically repeat the exact same intervention.

Escalation examples:
- theory repair → worked example/prerequisite repair;
- retrieval → rebuild conceptual model;
- contrast drill → stronger source/teacher/legal authority;
- repeated execution issue → alter task/environment/block design;
- source repair failed → source replacement;
- persistent mixed diagnosis → request more diagnostic evidence.

Record:
- prior intervention;
- outcome;
- new diagnosis/hypothesis;
- new intervention;
- evidence reason.

---

## 9. Interaction with Batismo

The alert engine is the computational form of Batismo's selective return and error-driven allocation.

### `basic_80_20`
Alerts may identify missing prerequisites/material problems, but broad coverage remains dominant.

### `basic_20_80`
Alerts strongly drive targeted theory return and remediation.

### `mesocycle`
Persistent high-leverage alerts can change D1…Dn ranking or justify the current differential target.

### final stages
Only alerts with sufficient exam leverage and realistic repair value should consume scarce final-stage time.

The same alert type may receive different remediation/dose depending on phase.

---

## 10. Interaction with Masterclass

Content problem and execution problem must be distinguished.

```text
many wrong answers
      ↓
content-driven? ──→ learning remediation
      │
      └─ execution/readiness-driven? ──→ execution intervention
```

Do not prescribe more theory when the dominant evidence is attention/time/environment.

Do not prescribe an execution hack when the candidate truly does not know the concept.

---

## 11. Interaction with D1…Dn and Today

Open alerts contribute to candidate priority.

Conceptually:

```text
D_priority / Today_priority
+= alert_severity
 × exam_leverage
 × persistence
 × prerequisite_value
 × repair_opportunity
```

A high-severity alert can promote an Atomic Topic into the current differential target.

A `WATCH` alert should not hijack the plan.

---

## 12. Evidence snapshot

Every alert must preserve the evidence that caused its detection so later model changes do not rewrite history.

Minimum alert snapshot:
- alert type/version;
- detector version;
- target exam;
- taxonomy node(s);
- detection timestamp;
- severity;
- confidence/uncertainty;
- sample size;
- unseen/repeated composition;
- relevant performance metrics;
- error counts/types;
- confidence/calibration evidence;
- time/retention evidence if relevant;
- exam-leverage features used;
- phase/context snapshot if relevant;
- evidence attempt/session IDs or query snapshot;
- human/model review state.

---

## 13. Data model

Schema hooks:

### `learning_alert`
Current alert identity and latest state:
- `alert_id`;
- `alert_type`;
- `detector_version`;
- `target_exam_id`;
- `node_id`;
- `severity`;
- `status`;
- `confidence`;
- `detected_at`;
- `last_evaluated_at`;
- `resolved_at`;
- `evidence_snapshot_json`;
- `resolution_policy_version`;
- `current_reason`.

### `learning_alert_event`
Append-oriented lifecycle history:
- `event_id`;
- `alert_id`;
- `event_type`;
- `occurred_at`;
- optional `session_id` / `attempt_id`;
- optional intervention ID/version;
- payload/reason.

M001 only needs the migration/schema to exist and be testable. Automatic detection/remediation is later.

---

## 14. Detection policy design

Start interpretable and rule-based.

Examples of candidate rules to calibrate later:

```text
MISCONCEPTION candidate:
- sufficient unseen sample
- repeated wrong answers
- multiple high-confidence wrong events
- same Atomic Topic / proposition family
```

```text
COVERAGE_GAP candidate:
- high local accuracy
- low proportion of target Atomic Tree sampled
- high repetition concentration
```

```text
TIME_FLUENCY candidate:
- acceptable accuracy
- latency or timeout materially worse than exam target / personal baseline
```

Each rule must define:
- required evidence;
- exclusions;
- severity function;
- cooldown/dedup policy;
- retest policy;
- resolution condition;
- version.

Do not jump to ML until deterministic baselines are measured.

---

## 15. Alert deduplication

Repeated detector runs must not spam separate alerts for the same unresolved underlying problem.

Default identity concept:

```text
target_exam
+ taxonomy node / transversal skill
+ alert type
+ detector major version
```

If the issue is already open:
- update evidence/current severity;
- append an evaluation event;
- do not create a duplicate alert unless the prior alert was resolved/superseded and a genuinely new episode occurs.

---

## 16. Alert UI

Alerts should be shown primarily where they change action:
- Today queue;
- topic page;
- post-session summary;
- weekly/mesocycle review.

User-facing alert should explain:

```text
WHAT is failing
WHY we think so
HOW strong the evidence is
WHY it matters for the exam
WHAT intervention is recommended
WHAT will prove it is fixed
```

Avoid fear-inducing red walls and notification spam.

---

## 17. Example

```text
HIGH — MISCONCEPTION
Administrative Law > Revocation

Evidence
- unseen validation: 4/9 correct
- 5 errors
- 3 knowledge/misconception-compatible errors
- 3 wrong answers at confidence 4–5
- high target-exam relevance

Why this matters
The pattern suggests a stable false rule, not just uncertainty.

Remediation
1. repair Revocation × Annulment from primary source;
2. produce the distinction from memory;
3. solve 10 mixed unseen discrimination items;
4. delayed retest.

Resolution
Do not close after restudy. Close after successful delayed unseen validation.
```

---

## 18. Hard rule

> **An alert is only valuable if it can alter the study plan and later be proven resolved or shown to have failed.**

If it cannot change an intervention, priority or measurement, it is analytics noise, not a Learning Alert.
