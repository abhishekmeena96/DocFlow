# Feature: Approval workflow

Status: PROPOSED | Built in: Phase 06 (backend), Phase 12 (frontend)

## Functionality
- A Reviewer approves or rejects the current version of a document.
- Rejection requires a comment. Approval comment is optional (to be confirmed).
- After a rejection the owner uploads a new version, which returns to Pending Review (D7).

## States (proposed)
Pending Review -> Approved
Pending Review -> Rejected
Rejected -> Pending Review (when a new version is uploaded)

## Rules (D5, D6)
- Only a Reviewer can review.
- A Reviewer cannot review a document they uploaded.
- Only a Pending Review current version can be reviewed.
- A version cannot be reviewed twice.

## Acceptance criteria (proposed)
- [ ] Approve and reject follow the allowed transitions only.
- [ ] Reject without a comment returns a validation error.
- [ ] Self-review is blocked by the server.
- [ ] A second review of the same version is blocked.
- [ ] Each decision and its audit entry are saved together or not at all.
- [ ] The UI shows Approve and Reject only when the rules allow.

## Open decisions
O6 exact status names and their database representation.

## Evidence
(Fill in with test and command outputs.)

## Questions
1. [design] Draw the state machine and name the one place in code that owns the transitions.
2. [scenario] Two Reviewers decide on the same version at the same moment. What should happen?
3. [concept] Why must the self-review rule be enforced on the server, not only hidden in the UI?
4. [debugging] A rejected document does not return to Pending Review after a new upload. Where do you look?
5. [scenario] The owner uploads a new version while a Reviewer is viewing the old one. What should the Reviewer see?
Answers: (fill in as you learn)
