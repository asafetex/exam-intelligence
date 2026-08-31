# ADR-0007 — Defer IRT/TRI until item calibration is trustworthy

**Status:** Accepted

## Context
The system initially has one candidate and a large item corpus, not a suitable population-response matrix for reliable multi-parameter IRT calibration.

## Decision
Use transparent accuracy/coverage/time/confidence/retention primitives first. Keep schema hooks for externally calibrated item parameters but do not present pseudo-precise theta estimates.

## Consequences
- less false precision;
- easier validation/debugging;
- IRT remains available if reliable population calibration becomes accessible later.
