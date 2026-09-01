CREATE TABLE learning_alert (
    alert_id TEXT PRIMARY KEY,
    alert_type TEXT NOT NULL,
    detector_version TEXT NOT NULL,
    target_exam_id TEXT REFERENCES exam(exam_id),
    node_id TEXT REFERENCES taxonomy_node(node_id),
    severity TEXT NOT NULL CHECK(severity IN ('watch','medium','high','critical')),
    status TEXT NOT NULL CHECK(status IN (
        'detected',
        'acknowledged',
        'remediation_assigned',
        'remediation_active',
        'retest_pending',
        'retested',
        'resolved',
        'escalated',
        'observe',
        'suppressed',
        'superseded'
    )),
    confidence REAL CHECK(confidence IS NULL OR (confidence >= 0 AND confidence <= 1)),
    detected_at TEXT NOT NULL,
    last_evaluated_at TEXT,
    resolved_at TEXT,
    resolution_policy_version TEXT,
    current_reason TEXT,
    evidence_snapshot_json TEXT NOT NULL DEFAULT '{}',
    metadata_json TEXT NOT NULL DEFAULT '{}'
);

CREATE INDEX idx_learning_alert_open
    ON learning_alert(status, severity, alert_type);
CREATE INDEX idx_learning_alert_node
    ON learning_alert(node_id, alert_type, status);
CREATE INDEX idx_learning_alert_exam
    ON learning_alert(target_exam_id, status, severity);

CREATE TABLE learning_alert_event (
    event_id TEXT PRIMARY KEY,
    alert_id TEXT NOT NULL REFERENCES learning_alert(alert_id) ON DELETE CASCADE,
    event_type TEXT NOT NULL CHECK(event_type IN (
        'detected',
        'evaluated',
        'acknowledged',
        'remediation_assigned',
        'remediation_started',
        'remediation_completed',
        'retest_scheduled',
        'retested',
        'resolved',
        'escalated',
        'observe',
        'suppressed',
        'superseded'
    )),
    occurred_at TEXT NOT NULL,
    session_id TEXT REFERENCES practice_session(session_id),
    attempt_id TEXT REFERENCES attempt(attempt_id),
    intervention_id TEXT,
    intervention_version TEXT,
    reason TEXT,
    payload_json TEXT NOT NULL DEFAULT '{}',
    FOREIGN KEY(intervention_id, intervention_version)
        REFERENCES learning_intervention(intervention_id, intervention_version)
);

CREATE INDEX idx_learning_alert_event_alert
    ON learning_alert_event(alert_id, occurred_at);
