# DocFlow - Master Context

## Overview
DocFlow is a Document Approval System.
- Uploaders upload PDF documents.
- Reviewers approve or reject them.
- Every document version is preserved.
- Every action is recorded in a history log.
- Users log in and access features by role.

## Goals
- A complete working full-stack app: frontend, backend, database, auth, tests, Docker.
- The owner understands the whole system and can explain it at experienced-developer level.
- A reusable JSON/config-driven CRUD component library with shared SCSS.
- Alfresco ACA-inspired architecture (general patterns, not copied ACA code).

## Approved decisions
- D1  Backend: Node.js + NestJS
- D2 Workspace: Plain monorepo with separate Angular frontend and NestJS backend applications in one Git repository; no Nx.
- D3  Frontend: Angular + Angular Material + SCSS + NgRx + RxJS
- D4  UI style: ACA-inspired, driven by docflow.extensions.json
- D5  One role per user: Uploader, Reviewer, Admin
- D6  A Reviewer cannot review a document they uploaded
- D7  After rejection, the Uploader uploads a new version of the same document
- D8  No optional features in v1 (assignment, comment threads, notifications, CSV export)
- D9  PostgreSQL with plain SQL (pg library), NOT Prisma. JWT auth. Local file storage behind an interface. Docker Compose.

## Workflow rules
- The owner approves every requirement, scope change and decision.
- Work happens in phases, and each phase has sub-phases (PHASE.SUB, e.g. 08.6).
- Inspect the current state before every step. Never assume.
- Status labels: Proposed, Approved, Generated, Applied, Verified, Complete.

## Project location
/home/abhishek/projects/DocFlow

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [design] Describe DocFlow in one minute, as you would in an interview.
2. [design] Which of the decisions D1 to D9 would you defend hardest, and what is the strongest argument against it?
3. [scenario] A teammate asks to switch from plain SQL to an ORM. What does this record say, and what is the process to change it?
4. [concept] Why are optional features excluded from v1 (D8)?
Answers: (fill in as you learn)
