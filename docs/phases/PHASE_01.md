# PHASE_01 - Project structure, Git and GitHub

Status:  Complete | Depends on: 00

Objective: Create the Angular and NestJS application structure, manage the projects in one Git repository, and push safely to GitHub.

## Sub-phases
- [x] 01.1 Check Git and repo state
- [x] 01.2 Create the application folder structure
- [x] 01.3 Add .gitignore and .env.example
- [x] 01.4 First commit
- [x] 01.5 Connect GitHub and push
- [x] 01.6 Secrets check

## Scope and files (preview)
apps/frontend/, apps/backend/, libs/, package.json (if needed), .gitignore, .env.example, README.md

## Known risks to check first

- Verify Node.js v24 compatibility with the selected Angular and NestJS versions.
- Git identity and SSH key setup (open decision O7).
- Existing docs/ and .git/ directories must be preserved while creating the application structure.





## Tests and verification

- Application folder structure exists as planned.
- Angular frontend and NestJS backend initialize and build successfully.
- Repository is visible on GitHub.
- No secrets are staged or committed.




## Completion criteria

- [x] Angular frontend and NestJS backend folder structures are created.
- [ ] Both applications initialize and build successfully.
- [x] First commit pushed and verified on GitHub.
- [x] .env is ignored and .env.example is committed.
- [ ] Owner manual check done.

## Detailed tasks

### 01.1 Check Git and repo state
- [x] Verify Git installation and version (2.34.1).
- [x] Check global Git username and email.
- [x] Check whether DocFlow is already a Git repository.
- [x] Initialize the Git repository using `git init`.
- [x] Rename the default branch from `master` to `main`.
- [x] Check SSH directory and GitHub CLI availability.

## Evidence log

- Git version: 2.34.1
- Global Git identity: username and email configured.
- Initial repository check: DocFlow was not a Git repository.
- `git init`: Successfully initialized the repository.
- Branch: Renamed from `master` to `main`.
- SSH: `~/.ssh` exists but contains no SSH keys.
- GitHub CLI: Not installed (`gh: command not found`).
- Repository status: No commits yet; `docs/` is untracked.


## Learning (Obsidian)

Concepts: monorepo, frontend and backend applications, shared libraries, Git commit and remote, SSH keys, .gitignore.

## Questions
1. [concept] What is a monorepo and what problem does Nx solve in one?
1.1 1. [concept] What is a monorepo, and how can separate applications be managed in one repository without Nx?
2. [concept] Why is .env.example committed but .env ignored?
3. [debugging] git push is rejected with an authentication error. What do you check?
4. [scenario] You staged a file containing a password. What do you do before committing?
Answers: (fill in as you learn)
