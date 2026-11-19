# Experimental architecture & feature registry v0.1
## Dataflow
`Official edital/version → atomic requirements/skills → approved source claims → real exam/keys+annulments → coverage gaps → authorial candidates → independent audit → sandbox bank → attempt/error signals → directed study/tutor → delayed unseen retest → evidence/report`.

## Features
F001 ingest edital, retifications, official anchors and scope tags.
F002 Atomic Tree: discipline/topic/subtopic/knowledge atom/cognitive skill; keep explicitly listed content distinct from prerequisites, plausible elaborations and optional advanced matter.
F003 audit authorized course coverage versus each atom; distinguish source summary, primary authority, validity date, missing material and exact page/claim.
F004 ingest official exams/forms, keys/errata, annulments, historical context, dedup and license.
F005 official bank DNA: bank-period-domain-item-format, linguistic patterns and recurrent occurrences; no synthetic inflation.
F006 generate original candidate items targeted at verified gaps; every claim sourced.
F007 adversarial independent auditor: ambiguous stems, 2/0 valid answers, stale/contradictory law, missing facts, extraction errors, distractor defects.
F008 preserve appeals and official annulments versus independent annulment hypotheses.
F009 quarantine, immutable history, repair lineage, independent re-review and score recalculation without overwriting attempts.
F010 user appeal UX with optional justification and feedback; no automated approval based on volume.
F011 bank reconnaissance/scanning; 10x is contextual historical heuristic, not mandatory learner diagnostic volume.
F012 adaptive learner scan with stratified content and explicit evidence sufficiency; proposed not psychometrically calibrated CAT.
F013 error hypotheses from observable attempts/distractors and alternative explanations, including UNKNOWN; do not infer subjective confidence.
F014 personalized study director: smallest theory intervention, novel questions, contrastive feedback, revisit/retention/transfer.
F015 dashboard separates content coverage, assessment coverage, accuracy, estimate uncertainty, retention and transfer.
F016 TutorAdapter grounded in approved sources and local owner data.
F017 authorized course-to-teacher pipeline with source manifest and licensing.
F018 federated read model under minimum privilege.
F019 QA and release gates.
F020 learning through implementation: explain design, Python/data engineering, tradeoffs, tests and engineering process in the actual work.

## Product constraints
- Training ≠ test ≠ simulation ≠ holdout.
- An authored question does not become an official exam occurrence.
- Response accuracy, confidence, mastery and retention are distinct.
- Generated/repaired items must remain provenance-labeled.
- Official history preserved, even when current truth differs.
- An auditor reduces, never eliminates, potential item invalidity.
- A learner's psychological confidence is not inferred from an incorrect selection.
- Advanced challenge items supplement rather than replace representative exam-level evaluation.
- No public distribution of restricted course content.
- No modification of production owners from this lab.

## Compatibility checkpoint
The existing repository already specifies many components. Before implementation, map each F### to `REUSE | WRAP | ADAPT | PROPOSE | OUT_OF_SCOPE`. Repository AGENTS/ADR policy wins for existing code until a deliberate, reviewed change.
