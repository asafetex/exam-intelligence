# Federation + CSV/SQLite + API contract v0.1
Status: **DESIGN ONLY**. Read-only federation is not installed.

## Ownership
- Exam Intelligence: existing code, exam/candidate/alert/learning state according to its repository.
- Existing Questions owner: questions, official mapping, attempts, errors, Gold.
- Existing Summaries owner: editorial PDF versions, claims, QA and release.
- Federation: registry and proposals, not a writer or duplicated primary dataset.
- Lab: independent drafts, fixtures, QA findings, proposals and experiments.

## Safe federation rule
A prompt that says `read only` is not a security boundary. Real integration requires a separate provider-enforced Viewer/Reader identity, explicit allowlist, minimum-scoped objects, denial of create/update/delete/share tested, audit logs and revocation plan. Before then store only source references or owner-approved minimized extracts. The LAB cannot write back to owners.

## Data transition
Start with UTF-8 CSV and JSONL for *synthetic or specifically authorized* experimental input; each batch has ID, schema version, source reference, as-of, rights, checksums if actually calculated and validation status.
CSV proposed:
- `sources.csv`: source_id, owner, uri, version, access, rights, hash, as_of
- `edital_atoms.csv`: atom_id, edital_id, version, parent_atom, scope_class, anchor, skill
- `source_claims.csv`: claim_id, source_id, atom_id, locator, validity, review
- `questions.csv`: question_id, version, origin, exam/form, stem, type, source, QA status
- `options.csv`: question/version, option_id, label, text
- `key_history.csv`: question/version, key_version, official_status, effective_at
- `audit_findings.csv`: finding_id, question/version, defect, evidence, review state
- `repair_lineage.csv`: parent_version, child_version, reason
- `attempts.csv`: attempt_id, question_version, pseudonym, selection, time_observed_if_any, optional_confidence
- `error_signals.csv`: signal_id, attempt, hypothesis, evidence_sufficiency, detector_version
- `study_plans.csv`: plan_id, pseudonym, source_evidence, intervention, next_evaluation
- `events.csv`: append-only event_id, entity, action, timestamp, run_id, parent

Do not invent missing confidence, latency or exact attempt rationale. Avoid real candidate data or protected course material in the repo.

## SQL evolution
When required, map these CSVs to SQLite with FKs, uniqueness, append-only key history, versioned migrations and roundtrip fixtures; reuse existing repo schema if compatible. No automatic destructive migrations. PostgreSQL is deferred until actual concurrency/multi-user demand.

## Future API sketches (NOT endpoints)
`POST /v0/edital/import`, `POST /v0/corpus/import`, `POST /v0/coverage/run`, `POST /v0/questions/propose`, `POST /v0/questions/{id}/audit`, `POST /v0/questions/{id}/appeals`, `POST /v0/tutor/lesson`, `GET /v0/study-plan`.
No web-accessible endpoint should expose learner data without appropriate authentication/authorization. External providers must be wrapped behind adapters. All proposed contracts require compatibility review with existing FastAPI paths before implementation.

## Provenance
`SOURCE_TRUTH`, `CURRENT_TECHNICAL_TRUTH`, `EXAM_TRUTH` and `LEARNER_EVIDENCE` remain distinct. A source duplicate is not a new official bank incidence. Question identity ≠ exam occurrence ≠ learner attempt.
