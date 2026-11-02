# PHASE_04 - Auth and users (backend)

Status: Proposed | Depends on: 03
Objective: Login with JWT, role guards, and Admin user management.

## Sub-phases
- [ ] 04.1 Password hashing
- [ ] 04.2 Admin user CRUD
- [ ] 04.3 Login endpoint
- [ ] 04.4 JWT access and refresh tokens
- [ ] 04.5 JwtAuthGuard
- [ ] 04.6 RolesGuard and @Roles() decorator
- [ ] 04.7 Login rate limiting
- [ ] 04.8 Tests

## Scope and files (preview)
apps/docflow-api/src/app/auth/*, apps/docflow-api/src/app/users/*

## Open decisions
O4 hashing library.

## Tests and verification
Valid and invalid login, expired or tampered token, wrong role gives 403, inactive user blocked.

## Completion criteria
- [ ] Role-protected endpoints work
- [ ] Passwords never stored or returned in plain text
- [ ] Tests pass with output seen
- [ ] Owner manual check done

## Detailed tasks
(Added when the phase starts.)

## Evidence log
(Fill in with command outputs.)

## Learning (Obsidian)
Concepts: password hashing, JWT structure, access vs refresh tokens, guards, custom decorators, rate limiting.

## Questions
1. [concept] What is in a JWT and why can the server trust it?
2. [concept] Authentication vs authorization: where is each enforced in this phase?
3. [scenario] A user is deactivated while holding a valid token. What happens, and how would you handle it?
4. [design] Why use short-lived access tokens plus refresh tokens?
5. [debugging] A valid Admin gets 403 on an Admin route. What do you check?
Answers: (fill in as you learn)
