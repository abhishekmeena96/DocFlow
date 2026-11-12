CREATE TABLE documents (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title              text NOT NULL CHECK (btrim(title) <> ''),
  description        text,
  status             text NOT NULL DEFAULT 'pending_review'
                     CHECK (status IN ('pending_review', 'approved', 'rejected')),
  owner_id           uuid NOT NULL REFERENCES users (id) ON DELETE RESTRICT,
  current_version_id uuid,
  created_at         timestamptz NOT NULL DEFAULT now(),
  updated_at         timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE document_versions (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  document_id   uuid NOT NULL REFERENCES documents (id) ON DELETE RESTRICT,
  version_number integer NOT NULL CHECK (version_number > 0),
  file_path     text NOT NULL,
  original_name text NOT NULL,
  size_bytes    bigint NOT NULL CHECK (size_bytes > 0),
  mime_type     text NOT NULL,
  sha256        text NOT NULL CHECK (sha256 ~ '^[0-9a-f]{64}$'),
  uploaded_by   uuid NOT NULL REFERENCES users (id) ON DELETE RESTRICT,
  created_at    timestamptz NOT NULL DEFAULT now(),
  UNIQUE (document_id, version_number)
);

-- documents and versions point at each other, so this link is added last.
ALTER TABLE documents
  ADD CONSTRAINT documents_current_version_fk
  FOREIGN KEY (current_version_id) REFERENCES document_versions (id)
  ON DELETE RESTRICT;

-- Postgres does not index foreign keys automatically.
CREATE INDEX documents_owner_idx   ON documents (owner_id);
CREATE INDEX documents_status_idx  ON documents (status);
CREATE INDEX documents_created_idx ON documents (created_at DESC);
CREATE INDEX document_versions_uploaded_by_idx ON document_versions (uploaded_by);

CREATE TRIGGER documents_set_updated_at
  BEFORE UPDATE ON documents
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER document_versions_immutable
  BEFORE UPDATE OR DELETE ON document_versions
  FOR EACH ROW EXECUTE FUNCTION forbid_modification();
