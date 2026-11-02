# Feature: Authentication and roles

Status: PROPOSED | Built in: Phase 04 (backend), Phase 09 (frontend)

## Functionality
- Users log in with email and password and receive a JWT access token and a refresh token.
- Each user has exactly one role: Uploader, Reviewer or Admin (D5).
- Only an Admin creates, edits and deactivates users.
- The server checks the role on every protected request. The frontend only hides things.

## Acceptance criteria (proposed)
- [ ] Valid login returns tokens. Wrong password or unknown email returns the same generic error.
- [ ] A deactivated user cannot log in.
- [ ] A missing, expired or tampered token returns 401.
- [ ] A valid token with the wrong role returns 403.
- [ ] Passwords are stored hashed and never returned by any endpoint.
- [ ] Repeated failed logins are rate limited.
- [ ] Logout and 401 handling work in the Angular app, and protected routes redirect to login.

## Open decisions
O3 token storage and refresh strategy. O4 password hashing library.

## Evidence
(Fill in with test and command outputs.)

## Questions
1. [concept] What is the difference between authentication and authorization here?
2. [scenario] An Uploader calls an Admin-only endpoint with a valid token. What happens and which component decides?
3. [design] Why return the same error for a wrong password and an unknown email?
4. [debugging] A user logs in successfully but every request returns 401. What do you check?
5. [scenario] An Admin deactivates a user who still holds a valid access token. How long can they keep acting?
Answers: (fill in as you learn)
