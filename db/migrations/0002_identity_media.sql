ALTER TABLE question ADD COLUMN identity_version TEXT NOT NULL DEFAULT 'v0';
ALTER TABLE question_occurrence ADD COLUMN presentation_version TEXT NOT NULL DEFAULT 'v0';

CREATE TABLE stimulus_asset (
    stimulus_id TEXT NOT NULL REFERENCES stimulus(stimulus_id) ON DELETE CASCADE,
    source_id TEXT NOT NULL REFERENCES source_asset(source_id),
    asset_role TEXT NOT NULL DEFAULT 'media',
    locator_json TEXT NOT NULL DEFAULT '{}',
    PRIMARY KEY(stimulus_id, source_id, asset_role)
);
