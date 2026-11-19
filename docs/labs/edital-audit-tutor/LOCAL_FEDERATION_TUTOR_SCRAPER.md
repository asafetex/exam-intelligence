# Local-first federation: planned ports and safe reuses
Documentation only, 2026-11-19. No connectors, services, logins or scrapers have been activated.

## Existing and external owner boundaries
Exam Intelligence owns exam/candidate/assessment/learning data and policy. An external course ETL component is a candidate provider for authorized CourseClaimBundle snapshots. A reusable Tutor service may generate grounded lessons from allowed knowledge and learner evidence but does not own remote grades or memory. A local QConcursos Dataset Builder V2 was documented separately by the user (HTML/manual capture, SQLite and CSV/JSONL/Parquet exports); its current local code is unverified in this Git research branch. Other consumer domains retain their own curriculum and assessment.

## Proposed ports (no implementations yet)
- CourseSourceReader.read_approved(course_id) -> CourseClaimBundle (read-only, licensed, source-locators).
- QuestionExportReader.read_snapshot(version) -> SourceSnapshot (provenance, rights, stable external IDs).
- TutorProtocol.explain(TutorLessonRequest) -> TutorLessonResult (citations, explanation, guided steps, uncertainty, new item proposal, delayed retest).
- SimulatorBlueprintComposer.compose(target, catalog, policy) -> candidate form or BLUEPRINT_INCOMPLETE.
- AuditService.review(question_version, authority_refs) -> versioned AuditFindings, never silent approval.
- DirectedStudyPlanner.plan(learner_evidence, atom, claims) -> StudyGuideTask.
All ports must be mocked in CI; external access remains DISABLED until contract/permissions/owner review.

## Security and privacy
A prompt-only 'read only' promise is not a permission boundary. Require technical Reader/Viewer credentials, fixed source IDs, restricted operations, negative write tests, no raw learner PII and no licensed paid course content in public Git. For HTML or web scraping, use only authorized sources/exports and stop at CAPTCHA, WAF, 401/403/429 or rights restrictions; no bypasses.
Local checkouts are referenced via environment variables, not hard-coded Windows personal paths. Always inspect git status and tests before reuse. External provider ID must not replace internal question identity, occurrence or exam-form keys. Do not import historical attempts into a new owner by default.

## Integration order
1. Find local checkouts and version/branch; inspect AGENTS and tests.
2. Exercise fixtures only: course snapshot, question export, Tutor response.
3. Verify schema mapping, dedup, rights and no source mutation.
4. Implement read-only adapter and negative write test.
5. Run an official-item holdout pilot.
6. Only then discuss a limited local rollout. Production remains separately gated.

## Tutor evaluation
Compare grounded explanation vs guided reasoning vs active research on independent comparable unseen items, delayed retest and transfer; no unmeasured claim of being 'better than a human teacher'. Confidence declared is optional in Lab proposal, but the main repo mandates it before feedback; solve by ADR without breaking old data.
