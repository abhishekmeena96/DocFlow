# DocFlow - Project Roadmap

Last updated: 2026-11-02
Status labels: Proposed, Approved, Generated, Applied, Verified, Complete.
Tick a box only after the real output was seen. The Phase gate line is ticked by the owner after a manual check.

## Phase gate checklist (applies to every phase)
- [ ] Agreed tasks implemented and applied by the owner
- [ ] Behaviour and relevant tests checked; untested areas recorded
- [ ] Code reviewed; Git changes committed and pushed (from Phase 01 onward)
- [ ] CURRENT_STATE.md, PHASE_XX.md and affected records updated
- [ ] Concepts recorded in Obsidian with learning status
- [ ] DeepSeek phase assessment done (phases with code)
- [ ] Scheduled Grok review done (after Phases 07, 12, 16)
- [ ] Known issues and the next task recorded

## Phase 00 - Environment and project records
Depends on: none
- [x] 00.1 Check OS and tool versions
- [x] 00.2 Check for an existing DocFlow folder
- [x] 00.3 Create the docs/ structure
- [x] 00.4 Initial records (MASTER_CONTEXT, AI_WORKFLOW, CURRENT_STATE)
- [x] 00.5 PROJECT_ROADMAP.md
- [x] 00.6 ARCHITECTURE.md and TECHNICAL_DECISIONS.md
- [x] 00.7 phases/PHASE_00.md to PHASE_16.md
- [x] 00.8 features/ starter files
- [x] 00.9 Questions blocks and CURRENT_STATE refresh
- [x] Phase gate

## Phase 01 - Project structure, Git and GitHub
Depends on: 00
- [x] 01.1 Check Git and repo state
- [x] 01.2 Create the application folder structure (Angular frontend and NestJS backend)
- [x] 01.3 Add .gitignore and .env.example
- [x] 01.4 First commit
- [x] 01.5 Connect GitHub and push
- [x] 01.6 Secrets check
- [x] Phase gate

## Phase 02 - NestJS backend foundation
Depends on: 01
- [x] 02.1 Generate docflow-api
- [x] 02.2 Config module and env validation
- [x] 02.3 Global prefix and ValidationPipe
- [x] 02.4 Global exception filter
- [x] 02.5 Swagger / OpenAPI documentation
- [x] 02.6 Health endpoint
- [x] 02.7 Tests
- [x] 02.8 Phase gate

## Phase 03 - Database and plain SQL (amended: no Prisma)
Depends on: 02
- [ ] 03.1 Postgres through Docker Compose
- [ ] 03.2 pg library and database service in NestJS
- [ ] 03.3 SQL migration runner and numbered .sql files
- [ ] 03.4 users table
- [ ] 03.5 documents and document_versions tables
- [ ] 03.6 reviews and audit_logs tables
- [ ] 03.7 Apply and verify migrations
- [ ] 03.8 Seed script (Admin user)
- [ ] Phase gate

## Phase 04 - Auth and users (backend)
Depends on: 03
- [ ] 04.1 Password hashing
- [ ] 04.2 Admin user CRUD
- [ ] 04.3 Login endpoint
- [ ] 04.4 JWT access and refresh tokens
- [ ] 04.5 JwtAuthGuard
- [ ] 04.6 RolesGuard and @Roles() decorator
- [ ] 04.7 Login rate limiting
- [ ] 04.8 Tests
- [ ] Phase gate

## Phase 05 - Documents, versions and upload (backend)
Depends on: 04
- [ ] 05.1 Storage interface and local implementation
- [ ] 05.2 Upload endpoint (Multer)
- [ ] 05.3 PDF validation (signature, size, type)
- [ ] 05.4 Create document with version 1
- [ ] 05.5 New-version rules
- [ ] 05.6 List with pagination, filter and sort
- [ ] 05.7 Detail and versions endpoints
- [ ] 05.8 Authenticated download
- [ ] Phase gate

## Phase 06 - Reviews, rules and audit (backend)
Depends on: 05
- [ ] 06.1 Status transition service
- [ ] 06.2 Approve endpoint
- [ ] 06.3 Reject endpoint with required comment
- [ ] 06.4 Rule checks (self-review, double review, pending only)
- [ ] 06.5 Audit service
- [ ] 06.6 History endpoint
- [ ] 06.7 Tests
- [ ] Phase gate

## Phase 07 - Backend hardening and API docs
Depends on: 06
- [ ] 07.1 Swagger/OpenAPI
- [ ] 07.2 Helmet and CORS
- [ ] 07.3 Consistent error format
- [ ] 07.4 Integration test suite
- [ ] 07.5 Coverage report
- [ ] 07.6 Grok review #1
- [ ] Phase gate

## Phase 08 - Angular foundation and UI layout
Depends on: 07
- [ ] 08.1 Generate docflow-web
- [ ] 08.2 Angular Material setup
- [ ] 08.3 Shared SCSS tokens and theme
- [ ] 08.4 Scaffold libraries
- [ ] 08.5 NgRx root (store, effects, router-store, devtools)
- [ ] 08.6 Header
- [ ] 08.7 Sidebar
- [ ] 08.8 Footer
- [ ] 08.9 Main content area and app shell
- [ ] 08.10 API proxy and environment config
- [ ] Phase gate

## Phase 09 - Auth frontend
Depends on: 08
- [ ] 09.1 Auth state (actions, reducer, selectors)
- [ ] 09.2 AuthService
- [ ] 09.3 Token handling decision
- [ ] 09.4 Login page
- [ ] 09.5 Interceptor and 401 handling
- [ ] 09.6 Auth and role guards
- [ ] 09.7 Logout and header user menu
- [ ] 09.8 Tests
- [ ] Phase gate

## Phase 10 - Extension system (minimal)
Depends on: 09
- [ ] 10.1 docflow.extensions.json schema
- [ ] 10.2 Extension loader
- [ ] 10.3 Rule evaluator registry
- [ ] 10.4 Action registry
- [ ] 10.5 Navigation from JSON
- [ ] 10.6 Role-aware sidebar wiring
- [ ] 10.7 Tests
- [ ] Phase gate

## Phase 11 - Documents list and upload (frontend)
Depends on: 10
- [ ] 11.1 Documents entity store
- [ ] 11.2 Documents API service
- [ ] 11.3 List page with JSON-defined columns
- [ ] 11.4 Pagination, filter and sort
- [ ] 11.5 Status chip
- [ ] 11.6 Upload dialog
- [ ] 11.7 Loading, empty and error states
- [ ] 11.8 Tests
- [ ] Phase gate

## Phase 12 - Document details and review
Depends on: 11
- [ ] 12.1 Details route and store
- [ ] 12.2 PDF viewer
- [ ] 12.3 Details tab
- [ ] 12.4 Versions tab
- [ ] 12.5 History tab
- [ ] 12.6 Toolbar actions from JSON with rules
- [ ] 12.7 Reject dialog
- [ ] 12.8 New version upload
- [ ] 12.9 Tests and Grok review #2
- [ ] Phase gate

## Phase 13 - Reusable CRUD library and user management
Depends on: 12
- [ ] 13.1 Config schema
- [ ] 13.2 Table component
- [ ] 13.3 Form component
- [ ] 13.4 Filter component
- [ ] 13.5 Toolbar and dialog components
- [ ] 13.6 Admin user management screens
- [ ] 13.7 Refactor documents list onto the library
- [ ] 13.8 SCSS cleanup
- [ ] Phase gate

## Phase 14 - Frontend tests and E2E
Depends on: 13
- [ ] 14.1 Unit test gaps
- [ ] 14.2 Playwright setup
- [ ] 14.3 Happy-path flow
- [ ] 14.4 Rejection and re-upload flow
- [ ] 14.5 Role access checks
- [ ] 14.6 Fix defects
- [ ] Phase gate

## Phase 15 - Docker and production-like environment
Depends on: 14
- [ ] 15.1 API Dockerfile
- [ ] 15.2 Web Dockerfile and Nginx
- [ ] 15.3 Full Compose stack
- [ ] 15.4 Migration step
- [ ] 15.5 Uploads volume
- [ ] 15.6 Env config and health checks
- [ ] 15.7 Smoke test
- [ ] Phase gate

## Phase 16 - Final documentation and release
Depends on: 15
- [ ] 16.1 README
- [ ] 16.2 Setup guide
- [ ] 16.3 API and architecture docs
- [ ] 16.4 Final Grok review
- [ ] 16.5 DeepSeek assessment
- [ ] 16.6 Issue triage
- [ ] 16.7 Tag v1.0
- [ ] Phase gate

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [design] Why is the roadmap backend-first, and what breaks if the Angular app is started before the API exists?
2. [scenario] A phase has all code applied but no tests were run. Can it be marked Complete? Why or why not?
3. [concept] What is the difference between the statuses Applied and Verified?
4. [scenario] CURRENT_STATE.md says Phase 05 is done but the repository has no upload code. Which record do you trust, and what do you do?
Answers: (fill in as you learn)
