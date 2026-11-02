# DocFlow - Technical Decisions

Record every decision with its reason. Change a decision only with the owner's approval, and keep the old entry in the change log.

## Approved decisions
| ID | Decision | Reason | Alternatives considered | Date |
|----|----------|--------|-------------------------|------|
| D1 | Node.js + NestJS backend | Structure mirrors Angular (modules, services, DI), enterprise style | Express + TypeScript | 2026-11-02 |
| D2 | Plain monorepo: Angular frontend and NestJS backend in separate applications within one Git repository; no Nx | Keep setup simple and avoid unnecessary tooling | Separate Angular CLI and NestJS CLI applications | 2026-11-02 |
| D3 | Angular + Angular Material + SCSS + NgRx + RxJS | Agreed stack; NgRx gives one predictable data path | Component-local state | 2026-11-02 |
| D4 | ACA-style, extension JSON driven UI | Owner wants to learn the enterprise pattern | Hard-coded templates | 2026-11-02 |
| D5 | One role per user (Uploader, Reviewer, Admin) | Simpler permissions to learn first | Multiple roles per user | 2026-11-02 |
| D6 | Reviewer cannot review own document | Prevents self-approval | None | 2026-11-02 |
| D7 | Rejection -> new version of same document | Keeps the full history linked | New document per attempt | 2026-11-02 |
| D8 | No optional features in v1 | Keep scope small | Assignment, comment threads, notifications, CSV export | 2026-11-02 |
| D9 | PostgreSQL with plain SQL (pg), not Prisma. JWT auth. Local storage behind an interface. Docker Compose. | Owner finds Prisma syntax hard; SQL is a transferable skill | Prisma ORM | 2026-11-02 |

## Open decisions (owner approval needed when reached)
| ID | Question | Needed by | Status |
|----|----------|-----------|--------|
| O1 | Is Node v24.21.0 supported by the chosen Nx, NestJS and Angular versions? Check current official requirements. | Phase 01 | Open |
| O2 | SQL migration approach: own small runner vs a migration library | Phase 03 | Open |
| O3 | Token storage in the browser (memory, cookie or storage) and refresh strategy | Phase 09 | Open |
| O4 | Password hashing library (bcrypt or argon2) | Phase 04 | Open |
| O5 | PDF viewer approach on the frontend | Phase 12 | Open |
| O6 | Exact document status names and database representation | Phase 03 | Open |
| O7 | GitHub connection method (SSH key or HTTPS) | Phase 01 | Open |

## Change log
- 2026-11-02: D9 amended from Prisma to plain SQL (owner decision).

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [design] Why is NestJS a better teaching fit than Express here, and what does it cost you?
2. [concept] What does Nx give you that a plain Angular CLI workspace does not?
3. [design] Plain SQL vs an ORM: list two advantages and two costs of each.
4. [scenario] A teammate wants to add comment threads to v1. How does D8 guide the answer, and what process changes it?
5. [concept] Why record rejected alternatives and reasons, not just the final choice?
6. [debugging] The build fails on Node 24 with a version error. Which open decision does this relate to, and what do you check?
7. [scenario] Where do you store the JWT in the browser? Compare the options and the attacks each one faces.
Answers: (fill in as you learn)
