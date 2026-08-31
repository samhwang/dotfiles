---
name: ticket-workflow
description: >
  Local-file ticket and project-context workflow. Use when working on a tracked
  task or ticket, when an issue needs implementation planning or notes, when a
  user-context document may exist for the project, or when drafting PR
  descriptions, PR replies, or ticket replies. Encodes the .agents/user-context.md
  and .agents/tickets/[ticket-number]/ artifact layout.
---

# Ticket Workflow

Work against local files, not just conversation memory. Tickets, plans, notes and context live on disk so they survive sessions, cross agents, and stay reviewable.

## When to Use

- Working on a ticket or tracked task.
- An issue needs an implementation plan or ongoing notes.
- Drafting a PR description, PR reply, or ticket reply.
- The project may have context worth loading.

## Process

### 1. Load project context

If `./.agents/user-context.md` exists, read it up front. It carries project-specific working agreements and conventions the agent should follow.

### 2. Use the tickets directory

Use `./.agents/tickets/[ticket-number]/` for the implementation plan and notes.

Write artifacts as markdown files, one per concern, at:

```
./.agents/tickets/[ticket-number]/<artifact-name>.md
```

Examples:
- `plan.md` - implementation plan
- `notes.md` - ongoing findings, decisions, open questions
- `review.md` - review notes

Keep artifacts atomic: one file per concern, small units, easy to diff.

### 3. Structure issues and tickets

Follow the `Context / Done When / Resources` structure. Clear intent, no over-prescriptive instructions. Atomic, decoupled stories.

### 4. Draft before sending

Draft PR descriptions, PR replies and ticket replies before sending. Never send without explicit permission. Commit atomic changes as you go; no single big commit.

### 5. Prefer "fix" version CLI tools

Prefer using a "fix" version of a CLI tool that exists in the project over manual editing. Priority: fix-version CLI > regular CLI > manual editing.

## Writing Style

Follow the enforced writing rules (Australian/British English, no em dashes, dash for lists, light markdown).

## Verification

- [ ] `./.agents/user-context.md` read when present
- [ ] Plan and notes live under `./.agents/tickets/[ticket-number]/` as `.md` artifacts
- [ ] Artifacts are atomic (one concern per file)
- [ ] No send (PR/ticket reply) without explicit permission
- [ ] Fix-version CLI preferred over manual editing when available
