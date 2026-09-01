CREATE TABLE learning_intervention (
    intervention_id TEXT NOT NULL,
    intervention_version TEXT NOT NULL,
    name TEXT NOT NULL,
    source_refs_json TEXT NOT NULL DEFAULT '[]',
    evidence_status TEXT NOT NULL DEFAULT 'unreviewed',
    protocol_json TEXT NOT NULL DEFAULT '{}',
    active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1)),
    PRIMARY KEY(intervention_id, intervention_version)
);

CREATE TABLE study_context (
    study_context_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL UNIQUE REFERENCES practice_session(session_id) ON DELETE CASCADE,
    phase_code TEXT,
    phase_model_version TEXT,
    phase_reason_json TEXT NOT NULL DEFAULT '[]',
    session_goal TEXT,
    planned_minutes INTEGER CHECK(planned_minutes IS NULL OR planned_minutes >= 0),
    start_latency_seconds INTEGER CHECK(start_latency_seconds IS NULL OR start_latency_seconds >= 0),
    focused_seconds INTEGER CHECK(focused_seconds IS NULL OR focused_seconds >= 0),
    alertness_1_5 INTEGER CHECK(alertness_1_5 IS NULL OR alertness_1_5 BETWEEN 1 AND 5),
    sleep_quality_1_5 INTEGER CHECK(sleep_quality_1_5 IS NULL OR sleep_quality_1_5 BETWEEN 1 AND 5),
    task_clarity_1_5 INTEGER CHECK(task_clarity_1_5 IS NULL OR task_clarity_1_5 BETWEEN 1 AND 5),
    perceived_difficulty_1_5 INTEGER CHECK(perceived_difficulty_1_5 IS NULL OR perceived_difficulty_1_5 BETWEEN 1 AND 5),
    frustration_1_5 INTEGER CHECK(frustration_1_5 IS NULL OR frustration_1_5 BETWEEN 1 AND 5),
    distraction_events INTEGER CHECK(distraction_events IS NULL OR distraction_events >= 0),
    intervention_id TEXT,
    intervention_version TEXT,
    completion_status TEXT,
    next_action TEXT,
    context_json TEXT NOT NULL DEFAULT '{}',
    created_at TEXT NOT NULL,
    updated_at TEXT,
    FOREIGN KEY(intervention_id, intervention_version)
        REFERENCES learning_intervention(intervention_id, intervention_version)
);

CREATE INDEX idx_study_context_phase ON study_context(phase_code);
CREATE INDEX idx_study_context_intervention ON study_context(intervention_id, intervention_version);
