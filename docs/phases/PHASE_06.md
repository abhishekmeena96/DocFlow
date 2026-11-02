# PHASE_06 - Reviews, rules and audit (backend)

Status: Proposed | Depends on: 05
Objective: Approve and reject documents under strict workflow rules, with every action written to an append-only audit log.

## Sub-phases
- [ ] 06.1 Status transition service
- [ ] 06.2 Approve endpoint
- [ ] 06.3 Reject endpoint with required comment
- [ ] 06.4 Rule checks (self-review, double review, pending only)
- [ ] 06.5 Audit service
- [ ] 06.6 History endpoint
- [ ] 06.7 Tests

## Scope and files (preview)
apps/docflow-api/src/app/reviews/*, audit/*; status transitions in one service

## Tests and verification
Every transition, wrong-role attempts, self-review blocked, double review blocked, audit entries created.

## Completion criteria
- [ ] Full workflow works through the API
- [ ] Audit log is correct and never updated or deleted
- [ ] Tests pass with output seen
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: state machines, SQL transactions, race conditions, append-only logs, business rules in services.

## Questions
1. [concept] What is a SQL transaction and why must an approval and its audit entry share one?
2. [scenario] Two Reviewers approve the same version at the same moment. What should happen and how does the database help?
3. [design] Why keep all status transitions in one service instead of spreading them across controllers?
4. [debugging] An approval succeeded but no audit entry exists. What went wrong and how do you prevent it?
5. [scenario] A Reviewer uploaded the document and tries to approve it. Which layer blocks it?
Answers: (fill in as you learn)
