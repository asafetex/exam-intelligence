from pathlib import Path
import json
import sqlite3

import jsonschema

from exam_intelligence.db import migrate


def root() -> Path:
    return Path(__file__).parents[1]


def test_v0_migrations_load_and_are_idempotent():
    conn = sqlite3.connect(":memory:")
    assert migrate(conn, root()) == 3
    assert migrate(conn, root()) == 3
    tables = {row[0] for row in conn.execute("SELECT name FROM sqlite_master WHERE type='table'")}
    expected = {
        "question", "question_occurrence", "occurrence_option", "answer_key",
        "exam_form", "ingestion_record", "taxonomy_node", "session_item",
        "attempt", "legal_authority_version", "occurrence_authority", "stimulus_asset",
        "learning_intervention", "study_context",
    }
    assert expected <= tables
    assert conn.execute("SELECT value FROM schema_meta WHERE key='schema_version'").fetchone()[0] == "3"


def test_learning_os_context_constraints_and_fk():
    conn = sqlite3.connect(":memory:")
    conn.execute("PRAGMA foreign_keys=ON")
    migrate(conn, root())

    conn.execute(
        "INSERT INTO practice_session(session_id, mode, started_at) VALUES (?, ?, ?)",
        ("s1", "learn", "2026-09-01T22:00:00+00:00"),
    )
    conn.execute(
        """
        INSERT INTO learning_intervention(
            intervention_id, intervention_version, name, evidence_status
        ) VALUES (?, ?, ?, ?)
        """,
        ("retrieval-targeted", "v1", "Targeted retrieval", "supported"),
    )
    conn.execute(
        """
        INSERT INTO study_context(
            study_context_id, session_id, phase_code, phase_model_version,
            session_goal, alertness_1_5, task_clarity_1_5,
            intervention_id, intervention_version, created_at
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """,
        (
            "ctx1", "s1", "basic_20_80", "batismo-v1",
            "Repair one tested gap", 4, 5,
            "retrieval-targeted", "v1", "2026-09-01T22:00:00+00:00",
        ),
    )
    row = conn.execute(
        "SELECT phase_code, alertness_1_5, intervention_id FROM study_context WHERE session_id='s1'"
    ).fetchone()
    assert row == ("basic_20_80", 4, "retrieval-targeted")

    try:
        conn.execute(
            """
            INSERT INTO study_context(study_context_id, session_id, alertness_1_5, created_at)
            VALUES ('ctx2', 's1', 9, '2026-09-01T22:01:00+00:00')
            """
        )
    except sqlite3.IntegrityError:
        pass
    else:
        raise AssertionError("invalid/duplicate study_context should fail constraints")


def test_question_staging_schema_accepts_minimal_mcq():
    schema = json.loads((root() / "schemas" / "question_batch_v0.schema.json").read_text())
    payload = {
        "schema_version": 0,
        "source": {
            "source_type": "public_dataset",
            "provider": "synthetic",
            "adapter": "test",
            "adapter_version": "0",
        },
        "exam": {"bank": "TEST", "form_code": "A"},
        "questions": [{
            "number": 1,
            "type": "single_choice",
            "stem": "Synthetic question?",
            "options": [{"label": "A", "text": "Yes"}, {"label": "B", "text": "No"}],
            "answer_key": "A",
            "answer_key_status": "final",
        }],
    }
    jsonschema.validate(payload, schema)
