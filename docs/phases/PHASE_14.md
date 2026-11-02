# PHASE_14 - Frontend tests and E2E

Status: Proposed | Depends on: 13
Objective: Fill testing gaps and prove the full workflow end to end with Playwright.

## Sub-phases
- [ ] 14.1 Unit test gaps
- [ ] 14.2 Playwright setup
- [ ] 14.3 Happy-path flow
- [ ] 14.4 Rejection and re-upload flow
- [ ] 14.5 Role access checks
- [ ] 14.6 Fix defects

## Scope and files (preview)
apps/docflow-web-e2e, unit tests in libs and the app

## Tests and verification
E2E suite passes with output seen, untested areas recorded.

## Completion criteria
- [ ] Login, upload, review and re-upload flows covered
- [ ] Role access checks covered
- [ ] Defects found are fixed or recorded
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: test pyramid, marble tests for RxJS, E2E selectors, test data setup, flaky tests, test isolation.

## Questions
1. [concept] What belongs in unit tests, integration tests and E2E tests, and why not everything in E2E?
2. [scenario] An E2E test passes locally and fails in CI occasionally. What do you suspect?
3. [design] How do you set up and clean test data so tests do not depend on each other?
4. [debugging] A test fails after a UI change although the feature works. What kind of problem is that?
5. [scenario] Which role access checks matter most for DocFlow, and why?
Answers: (fill in as you learn)
