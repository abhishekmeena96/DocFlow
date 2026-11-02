# DocFlow - Architecture

Status: PROPOSED. Nothing below is built yet. Update the status of each section as phases complete.
Alfresco ACA references are general patterns, not copied ACA code.

## 1. System overview

    Angular SPA  --HTTP/JSON-->  NestJS REST API  --SQL (pg)-->  PostgreSQL
    (Material, NgRx,             (auth, documents,               (users, documents,
     extension JSON,              versions, reviews,              versions, reviews,
     CRUD library)                audit, storage)                 audit_logs)
                                       |
                                       +--> File storage (PDF files on disk, behind an interface)

- The frontend never touches the database or the file system.
- PDF bytes are stored on disk. PostgreSQL stores only metadata and the file reference.

## 2. Backend (Node.js + NestJS)
Modules: auth, users, documents, versions, reviews, audit, storage, health, database, common, config.
- Controller: receives the request. Service: business rules. Database service: runs SQL.
- Guards: JwtAuthGuard (who are you), RolesGuard (are you allowed).
- DTOs and ValidationPipe validate input. A global exception filter standardises errors.
- Database access: pg connection pool, parameterised SQL only (never string-built queries).
- Migrations: numbered .sql files applied in order by a small runner.

## 3. Database (plain SQL, PostgreSQL)
- users: id, name, email (unique), password_hash, role, is_active, created_at, updated_at
- documents: id, title, description, status, owner_id, current_version_id, created_at, updated_at
- document_versions: id, document_id, version_number, file_path, original_name, size_bytes, mime_type, sha256, uploaded_by, created_at (never updated or deleted)
- reviews: id, version_id, reviewer_id, decision, comment, created_at
- audit_logs: id, actor_id, action, entity_type, entity_id, document_id, version_id, metadata (JSON), created_at (append-only)
Relationships: user -> many documents; document -> many versions; version -> many reviews; document/version -> many audit entries.

## 4. Document workflow (proposed states)
- Upload creates the document with version 1 and status Pending Review.
- Reviewer approves -> Approved. Reviewer rejects (comment required) -> Rejected.
- After Rejected, the owner uploads a new version -> Pending Review again.
Rules: only Reviewers review; a Reviewer cannot review their own document; only a pending current version can be reviewed; no double decision.


## 5. Frontend (Angular application)

- apps/frontend: Angular application containing the shell, routes and feature pages.
- libs/shared/models: Shared types and enums, if needed.
- libs/web/core: API services, interceptors and guards.
- libs/web/store: NgRx root setup and shared state.
- libs/web/extensions: Extension loader, rule registry and action registry.
- libs/web/ui: Reusable JSON-driven CRUD library.
- libs/web/styles: Shared SCSS tokens, mixins and theme.

Smart components select state and dispatch actions. Dumb components only use inputs and outputs.

## 6. NgRx and RxJS
- Slices: auth, documents (entity), versions, reviews, history, users, ui, router.
- Flow: user click -> action -> effect (HTTP via service) -> reducer -> selector -> UI.
- Components never call HTTP directly.
- Operator rules: switchMap for search and loading, concatMap for ordered writes, exhaustMap for submit and login, catchError inside the inner pipe.

## 7. Extension system (ACA-style general pattern)
- docflow.extensions.json declares navigation, toolbar actions, document list columns and visibility rules.
- Rules are named functions (example: docflow.hasRole) referenced by id from the JSON.
- Actions are registered ids mapped to NgRx actions.
- Components render whatever the JSON says, so a new button means JSON + one action + one effect, with no change to the toolbar component.
- Built minimally first (Phase 10), then grown only when needed.

## 8. Security
- Server-side role checks. The frontend only hides things.
- Hashed passwords, short-lived access tokens, refresh tokens, login rate limiting.
- PDF safety: signature check (%PDF), size limit, generated stored filenames, authenticated download.
- Secrets only in .env (git-ignored). .env.example is committed.

## 9. Deployment (Phase 15)
Docker Compose: web (Nginx), api, postgres, uploads volume, health checks, env-based config.

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [design] Why keep PDF bytes on disk and only metadata in PostgreSQL?
2. [concept] What is the difference between a controller, a service and the database service in NestJS?
3. [scenario] A Reviewer changes the frontend to show the Approve button on their own document. What stops them and where?
4. [concept] Why must SQL be parameterised? Show what a SQL injection looks like in a query built from a string.
5. [design] Why are document_versions and audit_logs never updated or deleted?
6. [concept] Trace one click on Approve through action, effect, API, reducer and selector.
7. [debugging] The documents list shows stale data after approving. Which NgRx part do you check first?
8. [design] What does the extension JSON buy you compared with writing buttons directly in templates?
9. [scenario] Two Reviewers approve the same version at the same moment. What should happen and how could the database help?
Answers: (fill in as you learn)
