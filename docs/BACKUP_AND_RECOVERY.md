# Backup and Recovery

The Git repository is not the backup for private candidate data or imported corpora.

## Rebuildable data
Canonical question corpus should be reproducible from retained source manifests/assets + adapters + migrations whenever rights allow local retention.

## Non-rebuildable personal evidence
Candidate attempts, confidence, timing, error events and review history are unique personal data and require backups.

Before real study use, provide a local backup command/process that:
- takes a consistent SQLite snapshot (SQLite backup API or `VACUUM INTO`)
- includes private manifests needed to locate local source assets
- excludes secrets by default
- supports a tested restore into a clean working directory

Migrations must be tested against a copy/backup before destructive schema changes.
