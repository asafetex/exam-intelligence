# Risk Register

| Risk | Impact | Mitigation / rule |
|---|---|---|
| Parser silently corrupts questions | Critical | staging + quality gates + quarantine + source locators |
| Source duplicate inflates recurrence | Critical | canonical question/occurrence/source-link separation |
| Alternate cadernos inflate incidence | High | exam vs exam-form distinction; option identity independent of label/order |
| Changed/annulled key rewrites candidate history | Critical | versioned answer keys + attempt scoring snapshot |
| Legal changes make old answer look current | High | time-versioned Authority Graph |
| Repeated questions inflate mastery | High | seen/unseen split; validation prioritizes unseen items |
| Coarse subject accuracy hides coverage gaps | High | Atomic Tree + breadth/sample thresholds |
| LLM hallucination becomes canonical fact | Critical | inference provenance/confidence/review; deterministic scoring core |
| Advanced model creates false precision | High | simple baselines, uncertainty, held-out validation |
| Public repo leaks paid/private corpus | Critical | gitignore/local-data + governance; secrets only via env |
| Git history stores large/restricted binaries | High | keep media/PDF corpus outside Git; manifest/hash only where appropriate |
| SQLite candidate DB lost | High | backup/recovery policy before destructive migrations |
| Taxonomy becomes overgranular/unmaintainable | Medium | descend only when decision value changes |
| Project becomes generic LMS/SaaS | Medium | scope gate in `AGENTS.md` |
| Bank-frequency overfitting | High | contextual shrinkage + recency + held-out later exams |
| Question-family model merges materially different propositions | High | conservative thresholds + review + method/version/confidence |
| Learning-science mechanism overstated | Medium | evidence registry; practitioner outcome separated from mechanistic claim |

Risk severity and mitigation should be revisited when a milestone materially changes architecture or data exposure.
