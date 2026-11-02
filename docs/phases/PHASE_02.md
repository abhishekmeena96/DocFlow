# PHASE_02 - NestJS backend foundation

Status: Proposed | Depends on: 01
Objective: A running NestJS API with config, validation, error handling and a health endpoint.

## Sub-phases
- [ ] 02.1 Generate docflow-api
- [ ] 02.2 Config module and env validation
- [ ] 02.3 Global prefix and ValidationPipe
- [ ] 02.4 Global exception filter
- [ ] 02.5 Health endpoint
- [ ] 02.6 Tests

## Scope and files (preview)
apps/docflow-api/src/** (main.ts, app module, config, common, health)

## Tests and verification
Health unit test, GET /api/health returns 200, a bad request returns the standard error shape.

## Completion criteria
- [ ] API starts locally
- [ ] Tests pass with output seen
- [ ] Standard error format documented
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: NestJS modules, controllers, providers, dependency injection, pipes, filters, environment config.

## Questions
1. [concept] What do a module, a controller and a provider each do in NestJS?
2. [concept] How is dependency injection in NestJS similar to Angular?
3. [scenario] A request body has a wrong field type. Which part rejects it, and what does the client receive?
4. [debugging] The API cannot start because an environment variable is missing. Where should that be caught?
Answers: (fill in as you learn)
