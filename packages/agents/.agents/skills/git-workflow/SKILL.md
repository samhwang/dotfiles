---
name: git-workflow
description: >
  Git workflow discipline. Use when making any code change, committing, branching,
  resolving conflicts, opening or reviewing a pull request, pushing to a remote, or
  organizing work. Covers trunk-based development, atomic commits, save points,
  worktrees, pre-commit hygiene and git debugging. Includes Conventional Commits
  message formatting.
---

# Git Workflow

Git is a safety net. Treat commits as save points, branches as sandboxes, history as documentation.

## When to Use

Always. Every code change flows through git.

## Core Principles

### Trunk-Based Development (recommended)

- Always keep the main branch (should either be `main` or `master`) deployable.
- Short-lived feature branches merging within 1-3 days.
- Feature flags over long branches.
- Commit discipline matters more than the branching model.

### Commit Early, Commit Often

Each successful increment gets its own commit: implement a slice, test, verify, commit, then move to the next slice. Commits are save points.

### Atomic Commits

Each commit does one logical thing.

### Keep Concerns Separate

Do not combine formatting with behavior, or refactors with features. Separate refactoring from feature work.

### Size Your Changes

- Target ~100 lines per commit or PR.
- ~300 acceptable for one logical change.
- ~1000: split it, or unless there is a good reason for a PR such big.

## Branch Naming

- `feature/<desc>` for features.
- `fix/<desc>` for bug fixes.
- `chore/<desc>` for tooling.
- `refactor/<desc>` for refactors.

Branch from `main`, keep short-lived, delete after merge.

## Working with Worktrees

For parallel AI agent work, use `git worktree add <path> <branch>` so agents work in parallel without branch switching. Remove the worktree when done.

## The Save Point Pattern

1. Make a change.
2. Test passes: commit.
3. Test fails: revert to last commit, investigate.

Never lose more than one increment.

## Change Summaries

After modifications, give a structured summary:

- **CHANGES MADE**: what was done.
- **THINGS I DIDN'T TOUCH**: what was intentionally left alone.
- **POTENTIAL CONCERNS**: what might need follow-up.

## Pre-Commit Hygiene

1. `git diff --staged` to review what you are about to commit.
2. Scan for secrets: `git diff --staged | grep -i "password\|secret\|api_key\|token"`.
3. Run tests, lint, typecheck before committing.

## Handling Generated Files

- Commit generated files only if the project expects them (e.g. `package-lock.json`).
- Do not commit build output (`dist/`, `.next/`), `.env`, or IDE config.
- Have a `.gitignore` covering `node_modules/`, `dist/`, `.env`, `*.pem`.

## Using Git for Debugging

- `git bisect` to find which commit introduced a bug.
- `git log --oneline -20` to see recent history.
- `git blame` for who last changed a line.
- `git log --grep` for searching commit messages.

## Commit Message Formatting

Write each commit message using the Conventional Commits format, terse and intent-only:

```
<type>(<scope>): <imperative summary>
```

- Types: `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `chore`, `build`, `ci`, `style`, `revert`. Scope optional.
- Imperative mood: "add", "fix", "remove", not "added", "adds".
- Subject ≤50 chars when possible, hard cap 72. No trailing period.
- Body only when needed: non-obvious *why*, breaking changes, migration notes, linked issues. Wrap at 72. Bullets with `-`, not `*`. Reference issues at the end (`Closes #42`).
- No em dashes, no AI attribution, no "This commit does X" or "I"/"we".

If the `caveman-commit` skill is present and active, its phrasing rules take precedence for the message string. This skill always governs when and what to commit.

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "I'll commit when the feature is done." | One giant commit is impossible to review or revert. Commit each slice. |
| "The message doesn't matter." | Messages are documentation. They outlive the PR. |
| "I'll squash it all later." | Squashing destroys narrative. Prefer clean incremental commits. |
| "I don't need .gitignore." | Until `.env` gets committed. |

## Red Flags

- Large uncommitted changes accumulating.
- Commit messages like "fix", "update", "misc".
- Formatting mixed with behavior in the same commit.
- No `.gitignore`.
- Committing `node_modules/`, `.env`, or build artifacts.
- Long-lived branches.
- Force-pushing to shared branches.

## Verification Checklist

- [ ] Commit does one logical thing.
- [ ] Tests pass before committing.
- [ ] No secrets in the diff.
- [ ] No formatting-only changes mixed with behavior.
- [ ] `.gitignore` covers standard exclusions.
