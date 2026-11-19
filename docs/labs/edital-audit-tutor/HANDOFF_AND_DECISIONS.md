# Handoff & decision register — LAB-DOC-v0.1 (19 Nov 2026)
Scope: documentation-only branch, main untouched; no code/tutor/ingestion/Reader implementation in this proposal.

## Recovered existing state (do not overwrite)
The repository `asafetex/exam-intelligence` is a public, local-first FastAPI/HTMX/SQLite project. `AGENTS.md` is the current coding contract; `docs/PROJECT_STATE.md` describes M001 active with schema v4 and an implementation branch. This lab must reconcile with existing docs and code before feature work.
Other Google Drive domains and their data owners remain separate. Do not place private Google Drive IDs, student events, copyrighted paid content or secrets in this public branch.

## Decisions
D001 sandbox project has independent Drive folder/docs and no Q/R writes.
D002 API/read-only federation is planned, not implemented; Reader security is mandatory.
D003 reuse existing Exam Intelligence through documented ADR before any new repository or feature merge.
D004 original official/authorial/repaired questions carry distinct immutable provenance.
D005 independent auditor plus continuous appeals; no guarantee against missed invalidities.
D006 confidence optional in experimental UI, explicitly conflicting with existing repo and requiring ADR rather than sneaky change.
D007 tutoring is a proposed reusable cross-domain contract, not a duplicate Nexus/Polyglot knowledge owner.
D008 CSV-first experimental interchange; SQL/SQLite later and only with migration tests.
D009 every decision/version recorded with actual commit SHA and readback; do not call Drive edit a git commit.
D010 product effectiveness must transfer to genuine official unseen items, not just generated items.

## Status
- Architecture: DOCUMENTED candidate.
- Drive workspace: DOCUMENTED (private source of project-specific links).
- Git feature branch: docs-only candidate; no merge to main.
- Experimental DB, CSV fixture, tested endpoints, scrape adapters, tutor API, audit agent, psychometrics: NOT IMPLEMENTED.
- Production federation: NOT CONNECTED.
- Human QA on source corpus and official answer keys: NOT PERFORMED.

## Next gated action
Review existing repo code and M001 dependencies, produce feature-to-current-component crosswalk `REUSE/WRAP/ADAPT/BUILD/HOLD` with ADR, then test one small GCM edital topic with authenticated official sources and 5–10 authorial items under independent audit.
Do not claim this research spec is a production-ready release.
