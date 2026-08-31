# ADR-0002 — Python + FastAPI + Jinja/HTMX + SQLite

**Status:** Accepted

## Context
The project is analytics/parsing/learning-science heavy, local-first and does not require a rich SPA for V0. Donor research showed a strong fit with Examen's local FastAPI/HTMX/SQLite shape.

## Decision
Use Python 3.11+, FastAPI, server-rendered Jinja/HTMX/minimal JS and SQLite as the initial stack.

## Consequences
- one language for parsing, analytics and application logic;
- low operational overhead;
- SQLite is adequate for tens of thousands of questions and single-user writes;
- avoid React/Postgres/cloud complexity until measured need appears.
