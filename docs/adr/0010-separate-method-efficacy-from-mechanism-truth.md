# ADR 0010 — Separate method efficacy from mechanism truth

**Status:** Accepted  
**Date:** 2026-09-01

## Context

Batismo/Masterclass includes practical protocols, reported approval outcomes and neuroscience explanations. It is possible for a behavioral method to be useful even when its proposed biological explanation is incomplete, indirect or overstated. It is also possible for a scientifically plausible mechanism to fail to improve exam performance in a given candidate.

Collapsing these into one binary label (`proven` / `false`) would damage the project in both directions.

## Decision

Maintain separate evidence dimensions:

1. `practitioner_outcome_evidence` — real-world outcomes associated with method/cohort;
2. `protocol_evidence` — fidelity/repetition of the actual behavioral procedure;
3. `scientific_intervention_evidence` — human learning evidence for the technique;
4. `mechanism_evidence` — support for the proposed neural/cognitive explanation;
5. `candidate_local_evidence` — measured immediate/delayed/transfer outcomes for the candidate.

A method rule may remain operational when mechanism evidence is weak if it is safe, coherent, outcome-relevant and measured. A mechanism claim may be rewritten without deleting a useful protocol.

When a numeric historical claim (for example number of approvals) becomes a product fact, attach auditable source/provenance rather than inferring a count.

## Product precedence

For an educational action:

`safety/current official source → target-exam fact → candidate evidence → strong direct learning evidence → practitioner operational canon/outcome evidence → indirect mechanism → heuristic/metaphor`.

This precedence is for conflict resolution, not for dismissing practitioner knowledge.

## Consequences

- We can take Batismo/Masterclass seriously as a high-value operating system without encoding every biological metaphor as literal fact.
- Scientific correction becomes an enrichment mechanism rather than a method-erasure mechanism.
- The project can eventually quantify which components work for the candidate.
- Claims registries need multiple evidence dimensions rather than a single score.
