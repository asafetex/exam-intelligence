# Evidence Framework

## Why it exists

The project mixes official exams, practitioner methods, learning science, legal authority, model classifications and personal experiments. They have different evidentiary status and must not be blended into one undifferentiated “truth.”

## Evidence classes

### Exam evidence
Official syllabus, exam occurrence, answer-key version, scoring policy.

### Authority evidence
Law/regulation/precedent/source version valid in time.

### Scientific evidence
Research claim with bibliographic provenance and strength.

### Practitioner evidence
Method/protocol/case outcomes reported by OQF, Benites, EARA etc.

### Candidate evidence
Observed attempts, retention probes, intervention outcomes.

### Model inference
Classification, semantic family, trap label, generated explanation. Always preserve model/version/confidence/review status.

## Learning claim strength

Working scale:
- **A:** systematic review/meta-analysis;
- **B:** multiple convergent studies;
- **C:** isolated/limited study;
- **D:** practitioner/expert evidence;
- **E:** hypothesis/marketing claim.

This scale describes evidence for a claim, not the moral/value quality of a source.

## Claims matrix

Later `CLAIMS_EVIDENCE_MATRIX` rows should include:

```text
claim
mechanism (if claimed)
intervention
conditions
exceptions
best use
bad use
source
source locator
evidence class/strength
confidence
personal validation status
```

## Conflict rule

Do not erase disagreement. When practitioner advice and scientific evidence differ, preserve both, identify what each actually supports, and let the Learning Canon state the best current operational recommendation with uncertainty.
