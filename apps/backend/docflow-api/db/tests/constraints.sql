BEGIN;
DO $$
DECLARE
  u_up uuid; u_rev uuid; d uuid; v1 uuid; v2 uuid;
BEGIN
  INSERT INTO users (name, email, password_hash, role)
    VALUES ('T Up', 't.up@test.local', 'x', 'uploader') RETURNING id INTO u_up;
  INSERT INTO users (name, email, password_hash, role)
    VALUES ('T Rev', 't.rev@test.local', 'x', 'reviewer') RETURNING id INTO u_rev;
  INSERT INTO documents (title, owner_id) VALUES ('Doc', u_up) RETURNING id INTO d;
  INSERT INTO document_versions
    (document_id, version_number, file_path, original_name, size_bytes, mime_type, sha256, uploaded_by)
    VALUES (d, 1, 'f1', 'a.pdf', 10, 'application/pdf', repeat('a', 64), u_up) RETURNING id INTO v1;
  INSERT INTO document_versions
    (document_id, version_number, file_path, original_name, size_bytes, mime_type, sha256, uploaded_by)
    VALUES (d, 2, 'f2', 'a2.pdf', 10, 'application/pdf', repeat('b', 64), u_up) RETURNING id INTO v2;
  RAISE NOTICE 'OK    valid users, document and versions inserted';

  BEGIN
    INSERT INTO users (name, email, password_hash, role) VALUES ('Dup', 'T.UP@test.local', 'x', 'uploader');
    RAISE NOTICE 'FAIL  1 duplicate email (different case) accepted';
  EXCEPTION WHEN unique_violation THEN RAISE NOTICE 'PASS  1 duplicate email (any case) rejected'; END;

  BEGIN
    INSERT INTO users (name, email, password_hash, role) VALUES ('Bad', 'bad@test.local', 'x', 'boss');
    RAISE NOTICE 'FAIL  2 invalid role accepted';
  EXCEPTION WHEN check_violation THEN RAISE NOTICE 'PASS  2 invalid role rejected'; END;

  BEGIN
    INSERT INTO documents (title, owner_id) VALUES ('   ', u_up);
    RAISE NOTICE 'FAIL  3 blank title accepted';
  EXCEPTION WHEN check_violation THEN RAISE NOTICE 'PASS  3 blank title rejected'; END;

  BEGIN
    INSERT INTO documents (title, owner_id, status) VALUES ('X', u_up, 'done');
    RAISE NOTICE 'FAIL  4 invalid status accepted';
  EXCEPTION WHEN check_violation THEN RAISE NOTICE 'PASS  4 invalid status rejected'; END;

  BEGIN
    INSERT INTO document_versions
      (document_id, version_number, file_path, original_name, size_bytes, mime_type, sha256, uploaded_by)
      VALUES (d, 1, 'f9', 'x.pdf', 10, 'application/pdf', repeat('c', 64), u_up);
    RAISE NOTICE 'FAIL  5 duplicate version number accepted';
  EXCEPTION WHEN unique_violation THEN RAISE NOTICE 'PASS  5 duplicate version number rejected'; END;

  BEGIN
    INSERT INTO document_versions
      (document_id, version_number, file_path, original_name, size_bytes, mime_type, sha256, uploaded_by)
      VALUES (d, 3, 'f3', 'x.pdf', 10, 'application/pdf', 'not-a-hash', u_up);
    RAISE NOTICE 'FAIL  6 bad sha256 accepted';
  EXCEPTION WHEN check_violation THEN RAISE NOTICE 'PASS  6 bad sha256 rejected'; END;

  BEGIN
    UPDATE document_versions SET original_name = 'changed.pdf' WHERE id = v1;
    RAISE NOTICE 'FAIL  7 version UPDATE accepted';
  EXCEPTION WHEN raise_exception THEN RAISE NOTICE 'PASS  7 version UPDATE blocked'; END;

  BEGIN
    DELETE FROM document_versions WHERE id = v1;
    RAISE NOTICE 'FAIL  8 version DELETE accepted';
  EXCEPTION WHEN raise_exception THEN RAISE NOTICE 'PASS  8 version DELETE blocked'; END;

  INSERT INTO reviews (version_id, reviewer_id, decision) VALUES (v1, u_rev, 'approved');
  RAISE NOTICE 'OK    valid approval inserted';

  BEGIN
    INSERT INTO reviews (version_id, reviewer_id, decision) VALUES (v1, u_rev, 'approved');
    RAISE NOTICE 'FAIL  9 second review of same version accepted';
  EXCEPTION WHEN unique_violation THEN RAISE NOTICE 'PASS  9 second review of same version rejected'; END;

  BEGIN
    INSERT INTO reviews (version_id, reviewer_id, decision) VALUES (v2, u_rev, 'rejected');
    RAISE NOTICE 'FAIL  10 rejection without comment accepted';
  EXCEPTION WHEN check_violation THEN RAISE NOTICE 'PASS  10 rejection without comment rejected'; END;

  INSERT INTO reviews (version_id, reviewer_id, decision, comment)
    VALUES (v2, u_rev, 'rejected', 'Missing signature');
  RAISE NOTICE 'OK    valid rejection with comment inserted';

  INSERT INTO audit_logs (actor_id, action, entity_type, document_id)
    VALUES (u_up, 'test', 'document', d);

  BEGIN
    UPDATE audit_logs SET action = 'changed' WHERE document_id = d;
    RAISE NOTICE 'FAIL  11 audit UPDATE accepted';
  EXCEPTION WHEN raise_exception THEN RAISE NOTICE 'PASS  11 audit UPDATE blocked'; END;

  BEGIN
    DELETE FROM audit_logs WHERE document_id = d;
    RAISE NOTICE 'FAIL  12 audit DELETE accepted';
  EXCEPTION WHEN raise_exception THEN RAISE NOTICE 'PASS  12 audit DELETE blocked'; END;

  BEGIN
    DELETE FROM users WHERE id = u_up;
    RAISE NOTICE 'FAIL  13 deleting a user who owns documents accepted';
  EXCEPTION WHEN foreign_key_violation THEN RAISE NOTICE 'PASS  13 deleting a user who owns documents rejected'; END;
END $$;
ROLLBACK;
