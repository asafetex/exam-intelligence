from __future__ import annotations

import sqlite3
from pathlib import Path

BUSY_TIMEOUT_MS = 5000


def open_db(path: Path) -> sqlite3.Connection:
    path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(path)
    conn.row_factory = sqlite3.Row
    conn.execute(f"PRAGMA busy_timeout={BUSY_TIMEOUT_MS}")
    conn.execute("PRAGMA foreign_keys=ON")
    conn.execute("PRAGMA journal_mode=WAL")
    return conn


def apply_v0_schema(conn: sqlite3.Connection, project_root: Path | None = None) -> None:
    root = project_root or Path(__file__).resolve().parents[2]
    sql = (root / "db" / "migrations" / "0001_v0.sql").read_text(encoding="utf-8")
    conn.executescript(sql)
