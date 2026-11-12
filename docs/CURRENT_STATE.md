# DocFlow - Current State

Last updated: 2026-11-12 (after Phase 03 work)

## Current phase and task
Phase 03 - Database and plain SQL: all sub-phases 03.1 to 03.8 Verified, clean rebuild verified. Waiting for the owner gate.
Next: Phase 04 - Auth and users (backend).

## Completed, with evidence level
- Phase 00: Verified. Phase 01: Complete (owner-reported). Phase 02: Verified (3 unit, 4 e2e tests, build, health, Swagger, env validation).
- 03.1 Verified: Postgres 17 in Docker, host port 5433, healthy. Commit 4803c5d.
- 03.2 Verified: pg database service, "Database connection OK" at startup, wrong password stops startup. Commit edd2eb8.
- 03.3 to 03.8 Verified (commit 833822d):
  - db/migrate.js runner: advisory lock, schema_migrations with checksums, one transaction per file, second run skips.
  - 001 users, 002 documents + document_versions, 003 reviews + audit_logs. 6 tables. UUID ids, CHECK constraints, ON DELETE RESTRICT, immutable triggers.
  - db/tests/constraints.sql: 13 PASS, 3 OK, rolled back.
  - db/seed.js: Admin created from .env (bcryptjs, hash length 60), re-run changes nothing.
  - Unit 3 passed, e2e 4 passed, build clean.

## Approved decisions
D1 NestJS. D2 plain folders, no Nx. D3 Angular + Material + SCSS + NgRx + RxJS. D4 ACA-style extension JSON. D5 one role per user. D6 no self-review. D7 rejection -> new version. D8 no optional features in v1. D9 plain SQL with pg, no Prisma.
Phase 03: own migration runner (O2), migrations in apps/backend/docflow-api/db/migrations, statuses pending_review / approved / rejected (O6 settled), bcryptjs for the seed (confirm in Phase 04, O4).

## Open items
1. Clean rebuild verified 2026-11-12: down -v, up, migrate (3 applied), seed (Admin created), 6 tables. Phase 03 owner gate pending.
2. Stray 002_*.sql and 003_*.sql in the backend root were confirmed identical to the real migrations and deleted. apps/frontend and docs/frontend are untracked and not reviewed by Claude. my.md and apps/backend/practice are untracked. Do not commit without approval.
3. Known issues: health response has timestamp, not a service field; Swagger responses and error schemas thin; Phase 07.1 overlaps 02.5; 26 npm vulnerabilities (do not run npm audit fix --force); e2e tests need the Postgres container and a root .env; D6 rule is enforced in the service in Phase 06.
4. Records to tick: 03.3 to 03.8 in PHASE_03.md and PROJECT_ROADMAP.md; D2 and Phase 03 choices in the TECHNICAL_DECISIONS.md change log; ARCHITECTURE.md and MASTER_CONTEXT.md still mention Nx or Prisma if unchanged.
5. .env rules: alphanumeric DB password; POSTGRES_PASSWORD and the password in DATABASE_URL must match; never paste .env or ADMIN_PASSWORD.
6. Git push uses an HTTPS personal access token. ~/employee-management-system is a separate project, do not touch.

## Repository state
Branch main, latest pushed commit 833822d. Layout: apps/backend/docflow-api (NestJS 12), apps/frontend, libs, docs, docker-compose.yml.

## Next task
Run the clean rebuild, pass the Phase 03 gate, then plan Phase 04 (auth, JWT, roles, user management).

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [scenario] You return after two weeks away. What do you read first, and what do you verify before continuing?
2. [debugging] A migration file was saved empty and the runner recorded it as applied. How do you detect and repair it?
3. [design] Why enforce "one review per version" with a UNIQUE constraint instead of only an if in the service?
4. [concept] Why does the migration runner store a checksum for each applied file?
5. [design] Why block UPDATE and DELETE on audit_logs with a trigger and not just by never writing such queries?
Answers: (fill in as you learn)
