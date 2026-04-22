# kotlin-skills

AI agent skills for Kotlin by [@huanshankeji](https://github.com/huanshankeji), following the [Agent Skills](https://agentskills.io) standard.

Also see https://github.com/Kotlin/kotlin-agent-skills for the skills maintained by Kotlin officially.

## Skills

| Skill | Description |
|---|---|
| [gradle-wrapper-update](skills/gradle-wrapper-update/) | Updates the Gradle wrapper to a specific version by running the wrapper task twice, keeping the wrapper script, properties, and jar consistent |
| [kotlin-debugging-unresolved-reference-file-clash](skills/kotlin-debugging-unresolved-reference-file-clash/) | Diagnoses and fixes Kotlin JVM "Unresolved reference" compilation errors caused by file facade class name clashes |

## Installation

### Using the skills CLI

```bash
npx skills add huanshankeji/kotlin-skills
```

### Manual installation

Copy the desired skill folder from [`skills/`](./skills) into the skills directory of your project:

```bash
# For GitHub Copilot
cp -r skills/kotlin-debugging-unresolved-reference-file-clash .github/skills/

# For Claude Code
cp -r skills/kotlin-debugging-unresolved-reference-file-clash .claude/skills/

# Universal (works with multiple agents)
cp -r skills/kotlin-debugging-unresolved-reference-file-clash .agents/skills/
```

### Repository layout

- [`skills/`](./skills) — directory containing all skills
