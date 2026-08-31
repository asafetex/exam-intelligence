from pathlib import Path
import json
import sqlite3

import jsonschema


def root() -> Path:
    return Path(__file__).parents[1]


def test_v0_schema_loads():
    sql = (root() / "db" / "migrations" / "0001_v0.sql").read_text(encoding="utf-8")
    conn = sqlite3.connect(":memory:")
    conn.executescript(sql)
    tables = {row[0] for row in conn.execute("SELECT name FROM sqlite_master WHERE type='table'")}
    expected = {
        "question", "question_occurrence", "occurrence_option", "answer_key",
        "exam_form", "ingestion_record", "taxonomy_node", "session_item",
        "attempt", "legal_authority_version", "occurrence_authority",
    }
    assert expected <= tables


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
