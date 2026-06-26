# git-poule French Sounds Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the repository and GitHub Pages French-first, package the WAV sounds, play `coq.wav` on successful pulls, and play `poule.wav` on failed pulls.

**Architecture:** Keep `git-poule` as a POSIX shell script with a small sound lookup/playback layer. Track sounds under `assets/sounds/`, install them into a share directory next to the installed binary prefix, and keep tests shell-based with fake audio players.

**Tech Stack:** POSIX shell, Bash shell tests, static HTML/CSS, GitHub Pages via GitHub API.

---

## File Structure

- Modify `git-poule`: add sound lookup and play success/failure WAVs before fallback.
- Modify `install.sh`: install packaged sounds into a share directory and print French output.
- Modify `test/git-poule-test.sh`: assert `afplay` receives `coq.wav` on success and `poule.wav` on failure; assert fallback `say` still works when no WAV exists.
- Modify `test/install-test.sh`: assert installed sounds exist and match source files.
- Modify `.gitignore`: keep root WAV scratch files ignored while allowing `assets/sounds/*.wav`.
- Create `assets/sounds/coq.wav` and `assets/sounds/poule.wav` from current local root WAV files.
- Modify `README.md`: full French README.
- Modify `index.html`: full French GitHub Pages copy.
- Modify `test/site-test.sh`: assert French page copy remains present.

### Task 1: Add Red Tests for Packaged Sounds

- [ ] Modify `test/git-poule-test.sh` to create fake `afplay` and assert:
  - success calls `afplay` with `coq.wav`;
  - failure calls `afplay` with `poule.wav`;
  - fallback still calls `say "cot cot cot"` when `GIT_POULE_SOUND_DIR` points to a missing directory and no `afplay` exists.
- [ ] Run `bash test/git-poule-test.sh`.
- [ ] Expected result: FAIL because current `git-poule` never calls `afplay` or packaged WAV files.

### Task 2: Implement Sound Packaging and Playback

- [ ] Copy root `coq.wav` to `assets/sounds/coq.wav`.
- [ ] Copy root `poule.wav` to `assets/sounds/poule.wav`.
- [ ] Update `.gitignore` from `*.wav` to:

```gitignore
*.wav
!assets/sounds/*.wav
```

- [ ] Update `git-poule` with:
  - `play_sound_file`;
  - `fallback_sound`;
  - `find_sound_file`;
  - `play_named_sound coq.wav` on success;
  - `play_named_sound poule.wav` on failure.
- [ ] Run `bash test/git-poule-test.sh`.
- [ ] Expected result: `git-poule tests passed`.
- [ ] Commit with `feat: play packaged git-poule sounds`.

### Task 3: Install Sounds

- [ ] Update `test/install-test.sh` to assert:
  - installed `git-poule` remains executable;
  - installed `coq.wav` and `poule.wav` exist under the test share directory;
  - installer output is French and mentions `git poule`.
- [ ] Run `bash test/install-test.sh`.
- [ ] Expected result: FAIL before installer changes.
- [ ] Update `install.sh`:
  - derive `share_dir` from `SHARE_DIR` or `INSTALL_DIR/../share/git-poule`;
  - copy both sounds there;
  - print French messages.
- [ ] Run `bash test/install-test.sh`.
- [ ] Expected result: `install tests passed`.
- [ ] Commit with `feat: install git-poule sounds`.

### Task 4: French Public Surface

- [ ] Rewrite `README.md` in French.
- [ ] Rewrite user-facing `index.html` copy in French while preserving:
  - `Unicorn? Non. Poule.`;
  - `git poule`;
  - `KO`;
  - `Alexandre Enouf`;
  - `https://alexandre-enouf.fr`;
  - `assets/git-poule-mascot.png`.
- [ ] Update `test/site-test.sh` to assert French copy such as `Installer la bete`, `poule`, and `Alexandre Enouf`.
- [ ] Run `bash test/site-test.sh`.
- [ ] Expected result: `site tests passed`.
- [ ] Commit with `docs: make public surface french`.

### Task 5: Final Local Verification

- [ ] Run:

```bash
bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
```

- [ ] Expected output:

```text
git-poule tests passed
install tests passed
site tests passed
```

- [ ] Run `git status --short`.
- [ ] Expected result: clean worktree.

### Task 6: Push and Configure GitHub Pages

- [ ] Run `gh auth status` and `gh repo view --json nameWithOwner,defaultBranchRef`.
- [ ] Push `main` to `origin`.
- [ ] Configure GitHub Pages with source branch `main` and path `/` using `gh api`.
- [ ] Verify Pages configuration with `gh api repos/Boblebol/git-poule/pages`.
