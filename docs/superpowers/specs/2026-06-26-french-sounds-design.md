# git-poule French Sounds Design

## Goal

Make the public repository and GitHub Pages landing fully French, and ship the current local WAV sounds as first-priority audio feedback for `git poule`.

## User-Facing Behavior

`git poule` still wraps `git pull "$@"` and preserves Git's exit status.

On successful pull:

- Preserve `git pull` output.
- First try to play the packaged success sound `coq.wav`.
- If the packaged sound cannot be played, keep the existing fallback behavior: try `say "cot cot cot"`, then terminal bell.
- Print the happy chicken ASCII art.
- Exit with status `0`.

On failed pull:

- Preserve `git pull` output.
- First try to play the packaged failure sound `poule.wav`.
- If the packaged failure sound cannot be played, keep the same best-effort fallback sound behavior.
- Print the KO chicken ASCII art.
- Exit with the exact non-zero status from `git pull`.

## Sound Packaging

The local files currently present at the repository root are the source sounds:

- `coq.wav`: success sound.
- `poule.wav`: failure sound.

They should be copied into versioned public assets:

- `assets/sounds/coq.wav`
- `assets/sounds/poule.wav`

Root-level WAV files remain ignored as local scratch files. Only `assets/sounds/*.wav` should be tracked.

## Sound Lookup

`git-poule` should use this lookup order:

1. `GIT_POULE_SOUND_DIR`, when set.
2. A path relative to the installed script for packaged installs.
3. A path relative to the repository checkout for local development.

The script should support macOS first with `afplay`, then common Linux players such as `paplay` and `aplay`. If no WAV player works, it should fall back to `say "cot cot cot"` when available, then terminal bell.

## Installer

`install.sh` should install:

- The executable script as `git-poule`.
- The sound files into a sibling share directory, such as `$PREFIX/share/git-poule`.

When `INSTALL_DIR` is provided for tests or explicit installs, the script should derive a matching share directory from that install location unless `SHARE_DIR` is explicitly provided.

The installer output should be in French.

## French Public Surface

The public-facing repository should be French-first:

- `README.md` in French.
- `index.html` in French.
- User-facing installer messages in French.
- The GitHub Pages landing should keep the current "Startup Poulailler" direction and footer credit to Alexandre Enouf with `https://alexandre-enouf.fr`.

Technical file names, shell commands, and test script names can remain conventional English.

## Testing

Command tests:

- Success forwards arguments and plays the success WAV before fallback.
- Failure preserves the non-zero exit status and plays the failure WAV before fallback.
- Fallback still calls `say "cot cot cot"` if the WAV cannot be played.
- ASCII art behavior remains unchanged.

Installer tests:

- Installing into a temporary `INSTALL_DIR` also installs both sound files.
- Installed script remains executable.

Static site tests:

- Landing remains linked to `styles.css` and the mascot asset.
- Landing includes French public copy, `git poule`, KO state, Alexandre Enouf, and the website URL.

## Out of Scope

- Publishing GitHub Pages from this session.
- Installing globally without explicit approval.
- Replacing the existing WAV files with new generated audio.
