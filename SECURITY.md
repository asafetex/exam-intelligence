# Security and Private Data

Exam Intelligence is local-first and may process private candidate telemetry, API credentials, paid-course sources and restricted question corpora.

## Do not commit

- `.env` or API tokens;
- candidate SQLite databases/backups;
- paid/restricted videos, ebooks or transcripts;
- proprietary question-bank dumps/exports when redistribution is not authorized;
- private reports containing sensitive candidate data.

Use gitignored local storage and environment variables.

## Vulnerability / accidental exposure

If a secret or restricted asset is accidentally committed, rotating/deleting the local file is not enough because Git history may retain it. Revoke/rotate the credential immediately and clean repository history as appropriate before continuing.

## Architecture rule

External services and model APIs are optional adapters. Core scoring/session/history must not require transmitting private candidate data to third parties.
