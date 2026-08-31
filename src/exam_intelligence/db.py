from __future__ import annotations

import sqlite3
from pathlib import Path

BUSY_TIMEOUT_MS = 5000


def _project_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _current_schema_version(conn: sqlite3.Connection) -> int:
    exists = conn.execute(
        "SELECT 1 FROM sqlite_master WHERE type='table' AND name='schema_meta'"
    ).fetchone()
    if not exists:
        return 0
    row = conn.execute(
        "SELECT value FROM schema_meta WHERE key='schema_version'"
    ).fetchone()
    return int(row[0]) if row else 0


def migrate(conn: sqlite3.Connection, project_root: Path | None = None) -> int:
    root = project_root or _project_root()
    migration_dir = root / "db" / "migrations"
    files = sorted(migration_dir.glob("[0-9][0-9][0-9][0-9]_*.sql"))
    current = _current_schema_version(conn)

    for migration in files:
        version = int(migration.name[:4])
        if version <= current:
            continue
        if version != current + 1:
            raise RuntimeError(
                f"Migration gap: database is v{current}, next file is v{version} ({migration.name})"
            )
        sql = migration.read_text(encoding="utf-8")
        script = f"""
BEGIN IMMEDIATE;
{sql}
INSERT INTO schema_meta(key, value) VALUES ('schema_version', '{version}')
ON CONFLICT(key) DO UPDATE SET value=excluded.value;
COMMIT;
"""
        try:
            conn.executescript(script)
        except Exception:
            conn.rollback()
            raise
        current = version
    return current


def open_db(path: Path, project_root: Path | None = None) -> sqlite3.Connection:
    path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(path)
    conn.row_factory = sqlite3.Row
    conn.execute(f"PRAGMA busy_timeout={BUSY_TIMEOUT_MS}")
    conn.execute("PRAGMA foreign_keys=ON")
    migrate(conn, project_root=project_root)
    conn.execute("PRAGMA journal_mode=WAL")
    return conn


def apply_v0_schema(conn: sqlite3.Connection, project_root: Path | None = None) -> None:
    """Backward-compatible helper used by early tests and scripts."""
    migrate(conn, project_root=project_root)
