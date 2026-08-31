# Flashcards, Memory Items and FSRS

## Decision

Do not build another Anki and do not invent a spaced-repetition algorithm. Use `py-fsrs` later as the scheduling engine.

## Memory item abstraction

The domain is broader than flashcards:

```text
memory_item
├── basic Q/A
├── cloze
├── contrast
├── misconception correction
├── legal rule/article
└── formula/definition
```

Each item can link to Atomic Tree nodes, source question(s), authority and provenance.

## Creation from errors

A wrong question may offer `Create memory item`, pre-populating topic/source context. Creation should remain selective: if the error is application/trap rather than recall, another intervention may be better.

## FSRS state

Later persistence should support scheduler-compatible data such as:
- difficulty;
- stability;
- due;
- last review;
- review logs;
- rating: Again / Hard / Good / Easy.

FSRS retrievability can become one signal for memory risk; it should not replace real question-based validation of applied knowledge.

## Personal optimization

After sufficient review logs, FSRS parameters/desired retention may be optimized using the library's optimizer. Do not tune from tiny datasets.

## Relationship with questions

Flashcards test/maintain compact retrieval. Official questions validate application under exam-like conditions. Both point to the same knowledge topology but represent different evidence channels.
