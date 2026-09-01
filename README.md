# Exam Intelligence

> Local-first intelligence system for competitive-exam preparation. It combines **exam evidence + candidate telemetry + Batismo 2.0 / Masterclass Neurociência + learning science + closed-loop remediation** to choose and verify the best next study action.

**Status:** V0 architecture frozen · Learning OS canonicalized · Learning Alert Engine canonicalized · **Active milestone:** M001 — Corpus In → First Attempt Out · **DB schema:** v4 · **Runtime:** Python + FastAPI + Jinja/HTMX + SQLite

## North star

> **What should the candidate study now, for how long, with which intervention, under which conditions, why — and what evidence will prove the problem was fixed?**

```text
TARGET EXAM
    ↓
Edital + Atomic Tree + historical exams + recurrence + scoring
    ↓
QUESTION / SOURCE CORPUS
    ↓
Candidate answers + time + confidence + exposure + session context
    ↓
CANDIDATE DIAGNOSIS
    ↓
LEARNING ALERT / REMEDIATION ENGINE
(evidence sufficiency → type → severity → lifecycle)
    ↓
BATISMO PHASE / ALLOCATION
    ↓
MASTERCLASS EXECUTION GATES
(readiness / clarity / difficulty / attention / feedback / recovery)
    ↓
INTERVENTION
(theory / retrieval / contrast / questions / source repair / fluency / memory / simulation)
    ↓
RETEST / DELAYED VALIDATION
    ↓
RESOLVED | ESCALATED | OBSERVE
    ↓
DECISION ENGINE / TODAY
    ↺
```

The product is not a generic question bank or dashboard. It is a closed evidence loop that detects important problems, changes the study plan and verifies whether remediation worked.

## Core intelligence domains

| Domain | Canonical question |
|---|---|
| **Exam Intelligence** | What matters on the target exam? |
| **Candidate Intelligence** | What does the candidate actually demonstrate? |
| **Diagnosis Intelligence** | Why is performance failing? |
| **Learning Alert Intelligence** | Is the evidence strong enough to change the plan, and how severe/persistent is the problem? |
| **Learning Intelligence** | Which Batismo/Masterclass/science intervention fits the diagnosed state? |
| **Decision Intelligence** | Where should the next unit of study time go? |

## Learning Operating System

Batismo 2.0 and Masterclass Neurociência are first-class design authorities, not optional RAG content.

- **Batismo 2.0** controls preparation strategy: material validation, `80/20 → 20/80`, D1…Dn, mesocycles, continuity, urgency, final-stage templates and simulation.
- **Masterclass Neurociência** controls execution: focus, readiness, task clarity, challenge-skill fit, active practice, feedback/progress, habit/start friction, frustration and recovery.
- **Learning science** refines the interventions and causal explanations.
- **Candidate-local evidence** decides whether the method actually improved delayed/exam-relevant performance for this candidate.

Canonical principle:

> **A method can be practically useful even when one proposed biological mechanism is incomplete. Protocol efficacy, practitioner outcome evidence, scientific intervention evidence, mechanism evidence and candidate-local evidence are tracked separately.**

## Learning Alert & Remediation Engine

An alert is **not a red notification**. It is a stateful evidence object that exists only when the accumulated evidence can plausibly change the plan.

Canonical alert families:
- knowledge gap;
- misconception / confident-wrong;
- concept confusion;
- retention decay;
- coverage gap;
- source gap;
- bank trap;
- time/fluency;
- attention/execution.

Severity:

```text
WATCH → MEDIUM → HIGH → CRITICAL
```

Lifecycle:

```text
DETECTED
→ ACKNOWLEDGED
→ REMEDIATION_ASSIGNED
→ REMEDIATION_ACTIVE
→ RETEST_PENDING
→ RETESTED
→ RESOLVED | ESCALATED | OBSERVE
```

A naive rule such as `errors >= 3 → alert` is explicitly rejected. Detection must consider evidence sufficiency, unseen/repeated exposure, coverage, error type, confidence, persistence, time/retention and exam leverage as relevant.

Resolution requires evidence. Clicking “done” is not mastery.

## Non-negotiable semantics

### Exam/data
- question identity ≠ exam occurrence ≠ presentation;
- source duplicate ≠ true cross-exam recurrence;
- alternate cadernos do not inflate recurrence;
- official bank key ≠ universal truth;
- legal authority is time-versioned;
- generated questions never contaminate official Bank DNA;
- raw sources/provenance are immutable.

### Learning
- accuracy ≠ mastery;
- immediate performance ≠ durable learning;
- error ≠ generic “more questions”;
- coverage insufficiency must remain visible;
- confident-wrong is a high-risk misconception/calibration state;
- Batismo phase and intervention/context are historical snapshots;
- readiness modifies task/dose/timing, not clinical diagnosis;
- alert severity is allocation priority, not punishment;
- failed retest triggers re-diagnosis/escalation, not blind repetition.

## Batismo-aligned state machine

```text
intake
→ material_validation
→ basic_80_20
→ basic_20_80
→ mesocycle | edital_imminent | surprise_subject | final_sprint_50 | countdown_10
→ simulation
→ exam
→ post_exam
```

Calendar durations are templates unless current evidence justifies a hard boundary.

## M001 — Corpus In → First Attempt Out

M001 remains deliberately narrow:

```text
1,000+ structured questions + 1 official VUNESP exam/key
                         ↓
adapters / PDF parser / staging / quarantine
                         ↓
canonical identity + SQLite schema v4
                         ↓
FastAPI Mini-QC
                         ↓
answer + timer + confidence + score
                         ↓
persisted attempt + optional study_context
                         ↓
Learning Alert lifecycle schema hook
                         ↓
first topic diagnostic
```

M001 does **not** implement automatic alert detection, automatic Batismo phase inference, remediation scheduling, FSRS UI or Today. It only prevents early evidence from becoming structurally unusable later.

## Schema hooks

- v3: `learning_intervention`, `study_context`.
- v4: `learning_alert`, `learning_alert_event`.

The alert event history is append-oriented so the system can later answer:

```text
what triggered the alert?
→ what remediation was assigned?
→ what did it cost?
→ what happened on retest?
→ was it resolved or escalated?
```

## Roadmap

```text
M001 — Foundation / corpus → attempt / schema hooks
M002 — Atomic Tree + current edital
M003 — Candidate Intelligence + Alert Detection v0
M004 — Batismo/Masterclass Learning OS + Remediation/Retest lifecycle
M005 — Retention + FSRS + intervention outcomes
M006 — Question/Bank Intelligence + trap alerts
M007 — Today Decision Engine
```

## Repository entrypoints

Start with:
1. `AGENTS.md`
2. `docs/PROJECT_STATE.md`
3. `docs/README.md`
4. `docs/SYSTEM_ARCHITECTURE.md`
5. `docs/LEARNING_OPERATING_SYSTEM.md`
6. `docs/LEARNING_ALERT_ENGINE.md`
7. `docs/M001_FOUNDATION.md`

Private paid-course source material, candidate DBs, API credentials and restricted corpora remain outside public Git.

---

**Operating loop:** *Observe → diagnose → determine evidence sufficiency → alert/observe → remediate → retest → resolve/escalate → choose the next action → repeat.*
