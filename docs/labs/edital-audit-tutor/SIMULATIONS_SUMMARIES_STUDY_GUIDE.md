# Proposed Exam Simulator, Personal Summaries and Directed Study
Research design only, 2026-11-19. This document is not an executable implementation.

## Simulations as first-class assessment
Reuse Assessment Engine, the actual exam scoring policy, item identity, official key history and candidate event ledger.
Blueprint fields: target_exam/version, bank, role, exam_form/style, item counts and weights per subject, atomic quota, format (binary/single choice/etc.), time/conditions, official scoring and blank policy, normative as-of, item origin, QA version, difficulty/exposure profile, seed and holdout constraints.
Modes:
- AUTHENTIC_HISTORICAL: untouched past exam + final key and official annulments.
- BLUEPRINT_MIRROR: attempt to match the current target exam with eligible items; report gaps honestly.
- HYBRID_EXPLICIT: audited authorial + official questions with origin proportions shown; educational training, not calibrated score forecast.
- ADVANCED_CHALLENGE: harder transferable tasks, tracked separately from exam-fidelity measurement.
- MICRO_EXAM: scoped timed probe.

When source items cannot fulfill the blueprint, emit BLUEPRINT_INCOMPLETE. Never silently invent blueprint fidelity. Freeze seed, key version and scoring snapshot for replay. Defer feedback until completion in exam mode; learn/validate modes remain distinct. Measure subject weighted score, time, omissions, repeat exposure, error operators, retention and longitudinal comparable simulation gains.
Cadence: monthly/fortnightly in long preparation and weekly near open edital are candidate defaults based on user experience, not hard universal requirements.

## Personal materials: four pathways
1. Question-derived Gold: wrong/uncertain item → independently checked explanation/distractors → decisive rule → compressed note → new unseen question → delayed retest. Personal annotations and externally sourced comments have separate ownership/rights.
2. Purchased/authorized summary: baseline reference and time saver, audited atom by atom for scope, outdated law and gaps. Purchase does not prove percent syllabus coverage.
3. Guided active study: source-backed research prompts, learner's own retrieval/explanation, contrastive feedback, summary proposal, independently graded transfer.
4. Hybrid: ready source + learner Gold + guided study on residual gaps.

Do not duplicate the editorial Summaries owner or overwrite existing Gold. The existing Question Learning Packet is the reuse point; new NoteCandidate and GuidedStudyTask entities require ADR and tests.

## GuidedStudyTask contract
task_id, atom_id, learning_goal, prerequisites, learner_evidence, guiding_questions, approved_source_refs, source_locator, expected_claims, learner_response_ref, hints_used, reasoning_review, gold_note_proposal, unseen_retest_ref, status.
The student must retrieve, search and explain before full feedback. Copying a generated answer to a PDF is not evidence of learning.

## Future essay module
Defer until the user provides the expert writing scaffold plus target exam rubric and validated samples. Candidate interface: EssayAssignment, RubricVersion, EssaySubmission, FeedbackClaims, HumanReview. No unsupported official score claim.

## Text and bibliography intelligence
Track works or authors cited in authenticated exams and texts when rights permit, with historical context, not the speculative reading habits of exam setters or guaranteed future test themes.

## Acceptance gates
Ground target edital and scoring; authenticate historical item provenance; constrain rights; freeze blueprint and contamination/holdout; test same-score reproduction; run zero/two-key and annulment cases; measure novice vs expert user friction; use independent unseen/delayed validation.
