# Feature: Document upload and versions

Status: PROPOSED | Built in: Phase 05 (backend), Phase 11 and 12 (frontend)

## Functionality
- An Uploader uploads a PDF. This creates a document with version 1 and status Pending Review.
- After a rejection, the owner uploads a new version of the same document (D7).
- Every version is kept and never overwritten or deleted.
- Files are stored on disk under generated names. The database stores metadata and a SHA-256 hash.
- Download requires authentication.

## Acceptance criteria (proposed)
- [ ] A non-PDF file is rejected, even if the extension says .pdf (signature check).
- [ ] A file over the size limit is rejected with a clear message.
- [ ] Version numbers increase by one per document with no gaps or duplicates.
- [ ] Only the document owner can add a version, and only after a rejection.
- [ ] The stored file name is generated, and the original name is kept in the database.
- [ ] A user without access cannot download the file.
- [ ] The list supports pagination, filter and sort.

## Open decisions
Maximum file size. O5 PDF viewer approach.

## Evidence
(Fill in with test and command outputs.)

## Questions
1. [concept] Why is the %PDF signature check stronger than checking the extension?
2. [design] Why keep every version instead of replacing the file?
3. [scenario] Two new versions are uploaded at the same moment. What could go wrong with version numbers?
4. [debugging] The upload succeeds but the file is missing on disk. What do you check?
5. [scenario] A user guesses another document's download URL. What stops them?
Answers: (fill in as you learn)
