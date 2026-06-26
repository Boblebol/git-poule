# git-poule Public Refresh Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add KO terminal feedback, clean the repository for public release, and create a no-build GitHub Pages landing page with a funny tricolor chicken mascot and Alexandre Enouf footer credit.

**Architecture:** Keep the CLI as a POSIX shell script and extend the existing shell tests first. Add a static GitHub Pages site at the repository root using `index.html`, `styles.css`, and a local mascot asset under `assets/`. Keep public cleanup explicit through `.gitignore`, `LICENSE`, and a stronger README.

**Tech Stack:** POSIX shell, Bash shell tests, static HTML/CSS, local image asset.

---

## File Structure

- Modify `git-poule`: print a happy chicken on success and a KO chicken on `git pull` failure; never play sound on failure.
- Modify `test/git-poule-test.sh`: assert KO output on failure.
- Create `.gitignore`: ignore local brainstorming files and local audio scratch files.
- Create `LICENSE`: MIT license for public repository use.
- Modify `README.md`: public-facing project README.
- Create `test/site-test.sh`: static checks for the GitHub Pages landing.
- Create `index.html`: landing page content.
- Create `styles.css`: landing page styling.
- Create `assets/git-poule-mascot.png`: tricolor chicken mascot visual asset.

### Task 1: Add Failing KO CLI Test

**Files:**
- Modify: `test/git-poule-test.sh`
- Test target: `git-poule`

- [ ] **Step 1: Add failure assertions**

Add these assertions inside `test_failure_preserves_exit_and_skips_chicken`, after the existing `assert_not_contains "$tmp_dir/stdout-fail" "cot cot"` line:

```bash
  assert_contains "$tmp_dir/stdout-fail" "KO"
  assert_contains "$tmp_dir/stdout-fail" "pull rate"
```

- [ ] **Step 2: Run the test to verify it fails**

Run:

```bash
bash test/git-poule-test.sh
```

Expected: FAIL because current failure output does not include `KO` or `pull rate`.

### Task 2: Implement KO CLI Feedback

**Files:**
- Modify: `git-poule`
- Test: `test/git-poule-test.sh`

- [ ] **Step 1: Update `git-poule`**

Replace the script body with:

```sh
#!/bin/sh

print_happy_chicken() {
  cat <<'CHICKEN'
     \\
      \\  cot cot
       \\
        __
      <(o )___
       ( ._> /
        `---'
CHICKEN
}

print_ko_chicken() {
  cat <<'CHICKEN'
     pull rate
        __
      <(x )___
       ( ._> /
        `---'  KO
CHICKEN
}

git pull "$@"
status=$?

if [ "$status" -ne 0 ]; then
  print_ko_chicken
  exit "$status"
fi

if command -v say >/dev/null 2>&1; then
  say "cot cot cot" >/dev/null 2>&1 || true
else
  printf '\a' >&2 || true
fi

print_happy_chicken
```

- [ ] **Step 2: Run CLI tests**

Run:

```bash
bash test/git-poule-test.sh
```

Expected: `git-poule tests passed`

- [ ] **Step 3: Commit CLI KO behavior**

```bash
git add git-poule test/git-poule-test.sh
git commit -m "feat: add ko chicken on pull failure"
```

### Task 3: Clean Public Repository Surface

**Files:**
- Create: `.gitignore`
- Create: `LICENSE`
- Modify: `README.md`

- [ ] **Step 1: Create `.gitignore`**

```gitignore
.DS_Store
.superpowers/
AGENTS.md
poule.wav
```

- [ ] **Step 2: Create `LICENSE`**

Use the MIT license with copyright holder:

```text
Copyright (c) 2026 Alexandre Enouf
```

- [ ] **Step 3: Rewrite README**

README must include:

````markdown
# git-poule

`git poule` is `git pull` with poultry-grade feedback.

```sh
git poule --rebase
```

On success: chicken sound + happy chicken.
On failure: no sound, same exit code, KO chicken.

## Install

```sh
./install.sh
```

## Test

```sh
bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
```
````

- [ ] **Step 4: Commit cleanup**

```bash
git add .gitignore LICENSE README.md
git commit -m "docs: prepare repository for public release"
```

### Task 4: Add Failing Static Site Test

**Files:**
- Create: `test/site-test.sh`
- Test target: `index.html`, `styles.css`, `assets/git-poule-mascot.png`

- [ ] **Step 1: Create `test/site-test.sh`**

```bash
#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

assert_file() {
  local file="$1"
  if [ ! -f "$repo_root/$file" ]; then
    echo "Expected $file to exist" >&2
    exit 1
  fi
}

assert_contains() {
  local file="$1"
  local text="$2"
  if ! grep -Fq "$text" "$repo_root/$file"; then
    echo "Expected $file to contain: $text" >&2
    exit 1
  fi
}

assert_file "index.html"
assert_file "styles.css"
assert_file "assets/git-poule-mascot.png"

assert_contains "index.html" "styles.css"
assert_contains "index.html" "Unicorn? Non. Poule."
assert_contains "index.html" "git poule"
assert_contains "index.html" "KO"
assert_contains "index.html" "Alexandre Enouf"
assert_contains "index.html" "https://alexandre-enouf.fr"
assert_contains "index.html" "assets/git-poule-mascot.png"

echo "site tests passed"
```

- [ ] **Step 2: Run test to verify it fails**

Run:

```bash
bash test/site-test.sh
```

Expected: FAIL because `index.html`, `styles.css`, and the mascot asset do not exist yet.

### Task 5: Build Landing Page

**Files:**
- Create: `assets/git-poule-mascot.png`
- Create: `index.html`
- Create: `styles.css`
- Test: `test/site-test.sh`

- [ ] **Step 1: Create mascot asset**

Generate or add a local bitmap mascot at:

```text
assets/git-poule-mascot.png
```

The image should be a funny blue-white-red chicken with French Tech parody energy.

- [ ] **Step 2: Create `index.html`**

Include:

```html
<link rel="stylesheet" href="styles.css">
<img src="assets/git-poule-mascot.png" alt="Blue white red git-poule chicken mascot">
<h1>Unicorn? Non. Poule.</h1>
<code>git poule --rebase</code>
<span>KO</span>
<a href="https://alexandre-enouf.fr">Alexandre Enouf</a>
```

- [ ] **Step 3: Create `styles.css`**

Style the page as a responsive "Startup Poulailler" landing: bold typography, blue-white-red accents, terminal demo, install CTA, and compact mobile layout.

- [ ] **Step 4: Run site test**

Run:

```bash
bash test/site-test.sh
```

Expected: `site tests passed`

- [ ] **Step 5: Commit landing**

```bash
git add index.html styles.css assets/git-poule-mascot.png test/site-test.sh
git commit -m "feat: add github pages landing"
```

### Task 6: Final Verification

**Files:**
- Test: `test/git-poule-test.sh`, `test/install-test.sh`, `test/site-test.sh`

- [ ] **Step 1: Run all tests**

```bash
bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
```

Expected:

```text
git-poule tests passed
install tests passed
site tests passed
```

- [ ] **Step 2: Check public status**

```bash
git status --short
```

Expected: no tracked-file changes remain; ignored local artifacts may exist but should not pollute status.
