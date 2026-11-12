CREATE TABLE reviews (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  version_id  uuid NOT NULL UNIQUE REFERENCES document_versions (id) ON DELETE RESTRICT,
  reviewer_id uuid NOT NULL REFERENCES users (id) ON DELETE RESTRICT,
  decision    text NOT NULL CHECK (decision IN ('approved', 'rejected')),
  comment     text,
  created_at  timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT reviews_rejection_needs_comment
    CHECK (decision <> 'rejected' OR btrim(coalesce(comment, '')) <> '')
);

CREATE INDEX reviews_reviewer_idx ON reviews (reviewer_id);

CREATE TABLE audit_logs (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  actor_id    uuid REFERENCES users (id) ON DELETE RESTRICT,
  action      text NOT NULL,
  entity_type text NOT NULL,
  entity_id   uuid,
  document_id uuid REFERENCES documents (id) ON DELETE RESTRICT,
  version_id  uuid REFERENCES document_versions (id) ON DELETE RESTRICT,
  metadata    jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX audit_logs_document_idx ON audit_logs (document_id, created_at);
CREATE INDEX audit_logs_actor_idx    ON audit_logs (actor_id);

CREATE TRIGGER reviews_immutable
  BEFORE UPDATE OR DELETE ON reviews
  FOR EACH ROW EXECUTE FUNCTION forbid_modification();

CREATE TRIGGER audit_logs_immutable
  BEFORE UPDATE OR DELETE ON audit_logs
  FOR EACH ROW EXECUTE FUNCTION forbid_modification();
