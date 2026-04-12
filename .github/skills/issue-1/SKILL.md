---
name: issue-1
description: "Skill to implement and verify Issue #1. Paste the issue body or link, then run this skill to create a repeatable workflow and acceptance checks."
---

# Issue #1 — <Title placeholder>

## Summary
- Purpose: Implement and verify the fix or feature described in Issue #1 and produce a reproducible, reviewable Pull Request.

## When to use
- When you are assigned or working on Issue #1 and want a documented, repeatable workflow from reproduction to merge.

## Inputs
- The full issue body or a link to the issue
- Preferred branch name (default: `issue-1/<short-title>`)
- Repo conventions (build/test commands, CI job names)

## Outputs
- A feature/fix branch
- A Pull Request that links to the issue
- Tests and/or docs updated
- CI passing and issue closed

## Steps
1. Reproduce
   - Attempt to reproduce the bug or confirm the feature request locally.
   - Collect logs, stack traces, and minimal repro steps.

2. Design
   - Sketch the proposed change and list files/modules affected.
   - Note API or behavior changes that require communication.

3. Implement
   - Create a branch: `git switch -c issue-1/<short-title>`
   - Make changes and add tests that capture the regression/feature.

4. Test
   - Run unit and integration tests locally. Example: `./gradlew test` or `./gradlew check` (confirm for this repo).
   - If tests are flaky, add stabilization or flakiness notes.

5. Open PR
   - Create a PR with summary, reproduction steps, and how the change fixes the issue.
   - Link the PR to Issue #1 and add appropriate labels.

6. Review & Iterate
   - Address reviewers' comments, keep commits small and descriptive.

7. Merge & Close
   - Merge when CI passes and reviews are satisfied; close the original issue and update changelog if needed.

## Decision Points
- If the issue cannot be reproduced:
  - Ask the reporter for environment details, logs, and exact steps.
- If the fix affects public APIs:
  - Mark as a breaking change, draft a migration note, and notify stakeholders.
- If tests reveal a larger design problem:
  - Open a design RFC or split the work into smaller issues.

## Acceptance Criteria
- Reproduction steps are documented in the PR or issue.
- New/updated tests demonstrate the fix and pass locally and in CI.
- CI jobs relevant to the change are green on the PR.
- PR description links to the original issue and lists verification steps.

## Example Prompts
- "Create SKILL.md for Issue #1: <paste issue body> — name: issue-1 — style: detailed — save: .github/skills/issue-1/SKILL.md"
- "Update `.github/skills/issue-1/SKILL.md` to include the failing test names and required CI job names."

## Clarifying Questions (please answer to finalize)
1. Paste the full issue body or a link to Issue #1.
2. Confirm the preferred skill name (default: `issue-1`).
3. Confirm primary test command(s) for this repo (e.g., `./gradlew test`).
4. Any repo-specific merge or review rules to include (e.g., required reviewers, labels)?

## Notes / Next Steps
- After you provide the issue body and answers above, I will update this SKILL.md to include concrete reproduction steps, exact test names, and CI job names.
