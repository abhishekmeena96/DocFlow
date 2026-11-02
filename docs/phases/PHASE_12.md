# PHASE_12 - Document details and review

Status: Proposed | Depends on: 11
Objective: The document details page with PDF viewer, version and history tabs, and the review actions driven by the extension JSON.

## Sub-phases
- [ ] 12.1 Details route and store
- [ ] 12.2 PDF viewer
- [ ] 12.3 Details tab
- [ ] 12.4 Versions tab
- [ ] 12.5 History tab
- [ ] 12.6 Toolbar actions from JSON with rules
- [ ] 12.7 Reject dialog
- [ ] 12.8 New version upload
- [ ] 12.9 Tests and Grok review #2

## Scope and files (preview)
document details feature (route, store, tabs), toolbar wired to the action and rule registries, reject dialog

## Open decisions
O5 PDF viewer approach.

## Tests and verification
Rules show the right buttons per role and status, effect tests (exhaustMap for submit), manual run of the full workflow from the UI.

## Completion criteria
- [ ] Full workflow works from the UI: upload, approve, reject, re-upload
- [ ] Buttons appear only when rules allow
- [ ] Grok review #2 findings recorded and triaged by the owner
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: route params, NgRx selectors with router state, rendering PDFs in the browser, Blob URLs, dialogs and forms, exhaustMap on submit.

## Questions
1. [concept] Why does the Approve button use a rule instead of an if inside the template?
2. [scenario] A user opens a document that was just rejected by someone else. How does the UI stay correct?
3. [design] How does the details page get its data: route param, effect, store, selector? Trace it.
4. [debugging] The PDF viewer shows a blank page. List what you check on the frontend and the backend.
5. [scenario] The Reject dialog is submitted twice quickly. What prevents two rejections?
Answers: (fill in as you learn)
