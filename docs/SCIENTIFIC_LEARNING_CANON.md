# Scientific Learning Canon

## Purpose

This document converts the recovered Masterclass scientific pack plus broader learning-science evidence into implementation rules for Exam Intelligence.

It does **not** compete with Batismo/Masterclass. It strengthens the parts that converge with research, limits overgeneralized mechanisms, and identifies where candidate-specific measurement should decide.

---

## 1. Evidence lanes

### Lane A — direct learning evidence
Human studies/meta-analyses on learning, retention, retrieval, spacing, feedback, classroom performance and metacognition.

### Lane B — cognitive/behavioral evidence
Human research on effort, attention, habit, sleep and decision-making that can constrain study design.

### Lane C — mechanistic neuroscience
Dopamine, striatal circuits, BDNF, neuroplasticity and related mechanisms. Useful for explanatory context, but generally farther from a concrete exam-study prescription.

### Lane D — candidate N-of-1 evidence
Observed outcomes from this candidate using controlled intervention comparisons and delayed validation.

A mechanism never overrides a direct learning outcome merely because it sounds more neuroscientific.

---

## 2. Retrieval practice — strong default, not a religion

### Core finding
Attempting to retrieve knowledge can improve later retention beyond additional passive study.

Key evidence:
- Roediger & Karpicke (2006), *Psychological Science*, DOI `10.1111/j.1467-9280.2006.01693.x`: delayed retention favored testing over repeated study even when repeated study could create greater immediate fluency/confidence.
- Yang et al. (2021), classroom meta-analysis: 222 independent studies, 48,478 students, overall testing effect approximately `g = 0.499`.
- Carpenter, Pan & Butler (2022), *Nature Reviews Psychology*, DOI `10.1038/s44159-022-00089-1`: spacing, retrieval practice, successive relearning and metacognitive regulation have broad applied relevance.

### Product rule
If knowledge is expected to be retrievable:

```text
retrieve first
→ commit answer
→ feedback
→ repair
→ retrieve again
→ delayed validation
```

### Important boundary
Retrieval is not always superior to every strong encoding technique. A 2025 systematic/meta-analytic comparison of retrieval practice versus elaborative encoding found only a small overall retrieval advantage (`g ≈ 0.14`), with corrective feedback strongly moderating the benefit; some elaborative conditions were comparable or better when feedback was absent.

Product implication:
- retrieval beats blind rereading as a default;
- when no usable model exists, use elaboration/worked examples/contrast before demanding repeated retrieval;
- feedback quality matters.

---

## 3. Spacing — schedule by retention objective and performance

### Core finding
Distributed practice generally improves long-term retention relative to massing.

Key evidence:
- Cepeda et al. (2006), *Psychological Bulletin*, DOI `10.1037/0033-2909.132.3.354`: 839 assessments from 317 experiments in 184 articles; optimal spacing interacts with the desired retention interval.
- Classroom meta-analysis (2025): 22 reports, 31 effect sizes, N > 3,000, pooled effect about `d = 0.54` favoring distributed over massed practice, with substantial heterogeneity.

### Product rule
No universal `7/14/21` calendar.

Use adaptive review based on:
- last successful retrieval;
- confidence;
- difficulty;
- item/topic importance;
- number of successful retrievals;
- retention target / days to exam;
- error severity;
- semantic similarity/confusability.

FSRS can later schedule atomic memory items. Topic-level retrieval and question validation remain separate from flashcard scheduling.

---

## 4. Successive relearning

Successive relearning combines successful retrieval with spaced repetition of that retrieval across sessions.

Product translation:

```text
successful retrieval today
→ later retrieval
→ correct feedback if needed
→ further delayed retrieval under variation
```

Use especially for:
- high-value atomic rules;
- legal exceptions/deadlines;
- formulas;
- recurring misconceptions;
- content demonstrated to decay.

Do not turn every syllabus sentence into a flashcard.

---

## 5. Feedback — correction is part of practice

Feedback should reduce uncertainty about **why** the response succeeded/failed and what changes next.

Minimum useful feedback:
- official answer/key state;
- decisive rule/concept;
- candidate's selected answer;
- error category;
- source locator when theory repair is needed;
- next action.

For a rich learning packet, add:
- distractor analysis;
- contrast with adjacent concept;
- authority/source;
- targeted memory candidate;
- delayed retest.

The post-question experience should be deeper for `confident_wrong` and repeated misconception states than for fast high-confidence correct answers.

---

## 6. Generation and pretesting

Attempting an answer, prediction or explanation before seeing the solution can expose a knowledge state and improve engagement with subsequent feedback under suitable conditions.

Product use:
- low-stakes diagnostic questions before reading;
- predict the rule/result before revealing explanation;
- free recall of a topic before reopening notes;
- worked-example completion after an initial attempt.

Do not score an uninformed first exposure as evidence of mastered performance.

---

## 7. Elaboration and contrast

Elaboration is useful when the learner must build or discriminate a conceptual model.

Preferred operations:
- explain `why/how`;
- produce own example;
- compare/contrast adjacent concepts;
- map rule → exception → counterexample;
- connect concept to bank distractor;
- teach from memory after initial model formation.

Product rule:

> **Retrieval is strongest when there is something meaningful to retrieve; elaboration helps construct and organize that something.**

---

## 8. Interleaving and discrimination

Mixing related problem types can help the candidate learn **which rule applies**, not only how to execute a rule after being told the topic.

Use interleaving when:
- adjacent concepts are confused;
- the real exam mixes topics;
- the candidate overfits a single question template;
- classification/discrimination is part of the skill.

Avoid random topic switching that destroys prerequisite building or produces shallow context changes without a discrimination purpose.

Batismo's continuity/variability principle and exam-specific switching map naturally here.

---

## 9. Performance is not learning

Immediate speed/ease can be misleading.

Examples:
- rereading can raise familiarity and confidence without equivalent delayed retention;
- repeated identical questions can inflate accuracy through item memory;
- seeing a comment before answering contaminates validation;
- an immediate post-study test may overestimate durable mastery.

Therefore distinguish:
- `learning_accuracy`;
- `validation_accuracy`;
- `exam_accuracy`;
- delayed retrieval/retention probes;
- unseen/equivalent transfer items.

Mastery cannot be inferred from one concentrated sample.

---

## 10. Confidence and metacognition

Confidence is useful only when compared with outcome.

Capture confidence **before feedback**.

Important states:
- correct + high confidence: likely stable evidence if sample/novelty adequate;
- correct + low confidence: possible fragile knowledge / guess;
- wrong + low confidence: recognized uncertainty;
- wrong + high confidence: misconception / calibration failure, high-priority repair.

Track Brier/ECE/log-loss only when enough observations make them interpretable. Early UI can show counts and calibration bands rather than false precision.

---

## 11. Answer changing

Do not encode “never change your first answer.” Evidence from exam contexts generally finds that answer changes more often improve than harm scores when the candidate has a reason to revise.

Product telemetry should preserve:
- first answer;
- final answer;
- answer changed;
- time of change where possible;
- correctness first vs final.

Then learn the candidate-specific pattern rather than teaching superstition.

---

## 12. Sleep and recovery

Sleep is part of learning architecture, not dead time.

Research syntheses support a role for sleep in memory consolidation, with effects varying by memory type, age and task. Sleep restriction/deprivation also impairs attention, effort allocation and performance.

Product rules:
- never maximize study hours by automatically cutting sleep;
- track low-friction self-reported sleep/readiness only if useful;
- move critical learning to the best available alertness window when practical;
- after major sleep loss, reduce risk/complexity or prioritize recovery;
- do not infer a disorder or prescribe treatment.

---

## 13. Habit and start friction

Recovered evidence includes Lally et al. (2010): automaticity for simple repeated behaviors varied widely; the often-cited 66 days was a median in a subset, not a universal law.

Product rules:
- stable cue/context;
- clear next physical action;
- low-friction minimum start;
- resume after lapse without symbolic reset;
- evaluate whether the routine still produces learning.

The target is reliable initiation of deliberate study, not fully automatic high-level cognition.

---

## 14. Effort, reward and dopamine

The recovered E01–E04 scientific sources support a nuanced relationship between dopamine, value, action, learning, cognitive effort and motivation. They do **not** justify a household “dopamine level” or a rule that more dopamine always improves studying.

Product translation:
- make benefits/progress proximal and visible;
- reduce unnecessary effort/friction around starting;
- keep challenge meaningful;
- use immediate informative feedback;
- avoid reward escalation and manipulative gamification;
- measure behavior, not neurotransmitters.

Do not use:
- `dopamine_score`;
- “boost dopamine” as a study prescription;
- neurotransmitter inference from procrastination;
- stimulant/supplement advice as an adaptive-learning action.

---

## 15. Neuroplasticity

Adult learning and plasticity are real; the product-level consequence is simply that repeated, feedback-rich, appropriately difficult practice can change performance.

Do not encode:
- a universal number of weeks required to “form the neural network of the edital”;
- one-shot learning guarantees;
- hippocampal growth as an approval prerequisite;
- BDNF as a user-facing KPI.

Use operational evidence:
- faster accurate retrieval;
- fewer errors;
- broader transfer;
- stronger delayed retention;
- better mock performance.

---

## 16. Physical activity

The recovered scientific pack includes broad evidence that regular physical activity supports general health and can support cognition, with biological mechanisms still heterogeneous and not reducible to one BDNF/dopamine rule.

Product treatment:
- optional context/support habit;
- candidate may experimentally compare alertness/performance after appropriate activity;
- never prescribe a medical exercise dose;
- never require a specific pre-study exercise window to “activate plasticity.”

---

## 17. Supplements and medication are outside the Learning OS core

The scientific pack contains dopamine pharmacology, stimulant and creatine literature. These sources are useful mainly to prevent simplistic claims.

The adaptive system never:
- recommends starting/stopping prescription stimulants;
- infers ADHD/depression from study telemetry;
- recommends melatonin/creatine/caffeine/omega-3 doses;
- uses supplements as a substitute for sleep or source/technique repair.

If the candidate independently has a medical plan, the Learning OS may only model observable constraints such as actual alertness/performance; medication decisions remain clinical.

---

## 18. Scientific source integrity rules

The recovered 19-document pack itself demonstrated why provenance matters:
- one file labeled as a sleep paper contained unrelated cocaine-seeking research;
- one Schultz 1993 item was only a placeholder, not a usable full article.

Therefore every scientific artifact must carry:
- source ID;
- citation/title/authors/year;
- artifact hash;
- source integrity status;
- study type/population;
- directly supported conclusion;
- prohibited inference;
- operational translation;
- version/review date.

A filename is never evidence.

---

## 19. Evidence tiers for product action

### Tier S — strong intervention evidence + practitioner convergence + candidate support
Default/high-confidence intervention.

### Tier A — strong human learning evidence
Default unless candidate/context contraindicates it.

### Tier B — convergent practitioner method + plausible/direct evidence
Use as default-prior and measure.

### Tier C — contextual/indirect evidence
Can shape explanation or low-risk experiment; should not dominate scheduling.

### Tier D — practitioner heuristic with outcome relevance but weak direct mechanism evidence
May be used when safe, with explicit measurement and rollback.

### Tier X — contradicted/unsafe/source-defective
Do not operationalize.

---

## 20. Canonical scientific rule

Every learning recommendation should be expressible as:

```text
observed problem
→ target learning process
→ intervention
→ evidence class
→ expected observable effect
→ measurement window
→ keep/adapt/stop criterion
```

The system does not need to prove a neurotransmitter changed. It needs to prove that the candidate learns, retains, transfers and performs better.

---

## Selected external learning-science references

- Dunlosky J, Rawson KA, Marsh EJ, Nathan MJ, Willingham DT. *Improving Students' Learning With Effective Learning Techniques*. Psychological Science in the Public Interest. 2013.
- Roediger HL, Karpicke JD. *Test-enhanced learning: taking memory tests improves long-term retention*. Psychological Science. 2006. DOI: `10.1111/j.1467-9280.2006.01693.x`.
- Cepeda NJ, Pashler H, Vul E, Wixted JT, Rohrer D. *Distributed practice in verbal recall tasks: a review and quantitative synthesis*. Psychological Bulletin. 2006. DOI: `10.1037/0033-2909.132.3.354`.
- Carpenter SK, Pan SC, Butler AC. *The science of effective learning with spacing and retrieval practice*. Nature Reviews Psychology. 2022. DOI: `10.1038/s44159-022-00089-1`.
- Yang C et al. *Testing (quizzing) boosts classroom learning: a systematic and meta-analytic review*. Psychological Bulletin. 2021.
- Mawson et al. *The Distributed Practice Effect on Classroom Learning: A Meta-Analytic Review of Applied Research*. Behavioral Sciences. 2025.
- Gonçalves AO, Muniz BFB, Jaeger A. *Retrieval Practice Versus Elaborative Encoding: A Systematic and Meta-analytic Review*. Educational Psychology Review. 2025. DOI: `10.1007/s10648-025-10076-6`.
