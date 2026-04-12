---
name: create-skill-from-conversation
description: "Convert a conversation or notes into a reusable SKILL.md that documents a repeatable workflow, decision points, and acceptance criteria. Saves the SKILL.md to the repo and returns clarifying questions and example prompts."
---

# Create SKILL.md from Conversation

Summary
- Purpose: Extract a repeatable workflow (steps, branching logic, and quality checks) from a conversation or set of notes and produce a complete `SKILL.md` file saved in the repository.

When to use
- After a team member completes a task by following an informal conversation, PR thread, or runbook that should be codified.
- When you want a repeatable checklist or multi-step workflow surfaced as a reusable skill.

Inputs
- Conversation text or link (paste the key messages or link a thread)
- Skill name (e.g., `release-checklist`)
- Target path to save SKILL.md (default: `.github/skills/<name>/SKILL.md`)
- Style: `quick-checklist` or `detailed-workflow`
- Optional: repository conventions (e.g., Kotlin style, CI names, file locations)

Outputs
- The SKILL.md file at the chosen path
- A short list of clarifying questions for any detected gaps
- Example prompts and usage notes to test the newly created skill

Procedure (step-by-step)
1. Review the conversation and extract a linear sequence of steps. Make each step atomic and testable.
2. Identify decision points and encode branching logic as conditional statements.
3. For each major outcome, define acceptance criteria or verification steps (commands, expected files, test names).
4. Draft the SKILL.md with metadata, the ordered steps, decision mappings, and examples.
5. Save the file at the requested path and present any ambiguous items as clarifying questions.
6. Iterate: incorporate answers, refine steps, add examples, and finalize.

Decision points and branching
- Represent branches explicitly, e.g.:

  If <condition> -> do <step A>
  Else -> do <step B>

- Prefer describing the common path first, then list alternatives.

Quality criteria (acceptance checks)
- Steps are actionable and short (1–2 concise sentences each).
- At least one verification step exists for the primary outcome (unit test, CI job, file existence, version bump, etc.).
- No more than 3 unresolved clarifying questions remain before finalizing.

SKILL.md Template (skeleton to save)

---
name: <skill-name>
description: "Short summary describing when to use this skill."
---

# <Skill Title>

## Summary
- One-line: what this skill does and when to use it.

## Inputs
- List required inputs (conversation, flags, environment requirements).

## Outputs
- Files produced, side effects, or verification results.

## Steps
1. Step one — concise and actionable.
2. Step two — concise and actionable.

## Decision Points
- If X then -> follow A
- If Y then -> follow B

## Acceptance Criteria
- How to verify success (commands, checks, tests).

## Example Prompts
- Example: "Create this SKILL.md from the following conversation: <paste> — name: <name> — style: detailed — save: <path>"

## Notes / Follow-ups
- Any recommended next customizations or automation (CI job, tests, hooks).

Ambiguities likely to appear (what I'll ask you)
- Should this skill be workspace-scoped (recommended) or a user-level prompt?
- Quick checklist or full multi-step workflow?
- Exact path and skill name to save under? (default `.github/skills/<name>/SKILL.md`)
- Any repo conventions to embed (Kotlin style guide, specific CI job names, required files)?

Example prompts to try
- "Create SKILL.md from this conversation: <paste>. Name: `release-checklist`. Style: `quick-checklist`. Save to `.github/skills/release/SKILL.md`."
- "Update existing SKILL.md at `.github/skills/foo/SKILL.md` to add acceptance tests and example prompts."

Next customizations
- Add a CI job that runs the acceptance checks listed in the skill.
- Add an `applyTo` or trigger phrases in the description to help the agent discover this skill.

Contact / Clarify
- After saving, I will surface the clarifying questions detected. Reply with answers and I will finalize the SKILL.md.
