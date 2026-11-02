# PHASE_09 - Auth frontend

Status: Proposed | Depends on: 08
Objective: Login, logout and protected routes driven by NgRx.

## Sub-phases
- [ ] 09.1 Auth state (actions, reducer, selectors)
- [ ] 09.2 AuthService
- [ ] 09.3 Token handling decision
- [ ] 09.4 Login page
- [ ] 09.5 Interceptor and 401 handling
- [ ] 09.6 Auth and role guards
- [ ] 09.7 Logout and header user menu
- [ ] 09.8 Tests

## Scope and files (preview)
libs/web/core (service, interceptor, guards), libs/web/store (auth slice), login page

## Open decisions
O3 token storage and refresh strategy.

## Tests and verification
Reducer, selector and effect tests, guard tests, manual login check against the real API.

## Completion criteria
- [ ] Login, logout and protected routes work per role
- [ ] Token handling decision recorded in TECHNICAL_DECISIONS.md
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: RxJS operators, NgRx effects, HttpClient, interceptors, route guards, token storage risks.

## Questions
1. [concept] What does exhaustMap do on login, and what would switchMap do instead?
2. [concept] How does an HTTP interceptor attach a token to every request?
3. [scenario] The token expires while the user is on a page. Trace what should happen.
4. [design] Where should the token be stored in the browser, and what attack does each option face?
5. [debugging] After logout the user can press Back and see a protected page. What do you check?
Answers: (fill in as you learn)
