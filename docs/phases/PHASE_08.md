# PHASE_08 - Angular foundation and UI layout

Status: Proposed | Depends on: 07
Objective: Build the Angular frontend application with Angular Material, shared SCSS, NgRx root, and the app shell (header, sidebar, footer).

## Sub-phases
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

## Scope and files (preview)
apps/docflow-web, libs/web/styles, libs/web/store, libs/web/core, libs/shared/models

## Tests and verification
App builds and runs, shell renders, dev proxy reaches /api/health.

## Completion criteria
- [ ] Empty shell talks to the backend
- [ ] Layout responsive and uses shared SCSS tokens
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: Angular standalone components, Angular Material, SCSS variables and mixins, NgRx store/effects, shared libraries and project boundaries, dev proxy.

## Questions
1. [concept] What does the NgRx store give you that component state does not?
2. [design] Why put styles and models in libraries instead of the app?
3. [concept] What is a dev proxy and what problem does it solve?
4. [scenario] The sidebar must collapse on small screens. Where does that logic and state live?
5. [debugging] The app loads but the API call fails with a CORS error. What do you check?
Answers: (fill in as you learn)
