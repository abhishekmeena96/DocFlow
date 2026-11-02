# PHASE_07 - Backend hardening and API docs

Status: Proposed | Depends on: 06
Objective: Make the backend safe, consistent and documented, then get an independent review.

## Sub-phases
- [ ] 07.1 Swagger/OpenAPI
- [ ] 07.2 Helmet and CORS
- [ ] 07.3 Consistent error format
- [ ] 07.4 Integration test suite
- [ ] 07.5 Coverage report
- [ ] 07.6 Grok review #1

## Scope and files (preview)
apps/docflow-api (bootstrap config, test suites), API documentation

## Tests and verification
Integration suite against a test database, coverage report, review findings triaged.

## Completion criteria
- [ ] Integration suite passes with output seen
- [ ] Grok review findings recorded and triaged by the owner
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: OpenAPI, security headers, CORS, integration vs unit tests, test databases, code coverage.

## Questions
1. [concept] What is CORS, and what does it protect against?
2. [concept] Unit test vs integration test: what does each prove?
3. [scenario] Coverage is 90% but a bug reaches production. How is that possible?
4. [design] Why restrict CORS to known origins instead of allowing all?
5. [scenario] A review finding is a potential risk, not a confirmed bug. How do you decide what to do?
Answers: (fill in as you learn)
