# Data Governance and Rights

## Default policy
Local/private by default for:
- paid-course videos/audio/transcripts
- copyrighted question-bank exports or API payload dumps
- raw official/public PDFs when redistribution status is unclear
- candidate performance databases and generated private reports
- API keys and credentials

## Git-safe by default
- source code
- schemas
- migrations
- architecture documentation
- synthetic test fixtures
- metadata/manifests that do not reproduce restricted source content

## Source rights metadata
Each `source_asset` records:
- provider
- URI/path/hash
- source type
- rights status
- redistribution allowed flag
- license/terms notes

Rights metadata does not itself grant rights. It records the basis for how the project treats the asset.

## Public repository rule
Never commit proprietary corpus content or personal performance data to a public repository. If later knowledge canon derived from paid material becomes detailed enough to reproduce protected expression, keep it private/local unless there is a clear right to publish it.

## Secrets
Quest API and other credentials must come from environment variables. `.env` is ignored; `.env.example` contains names only.
