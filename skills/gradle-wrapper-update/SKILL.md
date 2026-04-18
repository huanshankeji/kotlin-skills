---
name: gradle-wrapper-update
description: >
  Updates the Gradle wrapper to a specific version by running the wrapper task
  twice, which updates the wrapper script, properties file, and jar. Use
  whenever a Gradle project needs its wrapper upgraded or downgraded to a
  target Gradle version.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.0.0"
---

# Updating the Gradle Wrapper

## Background

The Gradle wrapper consists of three files that must all stay consistent:

- `gradle/wrapper/gradle-wrapper.properties` — declares the Gradle
  distribution URL and version.
- `gradle/wrapper/gradle-wrapper.jar` — the bootstrap jar that downloads the
  declared distribution.
- `gradlew` / `gradlew.bat` — the shell scripts that invoke the bootstrap jar.

Manually editing `gradle-wrapper.properties` only updates the declared version
string. It does **not** update the `gradle-wrapper.jar` or the `gradlew`
scripts, which may be required for newer Gradle versions to work correctly.
Always use the `wrapper` task to perform a full, consistent update.

## When to use

Apply this skill whenever you need to:

- Upgrade the Gradle wrapper to a newer Gradle version.
- Downgrade the Gradle wrapper to an older Gradle version.
- Ensure the wrapper jar and scripts are in sync with the declared version
  after any manual edits to `gradle-wrapper.properties`.

## How to find the target version

The recommended update command for a given Gradle release is listed on its
release notes page. For example:

- Gradle 9.4.1 → https://docs.gradle.org/9.4.1/release-notes.html
- Gradle 8.14 → https://docs.gradle.org/8.14/release-notes.html

Look for the "Upgrade instructions" or "Updating" section on the release notes
page to confirm the exact command recommended for that release.

## Update procedure

### Step 1: Run the wrapper task twice

Running the `wrapper` task once updates `gradle-wrapper.properties` and
regenerates the `gradlew` scripts. Running it a **second time** lets the newly
declared version of Gradle download itself and regenerate the
`gradle-wrapper.jar` with the correct version, ensuring all three wrapper
components are consistent.

```bash
./gradlew wrapper --gradle-version=<TARGET_VERSION> && ./gradlew wrapper
```

Replace `<TARGET_VERSION>` with the desired Gradle version, for example:

```bash
./gradlew wrapper --gradle-version=9.4.1 && ./gradlew wrapper
```

### Step 2: Verify the update

Check that `gradle/wrapper/gradle-wrapper.properties` now references the
correct distribution URL:

```bash
cat gradle/wrapper/gradle-wrapper.properties
```

The `distributionUrl` line should contain the target version, for example:

```
distributionUrl=https\://services.gradle.org/distributions/gradle-9.4.1-bin.zip
```

### Step 3: Commit the changed files

Commit all four modified files together so the repository always contains a
consistent wrapper:

```
gradle/wrapper/gradle-wrapper.jar
gradle/wrapper/gradle-wrapper.properties
gradlew
gradlew.bat
```

## Guardrails

- **Never** update the wrapper by only editing `gradle-wrapper.properties`
  manually. Always run `./gradlew wrapper` so the jar and scripts are also
  updated.
- Run the `wrapper` task **twice** as shown above. The first run updates the
  properties and scripts; the second run lets the new Gradle version update the
  jar.
- After updating, run the project's build or test task (e.g.,
  `./gradlew build`) to confirm the project works correctly with the new
  Gradle version.
- If the project uses a non-default distribution type (`-all` instead of
  `-bin`), preserve that by passing `--distribution-type=all`:

  ```bash
  ./gradlew wrapper --gradle-version=<TARGET_VERSION> --distribution-type=all && ./gradlew wrapper
  ```

## References

- [Gradle documentation: Upgrading the Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:upgrading_wrapper)
- [Gradle release notes index](https://docs.gradle.org/current/release-notes.html)
