# Testing Strategy

## Principle

The highest-risk bugs in this project are not CSS bugs. They are semantic bugs that silently corrupt evidence: duplicate recurrence, wrong key version, dropped media, option-order mismatch, scoring drift or candidate-history rewrite.

## Test pyramid

### Unit
Pure functions and small boundaries:
- normalization;
- hashing/versioning;
- option mapping;
- scoring policies;
- parser tokenization/block detection;
- confidence/metric helpers.

### Contract
- staging JSON schemas;
- provider adapter outputs;
- answer-key batch contract;
- migration schema expectations.

### Integration
- source asset → staging → quality gate → canonical load;
- exam/key independent ingestion;
- database foreign-key integrity;
- session → attempt persistence.

### End-to-end
Browser/local API flow for a minimal session and one or more fixture corpora.

## Golden fixtures

Maintain small legally redistributable/synthetic fixtures specifically covering:
- same occurrence from two sources;
- same canonical question in two distinct exams;
- alternate caderno with shuffled option labels;
- provisional→final changed key;
- annulled item;
- shared stimulus across multiple questions;
- missing image requiring quarantine;
- binary Cebraspe scoring and ordinary single-choice scoring.

## Regression policy

Every bug that could corrupt historical evidence receives a regression fixture before closure.

## Data-model tests

Test invariants, not just table existence. Example: adding a second `source_question_link` must not increment distinct exam occurrences; adding a new occurrence in another exam must.

## Performance

M001 should benchmark bulk import at realistic 10k–50k scale before optimizing. SQLite is expected to be sufficient; measure before adding infrastructure.
