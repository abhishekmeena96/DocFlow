# PHASE_11 - Documents list and upload (frontend)

Status: Proposed | Depends on: 10
Objective: A documents list driven by NgRx and JSON-defined columns, plus the upload dialog.

## Sub-phases
- [ ] 11.1 Documents entity store
- [ ] 11.2 Documents API service
- [ ] 11.3 List page with JSON-defined columns
- [ ] 11.4 Pagination, filter and sort
- [ ] 11.5 Status chip
- [ ] 11.6 Upload dialog
- [ ] 11.7 Loading, empty and error states
- [ ] 11.8 Tests

## Scope and files (preview)
documents feature (store, service, list page), status chip, upload dialog

## Tests and verification
Effect tests (switchMap for loading), selector tests, upload validation messages.

## Completion criteria
- [ ] An Uploader can upload and see the list, verified against the API
- [ ] Loading, empty and error states handled
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: NgRx entity adapter, memoized selectors, switchMap vs concatMap, debounce on search, file upload with progress.

## Questions
1. [concept] What does the entity adapter provide and why use it?
2. [concept] Why use switchMap for loading and searching, and what does it cancel?
3. [scenario] The user types quickly in the search box. How do you avoid a request per keystroke?
4. [debugging] The list does not refresh after an upload. Which part of the NgRx flow do you check?
5. [scenario] The upload fails halfway. What should the user see and what should the state hold?
Answers: (fill in as you learn)
