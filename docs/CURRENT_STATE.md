# DocFlow - Current State

Last updated: 2026-11-02

## Current phase and task

Phase 00 COMPLETE (owner gate passed).
Current: Phase 01 - Project structure, Git and GitHub (In Progress).
Completed sub-phase: 01.1 (Check Git and repo state).
Next sub-phase: 01.2 (Create the application folder structure). Not started.

## Completed, with evidence
- Phase 00 (00.1 to 00.9) Verified with owner output, and the owner manual gate passed.
- Environment: Ubuntu 22.04.1 LTS, Node v24.21.0, npm 11.19.0, Git 2.34.1, Docker 29.9.2, Compose v5.6.1, VS Code 1.144.0. docker ps works without a permission error.
- Records in ~/projects/DocFlow/docs: 6 top-level records, 17 phase files (PHASE_00 to PHASE_16), 4 feature files. 27 files, each with a Questions block.


- Phase 01.1: Verified Git installation and global identity, initialized the DocFlow repository, and renamed the branch to main. No commits created yet.


## In progress
- Nothing.

## Approved decisions
D1 NestJS, D2 Plain monorepo (separate Angular and NestJS applications), D3 Angular + Material + SCSS + NgRx + RxJS, D4 ACA-style extension JSON,
D5 one role per user, D6 no self-review, D7 rejection -> new version, D8 no optional features in v1,
D9 plain SQL (pg), no Prisma. Details in docs/TECHNICAL_DECISIONS.md.

## Open items
- O7 GitHub connection method still undecided; Git identity is configured, ~/.ssh has no keys, and GitHub CLI is not installed.
- O6 Maximum PDF size and exact status names still undecided.
- Optional extra feature files not created: document-versioning, user-management, extension-system, crud-library.
- ~/employee-management-system is a separate project. Do not touch.


## Repository state
Git repository initialized. Branch: main. No commits yet. The docs/ directory is currently untracked. Project path: /home/abhishek/projects/DocFlow


## Next task

01.2 Create the application folder structure for the Angular frontend and NestJS backend.

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [scenario] You return after two weeks away. What do you read first, and what do you verify before continuing?
2. [debugging] This file says an endpoint exists but a request returns 404. Which source is authoritative and why?
3. [design] Why record the evidence level next to each completed task?
Answers: (fill in as you learn)
