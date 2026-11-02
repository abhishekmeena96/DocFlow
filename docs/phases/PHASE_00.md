# PHASE_00 - Environment and project records

Status: Complete | Depends on: none
Objective: Know exactly what is installed, and create the project records that every later phase depends on.

## Sub-phases
- [x] 00.1 Check OS and tool versions
- [x] 00.2 Check for an existing DocFlow folder
- [x] 00.3 Create the docs/ structure
- [x] 00.4 Initial records (MASTER_CONTEXT, AI_WORKFLOW, CURRENT_STATE)
- [x] 00.5 PROJECT_ROADMAP.md
- [x] 00.6 ARCHITECTURE.md and TECHNICAL_DECISIONS.md
- [x] 00.7 phases/PHASE_00.md to PHASE_16.md
- [x] 00.8 features/ starter files
- [x] 00.9 Questions blocks and CURRENT_STATE refresh

## Scope and files
docs/*.md, docs/phases/*.md, docs/features/*.md under ~/projects/DocFlow

## Tests and verification
ls, wc -l, head, grep on each record. Owner output seen for each step.

## Completion criteria
- [x] Every record in the Master Document structure exists
- [x] Every record has a Questions block
- [x] CURRENT_STATE.md matches the real state
- [x] Owner manual check done (Phase gate in PROJECT_ROADMAP.md)

## Detailed tasks
Done step by step in the conversation. See CURRENT_STATE.md.

## Evidence log
- 00.1 Ubuntu 22.04.1, Node v24.21.0, npm 11.19.0, Git 2.34.1, Docker 29.9.2, Compose v5.6.1, VS Code 1.144.0
- 00.2 No existing DocFlow folder
- 00.5 PROJECT_ROADMAP.md 220 lines, 18 "## Phase" headings

## Learning (Obsidian)
Concepts: Markdown as project memory, status labels, authoritative records, inspect-before-act.

## Questions
1. [concept] Which record is the key resume point, and what must it contain?
2. [scenario] CURRENT_STATE.md and the real repository disagree. What do you do?
3. [design] Why keep project memory, learning notes and source code in three separate systems?
Answers: (fill in as you learn)
