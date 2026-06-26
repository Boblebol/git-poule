# git-poule Design

## Goal

Provide a globally installable Git subcommand named `git poule`, meaning available from any repository for the current user once installed in a directory on `PATH`.

When a user runs `git poule`, the tool runs `git pull` with any forwarded arguments. If the pull succeeds, it plays a chicken-like sound and prints a chicken ASCII art. If the pull fails, it exits with the same non-zero status and does not print the success chicken.

## User-Facing Behavior

- `git poule` behaves like `git pull`.
- Arguments are forwarded unchanged, so commands such as `git poule --rebase` map to `git pull --rebase`.
- On successful pull:
  - A chicken sound is attempted.
  - A chicken ASCII art is printed.
  - The command exits with status `0`.
- On failed pull:
  - No chicken success art is printed.
  - The original `git pull` failure status is returned.

## Architecture

Use Git's existing subcommand discovery mechanism. Git can execute a command named `git-foo` from the user's `PATH` when the user runs `git foo`.

The repository will contain:

- `git-poule`: executable shell script implementing the command.
- `install.sh`: installer that copies `git-poule` to a user-wide executable directory already intended for commands on `PATH`.
- `README.md`: usage, installation, and uninstall instructions.

## Components

### `git-poule`

Responsibilities:

- Run `git pull "$@"`.
- Store the exit status immediately after `git pull`.
- If the status is non-zero, return it without chicken output.
- If the status is zero, play a best-effort chicken sound and print ASCII art.

Sound strategy:

- On macOS, prefer `say "cot cot cot"` because it is available by default.
- If audio helpers such as `afplay`, `paplay`, or `aplay` are available in future versions, they can be used, but this first version does not depend on bundled audio files.
- If no sound command exists, fall back to the terminal bell.

### `install.sh`

Responsibilities:

- Locate an install target:
  - Use `INSTALL_DIR` when provided, mainly for tests or explicit user choice.
  - Prefer `/usr/local/bin` when writable.
  - Otherwise use `$HOME/.local/bin`.
- Create `$HOME/.local/bin` if needed.
- Copy `git-poule` to the target as `git-poule`.
- Mark it executable.
- Warn if the selected target is not in `PATH`.
- Print a short confirmation and usage example.

### `README.md`

Responsibilities:

- Explain that `git poule` is a playful wrapper around `git pull`.
- Document install and usage.
- Document uninstall by removing the installed `git-poule` executable.
- Mention that Git discovers `git-poule` through `PATH`.

## Error Handling

- `git-poule` preserves the `git pull` exit status on failure.
- The chicken sound is best-effort. Failure to play a sound must not make `git poule` fail after a successful pull.
- `install.sh` fails with a clear message if it cannot write to the chosen install target.

## Testing

Use shell-level tests where practical:

- Verify that `git-poule` forwards arguments to `git pull`.
- Verify that success prints the chicken art.
- Verify that failure preserves the non-zero exit status and suppresses success art.
- Verify that `install.sh` can install into a temporary directory when configured for tests.

Because this is a new feature, implementation should start with failing tests for the command behavior before writing production code.

## Out of Scope

- Packaging for Homebrew, npm, or pip.
- Shipping a real chicken audio file.
- Changing global Git configuration.
- Automatically modifying the user's shell startup files.
