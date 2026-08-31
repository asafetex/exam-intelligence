# Exam Intelligence — V0 Frozen Specification

## 1. Product thesis
The system is a closed loop:

`Exam demand → Candidate evidence → Diagnosis → Intervention → New evidence → Recalibration`

The first product is not a dashboard. The first useful output is a defensible next action.

## 2. Four canonical domains

### EXAM
What is likely to matter on the target exam?
- syllabus / edital
- Atomic Tree
- historical occurrences
- bank, role, organ, year, recency
- exact and semantic recurrence
- scoring policy

### CANDIDATE
What does the candidate currently demonstrate?
- correctness / score
- response time
- confidence
- first exposure vs repeated exposure
- answer changes
- mode: learn / validate / exam
- error type
- retention over time
- tree coverage

### LEARNING
Which intervention should address the diagnosed state?
V0 only exposes hooks. Later this is populated by OQF, Benites and external learning science.

### DECISION
What should happen next?
V0 produces primitive priorities. Later this becomes the `Today` engine.

## 3. Source layer
Supported source types:
- `official_exam_pdf`
- `official_answer_key_pdf`
- `quest_api`
- `public_dataset`
- `platform_export`
- `manual`
- `ai_generated`

Every source receives a hash, provider, acquisition time, parser/adapter version, rights metadata and provenance record. Paid/proprietary/private source content remains local by default.

## 4. Ingestion contract

### Structured route
`CSV/XLSX/JSON/API → adapter → staging JSON → validator → normalizer → identity/dedupe → DB`

### Document route
`exam PDF → extraction → layout/question parser → staging JSON → quality gates → DB`

Answer keys are independent versioned inputs:
`answer-key PDF/API update → answer-key staging → join to occurrence → new key version`

No parser output writes directly into canonical tables without quality gates.

## 5. Quality gates
Minimum checks:
- expected vs parsed question count
- option count consistency
- answer-key coverage
- orphan answers
- duplicate external IDs
- extraction confidence
- unresolved image/table/stimulus dependencies
- canonical validation
- ambiguous exam/form identity

Items that fail are recorded in `ingestion_record` as `needs_review`; they never silently become trusted data.

## 6. Question identity model
Four different phenomena remain separate:

1. **Source duplicate** — same exam occurrence ingested from two providers. No recurrence increment.
2. **Alternate exam form/booklet** — same exam, reordered question/option presentation. No historical recurrence increment.
3. **Exact cross-exam repetition** — materially same canonical question appears in distinct exams. Increases exact recurrence.
4. **Semantic question family** — different wording tests the same proposition/skill. Deferred model, schema-ready.

Canonical option content has no A/B/C identity; labels/order belong to the occurrence. `identity_hash` is order-insensitive for options, while `presentation_hash` preserves the exact rendered occurrence.

## 7. Answer-key model
Store bank decisions temporally:
- provisional
- final
- changed
- annulled

Use `official_bank_key`, not `truth`.

Attempts store the answer-key/scoring snapshot used at the time so later key changes do not rewrite history.

For law, Authority Graph links an occurrence to legal text / precedent / version valid at exam date.

## 8. Atomic Tree + verticalized syllabus
Canonical hierarchy:
`subject → macro_topic → topic → subtopic → atomic_topic`

The edital remains preserved in its original verticalized structure and maps into a versioned canonical taxonomy. Never mutate the source wording merely to fit the taxonomy.

Questions may link to more than one node when genuinely necessary. Granularity is justified only when it can change diagnosis or study allocation.

## 9. Rich-content support
Questions may depend on shared text, images, tables, diagrams or other media. V0 must preserve these as stimulus/media references and quarantine incomplete items rather than silently dropping the dependency.

## 10. Mini-QC runner
Three modes:
- `learn`: post-question explanations/interventions allowed
- `validate`: minimal feedback; prioritize unseen items
- `exam`: locked exam conditions; feedback after submission

Per session item/attempt, capture at minimum:
- question + optional official occurrence
- order / selection reason
- first response / final response
- answer changed
- response status: answered / blank / skipped / time_expired
- correctness and score under the session scoring policy
- response time
- confidence 1–5, committed before reveal
- seen count at attempt time
- timestamps
- answer-key/scoring snapshot used

## 11. Candidate metrics
V0 exposes:
- accuracy
- expected/real score
- sample size
- tree coverage
- unseen-item accuracy
- average / median response time
- confidence calibration primitives
- confident-wrong count
- seen/repeated ratio

Do not report a topic as mastered when sample breadth is insufficient.

## 12. Question Learning Packet — schema-ready, enrichment later
Potential layers:
- official answer
- decisive rule
- legal/source authority
- alternative-by-alternative analysis
- distractor type
- trap pattern
- contrastive unit
- concept map
- memory candidate

Deep enrichment is on-demand, not precomputed for the entire corpus.

## 13. Flashcards — deferred implementation
Flashcards share Atomic Tree nodes with questions. V0 reserves entities; scheduling later uses `py-fsrs`.

Question errors may later create:
- basic card
- cloze
- contrast card
- misconception card

## 14. V0 explicit non-goals
- clone all QC/TEC/Gran features
- scraping proprietary platforms as a core dependency
- multi-user auth
- payments
- social/community
- gamification
- cloud deployment as a product requirement
- React frontend
- vector DB
- IRT/TRI
- deep-learning mastery model
- automated legal opinions
