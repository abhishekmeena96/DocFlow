# PHASE_13 - Reusable CRUD library and user management

Status: Proposed | Depends on: 12
Objective: Extract a JSON/config-driven CRUD component library and use it to build Admin user management.

## Sub-phases
- [ ] 13.1 Config schema
- [ ] 13.2 Table component
- [ ] 13.3 Form component
- [ ] 13.4 Filter component
- [ ] 13.5 Toolbar and dialog components
- [ ] 13.6 Admin user management screens
- [ ] 13.7 Refactor documents list onto the library
- [ ] 13.8 SCSS cleanup

## Scope and files (preview)
libs/web/ui/*, libs/web/styles, users feature

## Tests and verification
Component tests with different configs, no duplicated logic between screens.

## Completion criteria
- [ ] A new CRUD screen can be built mostly from config
- [ ] Users and documents lists share the same library components
- [ ] Shared SCSS finalised
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: generic components, inputs and outputs, content projection, reactive forms, config schemas, avoiding duplication, SCSS design tokens.

## Questions
1. [design] What belongs in the config and what must stay in code?
2. [concept] How does a generic table component render different columns from JSON?
3. [scenario] A new screen needs a column with a custom button. How do you support that without breaking other screens?
4. [design] When does a reusable component become too abstract to maintain?
5. [debugging] Changing a shared style breaks another screen. How do you find and prevent that?
Answers: (fill in as you learn)
