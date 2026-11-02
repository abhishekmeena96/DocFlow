# PHASE_03 - Database and plain SQL (no Prisma)

Status: Proposed | Depends on: 02
Objective: Postgres running in Docker, tables created by numbered SQL migrations, and the API connected through the pg library.

## Sub-phases
- [ ] 03.1 Postgres through Docker Compose
- [ ] 03.2 pg library and database service in NestJS
- [ ] 03.3 SQL migration runner and numbered .sql files
- [ ] 03.4 users table
- [ ] 03.5 documents and document_versions tables
- [ ] 03.6 reviews and audit_logs tables
- [ ] 03.7 Apply and verify migrations
- [ ] 03.8 Seed script (Admin user)

## Scope and files (preview)
docker-compose.yml, db/migrations/*.sql, db seed script, apps/docflow-api/src/app/database/*

## Open decisions
O2 migration approach, O6 status names and representation.

## Tests and verification
Tables exist, constraints (unique, foreign key, not null) behave, seed row exists, API connects.

## Completion criteria
- [ ] Migrations apply on a clean database
- [ ] All queries are parameterised
- [ ] Seed Admin verified
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: Docker containers and volumes, connection pool, parameterised queries, migrations, primary and foreign keys, indexes, constraints.

## Questions
1. [concept] What is SQL injection, and how do parameterised queries prevent it?
2. [concept] What is a connection pool and why not open a connection per request?
3. [design] Why use numbered migration files instead of editing tables by hand?
4. [debugging] The API cannot connect to Postgres in Docker. List what you check in order.
5. [scenario] A migration fails halfway. What state is the database in and how do you recover?
Answers: (fill in as you learn)
