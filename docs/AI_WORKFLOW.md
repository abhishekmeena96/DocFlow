# DocFlow - AI Workflow

The AIs do not share conversations or memory. The owner transfers context between them.

## Roles
- ChatGPT: Project Manager. Planning, tracking, maintains the Markdown records and the Master Document only when asked.
- Claude: Main Project Builder. Proposal, roadmap, implementation code, tests, Git/GitHub, technical docs.
- DeepSeek: Technical Mentor. Checks code understanding, extracts concepts, practice, debugging, system design, ACA perspective, interview prep.
- Grok: Concept Teacher and Adversarial Reviewer. Teaches concepts, practice tasks, reviews code after scheduled phases.
- Owner: Approves decisions, applies code, runs commands and tests, keeps Obsidian notes.

## Rules
- Each AI stays inside its role and reports issues outside it instead of taking over.
- No AI assumes code was applied, a command was run, or a test passed without the owner's output.
- Changes to scope, architecture or this workflow need the owner's approval.

## Handoff summary (end of each meaningful task)
AI role and task, input context, work performed, files and code (applied or not), verification, findings and decisions, learning status, next handoff.

## Scheduled checkpoints
- Grok review: after Phases 07, 12 and 16.
- After every phase: handoff, DeepSeek assessment, Obsidian update, CURRENT_STATE.md update.

## Questions
Types: concept, scenario, design, debugging. Owner writes the answers. DeepSeek and Grok extend this list.

1. [concept] What does each AI own, and why keep the roles separate?
2. [scenario] Grok finds a bug in production code. Who changes the code, and how does the fix request travel?
3. [design] What goes into a handoff summary, and what goes wrong without one?
4. [scenario] Two AIs give conflicting advice. What does the workflow say you do?
Answers: (fill in as you learn)
