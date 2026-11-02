# PHASE_15 - Docker and production-like environment

Status: Proposed | Depends on: 14
Objective: Run the whole stack with Docker Compose from a clean start.

## Sub-phases
- [ ] 15.1 API Dockerfile
- [ ] 15.2 Web Dockerfile and Nginx
- [ ] 15.3 Full Compose stack
- [ ] 15.4 Migration step
- [ ] 15.5 Uploads volume
- [ ] 15.6 Env config and health checks
- [ ] 15.7 Smoke test

## Scope and files (preview)
docker/*, docker-compose.yml, nginx config, .env.example

## Tests and verification
Clean docker compose up works, smoke test of the full flow passes.

## Completion criteria
- [ ] Stack runs from scratch in a clean folder
- [ ] Uploads survive a container restart
- [ ] No secrets inside images or Git
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: images vs containers, multi-stage builds, Compose networking, volumes, Nginx as static server and reverse proxy, health checks, environment variables.

## Questions
1. [concept] Image vs container: what is the difference?
2. [design] Why use a multi-stage build for the Angular app?
3. [scenario] The API container starts before Postgres is ready. How do you handle it?
4. [debugging] Uploaded files disappear after restarting the stack. What did you miss?
5. [scenario] How do you pass the database password to the API without putting it in the image?
Answers: (fill in as you learn)
