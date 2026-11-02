# Feature: Audit and history log

Status: PROPOSED | Built in: Phase 06 (backend), Phase 12 (History tab)

## Functionality
- Every important action is recorded: who, what, when, which document and version.
- The log is append-only. Rows are never updated or deleted.
- The History tab on the document details page shows the timeline.

## Actions to record (proposed)
user created or changed, document uploaded, version uploaded, document approved, document rejected.

## Acceptance criteria (proposed)
- [ ] Each action above creates exactly one audit entry.
- [ ] An audit entry is saved in the same transaction as the action it describes.
- [ ] No endpoint updates or deletes audit rows.
- [ ] The history endpoint returns entries in time order with the actor name.
- [ ] The History tab shows the same entries.

## Open decisions
Whether to log logins and downloads. Who may see the full history of a document.

## Evidence
(Fill in with test and command outputs.)

## Questions
1. [design] Why must the audit entry share a transaction with the action?
2. [concept] How do you make a table append-only in practice, in code and in the database?
3. [scenario] An auditor asks who approved version 2 of a document and when. Which query answers it?
4. [debugging] The History tab is missing an entry that exists in the database. What do you check?
5. [design] What should the metadata JSON hold, and what must never be stored in it?
Answers: (fill in as you learn)
