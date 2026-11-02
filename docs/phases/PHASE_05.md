# PHASE_05 - Documents, versions and upload (backend)

Status: Proposed | Depends on: 04
Objective: Upload PDFs safely, store immutable versions, list and download documents.

## Sub-phases
- [ ] 05.1 Storage interface and local implementation
- [ ] 05.2 Upload endpoint (Multer)
- [ ] 05.3 PDF validation (signature, size, type)
- [ ] 05.4 Create document with version 1
- [ ] 05.5 New-version rules
- [ ] 05.6 List with pagination, filter and sort
- [ ] 05.7 Detail and versions endpoints
- [ ] 05.8 Authenticated download

## Scope and files (preview)
apps/docflow-api/src/app/storage/*, documents/*, versions/*; uploads folder (git-ignored)

## Tests and verification
Non-PDF rejected, oversized file rejected, spoofed extension caught, only the owner adds versions, versions never overwritten.

## Completion criteria
- [ ] Upload and versioning verified through the API
- [ ] Files stored under generated names with SHA-256 hash
- [ ] Download requires authentication
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: multipart upload, Multer, file signatures, hashing with SHA-256, streams, SQL pagination, immutable records.

## Questions
1. [concept] Why check the %PDF signature instead of trusting the file extension?
2. [design] Why store files under generated names and keep the original name in the database?
3. [scenario] Two uploads of a new version arrive at the same time. What could go wrong with version numbers?
4. [concept] Explain offset pagination in SQL and one weakness of it.
5. [debugging] Download returns an empty or corrupt PDF. What do you check?
Answers: (fill in as you learn)
