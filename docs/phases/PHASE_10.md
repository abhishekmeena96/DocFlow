# PHASE_10 - Extension system (minimal)

Status: Proposed | Depends on: 09
Objective: Drive navigation and actions from docflow.extensions.json with a rule registry and an action registry. This is a general ACA-style pattern, not copied ACA code.

## Sub-phases
- [ ] 10.1 docflow.extensions.json schema
- [ ] 10.2 Extension loader
- [ ] 10.3 Rule evaluator registry
- [ ] 10.4 Action registry
- [ ] 10.5 Navigation from JSON
- [ ] 10.6 Role-aware sidebar wiring
- [ ] 10.7 Tests

## Scope and files (preview)
libs/web/extensions/*, docflow.extensions.json, sidebar wiring

## Tests and verification
Rule evaluator unit tests, navigation shows the right items per role.

## Completion criteria
- [ ] Changing the JSON changes navigation without touching component code
- [ ] Rules and actions are registered by id
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: configuration-driven UI, registries, dependency injection tokens, selectors for rule inputs, ACA extension pattern.

## Questions
1. [design] What does the extension JSON buy you compared with writing buttons directly in templates?
2. [concept] What is a rule evaluator and what inputs does it need?
3. [scenario] You must add a Download button for Approved documents only. List every change required.
4. [design] When is this pattern over-engineering?
5. [debugging] A menu item shows for the wrong role. Where do you look first?
Answers: (fill in as you learn)
