# Reusable Tutor AI protocol and QA v0.1
Status: specification only; no cross-project connection is active.

## Pedagogical goal
Turn an authorized course/evidence corpus into a grounded, interactive teacher: prerequisite check → explanation/example → guided practice → independent retrieval → feedback → targeted repair → delayed novel retest. Personalize based on observed learning and explicit learner preferences, not fixed unsupported "learning styles".

## Federation candidates and boundaries
- Tutor AI (historical IW/ETL course-to-teacher direction) is a proposed educational service owner, **not** an already verified active backend of this repository.
- EXAM/Candidates own assessment facts, official exam context and learning outcomes.
- NEXUS owns concepts, evidence and scenarios; future lesson-context adapter may provide grounded knowledge; NEXUS tutor hook is not presumed active.
- Polyglot OS owns language graph, voice/pronunciation, local memory, FSRS and performance measurements; do not duplicate its acoustic assessment or memory.
- ETL Training owns extraction/normalization of permitted course material, segment manifest and rights.
- No remote cross-owner write without separate review and explicit authorization.

## Tutor contract concept
`TutorLessonRequest`: request_id, consumer_id, learner_ref, learning_goal, language, modality, target_atom_ids, prerequisite_ids, allowed_claim_refs, source_versions, evidence_policy, attempt_evidence_refs, scaffolding_mode, policy_version.
`TutorLessonResult`: lesson_id, grounded_claim_ids, steps, explanation, examples, contrasts, practice_items, feedback_policy, uncertainties, retest_proposal, provenance.
This protocol is **proposed**, not a callable API and not a license to copy shared learner profiles.

## Confidence policy incompatibility
Lab UX proposes `answer → confirm` with confidence/strategy optional to minimize friction. Existing `AGENTS.md` requires confidence captured before feedback. Do not silently edit the existing contract. ADR must decide mode compatibility, missing-value semantics, migration and evaluation.

## QA gates
1. Official source/version/rights verified.
2. Atomic coverage audited and conflicts quarantined.
3. Generator independent of auditor; every issue grounds a source claim.
4. Postpublication contestation and potential score HOLD are reversible and versioned.
5. Official annulment decision distinguished from auditor hypothesis.
6. Test item validity with seeded defects: two correct, none correct, outdated norm, truncated option.
7. Validate error inference against observed evidence without mind reading.
8. Verify adaptive diagnosis and directed study with unseen holdout items and delayed retest; training gain alone is insufficient.
9. Enforce read-only negative write tests with constrained credentials before any live federation.
10. Human review and release manifest before production.

## Learning from work
During implementation, use real code/process tasks to teach Python, software engineering, data engineering, QA, observability, domain reasoning and tradeoffs. Annotate decisions with the "why", executable test and what capability was acquired, without separate mandatory study schedules.

## Evidence claims
Neither this document nor an LLM promise demonstrates superiority to pedagogy/neuroscience. That requires blinded or comparably rigorous empirical study measuring correctness, retention, transfer, cost and learner friction.
