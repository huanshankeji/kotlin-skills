---
name: gradle-wrapper-update
description: >
  Updates the Gradle wrapper by running the wrapper task twice, keeping the
  wrapper scripts, properties file, and jar consistent. Supports updating to
  the latest version or a specific version. Use whenever a Gradle project needs
  its wrapper upgraded or downgraded.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.0.0"
---

# Updating the Gradle Wrapper

## Background

The Gradle wrapper consists of four files that must all stay consistent:

- `gradle/wrapper/gradle-wrapper.properties` — declares the Gradle
  distribution URL and version.
- `gradle/wrapper/gradle-wrapper.jar` — the bootstrap jar that downloads the
  declared distribution.
- `gradlew` — the POSIX shell script that invokes the bootstrap jar.
- `gradlew.bat` — the Windows batch script that invokes the bootstrap jar.

Both `gradlew` and `gradlew.bat` must exist so the project works on all
platforms. Do **not** manually edit any of these files. Always use the
`wrapper` task to perform a full, consistent update.

## When to use

Apply this skill whenever you need to:

- Upgrade the Gradle wrapper to a newer Gradle version.
- Downgrade the Gradle wrapper to an older Gradle version.

## Update procedure

### Step 1: Run the wrapper task twice

Running the `wrapper` task once updates `gradle-wrapper.properties` and
regenerates the `gradlew` and `gradlew.bat` scripts. Running it a **second
time** lets the newly declared version of Gradle download itself and
regenerate the `gradle-wrapper.jar` with the correct version, ensuring all
four wrapper components are consistent.

**Option A — update to the latest Gradle version (recommended starting point):**

```bash
./gradlew wrapper --gradle-version=latest && ./gradlew wrapper
```

Try this first. If you need a specific version instead, use Option B.

**Option B — update to a specific Gradle version:**

```bash
./gradlew wrapper --gradle-version=<TARGET_VERSION> && ./gradlew wrapper
```

Replace `<TARGET_VERSION>` with the desired Gradle version, for example:

```bash
./gradlew wrapper --gradle-version=9.4.1 && ./gradlew wrapper
```

To find the version string for a specific release, consult its release notes
page. The latest release notes are always at
https://docs.gradle.org/current/release-notes.html, and a specific release
such as 9.4.1 is at https://docs.gradle.org/9.4.1/release-notes.html.

### Step 2: Verify the update

Run `./gradlew -v` to confirm the wrapper script works and to see the active
Gradle version:

```bash
./gradlew -v
```

Then check that `gradle/wrapper/gradle-wrapper.properties` references the
expected distribution URL:

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

- **Never** manually edit `gradle-wrapper.properties` or any other wrapper
  file. Always run `./gradlew wrapper` so all four files are updated together.
- Run the `wrapper` task **twice** as shown above. The first run updates the
  properties and scripts; the second run lets the new Gradle version update the
  jar.
- After updating, run `./gradlew -v` to verify the wrapper works, then run the
  project's build or test task (e.g., `./gradlew build`) to confirm the project
  works correctly with the new Gradle version.
- If the project uses a non-default distribution type (`-all` instead of
  `-bin`), preserve that by passing `--distribution-type=all`:

  ```bash
  ./gradlew wrapper --gradle-version=latest --distribution-type=all && ./gradlew wrapper
  ```

## References

- [Gradle documentation: Upgrading the Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:upgrading_wrapper)
- [Gradle release notes index](https://docs.gradle.org/current/release-notes.html)
