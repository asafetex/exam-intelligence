PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS schema_meta (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);
INSERT OR IGNORE INTO schema_meta(key, value) VALUES ('schema_version', '1');

CREATE TABLE IF NOT EXISTS source_provider (
    provider_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    provider_type TEXT NOT NULL,
    base_url TEXT,
    terms_url TEXT,
    license_id TEXT,
    rights_notes TEXT
);

CREATE TABLE IF NOT EXISTS source_asset (
    source_id TEXT PRIMARY KEY,
    provider_id INTEGER REFERENCES source_provider(provider_id),
    source_type TEXT NOT NULL,
    uri TEXT,
    local_path TEXT,
    content_type TEXT,
    sha256 TEXT NOT NULL,
    acquired_at TEXT NOT NULL,
    rights_status TEXT NOT NULL DEFAULT 'unknown',
    redistribution_allowed INTEGER NOT NULL DEFAULT 0 CHECK(redistribution_allowed IN (0,1)),
    metadata_json TEXT NOT NULL DEFAULT '{}',
    UNIQUE(sha256, source_type)
);

CREATE TABLE IF NOT EXISTS import_batch (
    batch_id TEXT PRIMARY KEY,
    adapter_name TEXT NOT NULL,
    adapter_version TEXT NOT NULL,
    started_at TEXT NOT NULL,
    finished_at TEXT,
    status TEXT NOT NULL,
    stats_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS import_batch_asset (
    batch_id TEXT NOT NULL REFERENCES import_batch(batch_id) ON DELETE CASCADE,
    source_id TEXT NOT NULL REFERENCES source_asset(source_id),
    asset_role TEXT NOT NULL,
    PRIMARY KEY(batch_id, source_id, asset_role)
);

CREATE TABLE IF NOT EXISTS ingestion_record (
    record_id TEXT PRIMARY KEY,
    batch_id TEXT NOT NULL REFERENCES import_batch(batch_id) ON DELETE CASCADE,
    source_id TEXT REFERENCES source_asset(source_id),
    external_id TEXT,
    raw_locator TEXT,
    record_type TEXT NOT NULL,
    status TEXT NOT NULL,
    parser_confidence REAL CHECK(parser_confidence IS NULL OR (parser_confidence >= 0 AND parser_confidence <= 1)),
    raw_json TEXT NOT NULL,
    normalized_json TEXT,
    errors_json TEXT NOT NULL DEFAULT '[]',
    created_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_ingestion_record_batch_status ON ingestion_record(batch_id, status);

CREATE TABLE IF NOT EXISTS scoring_policy (
    scoring_policy_id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL,
    policy_version INTEGER NOT NULL DEFAULT 1,
    description TEXT NOT NULL,
    config_json TEXT NOT NULL,
    UNIQUE(code, policy_version)
);

CREATE TABLE IF NOT EXISTS exam (
    exam_id TEXT PRIMARY KEY,
    identity_key TEXT NOT NULL UNIQUE,
    bank TEXT NOT NULL,
    organ TEXT,
    role TEXT,
    year INTEGER,
    exam_date TEXT,
    scoring_policy_id INTEGER REFERENCES scoring_policy(scoring_policy_id),
    metadata_json TEXT NOT NULL DEFAULT '{}'
);
CREATE INDEX IF NOT EXISTS idx_exam_bank_year ON exam(bank, year);

CREATE TABLE IF NOT EXISTS exam_source_link (
    exam_id TEXT NOT NULL REFERENCES exam(exam_id) ON DELETE CASCADE,
    source_id TEXT NOT NULL REFERENCES source_asset(source_id),
    external_exam_id TEXT,
    PRIMARY KEY(exam_id, source_id),
    UNIQUE(source_id, external_exam_id)
);

CREATE TABLE IF NOT EXISTS exam_form (
    form_id TEXT PRIMARY KEY,
    exam_id TEXT NOT NULL REFERENCES exam(exam_id) ON DELETE CASCADE,
    form_code TEXT NOT NULL DEFAULT 'default',
    title TEXT,
    metadata_json TEXT NOT NULL DEFAULT '{}',
    UNIQUE(exam_id, form_code)
);

CREATE TABLE IF NOT EXISTS stimulus (
    stimulus_id TEXT PRIMARY KEY,
    canonical_text_md TEXT,
    content_hash TEXT NOT NULL UNIQUE,
    metadata_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS question (
    question_id TEXT PRIMARY KEY,
    question_type TEXT NOT NULL,
    canonical_stem_md TEXT NOT NULL,
    identity_hash TEXT NOT NULL UNIQUE,
    creation_kind TEXT NOT NULL DEFAULT 'official_import',
    created_at TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'active'
);

CREATE TABLE IF NOT EXISTS question_option (
    option_id TEXT PRIMARY KEY,
    question_id TEXT NOT NULL REFERENCES question(question_id) ON DELETE CASCADE,
    canonical_text_md TEXT NOT NULL,
    option_hash TEXT NOT NULL,
    UNIQUE(question_id, option_hash)
);

CREATE TABLE IF NOT EXISTS question_stimulus (
    question_id TEXT NOT NULL REFERENCES question(question_id) ON DELETE CASCADE,
    stimulus_id TEXT NOT NULL REFERENCES stimulus(stimulus_id),
    relation_type TEXT NOT NULL DEFAULT 'context',
    display_order INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(question_id, stimulus_id, relation_type)
);

CREATE TABLE IF NOT EXISTS question_occurrence (
    occurrence_id TEXT PRIMARY KEY,
    question_id TEXT NOT NULL REFERENCES question(question_id),
    form_id TEXT NOT NULL REFERENCES exam_form(form_id),
    question_number TEXT,
    original_stem_md TEXT,
    presentation_hash TEXT NOT NULL,
    item_weight REAL NOT NULL DEFAULT 1.0,
    metadata_json TEXT NOT NULL DEFAULT '{}',
    UNIQUE(form_id, question_number),
    UNIQUE(form_id, presentation_hash)
);
CREATE INDEX IF NOT EXISTS idx_occurrence_question ON question_occurrence(question_id);
CREATE INDEX IF NOT EXISTS idx_occurrence_form ON question_occurrence(form_id);

CREATE TABLE IF NOT EXISTS occurrence_option (
    occurrence_id TEXT NOT NULL REFERENCES question_occurrence(occurrence_id) ON DELETE CASCADE,
    option_id TEXT NOT NULL REFERENCES question_option(option_id),
    display_label TEXT NOT NULL,
    display_position INTEGER NOT NULL,
    original_text_md TEXT,
    PRIMARY KEY(occurrence_id, option_id),
    UNIQUE(occurrence_id, display_label),
    UNIQUE(occurrence_id, display_position)
);

CREATE TABLE IF NOT EXISTS source_question_link (
    source_id TEXT NOT NULL REFERENCES source_asset(source_id),
    occurrence_id TEXT NOT NULL REFERENCES question_occurrence(occurrence_id),
    batch_id TEXT REFERENCES import_batch(batch_id),
    external_id TEXT,
    raw_locator TEXT,
    PRIMARY KEY(source_id, occurrence_id),
    UNIQUE(source_id, external_id)
);

CREATE TABLE IF NOT EXISTS answer_key (
    answer_key_id TEXT PRIMARY KEY,
    occurrence_id TEXT NOT NULL REFERENCES question_occurrence(occurrence_id),
    key_version TEXT NOT NULL,
    official_response_json TEXT,
    status TEXT NOT NULL,
    published_at TEXT,
    source_id TEXT REFERENCES source_asset(source_id),
    notes TEXT,
    UNIQUE(occurrence_id, key_version)
);

CREATE TABLE IF NOT EXISTS reference_answer (
    reference_answer_id TEXT PRIMARY KEY,
    question_id TEXT NOT NULL REFERENCES question(question_id) ON DELETE CASCADE,
    response_json TEXT NOT NULL,
    source_type TEXT NOT NULL,
    confidence REAL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS taxonomy_scheme (
    scheme_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    version TEXT NOT NULL,
    is_canonical INTEGER NOT NULL DEFAULT 0 CHECK(is_canonical IN (0,1)),
    UNIQUE(name, version)
);

CREATE TABLE IF NOT EXISTS taxonomy_node (
    node_id TEXT PRIMARY KEY,
    scheme_id TEXT NOT NULL REFERENCES taxonomy_scheme(scheme_id),
    parent_id TEXT REFERENCES taxonomy_node(node_id),
    node_type TEXT NOT NULL,
    name TEXT NOT NULL,
    canonical_path TEXT NOT NULL,
    active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1)),
    UNIQUE(scheme_id, canonical_path)
);
CREATE INDEX IF NOT EXISTS idx_taxonomy_parent ON taxonomy_node(parent_id);

CREATE TABLE IF NOT EXISTS question_taxonomy (
    question_id TEXT NOT NULL REFERENCES question(question_id),
    node_id TEXT NOT NULL REFERENCES taxonomy_node(node_id),
    relation_type TEXT NOT NULL DEFAULT 'primary',
    confidence REAL CHECK(confidence IS NULL OR (confidence >= 0 AND confidence <= 1)),
    classifier TEXT,
    classifier_version TEXT,
    classified_at TEXT,
    review_status TEXT NOT NULL DEFAULT 'unreviewed',
    PRIMARY KEY(question_id, node_id, relation_type)
);

CREATE TABLE IF NOT EXISTS syllabus (
    syllabus_id TEXT PRIMARY KEY,
    target_name TEXT NOT NULL,
    source_id TEXT REFERENCES source_asset(source_id),
    published_at TEXT,
    metadata_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS syllabus_item (
    syllabus_item_id TEXT PRIMARY KEY,
    syllabus_id TEXT NOT NULL REFERENCES syllabus(syllabus_id) ON DELETE CASCADE,
    parent_item_id TEXT REFERENCES syllabus_item(syllabus_item_id),
    raw_text TEXT NOT NULL,
    display_order INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS syllabus_taxonomy_map (
    syllabus_item_id TEXT NOT NULL REFERENCES syllabus_item(syllabus_item_id) ON DELETE CASCADE,
    node_id TEXT NOT NULL REFERENCES taxonomy_node(node_id),
    confidence REAL,
    method TEXT,
    status TEXT NOT NULL DEFAULT 'proposed',
    PRIMARY KEY(syllabus_item_id, node_id)
);

CREATE TABLE IF NOT EXISTS question_family (
    family_id TEXT PRIMARY KEY,
    family_type TEXT NOT NULL,
    label TEXT,
    proposition_json TEXT,
    method_version TEXT,
    status TEXT NOT NULL DEFAULT 'proposed'
);

CREATE TABLE IF NOT EXISTS question_family_member (
    family_id TEXT NOT NULL REFERENCES question_family(family_id),
    question_id TEXT NOT NULL REFERENCES question(question_id),
    similarity REAL,
    method TEXT,
    PRIMARY KEY(family_id, question_id)
);

CREATE TABLE IF NOT EXISTS practice_session (
    session_id TEXT PRIMARY KEY,
    mode TEXT NOT NULL,
    target_exam_id TEXT REFERENCES exam(exam_id),
    scoring_policy_id INTEGER REFERENCES scoring_policy(scoring_policy_id),
    filter_snapshot_json TEXT NOT NULL DEFAULT '{}',
    random_seed TEXT,
    started_at TEXT NOT NULL,
    completed_at TEXT
);

CREATE TABLE IF NOT EXISTS session_item (
    session_item_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES practice_session(session_id) ON DELETE CASCADE,
    display_position INTEGER NOT NULL,
    question_id TEXT NOT NULL REFERENCES question(question_id),
    occurrence_id TEXT REFERENCES question_occurrence(occurrence_id),
    selection_reason TEXT,
    first_shown_at TEXT,
    status TEXT NOT NULL DEFAULT 'pending',
    UNIQUE(session_id, display_position)
);
CREATE INDEX IF NOT EXISTS idx_session_item_session ON session_item(session_id, display_position);

CREATE TABLE IF NOT EXISTS attempt (
    attempt_id TEXT PRIMARY KEY,
    session_item_id TEXT NOT NULL REFERENCES session_item(session_item_id) ON DELETE CASCADE,
    first_response_json TEXT,
    final_response_json TEXT,
    answer_changed INTEGER NOT NULL DEFAULT 0 CHECK(answer_changed IN (0,1)),
    response_status TEXT NOT NULL DEFAULT 'answered',
    correctness REAL,
    score_value REAL,
    confidence INTEGER CHECK(confidence BETWEEN 1 AND 5),
    response_time_ms INTEGER,
    seen_count_before INTEGER NOT NULL DEFAULT 0,
    shown_at TEXT NOT NULL,
    confidence_recorded_at TEXT,
    answered_at TEXT,
    answer_key_id_used TEXT REFERENCES answer_key(answer_key_id),
    scoring_snapshot_json TEXT NOT NULL DEFAULT '{}'
);
CREATE INDEX IF NOT EXISTS idx_attempt_session_item ON attempt(session_item_id, answered_at);

CREATE TABLE IF NOT EXISTS error_event (
    error_id TEXT PRIMARY KEY,
    attempt_id TEXT NOT NULL REFERENCES attempt(attempt_id) ON DELETE CASCADE,
    error_type TEXT NOT NULL,
    note TEXT,
    created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS legal_authority (
    authority_id TEXT PRIMARY KEY,
    authority_type TEXT NOT NULL,
    citation TEXT NOT NULL,
    title TEXT,
    UNIQUE(authority_type, citation)
);

CREATE TABLE IF NOT EXISTS legal_authority_version (
    authority_version_id TEXT PRIMARY KEY,
    authority_id TEXT NOT NULL REFERENCES legal_authority(authority_id) ON DELETE CASCADE,
    valid_from TEXT,
    valid_to TEXT,
    content_hash TEXT,
    source_id TEXT REFERENCES source_asset(source_id),
    metadata_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS occurrence_authority (
    occurrence_id TEXT NOT NULL REFERENCES question_occurrence(occurrence_id) ON DELETE CASCADE,
    authority_version_id TEXT NOT NULL REFERENCES legal_authority_version(authority_version_id),
    relation_type TEXT NOT NULL,
    confidence REAL,
    verification_status TEXT NOT NULL DEFAULT 'unverified',
    PRIMARY KEY(occurrence_id, authority_version_id, relation_type)
);

CREATE TABLE IF NOT EXISTS memory_item (
    memory_item_id TEXT PRIMARY KEY,
    node_id TEXT REFERENCES taxonomy_node(node_id),
    item_type TEXT NOT NULL,
    front TEXT NOT NULL,
    back TEXT NOT NULL,
    source_question_id TEXT REFERENCES question(question_id),
    fsrs_card_json TEXT,
    created_at TEXT NOT NULL,
    active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1))
);

CREATE TABLE IF NOT EXISTS memory_review (
    review_id TEXT PRIMARY KEY,
    memory_item_id TEXT NOT NULL REFERENCES memory_item(memory_item_id),
    rating INTEGER,
    response_time_ms INTEGER,
    reviewed_at TEXT NOT NULL,
    fsrs_review_log_json TEXT
);
